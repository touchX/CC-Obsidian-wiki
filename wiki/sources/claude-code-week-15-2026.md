---
name: sources/claude-code-week-15-2026
description: Claude Code Week 15 周报 — Ultraplan、Monitor tool、/autofix-pr、/team-onboarding
type: source
tags: [claude, changelog, week-15, ultraplan, monitor, autofix-pr, team-onboarding]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/Week 15 · April 6–10, 2026.md
---

> Releases [v2.1.92 → v2.1.101](https://code.claude.com/docs/en/changelog#2-1-92) · 4 features · April 6–10

## Ultraplan（预览版）

云端规划模式：在终端启动计划模式，结果在浏览器中审查。Claude 在 Web 会话中起草计划，终端保持空闲；完成后可逐段评论、请求修订，选择远程执行或发回 CLI。

```text
> /ultraplan migrate the auth service from sessions to JWTs
```

[Ultraplan guide](https://code.claude.com/docs/en/ultraplan)

---

## Monitor Tool (v2.1.98)

后台监视器工具，将事件流式传输到对话中：每个事件作为新消息落地，Claude 立即响应。监视训练过程、PR CI 状态，或自动修复开发服务器崩溃。

```text
> Tail server.log in the background and tell me the moment a 5xx shows up
```

配合 `/loop` 使用，现在 `/loop` 支持自步调：省略间隔时间时，Claude 根据任务调度下一次执行，或直接使用 Monitor 工具跳过轮询。

[Monitor tool reference](https://code.claude.com/docs/en/tools-reference#monitor-tool)

---

## /autofix-pr

PR 自动修复已登陆 Web（Week 13），现在可在终端启用：`/autofix-pr` 自动推断当前分支的 PR，在 Claude Code on the Web 上启用自动修复。推送分支、运行命令、离开；Claude 监视 CI 和审查评论并推送修复直到通过。

```text
> /autofix-pr
```

[Auto-fix pull requests](https://code.claude.com/docs/en/claude-code-on-the-web#auto-fix-pull-requests)

---

## /team-onboarding (v2.1.101)

从本地 Claude Code 使用情况生成队友入职指南。在熟悉的项目中运行，输出结果交给新队友，让他们可以复现你的设置。

```text
> /team-onboarding
```

[Commands reference](https://code.claude.com/docs/en/commands)

---

## Other Wins

### UI/UX 改进
- **Focus view**：按 `Ctrl+O` 进入无闪烁模式，收缩视图至最后提示、工具摘要+diffstats、Claude 最终回复
- **`/agents` 标签页布局**：Running 标签显示实时子代理及 `● N running` 计数

### 平台设置向导
- 登录界面新增 **Bedrock** 和 **Vertex AI** 引导式设置：选择"3rd-party platform"获取分步认证、区域、凭证检查、模型固定

### 订阅用户
- **默认 effort 级别**：`high`（可通过 `/effort` 控制）
- **`/cost`**：显示每模型和缓存命中率明细
- **`/release-notes`**：改为交互式版本选择器

### 状态栏
- 新增 `refreshInterval` 设置，每 N 秒重新运行命令
- JSON 输入中支持 `workspace.git_worktree`

### 企业级
- `CLAUDE_CODE_PERFORCE_MODE`：只读文件编辑/写入失败时提示 `p4 edit`
- **OS CA 证书存储**：默认信任企业 TLS 代理（`CLAUDE_CODE_CERT_STORE=bundled` 可退出）
- **Bash 工具权限加固**：反斜杠转义标志、环境变量前缀、`/dev/tcp` 重定向、复合命令现在正确提示

### 集成
- **Amazon Bedrock powered by Mantle**：设置 `CLAUDE_CODE_USE_MANTLE=1`

### Hooks
- `UserPromptSubmit` hooks 可通过 `hookSpecificOutput.sessionTitle` 设置会话标题

---

[Full changelog for v2.1.92–v2.1.101 →](https://code.claude.com/docs/en/changelog#2-1-92)
