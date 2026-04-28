---
name: sources/sdk-vs-cli-system-prompts
description: Claude Agent SDK vs CLI 系统提示词对比 — 输出一致性分析
type: source
tags: [sdk, cli, system-prompts, comparison]
created: 2026-04-20
updated: 2026-04-26
source: ../../archive/reports/claude-agent-sdk-vs-cli-system-prompts.md
---

# SDK vs CLI System Prompts

> Claude Agent SDK 与 CLI 工具系统提示词对比分析，探讨两者在输出一致性上的差异及其对开发工作流的影响。

Claude Agent SDK 与 Claude CLI 的系统提示词架构根本不同：CLI 使用模块化系统提示词架构（~269 基础 token + 条件加载），SDK 默认使用极简提示词。两者输出一致性无法保证，因为缺少 seed 参数且存在固有非确定性。

## 相关页面

- [[claude-skills]] — Skills 系统
- [[agent-harness]] — Agent Harness
