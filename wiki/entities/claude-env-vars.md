---
name: entities/claude-env-vars
description: Claude Code 环境变量完整参考 — 配置、认证和运行时行为控制
type: entity
tags: [env-vars, configuration, settings, environment]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/环境变量.md
---

# Claude Code 环境变量

Claude Code 支持多种环境变量来配置行为、认证和运行时设置。

## 认证变量

| 变量 | 说明 |
| --- | --- |
| `ANTHROPIC_API_KEY` | Anthropic API 密钥 |
| `ANTHROPIC_BASE_URL` | API 端点 URL（用于代理） |
| `ANTHROPIC_ACCOUNT_ID` | 指定账户 ID |
| `ANTHROPIC_API_KEY_FILE` | API 密钥文件路径 |

## 认证文件位置

Claude Code 按以下顺序查找 API 密钥：

1. `ANTHROPIC_API_KEY` 环境变量
2. `.env` 文件中的 `ANTHROPIC_API_KEY`
3. `~/.claude/.env` 文件
4. `~/.config/claude/.env` 文件

## 云提供商配置

### Amazon Bedrock

| 变量 | 说明 |
| --- | --- |
| `CLAUDE_CODE_USE_BEDROCK` | 启用 Bedrock (设为 1) |
| `AWS_ACCESS_KEY_ID` | AWS 访问密钥 |
| `AWS_SECRET_ACCESS_KEY` | AWS 密钥 |
| `AWS_REGION` | AWS 区域 |

### Google Vertex AI

| 变量 | 说明 |
| --- | --- |
| `CLAUDE_CODE_USE_VERTEX` | 启用 Vertex (设为 1) |
| `CLOUDSDK_CORE_PROJECT` | GCP 项目 ID |
| `CLOUDSDK_COMPUTE_REGION` | GCP 区域 |

## 会话控制

| 变量 | 说明 |
| --- | --- |
| `CLAUDE_TOKEN_BUDGET` | 会话令牌预算限制 |
| `CLAUDE_CODE_FORK_SUBAGENT` | `/fork` 生成分叉的 subagent |
| `CLAUDE_CODE_DISABLE_BACKGROUND_TASKS` | 禁用后台任务功能 |
| `CLAUDE_CODE_TASK_LIST_ID` | 任务列表目录 ID |

## Bash 工具

| 变量 | 说明 |
| --- | --- |
| `CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR` | 禁用目录延续 |
| `CLAUDE_ENV_FILE` | 环境变量文件路径 |

## 开发选项

| 变量 | 说明 |
| --- | --- |
| `CLAUDE_CODE_DEBUG` | 启用调试日志 |
| `CLAUDE_CODE_VERBOSE` | 详细输出 |

## 非交互模式

| 变量 | 说明 |
| --- | --- |
| `CI` | 标记为 CI 环境 |
| `CLAUDE_CODE_NONINTERACTIVE` | 非交互模式 |
| `DISABLE_TELEMETRY` | 禁用遥测 |
| `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC` | 禁用非必要流量 |

## 初始化

| 变量 | 说明 |
| --- | --- |
| `CLAUDE_CODE_NEW_INIT` | 交互式初始化流程 |

## 使用示例

```bash
# 基本配置
export ANTHROPIC_API_KEY="sk-ant-..."

# Bedrock 配置
export CLAUDE_CODE_USE_BEDROCK=1
export AWS_REGION="us-east-1"

# 调试模式
export CLAUDE_CODE_DEBUG=1

# CI 环境
export CI=true
export DISABLE_TELEMETRY=1
```

## 相关页面

- [[claude-cli]] — CLI 基础
- [[claude-settings]] — 配置选项
- [[claude-permissions]] — 权限管理
