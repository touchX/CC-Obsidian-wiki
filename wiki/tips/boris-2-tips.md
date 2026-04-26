---
name: tips/boris-2-tips
description: Code Review与Test Time Compute技巧
type: tips
tags: [tips, boris, code-review, test-time-compute]
created: 2026-03-10
---

# Code Review & Test Time Compute

> Boris Cherny 分享的两个关键洞察。2026年3月10日。

## 1/ Code Review

Claude Code 内置 **Code Review** — 一组 agents 对每个 PR 进行深度审查。

- 为 Anthropic 自己的团队先构建 — 每个工程师的代码产出今年增加了 **200%**
- Boris 使用几周后发现它捕获了很多他本来不会注意到的真实 bug
- PR 打开时，Claude 派遣一组 agents 寻找 bug

---

## 2/ Test Time Compute & Multiple Context Windows

简言之，投给编程问题的 tokens 越多，结果越好。Boris 称之为 **test time compute**。

关键洞察：**separate context windows** 让结果更好 — 这就是 subagents 工作的原理，也是为什么一个 agent 可能产生 bug 而另一个（使用完全相同的模型）能找到它们。

- 类似于工程团队：如果你造成 bug，review 你代码的同事可能更可靠地找到它
- 在极限情况下，agents 可能写出完美的无 bug 代码
- 在那之前，**多个不相关的 context windows** 是一个好的方法

---

## 来源

- [Boris Cherny (@bcherny) on X — March 10, 2026](https://x.com/bcherny)
