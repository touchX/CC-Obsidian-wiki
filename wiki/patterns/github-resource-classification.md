---
name: patterns/github-resource-classification
description: Claude Code 生态 GitHub 资源系统性分类方法 — 仓库识别、差异化定位、标准化文档结构
type: pattern
tags: [github, claude-code, classification, wiki, content-strategy, ecosystem-analysis]
created: 2026-05-01
updated: 2026-05-01
source: ../../archive/patterns/github-resource-classification-2026-05-01.md
---

# GitHub 资源分类模式

> Claude Code 生态资源的系统性收集、分类与文档化方法

## 关键发现

### 1. 仓库分类三角法

通过目录结构和核心文件快速识别仓库类型：

| 类型 | 检测特征 | 示例 |
|------|----------|------|
| **Skills 仓库** | `AGENTS.md` + `skills/` 目录 | affaan-m/everything-claude-code |
| **教程仓库** | 结构化章节（01-xx/）+ 多语言 | luongnv89/claude-howto |
| **框架仓库** | 核心代码 + 完整工具链 | microsoft/agent-lightning |
| **本地化仓库** | 多语言 README + 社区配置 | Yeachan-Heo/oh-my-claudecode |

**应用价值**：
- 快速识别仓库类型（3-5 秒）
- 选择合适的文档模板
- 突出核心特色内容

### 2. 差异化定位分析

每个资源页面都包含**对标项目分析**表格：

```markdown
| 项目 | Stars | 特色 |
|------|-------|------|
| 项目 A | XXX | 🏷️ 独特价值 |
| 项目 B | YYY | 🎯 目标用户 |
| 本项目 | - | 💫 差异化亮点 |
```

**价值体现**：
- 帮助用户快速理解生态格局
- 避免重复收集相似项目
- 突出每个项目的独特贡献

### 3. 标准化内容结构

#### 必需组件
- ✅ **基本信息表**（Stars、语言、许可证）
- ✅ **核心亮点**（3-5 条带 emoji）
- ✅ **项目结构**（目录树）
- ✅ **对标分析**（与其他项目对比）

#### 可选组件（根据类型）
- Skills 仓库：技能模块列表、使用场景
- 教程仓库：学习路径图、章节目录
- 框架仓库：技术架构图、核心模块说明

## 上下文

本次会话完成了 4 个仓库的收集：
1. **Yeachan-Heo/oh-my-claudecode** — 韩国开发者本地化
2. **luongnv89/claude-howto** — 结构化教程（10章）
3. **microsoft/agent-lightning** — Microsoft Agent 框架
4. ⚠️ 知乎链接 — 已拒绝（非 GitHub 仓库）

发现了仓库类型的自然分类模式，形成了可复用的分析方法。

## 应用场景

### 持续资源收集
使用相同模板维护一致性，建立标准化资源库

### 新项目评估
快速判断是否值得收录，避免重复劳动

### 生态分析
通过对标表格发现空缺领域，指导下一步收集方向

### 用户导航
帮助用户快速找到需要的资源类型（Skills/教程/框架）

## 最佳实践

### DO ✅
- 每个页面都包含对标项目分析
- 突出项目的独特价值主张（💫 emoji）
- 使用 emoji 增强可读性
- 归档原始 JSON 数据（用于未来分析）

### DON'T ❌
- 不区分项目类型，使用相同模板
- 遗漏对标分析（失去了生态视角）
- 过度描述技术细节（用户关心价值）
- 忘记更新 wiki/log.md（失去操作历史）

## 模板示例

### Skills 仓库模板片段
```markdown
## 核心技能

| 技能 | 说明 |
|------|------|
| `planner.md` | 功能实现规划 |
| `architect.md` | 系统架构设计 |
```

### 框架仓库模板片段
```markdown
## 技术架构

### 分层设计
应用层 → 框架层 → 适配层 → LLM Provider
```

## 经验教训

### URL 格式验证
- **错误**：用户提供知乎文章链接
- **处理**：立即拒绝，明确正确格式
- **结果**：避免创建无效文件

### 分类的重要性
- 没有分类，用户无法快速找到需要的资源
- 对标分析提供了生态视角，而不只是单一项目介绍
- 标准化模板提高了 Wiki 的整体质量

## 相关 Wiki 页面

- [[resources/github-repos/README]] — 资源收集指南
- [[WIKI]] — Wiki Schema 规范
- [[log]] — 操作历史记录

---

*沉淀时间: 2026-05-01*
*会话: GitHub 资源收集系列*
