---
name: tools/codex-cli
description: Codex CLI - OpenAI 的终端编码助手，支持 apply_patch 和沙箱模式
type: source
tags: [claude-code, agent, terminal, openai, codex]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/Open Source prompts/Codex CLI/openai-codex-cli-system-prompt-20250820.txt
---

# Codex CLI

Codex CLI 是 OpenAI 开发的终端编码助手，专注于为开发者提供快速、高效的代码编辑体验。

## 核心工具

### apply_patch

Codex CLI 使用 `apply_patch` 工具进行代码修改：

```json
{
  "tool": "apply_patch",
  "path": "src/index.ts",
  "operations": [
    {"op": "replace", "start": 10, "end": 15, "content": "新代码内容"}
  ]
}
```

### update_plan

任务进度跟踪工具：

```json
{
  "tool": "update_plan",
  "status": "in_progress",
  "current_task": "实现用户认证",
  "next_steps": ["添加 JWT 验证", "实现登录页面"]
}
```

## 操作模式

### Sandbox 模式

沙箱模式提供隔离的代码编辑环境：

```yaml
mode: sandbox
features:
  - 隔离的文件系统
  - 临时修改
  - 安全的代码执行
```

### Approval 模式

审批模式需要用户确认每个修改：

```yaml
mode: approval
features:
  - 修改预览
  - 逐个审批
  - 批量确认
```

## 个性特点

### 简洁风格

Codex CLI 响应风格简洁直接：

```markdown
用户: 添加用户登录功能
Codex: 实现中...
- 添加 auth.ts 路由
- 添加 login API 端点
- 添加 JWT 验证中间件
```

### 技术导向

专注于代码质量和最佳实践：

```markdown
- 使用 TypeScript 严格模式
- 遵循 ESLint 规则
- 优化代码结构
```

## 使用场景

| 场景 | Codex CLI 响应 |
|------|----------------|
| 代码修改 | apply_patch 精确修改 |
| 任务跟踪 | update_plan 进度更新 |
| 安全编辑 | approval 审批模式 |
| 快速开发 | sandbox 沙箱模式 |

## 相关链接

- [[tools/amp-claude-4-sonnet]] - Amp 开发代理
- [[tools/amp-gpt-5]] - Amp GPT-5 版本
- [[tools/cluely-default]] - Cluely 默认版

---

*来源：[Codex CLI System Prompt](https://github.com/openai/codex)*