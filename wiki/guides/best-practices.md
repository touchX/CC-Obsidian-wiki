---
name: guides/best-practices
description: Claude Code 最佳实践：验证、规划、提示技巧和环境配置
type: guide
tags: [best-practices, workflow, tips]
created: 2026-04-27
updated: 2026-04-27
source: ../../../archive/cc-doc/Claude Code 最佳实践.md
---

# Claude Code 最佳实践

## 核心约束

Claude 的 context window 填充很快，填充时性能会下降。这是**最重要的资源**。

> 观看[交互式演练](https://code.claude.com/docs/zh-CN/context-window)了解会话如何填充上下文。

---

## 给 Claude 一种验证其工作的方式

这是**最高杠杆**的事情。当 Claude 能验证自己工作时，表现显著提高。

| 策略 | 示例 |
|------|------|
| **提供验证标准** | *"编写 validateEmail 函数。测试用例：[user@example.com](mailto:user@example.com) 为真，invalid 为假。实现后运行测试"* |
| **视觉验证 UI** | *"[粘贴截图] 实现此设计。对结果截图比较，列出差异并修复"* |
| **解决根本原因** | *"构建失败，错误：[粘贴错误]。修复并验证，不要抑制错误"* |

**验证方法**：测试套件、linter、bash 命令、屏幕截图。

---

## 先探索，再规划，最后编码

使用 [Plan Mode](https://code.claude.com/docs/zh-CN/common-workflows#use-plan-mode-for-safe-code-analysis) 将探索与执行分开。

| 任务类型 | 推荐方式 |
|----------|----------|
| 范围明确、修复很小 | 直接执行（如修复拼写错误） |
| 方法不确定、更改多文件、不熟悉代码 | 使用 Plan Mode |
| 能用一句话描述 diff | 跳过计划 |

---

## 在提示中提供具体上下文

| 策略 | 之前 | 之后 |
|------|------|------|
| **限定任务范围** | *"为 foo.py 添加测试"* | *"为 foo.py 编写测试，覆盖用户已注销边界情况，避免 mock"* |
| **指向来源** | *"为什么 ExecutionFactory 有奇怪的 api？"* | *"查看 ExecutionFactory 的 git 历史并总结其 api 如何形成"* |
| **参考现有模式** | *"添加日历小部件"* | *"查看 HotDogWidget.php 的模式，按该模式实现日历小部件"* |
| **描述症状** | *"修复登录错误"* | *"用户报告会话超时后登录失败，检查 src/auth/ 认证流程，编写失败测试重现问题"* |

### 提供丰富的内容

- 使用 `@` 引用文件，Claude 会自动读取
- 直接粘贴图像（复制/粘贴或拖放）
- 提供 URL 用于文档参考
- 管道数据：`cat error.log | claude`
- 让 Claude 自己获取上下文

---

## 配置你的环境

### 编写有效的 CLAUDE.md

运行 `/init` 根据项目结构生成启动 CLAUDE.md 文件。

| ✅ 包括 | ❌ 排除 |
|---------|---------|
| Claude 无法猜测的 Bash 命令 | Claude 可从代码推断的内容 |
| 与默认值不同的代码风格规则 | Claude 已知的标准语言约定 |
| 测试指令和首选测试运行器 | 详细 API 文档（链接即可） |
| 存储库礼仪（分支命名、PR 约定） | 经常变化的信息 |
| 特定项目的架构决策 | 长解释或教程 |
| 开发者环境怪癖（必需的环境变量） | 自明的实践 |
| 常见陷阱或非显而易见的行为 | 文件逐个描述代码库 |

**原则**：保持简洁。每一行问自己 *"删除这个会让 Claude 犯错吗？"* 如果不会，删除它。

### 添加强调改进遵守

```markdown
# IMPORTANT: 这个项目使用 TypeScript
# YOU MUST: 每次修改后运行 tsc --noEmit
```

### 多文件导入

```markdown
See @README.md for overview and @package.json for npm commands.
See @docs/git-instructions.md for git workflow.
```

### CLAUDE.md 位置

| 位置 | 作用域 |
|------|--------|
| `~/.claude/CLAUDE.md` | 所有会话 |
| `./CLAUDE.md`（项目根目录） | 与团队共享 |

---

## 相关页面

- [[wiki/entities/claude-code]] — Claude Code 核心机制
- [[concepts/context-window]] — 上下文窗口原理
- [[guides/workflows]] — 常见工作流程
- [[wiki/entities/claude-skills]] — Skills 系统
- [[wiki/entities/claude-hooks]] — Hooks 系统

## 来源

- [Claude Code 最佳实践](https://code.claude.com/docs/zh-CN/best-practices) — 官方文档
