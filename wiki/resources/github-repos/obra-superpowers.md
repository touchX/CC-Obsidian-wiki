---
name: resources/github-repos/obra-superpowers
description: An agentic skills framework & software development methodology that works.
type: source
version: 1.0
tags: [github, shell, skills, framework, methodology, claude-code, agent]
created: 2026-04-28
updated: 2026-04-28
source: ../../../archive/resources/github/obra-superpowers-2026-04-28.json
stars: 170260
language: Shell
license: MIT
github_url: https://github.com/obra/superpowers
---

# Superpowers

完整的 AI 编码代理软件开发方法论，建立在可组合技能系统之上。

## 核心理念

| 理念 | 说明 |
|------|------|
| **测试驱动开发** | 始终先写测试 |
| **系统化优于临时** | 流程优于猜测 |
| **降低复杂度** | 简单性是首要目标 |
| **证据胜于声明** | 在声明成功前先验证 |

## 基础工作流

Superpowers 的 7 步开发流程：

### 1. Brainstorming（头脑风暴）
- 编写代码前激活
- 通过问题提炼需求
- 探索替代方案
- 分段展示设计供验证

### 2. Using Git Worktrees（使用 Git 工作树）
- 设计批准后激活
- 在新分支创建隔离工作区
- 运行项目设置
- 验证干净的测试基线

### 3. Writing Plans（编写计划）
- 批准设计后激活
- 将工作分解为小任务（每项 2-5 分钟）
- 每个任务包含：精确文件路径、完整代码、验证步骤

### 4. Executing Plans（执行计划）
- Subagent-driven-development：为每个任务分派全新子代理，两阶段审查（规范合规性 → 代码质量）
- 或者在批次执行，设置人工检查点

### 5. Test-Driven Development（测试驱动开发）
- 实施期间激活
- 强制 RED-GREEN-REFACTOR 循环
- 编写失败测试 → 看它失败 → 编写最小代码 → 看它通过 → 提交
- 删除在测试之前编写的代码

### 6. Requesting Code Review（请求代码审查）
- 任务之间激活
- 对照计划进行审查
- 按严重程度报告问题
- 关键问题阻止进度

### 7. Finishing a Development Branch（完成开发分支）
- 任务完成时激活
- 验证测试
- 展示选项（合并/PR/保留/丢弃）
- 清理工作树

## 技能库

### 测试相关
- **test-driven-development** — RED-GREEN-REFACTOR 循环（包含测试反模式参考）

### 调试相关
- **systematic-debugging** — 4 阶段根因过程（包含根因追踪、纵深防御、基于条件的等待技术）
- **verification-before-completion** — 确保真正修复

### 协作相关
- **brainstorming** — 苏格拉底式设计优化
- **writing-plans** — 详细实施计划
- **executing-plans** — 带检查点的批次执行
- **dispatching-parallel-agents** — 并发子代理工作流
- **requesting-code-review** — 预审查检查清单
- **receiving-code-review** — 响应反馈
- **using-git-worktrees** — 并行开发分支
- **finishing-a-development-branch** — 合并/PR 决策工作流
- **subagent-driven-development** — 两阶段审查的快速迭代（规范合规性 → 代码质量）

### 元相关
- **writing-skills** — 遵循最佳实践创建新技能（包含测试方法学）
- **using-superpowers** — 技能系统介绍

## 安装方式

### Claude Code Official Marketplace
```bash
/plugin install superpowers@claude-plugins-official
```

### Claude Code (Superpowers Marketplace)
```bash
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

### OpenAI Codex CLI
```bash
/plugins  # 打开插件搜索
superpowers  # 搜索并安装
```

### Cursor
```
/add-plugin superpowers
```

### GitHub Copilot CLI
```bash
copilot plugin marketplace add obra/superpowers-marketplace
copilot plugin install superpowers@superpowers-marketplace
```

### Gemini CLI
```bash
gemini extensions install https://github.com/obra/superpowers
```

## 工作原理

当你的编码代理启动时，它不会直接跳转到编写代码。相反：

1. **退一步询问** — 你真正想做什么
2. **提炼规范** — 从对话中提取规格
3. **分段展示** — 以短到可读和消化的块展示设计
4. **制定计划** — 为热情但不挑剔、无项目上下文、厌恶测试的初级工程师制定清晰计划
5. **执行开发** — 子代理驱动的开发过程，每个工程任务都有代理工作、检查和审查
6. **持续前进** — Claude 可以自主工作数小时而不偏离计划

## 社区资源

- **作者**: [Jesse Vincent](https://blog.fsck.com)
- **组织**: [Prime Radiant](https://primeradiant.com)
- **Discord**: [加入社区](https://discord.gg/35wsABTejz)
- **Issues**: https://github.com/obra/superpowers/issues
- **发布公告**: [Sign up](https://primeradiant.com/superpowers/)
- **博客**: [原始发布公告](https://blog.fsck.com/2025/10/09/superpowers/)

---

*归档时间: 2026-04-28*
