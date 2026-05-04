---
name: mcp-protocol-analysis
description: MCP 协议深度分析 - 抓包分析 Cline 与模型的交互协议
type: tutorial
tags: [mcp, tutorial, expert, protocol, sse, react]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-mcp-ultimate-guide/2026-05-04-MCP终极指南番外篇：抓包分析 Cline 与模型的交互协议.md
related:
  - "[[claude-mcp]]"
  - "[[mcp-basics]]"
  - "[[mcp-advanced]]"
---

# MCP 协议深度分析

> [!info] 教程信息
> - **来源**: Bilibili - 马克的技术工作坊
> - **视频**: BV1v9V5zSEHA
> - **时长**: 44:15
> - **难度**: ⭐⭐⭐⭐⭐ 专家
> - **前置知识**: [[mcp-advanced]], 网络协议基础

---

## 一、Cline 与模型交互协议

### 1.1 通信架构

```
┌──────────┐     SSE      ┌─────────────┐
│  Cline   │◀─────────────▶│ OpenRouter │
│ (Host)   │   长连接推送  │  (Proxy)   │
└──────────┘               └─────────────┘
                                     │
                                     ▼
                              ┌─────────────┐
                              │   Claude    │
                              │  (Model)    │
                              └─────────────┘
```

**关键特点**：
- **SSE (Server-Sent Events)**: 单向推送，服务器主动发送
- **长连接**: 一次连接，多次响应
- **事件流**: 数据以 `data:` 行格式推送

### 1.2 请求格式

**HTTP 请求**：
```http
POST /v1/chat/completions HTTP/1.1
Host: openrouter.ai
Content-Type: application/json
Authorization: Bearer sk-or-v1-xxx

{
  "model": "anthropic/claude-3.5-sonnet",
  "messages": [
    {"role": "user", "content": "你好"}
  ],
  "stream": true  // 启用流式响应
}
```

### 1.3 响应格式（SSE）

**SSE 数据流**：
```
data: {"type":"message_start","message":{"id":"msg_xxx","role":"assistant"}}

data: {"type":"content_block_start","index":0}

data: {"type":"content_block_delta","delta":{"type":"text","text":"你好"}}

data: {"type":"content_block_stop","index":0}

data: {"type":"message_stop"}
```

**字段说明**：
- `data:`: SSE 前缀，表示这是数据行
- `type`: 事件类型（message_start, content_block_delta, etc.）
- `index`: 内容块索引（支持多块并发）
- `delta`: 增量数据（文本、工具调用等）

---

## 二、ReAct 模式分析

### 2.1 ReAct 定义

**ReAct = Reasoning + Acting**

推理-行动循环，Agent 实现的核心模式：

```
┌─────────────────────────────────────────┐
│  Thought: 我需要查询天气                │
│  ────────────────────────────────────  │
│  Action: 调用 weather_tool              │
│  ────────────────────────────────────  │
│  Observation: 收到工具返回结果          │
│  ────────────────────────────────────  │
│  Thought: 基于结果，我可以回答用户了    │
│  ────────────────────────────────────  │
│  Action: 返回最终答案                  │
└─────────────────────────────────────────┘
```

### 2.2 ReAct 在协议中的体现

**实际对话示例**：

```
用户: 帮我查北京天气

[Thought 1]
Claude: 需要使用天气工具

[Action 1]
Claude: <function=weather_get_forecast>
        <parameter=location>北京</parameter>
        </function=weather_get_forecast>

[Observation 1]
Tool: 北京今天晴天，15-25°C

[Thought 2]
Claude: 基于天气信息，给出建议

[Action 2]
Claude: 北京今天天气不错，气温15-25度，适合...
```

### 2.3 XML 标签协议

**Cline 使用的 XML 格式**：

```xml
<invoke="tool_name">
<parameter name="param1">value1</parameter>
<parameter name="param2">value2</parameter>
</invoke="tool_name>
```

**示例**：
```xml
<invoke="search_files">
<parameter name="query">TODO</parameter>
<parameter name="path">./src</parameter>
</invoke="search_files">
```

---

## 三、抓包分析实战

### 3.1 FastAPI 日志中间件

**创建日志服务器**：

```python
from fastapi import FastAPI, Request
from fastapi.responses import StreamingResponse
import json
import uvicorn

app = FastAPI()

@app.post("/v1/chat/completions")
async def chat_completions(request: Request):
    """拦截并记录所有请求和响应"""
    
    # 记录请求
    body = await request.json()
    print("\n" + "="*60)
    print("【REQUEST】")
    print(json.dumps(body, indent=2, ensure_ascii=False))
    print("="*60 + "\n")
    
    # 转发到真实 API
    import httpx
    async with httpx.AsyncClient() as client:
        response = await client.post(
            "https://openrouter.ai/api/v1/chat/completions",
            json=body,
            headers={
                "Authorization": request.headers["authorization"],
                "HTTP-Referer": "https://localhost",
            }
        )
    
    # 记录响应流
    async def log_stream():
        async for line in response.aiter_lines():
            if line.startswith("data: "):
                data = line[6:]  # 移除 "data: " 前缀
                if data != "[DONE]":
                    try:
                        parsed = json.loads(data)
                        print("【RESPONSE】", json.dumps(parsed, ensure_ascii=False)[:200])
                    except:
                        pass
            yield line
    
    return StreamingResponse(
        log_stream(),
        media_type="text/event-stream"
    )

if __name__ == "__main__":
    uvicorn.run(app, host="localhost", port=8000)
```

### 3.2 配置 Cline 使用代理

**修改 API Endpoint**：

```json
{
  "apiProvider": "openrouter",
  "apiKey": "sk-or-v1-xxx",
  "apiBase": "http://localhost:8000/v1"  // 指向日志服务器
}
```

### 3.3 分析捕获的数据

**请求结构**：
```json
{
  "model": "anthropic/claude-3.5-sonnet:beta",
  "messages": [
    {
      "role": "user",
      "content": "查北京天气"
    }
  ],
  "tools": [
    {
      "type": "function",
      "function": {
        "name": "weather_get_forecast",
        "description": "获取天气预报",
        "parameters": {
          "type": "object",
          "properties": {
            "location": {"type": "string"}
          },
          "required": ["location"]
        }
      }
    }
  ],
  "stream": true
}
```

**响应流分析**：

```javascript
// 1. 消息开始
data: {"type":"message_start","message":{"id":"msg_1","role":"assistant"}}

// 2. 思考开始（如果使用 thinking）
data: {"type":"thinking_start"}

// 3. 工具调用
data: {"type":"content_block_start","content_block":{"type":"tool_use","id":"toolu_1","name":"weather_get_forecast"}}

data: {"type":"content_block_delta","delta":{"type":"tool_use","input":{"location":"北京"}}}

// 4. 等待工具结果
// （此时暂停，等待 Host 提供工具结果）

// 5. 收到工具结果后继续
data: {"type":"content_block_start","content_block":{"type":"text","id":"text_1"}}

data: {"type":"content_block_delta","delta":{"type":"text","text":"北京今天晴天"}}

// 6. 消息结束
data: {"type":"message_stop"}
```

---

## 四、System Prompt 分析

### 4.1 获取 System Prompt

**Cline System Prompt 规模**：
- **行数**: 626 行
- **字符数**: 48,670
- **Token**: 约 12,000 tokens

**关键部分**：

```markdown
# Cline System Prompt (节选)

You are Cline, an AI coding assistant...

## Core Capabilities
- Read/write files
- Execute commands
- Search code
- Use MCP tools
- Browser automation

## Tool Use Format
When using tools, respond with this XML format:

<execute>
<tool_name>
<parameter name="param1">value1</parameter>
</tool_name>
</execute>

## MCP Protocol
You have access to MCP servers. Available tools:
- weather: get_forecast(location)
- filesystem: read_file(path), write_file(path, content)
...
```

### 4.2 System Prompt 的影响

**对模型行为的约束**：
1. **输出格式**: 强制使用 XML 标签
2. **工具调用**: 定义可用的 MCP 工具
3. **工作流程**: 指定思考-行动循环
4. **安全限制**: 禁止危险操作

### 4.3 优化 System Prompt

**优化策略**：

| 策略 | 说明 | 效果 |
|------|------|------|
| **精简指令** | 移除冗余描述 | 节省 tokens |
| **结构化工具** | 分类组织 MCP 工具 | 提高可读性 |
| **示例驱动** | 用示例替代说明 | 减少歧义 |
| **动态加载** | 按需加载工具描述 | 降低上下文 |

---

## 五、Agent 实现原理

### 5.1 Agent 架构

```
┌──────────────────────────────────────────┐
│              Agent Core                  │
│  ┌────────────┐      ┌─────────────┐   │
│  │  Planner   │─────▶│   Executor  │   │
│  │  (规划)    │      │   (执行)    │   │
│  └────────────┘      └─────────────┘   │
│         │                    │          │
│         ▼                    ▼          │
│  ┌────────────┐      ┌─────────────┐   │
│  │  ReAct     │      │   Tools     │   │
│  │  (推理)    │      │   (工具)     │   │
│  └────────────┘      └─────────────┘   │
└──────────────────────────────────────────┘
```

### 5.2 实现步骤

**步骤 1: 规划（Planner）**

```python
class Planner:
    def plan(self, task: str) -> list[Step]:
        """将任务分解为步骤"""
        # 使用 LLM 分析任务
        steps = llm.generate(f"""
        任务: {task}
        请分解为具体步骤:
        1. ...
        2. ...
        """)
        return parse_steps(steps)
```

**步骤 2: 执行（Executor）**

```python
class Executor:
    def execute(self, step: Step) -> Result:
        """执行单个步骤"""
        # ReAct 循环
        while not step.done:
            thought = self.think(step)
            action = self.decide(thought)
            result = self.act(action)
            step.update(result)
        return step.result
```

**步骤 3: 工具调用（Tools）**

```python
class ToolRegistry:
    def call(self, name: str, params: dict) -> Any:
        """调用 MCP 工具"""
        tool = self.tools[name]
        return tool(**params)
```

### 5.3 完整示例

```python
from typing import Protocol

class Tool(Protocol):
    def __call__(self, **kwargs) -> str: ...

class Agent:
    def __init__(self):
        self.tools: dict[str, Tool] = {}
    
    def register_tool(self, name: str, tool: Tool):
        """注册工具"""
        self.tools[name] = tool
    
    def run(self, task: str) -> str:
        """运行 Agent"""
        # 1. 理解任务
        thought = self._think(task)
        
        # 2. 选择工具
        if tool_name := self._select_tool(thought):
            # 3. 调用工具
            result = self.tools[tool_name](**self._parse_params(thought))
            
            # 4. 生成回答
            return self._generate_response(result)
        
        return "我无法完成这个任务"
```

---

## 六、高级话题

### 6.1 流式响应处理

**处理 SSE 流**：

```python
import asyncio
import httpx

async def stream_completion(messages: list[dict]):
    """流式处理响应"""
    async with httpx.AsyncClient() as client:
        async with client.stream(
            "POST",
            "https://openrouter.ai/api/v1/chat/completions",
            json={"messages": messages, "stream": True},
            headers={"Authorization": f"Bearer {API_KEY}"}
        ) as response:
            async for line in response.aiter_lines():
                if line.startswith("data: "):
                    data = line[6:]
                    if data == "[DONE]":
                        break
                    yield json.loads(data)
```

### 6.2 并发工具调用

**多工具并行执行**：

```python
async def parallel_tools(tools: list[dict]) -> list[dict]:
    """并发调用多个工具"""
    tasks = [
        call_tool(tool["name"], tool["params"])
        for tool in tools
    ]
    return await asyncio.gather(*tasks)
```

### 6.3 错误恢复

**ReAct 错误处理**：

```python
def react_with_retry(max_retries: int = 3):
    """带重试的 ReAct"""
    for attempt in range(max_retries):
        try:
            thought = agent.think()
            action = agent.act(thought)
            result = execute(action)
            return result
        except Exception as e:
            if attempt == max_retries - 1:
                raise
            agent.reflect(error=str(e))
```

---

## 七、调试技巧

### 7.1 日志级别

**分级日志**：

```python
import logging

logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s [%(levelname)s] %(message)s'
)

# 使用
logging.debug("工具调用参数: %s", params)
logging.info("工具返回结果: %s", result)
logging.error("工具调用失败: %s", error)
```

### 7.2 性能监控

**计时装饰器**：

```python
import time
from functools import wraps

def timed(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        elapsed = time.time() - start
        logging.info(f"{func.__name__} 耗时: {elapsed:.2f}s")
        return result
    return wrapper

@timed
def call_tool(name: str, params: dict):
    ...
```

### 7.3 协议验证

**JSON Schema 验证**：

```python
from jsonschema import validate, ValidationError

tool_call_schema = {
    "type": "object",
    "properties": {
        "name": {"type": "string"},
        "parameters": {"type": "object"}
    },
    "required": ["name", "parameters"]
}

def validate_tool_call(call: dict):
    """验证工具调用格式"""
    try:
        validate(call, tool_call_schema)
        return True
    except ValidationError as e:
        logging.error(f"无效的工具调用: {e}")
        return False
```

---

## 八、常见问题

### Q1: SSE 连接断开怎么办？

**重连策略**：
```python
async def stream_with_retry(url: str, max_retries: int = 3):
    """带重试的 SSE 连接"""
    for attempt in range(max_retries):
        try:
            async with httpx.AsyncClient() as client:
                async with client.stream("GET", url) as response:
                    async for line in response.aiter_lines():
                        yield line
        except httpx.ReadTimeout:
            if attempt < max_retries - 1:
                logging.warning(f"连接断开，重试 {attempt + 1}/{max_retries}")
                await asyncio.sleep(2 ** attempt)  # 指数退避
            else:
                raise
```

### Q2: 如何处理大响应？

**分块处理**：
```python
async def process_large_response(response: AsyncIterator):
    """分块处理大响应"""
    buffer = []
    async for chunk in response:
        buffer.append(chunk)
        if len(buffer) >= 100:  # 每 100 块处理一次
            yield "".join(buffer)
            buffer = []
    if buffer:
        yield "".join(buffer)
```

### Q3: ReAct 循环不终止？

**添加最大迭代限制**：
```python
MAX_ITERATIONS = 10

def react_loop(task: str):
    for i in range(MAX_ITERATIONS):
        thought = agent.think(task)
        if thought.is_complete():
            return thought.final_answer()
        
        action = agent.act(thought)
        result = execute(action)
        agent.observe(result)
    else:
        raise RuntimeError("ReAct 循环超过最大迭代次数")
```

---

## 九、实战项目

### 项目：构建完整 Agent

**目标**：实现一个代码审查 Agent

**功能要求**：
- ✅ 读取代码文件
- ✅ 分析代码质量
- ✅ 提供改进建议
- ✅ 生成审查报告

**技术栈**：
- FastAPI（Web 服务）
- httpx（HTTP 客户端）
- Python-MCP（协议处理）

---

## 十、参考资源

### 官方文档
- [MCP Protocol Spec](https://spec.modelcontextprotocol.io/)
- [Anthropic API Docs](https://docs.anthropic.com/)
- [Server-Sent Events (W3C)](https://html.spec.whatwg.org/multipage/server-sent-events.html)

### Wiki 相关页面
- [[claude-mcp]] - MCP 在 Claude Code 中的应用
- [[mcp-basics]] - MCP 基础教程
- [[mcp-advanced]] - MCP 进阶开发

### 工具和库
- [FastMCP](https://github.com/jlowin/fastmcp) - Python MCP 框架
- [httpx](https://www.python-httpx.org/) - 现代 HTTP 客户端
- [FastAPI](https://fastapi.tiangolo.com/) - Web 框架

---

*最后更新: 2026-05-04*
*来源: Bilibili - 马克的技术工作坊 (BV1v9V5zSEHA)*
