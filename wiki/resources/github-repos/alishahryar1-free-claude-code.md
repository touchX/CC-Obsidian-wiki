---
name: Alishahryar1-free-claude-code
description: Use claude-code for free in the terminal, VSCode extension or discord like OpenClaw (voice supported)
type: source
tags: [github, python, claude-code, proxy, api]
created: 2026-05-08
updated: 2026-05-08
source: ../../../archive/resources/github/Alishahryar1-free-claude-code-2026-05-08.json
stars: 22498
forks: 3250
language: Python
license: MIT
github_url: https://github.com/Alishahryar1/free-claude-code
---

# Free Claude Code

> [!tip] Repository Overview
> ⭐ **22,498 Stars** | 🍴 **3,250 Forks** | 🔥 **Use claude-code for free in the terminal, VSCode extension or discord like OpenClaw (voice supported)**

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [Alishahryar1/free-claude-code](https://github.com/Alishahryar1/free-claude-code) |
| **Stars** | ⭐ 22,498 |
| **Forks** | 🍴 3,250 |
| **语言** | Python |
| **许可证** | MIT |
| **创建时间** | 2026-01-28 |
| **更新时间** | 2026-05-08 |

## 项目介绍

**Free Claude Code** 是一个 Anthropic 兼容的代理服务，用于将 Claude Code 的 API 流量路由到多种免费或本地的 AI 模型提供商。它解决了 Claude Code 必须付费使用的问题，同时保持客户端协议的稳定性。

### 核心定位

- **降低门槛**：让开发者免费使用 Claude Code
- **多提供商支持**：支持 NVIDIA NIM、OpenRouter、DeepSeek、LM Studio、llama.cpp、Ollama 等 6 种后端
- **模型路由**：按模型层级（Opus/Sonnet/Haiku）自动路由到不同提供商
- **本地优先**：支持完全本地运行的模型，无需网络

### 解决的问题

1. Claude Code 官方需要付费的 Anthropic API 密钥
2. 开发者希望使用免费或本地模型进行开发
3. 需要在多种 AI 提供商之间灵活切换
4. 本地模型部署后的 Claude Code 集成问题

## 技术架构

```
Claude Code CLI / IDE
        |
        | Anthropic Messages API
        v
Free Claude Code proxy (:8082)
        |
        | provider-specific request/stream adapter
        v
NIM / OpenRouter / DeepSeek / LM Studio / llama.cpp / Ollama
```

### 项目结构

```
free-claude-code/
├── server.py              # ASGI 入口点
├── api/                   # FastAPI 路由、服务层、路由、优化
├── core/                  # 共享 Anthropic 协议助手和 SSE 工具
├── providers/             # 提供商传输、注册表、速率限制
├── messaging/             # Discord/Telegram 适配器、会话、语音
├── cli/                   # 包入口点和 Claude 进程管理
├── config/                # 设置、提供商目录、日志
└── tests/                 # 单元和契约测试
```

### 核心技术栈

| 组件 | 技术 |
|------|------|
| **Web 框架** | FastAPI + Uvicorn |
| **包管理** | uv (Astral) |
| **类型检查** | Ty |
| **代码格式** | Ruff |
| **日志** | Loguru |
| **测试** | Pytest |

### 支持的提供商

| 提供商 | 前缀 | 传输协议 | 默认基础 URL |
|--------|------|----------|--------------|
| NVIDIA NIM | `nvidia_nim/...` | OpenAI Chat 翻译 | `https://integrate.api.nvidia.com/v1` |
| Kimi | `kimi/...` | OpenAI Chat 翻译 | `https://api.moonshot.ai/v1` |
| OpenRouter | `open_router/...` | Anthropic Messages | `https://openrouter.ai/api/v1` |
| DeepSeek | `deepseek/...` | Anthropic Messages | `https://api.deepseek.com/anthropic` |
| LM Studio | `lmstudio/...` | Anthropic Messages | `http://localhost:1234/v1` |
| llama.cpp | `llamacpp/...` | Anthropic Messages | `http://localhost:8080/v1` |
| Ollama | `ollama/...` | Anthropic Messages | `http://localhost:11434` |

## 安装与使用

### 环境要求

- Python 3.14+
- uv 包管理器
- Claude Code CLI

### 安装步骤

#### 1. 安装依赖

**macOS/Linux:**
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
uv self update
uv python install 3.14
```

**Windows PowerShell:**
```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
uv self update
uv python install 3.14
```

#### 2. 克隆并配置

```bash
git clone https://github.com/Alishahryar1/free-claude-code.git
cd free-claude-code
cp .env.example .env
```

编辑 `.env` 文件，选择一个提供商（以 NVIDIA NIM 为例）：
```dotenv
NVIDIA_NIM_API_KEY="nvapi-your-key"
MODEL="nvidia_nim/z-ai/glm4.7"
ANTHROPIC_AUTH_TOKEN="freecc"
```

#### 3. 启动代理

```bash
uv run uvicorn server:app --host 0.0.0.0 --port 8082
```

#### 4. 运行 Claude Code

**PowerShell:**
```powershell
$env:ANTHROPIC_AUTH_TOKEN="freecc"
$env:ANTHROPIC_BASE_URL="http://localhost:8082"
$env:CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY="1"
claude
```

**Bash:**
```bash
ANTHROPIC_AUTH_TOKEN="freecc" ANTHROPIC_BASE_URL="http://localhost:8082" CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY=1 claude
```

## 使用案例

### 案例 1：使用免费模型

通过 OpenRouter 使用免费模型：
```dotenv
OPENROUTER_API_KEY="sk-or-your-key"
MODEL="open_router/stepfun/step-3.5-flash:free"
```

### 案例 2：本地 Ollama 模型

```bash
ollama pull llama3.1
ollama serve
```

```dotenv
OLLAMA_BASE_URL="http://localhost:11434"
MODEL="ollama/llama3.1"
```

### 案例 3：按模型层级路由

```dotenv
NVIDIA_NIM_API_KEY="nvapi-your-key"
OPENROUTER_API_KEY="sk-or-your-key"

MODEL_OPUS="nvidia_nim/moonshotai/kimi-k2.5"
MODEL_SONNET="open_router/deepseek/deepseek-r1-0528:free"
MODEL_HAIKU="lmstudio/unsloth/GLM-4.7-Flash-GGUF"
MODEL="nvidia_nim/z-ai/glm4.7"
```

### 案例 4：Discord 远程编码会话

```dotenv
MESSAGING_PLATFORM="discord"
DISCORD_BOT_TOKEN="your-discord-bot-token"
ALLOWED_DISCORD_CHANNELS="123456789"
CLAUDE_WORKSPACE="./agent_workspace"
ALLOWED_DIR="C:/Users/yourname/projects"
```

## 核心特性

- **🔄 透明代理**：Claude Code 的即插即用代理，无需修改代码
- **🖥️ 六种提供商**：NVIDIA NIM、OpenRouter、DeepSeek、LM Studio、llama.cpp、Ollama
- **📊 智能路由**：按 Opus/Sonnet/Haiku 层级自动路由到最优提供商
- **💬 对话分支**：支持 Discord/Telegram 机器人的回复式对话分支
- **🎤 语音笔记**：通过 Whisper 或 NVIDIA NIM 转录语音输入
- **🔍 模型发现**：原生 `/model` picker 支持，自动发现可用模型
- **📡 流式响应**：支持流式输出、工具调用、思考块处理
- **🛠️ 本地优化**：本地请求优化，减少延迟和配额消耗

## 配置参考

### 模型路由配置

```dotenv
MODEL="nvidia_nim/z-ai/glm4.7"
MODEL_OPUS=           # 可选：覆盖 Opus 模型
MODEL_SONNET=         # 可选：覆盖 Sonnet 模型
MODEL_HAIKU=          # 可选：覆盖 Haiku 模型
ENABLE_MODEL_THINKING=true  # 启用思考能力
```

### 速率限制配置

```dotenv
PROVIDER_RATE_LIMIT=1       # 每窗口请求数
PROVIDER_RATE_WINDOW=3      # 时间窗口（秒）
PROVIDER_MAX_CONCURRENCY=5  # 最大并发数
HTTP_READ_TIMEOUT=120       # 读取超时
```

## 常见问题

### Claude Code 显示 `undefined ... input_tokens`

1. 确保 `ANTHROPIC_BASE_URL` 是 `http://localhost:8082`，不是 `/v1` 结尾
2. 确保代理返回的是 SSE 格式的 Server-Sent Events
3. 检查 `server.log` 中是否有上游 400/500 响应

### llama.cpp 或 LM Studio 返回 HTTP 400

1. 确保本地服务器支持 `POST /v1/messages`
2. 确保模型和运行时支持请求的上下文长度
3. 确保 llama.cpp 启动时有足够的 `--ctx-size`
4. 确保基础 URL 包含 `/v1`（LM Studio 和 llama.cpp 需要）

## 相关链接

- [GitHub 仓库](https://github.com/Alishahryar1/free-claude-code)
- [Issues](https://github.com/Alishahryar1/free-claude-code/issues)
- [NVIDIA NIM API Keys](https://build.nvidia.com/settings/api-keys)
- [OpenRouter Keys](https://openrouter.ai/keys)
- [DeepSeek API Keys](https://platform.deepseek.com/api_keys)

---

*收集时间: 2026-05-08 | 收集工具: github-collect skill v3.1*
