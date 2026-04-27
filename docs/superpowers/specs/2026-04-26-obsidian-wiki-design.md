# Obsidian Wiki Skill 设计文档

> 创建时间: 2026-04-26
> 状态: 已批准

## 概述

创建一个用户级全局 Skill，用于快速初始化基于 Obsidian + obsidian-cli 的 Wiki 知识库。灵感来源于本项目（Claude Code Best Practice）的成功实践。

## 目标

- 一键初始化完整 Wiki 目录结构
- 预置 Obsidian 最佳配置
- 标准化 Frontmatter 规范
- 内置 Wiki 工作流脚本

## 设计规格

### 技能元数据

| 属性 | 值 |
|------|-----|
| Skill ID | `obsidian-wiki` |
| 触发方式 | `/obsidian-wiki` |
| 前置条件 | obsidian-cli 已安装并运行 |
| 输出 | 完整 Wiki 目录结构 |

### 目录结构

```
obsidian-wiki/
├── SKILL.md                # 主技能定义
├── TEMPLATE/               # Wiki 模板
│   ├── wiki/
│   │   ├── concepts/      # 核心概念
│   │   ├── entities/      # 实体文档
│   │   ├── guides/        # 操作指南
│   │   ├── synthesis/     # 综合分析
│   │   ├── tutorial/      # 教程
│   │   ├── tips/          # 实用技巧
│   │   ├── index.md       # Wiki 索引
│   │   └── WIKI.md        # Schema 规范
│   ├── archive/            # 归档目录
│   ├── raw/               # 待处理文档
│   ├── docs/               # 项目文档
│   ├── scripts/
│   │   └── wiki-lint.sh   # 健康检查脚本
│   └── .obsidian/          # Obsidian 配置
└── README.md               # 使用说明
```

### 工作流程

```
用户执行 /obsidian-wiki
    ↓
询问 Wiki 名称（如 "AI研究"）
    ↓
询问目标路径（如 "~/wiki/ai-research"）
    ↓
验证 obsidian-cli 可用
    ↓
复制 TEMPLATE/ 到目标路径
    ↓
替换模板变量（Wiki 名称、日期等）
    ↓
初始化 obsidian vault
    ↓
创建成功，告知用户
```

### 模板变量

| 变量 | 说明 | 示例 |
|------|------|------|
| `{{WIKI_NAME}}` | Wiki 名称 | AI研究 |
| `{{DATE}}` | 创建日期 | 2026-04-26 |
| `{{USER_PATH}}` | 用户主目录 | /Users/admin |

### Frontmatter 规范（预置）

```yaml
---
name: {category}/{slug}
description: 一句话描述
type: concept | entity | source | synthesis | guide
tags: [tag1, tag2]
created: {date}
updated: {date}
source: ../../archive/{category}/filename.md
---
```

### Obsidian 配置内容

预置配置包括：
- 推荐插件列表（obsidian-surfing、dataview、templater 等）
- 主题配置（推荐 minimal/ ITS Theme）
- 快捷键配置
- 核心插件设置

## 实现文件清单

| 文件 | 用途 |
|------|------|
| `SKILL.md` | 主技能定义 |
| `TEMPLATE/wiki/index.md` | Wiki 索引模板 |
| `TEMPLATE/wiki/WIKI.md` | Schema 规范 |
| `TEMPLATE/scripts/wiki-lint.sh` | 健康检查脚本 |
| `TEMPLATE/.obsidian/config.json` | Obsidian 配置 |
| `README.md` | 使用说明 |

## 成功标准

- [ ] 用户执行 `/obsidian-wiki` 后可交互式创建 Wiki
- [ ] 生成的 Wiki 包含完整目录结构
- [ ] Frontmatter 规范已预置
- [ ] wiki-lint.sh 可正常运行
- [ ] Obsidian 可直接打开生成的 Vault

## 相关资源

- [本项目成功经验](../synthesis/project-success-insights.md)
- [Wiki Skills 参考](../.claude/skills/)
