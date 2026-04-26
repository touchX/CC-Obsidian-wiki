---
name: tips/boris-15-tips
description: 15个隐藏功能：Mobile App、Teleport、loop、Dispatch、Git Worktrees
type: tips
tags: [tips, boris, mobile, teleport, loop, dispatch, worktrees, batch, voice]
created: 2026-03-30
---

# 15 Hidden & Under-Utilized Features

> Boris Cherny 最喜欢的隐藏和未被充分利用的功能。2026年3月30日。

## 1/ Claude Code 有移动 App

从 iOS/Android App 写代码：
- 下载 Claude App
- 进入 **Code** 标签页
- 审查变更、批准 PR、直接写代码

---

## 2/ 跨设备移动会话

- **Teleport**: `claude --teleport` 或 `/teleport` 将云会话拉到本地
- **Remote Control**: `/remote-control` 从手机/网页控制本地会话

Boris 在 `/config` 中设置 **"Enable Remote Control for all sessions"**。

---

## 3/ /loop 和 /schedule — 最强大的功能

自动按设定间隔运行 Claude（最长一周）：

- `/loop 5m /babysit` — 自动处理 code review、自动 rebase、shepherd PRs
- `/loop 30m /slack-feedback` — 每 30 分钟自动为 Slack 反馈创建 PRs
- `/loop /post-merge-sweeper` — 处理遗漏的 review 评论
- `/loop 1h /pr-pruner` — 关闭过时 PRs

将工作流转换为 skills + loops，非常强大。

---

## 4/ Hooks 确定性地运行逻辑

- **SessionStart** — 每次启动时动态加载上下文
- **PreToolUse** — 记录模型运行的每个 bash 命令
- **PermissionRequest** — 路由到 WhatsApp 审批
- **Stop** — 提醒 Claude 继续工作

---

## 5/ Cowork Dispatch

Dispatch 是 Claude Desktop App 的安全远程控制：
- 可使用 MCP、浏览器、计算机
- 委托非编码任务

---

## 6/ Chrome Extension 做前端工作

**给 Claude 一种验证输出的方式**：

- 给他浏览器，他就能迭代直到结果看起来很好
- Boris 做 web 代码时每次都使用 Chrome extension
- 比其他 MCP 更可靠

---

## 7/ Desktop App 自动启动和测试 Web 服务器

Desktop App 捆绑了 Claude 自动运行 web 服务器并在内置浏览器中测试的功能。

---

## 8/ Fork 会话

两种方式：
1. 运行 `/branch` 分叉会话
2. CLI: `claude --resume <session-id> --fork-session`

---

## 9/ /btw 边查询

在 agent 工作时快速回答问题而不中断任务：

```
/btw how do I spell dachshund?
> dachshund — German for "badger dog"
```

---

## 10/ Git Worktrees

Claude Code 原生支持 git worktrees：
- `claude -w` 在 worktree 中启动新会话
- Desktop App 中的 **"worktree" 复选框**
- 非 Git VCS 用户使用 `WorktreeCreate` hook

---

## 11/ /batch 批量处理大规模变更

`/batch` 采访你后，将工作分发到尽可能多的 **worktree agents**（数十、数百甚至数千）。

---

## 12/ --bare 加速 SDK 启动 10 倍

默认 SDK 搜索本地 CLAUDE.md、settings、MCP。对于非交互式使用：

```bash
claude -p "summarize this codebase" \
    --output-format=stream-json \
    --bare
```

---

## 13/ --add-dir 访问更多文件夹

`--add-dir` 或 `/add-dir` 让 Claude 看到其他仓库并获得权限。

或在 `settings.json` 中设置 `"additionalDirectories"`。

---

## 14/ --agent 自定义 System Prompt

定义新 agent 后运行：

```bash
claude --agent=<your agent's name>
```

Agents 可限制工具、自定义描述、特定模型。

---

## 15/ /voice 语音输入

Boris 大部分代码通过语音输入：

- CLI: `/voice` 然后按住空格键说话
- Desktop: 按语音按钮
- iOS 设置中启用听写

---

## 来源

- [Boris Cherny (@bcherny) on X — March 30, 2026](https://x.com/bcherny/status/2038454336355999749)
