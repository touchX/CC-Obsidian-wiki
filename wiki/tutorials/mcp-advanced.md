---
name: mcp-advanced
description: MCP 进阶教程 - 编写自定义 MCP Server 与协议分析
type: tutorial
tags: [mcp, tutorial, advanced, python, fastmcp]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-mcp-ultimate-guide/2026-05-04-MCP终极指南进阶篇.md
related:
  - "[[claude-mcp]]"
  - "[[mcp-basics]]"
  - "[[mcp-protocol-analysis]]"
---

# MCP 进阶教程

> [!info] 教程信息
> - **来源**: Bilibili - 马克的技术工作坊
> - **视频**: BV1Y854zmEg9
> - **时长**: 27:03
> - **难度**: ⭐⭐⭐ 进阶
> - **前置知识**: [[mcp-basics]], Python 基础

---

## 一、编写自定义 MCP Server

### 1.1 FastMCP 简介

**FastMCP** 是一个 Python 框架，简化 MCP Server 开发：

**核心优势**：
- ✅ 装饰器语法简洁
- ✅ 自动处理协议细节
- ✅ 类型提示支持
- ✅ 内置文档生成

### 1.2 第一个 MCP Server

**项目结构**：
```
my-mcp-server/
├── server.py          # Server 入口
├── pyproject.toml     # 依赖配置
└── README.md
```

**代码示例** (`server.py`)：

```python
from fastmcp import FastMCP

# 创建 Server 实例
mcp = FastMCP("my-first-server")

@mcp.tool()
def get_forecast(location: str) -> str:
    """获取指定地点的天气预报

    Args:
        location: 城市名称

    Returns:
        天气信息字符串
    """
    # 实际应用中这里会调用天气 API
    return f"{location}今天晴天，气温 20-28°C"

# 启动 Server
if __name__ == "__main__":
    mcp.run()
```

**关键点**：
1. `@mcp.tool()` 装饰器注册工具
2. 函数文档字符串（docstring）自动生成工具描述
3. 类型提示（`location: str`）定义参数 schema
4. `mcp.run()` 启动 STDIO 通信

### 1.3 配置文件

**pyproject.toml**：

```toml
[project]
name = "my-mcp-server"
version = "0.1.0"
description = "我的第一个 MCP Server"
requires-python = ">=3.10"
dependencies = [
    "fastmcp>=0.1.0",
]

[project.scripts]
my-server = "server:main"
```

### 1.4 本地测试

**启动 Server**：
```bash
# 使用 uvx 运行（无需安装）
uvx --directory /path/to/my-mcp-server server.py

# 或使用 npx（如果打包发布）
npx my-server
```

**测试协议**：
```bash
# 输入初始化请求（STDIN）
echo '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{...}}' | uvx server.py
```

---

## 二、MCP 协议分析

### 2.1 协议基础

**JSON-RPC 2.0** 格式：
```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "tools/list",
  "params": {}
}
```

**关键字段**：
- `jsonrpc`: 协议版本（固定 "2.0"）
- `id`: 请求标识符（客户端生成）
- `method`: 方法名（如 `tools/list`、`tools/call`）
- `params`: 方法参数

### 2.2 核心方法

| 方法 | 说明 | 参数 |
|------|------|------|
| `initialize` | 初始化连接 | `protocolVersion`, `capabilities`, `clientInfo` |
| `tools/list` | 列出可用工具 | 无 |
| `tools/call` | 调用工具 | `name`, `arguments` |
| `resources/list` | 列出资源 | 无 |
| `resources/read` | 读取资源 | `uri` |

### 2.3 通信流程

```
1. Host → Server: initialize
   Server → Host: capabilities 声明

2. Host → Server: tools/list
   Server → Host: 返回工具列表

3. Host → Server: tools/call
   Server → Host: 返回执行结果
```

---

## 三、协议调试工具

### 3.1 MCP Logger

创建日志脚本拦截通信：

```python
# mcp_logger.py
import sys
import json

def log_message(direction: str, message: dict):
    """记录 JSON-RPC 消息"""
    print(f"\n{'='*60}")
    print(f"[{direction}]")
    print(json.dumps(message, indent=2, ensure_ascii=False))
    print(f"{'='*60}\n")

for line in sys.stdin:
    try:
        message = json.loads(line)
        log_message("RECEIVED", message)

        # 转发到实际 Server
        # 这里可以用 subprocess 与真实 Server 通信

        # 模拟响应
        if message.get("method") == "initialize":
            response = {
                "jsonrpc": "2.0",
                "id": message.get("id"),
                "result": {
                    "protocolVersion": "2024-11-05",
                    "capabilities": {},
                    "serverInfo": {
                        "name": "logger-mcp",
                        "version": "1.0.0"
                    }
                }
            }
            log_message("SENT", response)
            print(json.dumps(response))

    except json.JSONDecodeError:
        print(line, end='')  # 非JSON 行直接输出
```

**使用方式**：
```bash
# 配置 Host 指向 logger，logger 转发到真实 Server
python mcp_logger.py | uvx server.py
```

### 3.2 手动协议测试

**测试工具初始化**：
```bash
# 发送初始化请求
echo '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"test","version":"1.0"}}}' | uvx server.py
```

**列出工具**：
```bash
echo '{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}}' | uvx server.py
```

**调用工具**：
```bash
echo '{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"get_forecast","arguments":{"location":"北京"}}}' | uvx server.py
```

---

## 四、高级功能

### 4.1 资源（Resources）

**定义资源**：
```python
@mcp.resource("weather://forecast/{location}")
def get_forecast_resource(location: str) -> str:
    """提供天气预报资源"""
    return f"{location}的天气预报..."
```

**读取资源**：
```bash
# Host 调用
resources/read?uri=weather://forecast/北京
```

### 4.2 Prompts

**定义提示模板**：
```python
@mcp.prompt()
def weather_analyst(location: str) -> str:
    """生成天气分析提示"""
    return f"请分析{location}的天气趋势..."
```

### 4.3 异步工具

```python
import asyncio

@mcp.tool()
async def async_fetch_data(url: str) -> dict:
    """异步获取数据"""
    # 模拟异步 IO
    await asyncio.sleep(1)
    return {"url": url, "data": "..."}
```

---

## 五、最佳实践

### 5.1 错误处理

```python
@mcp.tool()
def safe_divide(a: int, b: int) -> float:
    """安全除法"""
    try:
        return a / b
    except ZeroDivisionError:
        raise ValueError("除数不能为零")
```

### 5.2 类型验证

```python
from typing import Annotated

@mcp.tool()
def validated_search(
    query: Annotated[str, "搜索关键词，至少2个字符"],
    limit: Annotated[int, "结果数量，1-100之间"] = 10
) -> list:
    """带类型验证的搜索"""
    if len(query) < 2:
        raise ValueError("查询关键词太短")
    if not 1 <= limit <= 100:
        raise ValueError("limit 必须在 1-100 之间")
    # 执行搜索...
    return []
```

### 5.3 工具分组

```python
# 创建多个 Server 实例分组管理
weather_mcp = FastMCP("weather-tools")
database_mcp = FastMCP("database-tools")

@weather_mcp.tool()
def get_forecast(location: str) -> str:
    """天气工具"""
    ...

@database_mcp.tool()
def query_users(limit: int) -> list:
    """数据库工具"""
    ...
```

---

## 六、部署发布

### 6.1 打包到 PyPI

**配置 setup.py**：
```python
from setuptools import setup

setup(
    name="my-mcp-server",
    version="0.1.0",
    packages=["."],
    install_requires=["fastmcp>=0.1.0"],
    entry_points={
        "console_scripts": [
            "my-server=server:main",
        ],
    },
)
```

**发布**：
```bash
# 构建
python -m build

# 上传到 PyPI
twine upload dist/*
```

### 6.2 npx 支持

**添加 package.json**：
```json
{
  "name": "my-mcp-server",
  "version": "0.1.0",
  "bin": {
    "my-server": "./server.py"
  },
  "scripts": {
    "start": "python server.py"
  }
}
```

**发布到 npm**：
```bash
npm publish
```

---

## 七、常见问题

### Q1: 如何调试协议错误？

**方法**：
1. 使用 MCP Logger 拦截通信
2. 检查 JSON 格式是否正确
3. 验证 method 和 params 字段
4. 查看 Server 端日志

### Q2: FastMCP 支持哪些 Python 版本？

**要求**：Python 3.10+

**原因**：使用了现代类型提示和异步特性

### Q3: 如何处理大型数据流？

**方案**：
- 使用资源（Resources）而非工具
- 分页返回数据
- 使用流式响应（如果 Host 支持）

---

## 八、实战项目

### 项目 1：天气 MCP Server

**目标**：创建完整的天气查询 Server

**功能要求**：
- ✅ 查询当前天气
- ✅ 查询未来预报
- ✅ 支持多城市
- ✅ 提供天气资源（Resources）
- ✅ 错误处理和验证

### 项目 2：Notion 集成

**目标**：集成 Notion API

**功能要求**：
- ✅ 列出数据库
- ✅ 创建页面
- ✅ 查询内容
- ✅ 更新属性

---

## 九、下一步学习

完成本教程后，建议继续学习：

1. **[[mcp-protocol-analysis]]** - 深入协议分析和抓包
2. **[[claude-mcp]]** - 在 Claude Code 中配置使用
3. **[FastMCP 文档](https://github.com/jlowin/fastmcp)** - 官方文档

---

*最后更新: 2026-05-04*
*来源: Bilibili - 马克的技术工作坊 (BV1Y854zmEg9)*
