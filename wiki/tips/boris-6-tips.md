---
name: tips/boris-6-tips
description: Opus 4.7技巧：Auto Mode、Focus Mode、Recaps、Verification
type: tips
tags: [tips, boris, opus, auto-mode, recaps, focus-mode]
created: 2026-04-16
---

# 6 Tips for Opus 4.7

> Boris Cherny 在 dogfooding Opus 4.7 几周后分享的技巧。2026年4月16日。

## 1/ Auto Mode — 无需权限提示

Opus 4.7 喜欢做复杂的长时间任务：**deep research、refactoring code、building complex features、iterating until 性能 benchmark 达到**。

**Auto mode** 作为更安全的替代方案：
- 如果安全，自动批准
- 如果有风险，暂停并询问

这意味着无需 babysitting 就能运行。**Shift+Tab** 循环切换 `Ask permissions` → `Plan mode` → `Auto mode`。

---

## 2/ /fewer-permission-prompts Skill

新发布的 skill 扫描会话历史，查找常见安全但重复提示的 bash 和 MCP 命令，推荐添加到权限白名单。

---

## 3/ Recaps

**Recaps** 是 agent 做了什么、下一步是什么的简短摘要。

返回长时间运行的会话后非常有用：

```
* Cogitated for 6m 27s
* recap: Fixing the post-submit transcript shift bug...
  Next: need a screen recording...
(disable recaps in /config)
```

---

## 4/ Focus Mode

使用 `/focus` 切换 — 隐藏中间工作，只关注最终结果。

Boris 到达了他信任模型运行正确命令和做出正确编辑的阶段。他只看最终结果。

---

## 5/ 配置 Effort Level

Opus 4.7 使用 **adaptive thinking** 而非 thinking budgets。调节 effort：
- **Lower effort** — 更快响应、更低 token 使用
- **Higher effort** — 最大智能和能力

滑块显示 5 级：`low` · `medium` · `high` · `xhigh` · `max`

---

## 6/ 给 Claude 一种验证方式（最重要）

4.7 的产出是之前的 2-3 倍，所以验证比以往更重要。

验证因任务而异：
- **Backend** — 让 Claude 运行 server/service 进行 E2E 测试
- **Frontend** — 使用 [Claude Chromium extension](https://code.claude.com/docs/en/chrome)
- **Desktop apps** — 使用 Computer Use

Boris 的 prompt 看起来像 `Claude do blah blah /go`，其中 `/go` 是一个 skill：
1. 使用 bash、browser 或 computer use 进行自测
2. 运行 `/simplify`
3. 创建 PR

---

## 来源

- [Boris Cherny (@bcherny) on X — April 16, 2026](https://x.com/bcherny)
