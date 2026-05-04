---
name: mcp-basics
description: MCP 基础教程 - 从零开始理解 Model Context Protocol
type: tutorial
tags: [mcp, tutorial, beginner, claude-code]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-mcp-ultimate-guide/2026-05-04-MCP终极指南基础篇.md
related:
  - "[[claude-mcp]]"
  - "[[mcp-advanced]]"
  - "[[mcp-protocol-analysis]]"
---

# MCP 基础教程

> [!info] 教程信息
> - **来源**: Bilibili - 马克的技术工作坊
> - **视频**: BV1uronYREWR
> - **时长**: 27:03
> - **难度**: ⭐ 入门
> - **前置知识**: 无

---

## 一、MCP 是什么？

### 1.1 定义

**MCP (Model Context Protocol)** 是 Anthropic 推出的**模型上下文协议**，用于扩展 LLM 的能力边界。

**类比理解**：
- MCP 就像是给 Claude 安装"插件"
- 每个 MCP Server 提供一组"工具"（Tools）
- Claude 可以调用这些工具完成原本无法完成的任务

### 1.2 核心架构

```
┌─────────────┐       ┌──────────────┐       ┌─────────────┐
│  MCP Host   │──────▶│  MCP Server  │──────▶│ 外部服务/数据 │
│ (Claude等)  │◀──────│  (Node/Py)  │◀──────│ (API/文件)  │
└─────────────┘       └──────────────┘       └─────────────┘
    协议使用者              协议提供者
```

**关键概念**：

| 概念 | 说明 | 示例 |
|------|------|------|
| **MCP Host** | 支持 MCP 协议的软件 | Claude Desktop, Cursor, Cline |
| **MCP Server** | 提供工具的程序 | weather-mcp, notion-mcp |
| **MCP Tool** | Server 中的具体函数 | get_forecast, create_page |
| **Transport** | 通信方式 | STDIO, SSE |

### 1.3 通信方式

**STDIO (标准输入输出)**：
- 适用场景：本地运行
- 特点：通过标准输入输出通信
- 示例：`uvx weather.py`

**SSE (Server-Sent Events)**：
- 适用场景：远程/网络服务
- 特点：HTTP 长连接，服务器主动推送
- 示例：云端 MCP 服务

---

## 二、在 Cline 中使用 MCP

### 2.1 安装 Cline

> [!tip] 什么是 Cline？
> Cline 是一个 VS Code 扩展，将 Claude 能力集成到编辑器中，支持 MCP 协议。

**安装步骤**：
1. 打开 VS Code
2. 扩展商店搜索 "Cline"
3. 点击安装

### 2.2 配置 API

Cline 使用 OpenRouter API 调用 Claude：

```json
{
  "apiProvider": "openrouter",
  "apiKey": "sk-or-v1-your-key-here"
}
```

**获取 API Key**：
1. 访问 [OpenRouter](https://openrouter.ai)
2. 注册账号
3. 生成 API Key

### 2.3 配置 MCP Server

在 Cline 设置中添加 MCP 配置：

```json
{
  "mcpServers": {
    "weather": {
      "command": "uvx",
      "args": ["--directory", "/path/to/weather", "weather.py"],
      "transport": "stdio"
    }
  }
}
```

**配置字段说明**：
- `command`: 启动命令（`uvx` 用于 Python，`npx` 用于 Node）
- `args`: 传递参数
  - `--directory`: 指定工作目录
  - 最后一个参数：入口文件
- `transport`: 通信方式（通常为 `stdio`）

---

## 三、第一次使用 MCP

### 3.1 实战案例：天气查询

**场景**：让 Claude 帮你查询天气

**对话示例**：
```
用户: 帮我查一下北京今天的天气

Claude: [思考] 需要使用天气工具
      [调用] mcp__weather__get_forecast(location="北京")
      [返回] 北京今天晴天，气温 15-25°C
```

### 3.2 工具调用流程

```
1. 用户提出问题
   ↓
2. Claude 分析需求
   ↓
3. 选择合适的 MCP Tool
   ↓
4. 发送请求到 MCP Server
   ↓
5. Server 执行并返回结果
   ↓
6. Claude 基于结果回答用户
```

### 3.3 可用的 MCP Servers

**常用 Server 列表**：

| Server | 功能 | 安装命令 |
|--------|------|----------|
| **context7** | 查询最新文档 | `npx -y @context7/mcp-server` |
| **playwright** | 浏览器自动化 | `npx -y @executeautomation/playwright-mcp-server` |
| **filesystem** | 文件系统操作 | `npx -y @modelcontextprotocol/server-filesystem` |
| **weather** | 天气查询 | 自定义 Python 脚本 |
| **notion** | Notion 集成 | `npx -y @notionhq/client` |

---

## 四、uvx 和 npx

### 4.1 uvx (Python)

**作用**：直接运行 Python 包，无需安装

```bash
# 传统方式
pip install weather-package
weather-package

# uvx 方式
uvx weather-package
```

**优势**：
- ✅ 无需预先安装
- ✅ 自动处理依赖
- ✅ 隔离运行环境

### 4.2 npx (Node.js)

**作用**：直接运行 npm 包

```bash
# 传统方式
npm install -g package-name
package-name

# npx 方式
npx package-name
```

**常用参数**：
- `-y`: 自动确认（跳过交互提示）
- 示例：`npx -y @context7/mcp-server`

---

## 五、MCP vs 传统 API

### 5.1 传统方式

```python
import anthropic

client = anthropic.Anthropic(api_key="sk-xxx")
response = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    messages=[{"role": "user", "content": "查天气"}]
)
# ❌ Claude 无法访问实时数据
```

### 5.2 MCP 方式

```python
# Claude 自动调用 MCP Tool
response = client.messages.create(
    model="claude-3-5-sonnet-20241022",
    tools=[weather_tool],  # 声明可用工具
    messages=[{"role": "user", "content": "查天气"}]
)
# ✅ Claude 先调用 weather_tool，再基于结果回答
```

---

## 六、常见问题

### Q1: MCP 和 Plugin 有什么区别？

| 特性 | MCP | Plugin |
|------|-----|--------|
| **通用性** | 跨平台标准 | 平台特定 |
| **开发语言** | 任意（通过协议） | 平台限制 |
| **安装方式** | 配置文件 | 应用内安装 |
| **能力范围** | 工具+资源 | 功能扩展 |

### Q2: 如何调试 MCP Server？

**方法**：
1. 直接在终端运行 Server（不通过 Host）
2. 观察标准输入输出
3. 查看错误日志

**示例**：
```bash
uvx --directory /path/to/weather weather.py
# 手动输入 JSON 协议测试
```

### Q3: MCP Server 可以访问网络吗？

✅ **可以**。MCP Server 就像普通程序，可以：
- 发送 HTTP 请求
- 访问数据库
- 读写文件
- 调用其他 API

---

## 七、下一步学习

完成本教程后，建议继续学习：

1. **[[mcp-advanced]]** - 编写自定义 MCP Server
2. **[[mcp-protocol-analysis]]** - 深入理解协议细节
3. **[[claude-mcp]]** - Claude Code 中的 MCP 配置

---

## 八、实战练习

### 练习 1：配置 Context7

**目标**：在 Cline 中配置 Context7 MCP Server

**步骤**：
1. 在 Cline 设置中添加：
```json
{
  "context7": {
    "command": "npx",
    "args": ["-y", "@context7/mcp-server"],
    "transport": "stdio"
  }
}
```

2. 重启 Cline

3. 测试：让 Claude 查询某个库的最新文档

### 练习 2：使用 Weather MCP

**目标**：查询你所在城市的天气

**提示词**：
```
请帮我查询 [你的城市] 未来三天的天气预报
```

**预期结果**：
- Claude 调用 weather MCP Tool
- 返回详细天气信息
- 基于天气给出建议（如带伞、穿衣等）

---

*最后更新: 2026-05-04*
*来源: Bilibili - 马克的技术工作坊 (BV1uronYREWR)*
