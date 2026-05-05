---
name: alishahryar1-free-claude-code
description: 免费使用 Claude Code CLI 和 VSCode 扩展的代理服务器 — 无需 Anthropic API key，支持多种免费/本地 LLM 提供商
type: source
version: 1.0
tags: [github, python, fastapi, claude-code, proxy, nvidia-nim, openrouter, deepseek, llm, discord-bot, telegram-bot]
created: 2026-04-29
updated: 2026-04-29
source: ../../../archive/resources/github/alishahryar1-free-claude-code-2026-04-29.json
stars: 0
language: Python
license: MIT
github_url: https://github.com/Alishahryar1/free-claude-code
---

# Free Claude Code

> **零成本使用 Claude Code CLI 和 VSCode 扩展** — 通过代理服务器将 Claude Code 的 Anthropic API 调用路由到免费/本地 LLM 提供商

## 基本信息

| 项目 | 信息 |
|------|------|
| **作者** | Alishahryar1 |
| **版本** | 2.0.0 |
| **语言** | Python (≥3.14) |
| **许可证** | MIT |
| **包管理器** | uv |
| **Web 框架** | FastAPI |

## 核心价值

### 💰 零成本 AI 编程助手

| 特性 | 说明 |
|------|------|
| **完全免费** | NVIDIA NIM 提供 40 req/min 免费额度 |
| **Drop-in 替换** | 仅需设置 2 个环境变量，无需修改 Claude Code |
| **多云支持** | 5 个提供商可选，可混合使用 |
| **本地部署** | 支持 LM Studio 和 llama.cpp 完全离线使用 |

### 🎯 支持的提供商

| 提供商 | 成本 | 速率限制 | 最佳场景 |
|--------|------|----------|----------|
| **NVIDIA NIM** | 免费 | 40 req/min | 日常驱动，慷慨的免费额度 |
| **OpenRouter** | 免费/付费 | 变化 | 模型多样性，备用选项 |
| **DeepSeek** | 按使用量 | 变化 | 直接访问 DeepSeek 聊天/推理模型 |
| **LM Studio** | 免费（本地） | 无限制 | 隐私保护，离线使用 |
| **llama.cpp** | 免费（本地） | 无限制 | 轻量级本地推理引擎 |

## 核心功能

### 1. 智能代理路由

```
Claude Code CLI/VSCode
     ↓
Anthropic API 格式 (SSE)
     ↓
Free Claude Code 代理 (:8082)
     ↓
OpenAI-compatible 格式
     ↓
LLM 提供商 (NIM/OR/DS/LMS/llamacpp)
```

### 2. 按模型路由

每个 Claude 模型可路由到不同的后端：

```bash
MODEL_OPUS="nvidia_nim/z-ai/glm4.7"           # Claude Opus
MODEL_SONNET="open_router/deepseek/deepseek-r1:free"  # Claude Sonnet
MODEL_HAIKU="lmstudio/unsloth/GLM-4.7-Flash-GGUF"      # Claude Haiku
MODEL="nvidia_nim/stepfun-ai/step-3.5-flash"            # 后备
```

### 3. 高级特性

| 功能 | 描述 |
|------|------|
| **思考 Token 支持** | 解析 `` 标签和 `reasoning_content` 转换为原生 Claude 思考块 |
| **启发式工具解析** | 将模型输出的文本工具调用自动解析为结构化工具使用 |
| **请求优化** | 5 类本地拦截（配额探测、标题生成、前缀检测、建议、文件路径提取） |
| **智能速率限制** | 主动滚动窗口节流 + 被动 429 指数退避 + 并发上限 |
| **Discord/Telegram Bot** | 远程自主编程，基于树的消息线程，会话持久化，实时进度 |
| **Subagent 控制** | Task 工具拦截强制 `run_in_background=False`，防止失控子代理 |

## 技术架构

### 项目结构

```
free-claude-code/
├── server.py              # 入口点
├── api/                   # FastAPI 路由、请求检测、优化处理器
├── providers/             # BaseProvider、OpenAICompatibleProvider、各提供商实现
│   ├── common/            # 共享工具（SSE 构建器、消息转换器、解析器）
│   ├── nvidia_nim/
│   ├── open_router/
│   ├── deepseek/
│   ├── lmstudio/
│   └── llamacpp/
├── messaging/             # MessagingPlatform ABC + Discord/Telegram 机器人
├── config/                # 设置、NIM 配置、日志
├── cli/                   # CLI 会话和进程管理
└── tests/                 # Pytest 测试套件
```

### 技术栈

**核心依赖**:
- `fastapi[standard]` — Web 框架
- `uvicorn` — ASGI 服务器
- `httpx[socks]` — HTTP 客户端（支持 SOCKS 代理）
- `pydantic` — 数据验证
- `openai` — OpenAI Python SDK（OpenAI-compatible 接口）
- `discord.py` — Discord Bot
- `python-telegram-bot` — Telegram Bot
- `loguru` — 日志记录

**开发工具**:
- `uv` — 快速 Python 包管理器
- `pytest` — 测试框架
- `ty` — 类型检查
- `ruff` — 代码格式化和 Lint

## 快速开始

### 1. 安装

```bash
# 克隆仓库
git clone https://github.com/Alishahryar1/free-claude-code.git
cd free-claude-code

# 安装 uv
pip install uv

# 复制配置文件
cp .env.example .env
```

### 2. 配置提供商

**NVIDIA NIM**（推荐，40 req/min 免费）:
```bash
NVIDIA_NIM_API_KEY="nvapi-your-key-here"
MODEL_OPUS="nvidia_nim/z-ai/glm4.7"
MODEL_SONNET="nvidia_nim/moonshotai/kimi-k2-thinking"
MODEL_HAIKU="nvidia_nim/stepfun-ai/step-3.5-flash"
ENABLE_THINKING=true
```

**OpenRouter**（数百种模型）:
```bash
OPENROUTER_API_KEY="sk-or-your-key-here"
MODEL_OPUS="open_router/deepseek/deepseek-r1:free"
MODEL_SONNET="open_router/openai/gpt-oss-120b:free"
MODEL_HAIKU="open_router/stepfun/step-3.5-flash:free"
```

**LM Studio**（完全本地，无需 API key）:
```bash
MODEL_OPUS="lmstudio/unsloth/MiniMax-M2.5-GGUF"
MODEL_SONNET="lmstudio/unsloth/Qwen3.5-35B-A3B-GGUF"
MODEL_HAIKU="lmstudio/unsloth/GLM-4.7-Flash-GGUF"
```

### 3. 启动服务

```bash
# 终端 1：启动代理服务器
uv run uvicorn server:app --host 0.0.0.0 --port 8082

# 终端 2：运行 Claude Code
ANTHROPIC_AUTH_TOKEN="freecc" ANTHROPIC_BASE_URL="http://localhost:8082" claude
```

### 4. VSCode 扩展配置

在 VSCode 设置中添加：
```json
"claudeCode.environmentVariables": [
  { "name": "ANTHROPIC_BASE_URL", "value": "http://localhost:8082" },
  { "name": "ANTHROPIC_AUTH_TOKEN", "value": "freecc" }
]
```

## Discord/Telegram Bot

### 功能特性

- **基于树的消息线程**: 回复消息以分支对话
- **会话持久化**: 跨服务器重启保持会话
- **实时流式传输**: 思考 token、工具调用、结果实时流式传输
- **无限并发**: 无限并发 Claude CLI 会话（通过 `PROVIDER_MAX_CONCURRENCY` 控制）
- **语音笔记**: 发送语音消息，自动转录并处理为常规提示
- **命令**: `/stop`（取消任务）、`/clear`（重置会话）、`/stats`

### 配置示例

**Discord**:
```bash
MESSAGING_PLATFORM="discord"
DISCORD_BOT_TOKEN="your_discord_bot_token"
ALLOWED_DISCORD_CHANNELS="123456789,987654321"
CLAUDE_WORKSPACE="./agent_workspace"
ALLOWED_DIR="C:/Users/yourname/projects"
```

**Telegram**:
```bash
MESSAGING_PLATFORM="telegram"
TELEGRAM_BOT_TOKEN="123456789:ABCdefGHIjklMNOpqrSTUvwxYZ"
ALLOWED_TELEGRAM_USER_ID="your_telegram_user_id"
```

## 配置参数

### 核心配置

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `MODEL` | 后备模型 (`provider/model/name` 格式) | `nvidia_nim/stepfun-ai/step-3.5-flash` |
| `MODEL_OPUS` | Claude Opus 请求的模型（回退到 `MODEL`） | `nvidia_nim/z-ai/glm4.7` |
| `MODEL_SONNET` | Claude Sonnet 请求的模型（回退到 `MODEL`） | `open_router/arcee-ai/trinity-large-preview:free` |
| `MODEL_HAIKU` | Claude Haiku 请求的模型（回退到 `MODEL`） | `open_router/stepfun/step-3.5-flash:free` |
| `ENABLE_THINKING` | 全局开关：提供商推理请求和 Claude 思考块 | `true` |
| `ANTHROPIC_AUTH_TOKEN` | 可选认证令牌（限制代理访问） | `""` |

### 速率限制和超时

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `PROVIDER_RATE_LIMIT` | LLM API 每窗口请求数 | `40` |
| `PROVIDER_RATE_WINDOW` | 速率限制窗口（秒） | `60` |
| `PROVIDER_MAX_CONCURRENCY` | 最大同时打开的提供商流 | `5` |
| `HTTP_READ_TIMEOUT` | 提供商请求的读取超时（秒） | `120` |
| `HTTP_WRITE_TIMEOUT` | 提供商请求的写入超时（秒） | `10` |
| `HTTP_CONNECT_TIMEOUT` | 提供商请求的连接超时（秒） | `2` |

## 开发命令

```bash
uv run ruff format     # 格式化代码
uv run ruff check      # Lint
uv run ty check        # 类型检查
uv run pytest          # 运行测试
```

## 扩展性

### 添加 OpenAI-compatible 提供商

```python
from providers.openai_compat import OpenAICompatibleProvider
from providers.base import ProviderConfig

class MyProvider(OpenAICompatibleProvider):
    def __init__(self, config: ProviderConfig):
        super().__init__(config, provider_name="MYPROVIDER",
                         base_url="https://api.example.com/v1", 
                         api_key=config.api_key)
```

### 添加消息平台

扩展 `MessagingPlatform` 并实现：
- `start()`
- `stop()`
- `send_message()`
- `edit_message()`
- `on_message()`

## 相关链接

| 链接 | 说明 |
|------|------|
| [GitHub 仓库](https://github.com/Alishahryar1/free-claude-code) | 源代码 |
| [NVIDIA NIM](https://build.nvidia.com) | 获取 NVIDIA API key |
| [OpenRouter](https://openrouter.ai) | 获取 OpenRouter API key |
| [DeepSeek](https://platform.deepseek.com) | 获取 DeepSeek API key |
| [LM Studio](https://lmstudio.ai) | 本地模型运行器 |
| [Claude Code](https://github.com/anthropics/claude-code) | Anthropic 官方 Claude Code |

## 亮点特性

1. **零成本 AI 编程** — NVIDIA NIM 40 req/min 免费额度
2. **即插即用** — 仅需 2 个环境变量，无需修改 Claude Code
3. **多云混合** — 5 个提供商可随意混合使用
4. **智能优化** — 5 类本地拦截节省配额和延迟
5. **远程编程** — Discord/Telegram Bot 支持自主编程
6. **完全本地** — 支持 LM Studio 和 llama.cpp 离线使用
7. **可扩展** — 清晰的 `BaseProvider` 和 `MessagingPlatform` ABC
8. **生产就绪** — 完整测试套件、类型检查、日志记录

## 标签

#claude-code #anthropic #proxy #nvidia-nim #openrouter #deepseek #lm-studio #llamacpp #fastapi #discord-bot #telegram-bot #free-api #ai-assistant #coding-assistant #python

---

*收集时间：2026-04-29*
