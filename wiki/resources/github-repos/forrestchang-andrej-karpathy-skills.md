---
name: forrestchang-andrej-karpathy-skills
description: A single CLAUDE.md file to improve Claude Code behavior, derived from Andrej Karpathy's observations on LLM coding pitfalls.
type: source
version: 2.0
tags: [github, claude-code, claude-md, karpathy, guidelines]
created: 2026-04-28
updated: 2026-04-28
source: ../../../../archive/resources/github/forrestchang-andrej-karpathy-skills-2026-04-28-v2.json
stars: 95206
forks: 9224
github_url: https://github.com/forrestchang/andrej-karpathy-skills
platforms: [Claude Code, Cursor]
---

# Andrej Karpathy Skills

A single `CLAUDE.md` file to improve Claude Code behavior, derived from Andrej Karpathy's observations on LLM coding pitfalls.

## 基本信息

| 字段 | 值 |
|------|-----|
| 作者 | [forrestchang](https://github.com/forrestchang) |
| Stars | ![95206](https://img.shields.io/github/stars/forrestchang/andrej-karpathy-skills) |
| Forks | 9,224 |
| 许可证 | MIT |
| 平台 | Claude Code, Cursor |

## 核心问题

Karpathy 提出的 LLM 编码三大陷阱：

1. **错误假设** — 模型无声地做出错误假设，不检查、不确认、不呈现权衡
2. **过度复杂** — 喜欢把代码和 API 过度复杂化，100 行能解决的写 1000 行
3. **副作用编辑** — 改动不理解的代码/注释，产生意外的副作用

## 四大原则

| 原则 | 核心理念 | 解决的问题 |
|------|----------|----------|
| **Think Before Coding** | 不要假设，不要隐藏困惑，呈现权衡 | 错误假设、隐藏困惑、遗漏权衡 |
| **Simplicity First** | 最小代码解决问题，不做投机 | 过度复杂、臃肿抽象 |
| **Surgical Changes** | 只改必须改的，只清理自己的烂摊子 | 无关编辑、误触代码 |
| **Goal-Driven Execution** | 定义成功标准，循环验证 | 通过测试优先、可验证的成功标准 |

### 1. Think Before Coding

**不要假设。不要隐藏困惑。呈现权衡。**

- 明确陈述假设 — 不确定时先问
- 呈现多种解释 — 存在歧义时不默默选择
- 必要时提出反对 — 更简单的方案存在时说出来
- 困惑时停下来 — 说出不清楚的地方，请求澄清

### 2. Simplicity First

**最小代码解决问题。不做投机性代码。**

- 不添加超出需求的特性
- 不为单次使用的代码创建抽象
- 不添加没要求过的"灵活性"或"可配置性"
- 不为不可能的场景添加错误处理
- 如果 200 行可以写成 50 行，重写它

### 3. Surgical Changes

**只触碰必须改的。只能清理自己的烂摊子。**

编辑现有代码时：
- 不要"改进"相邻代码、注释或格式
- 不要重构没有坏的东西
- 匹配现有风格，即使你会用不同方式
- 注意到无关的僵尸代码时，提出来 — 不要删除

### 4. Goal-Driven Execution

**定义成功标准。循环验证直到达成。**

| 不要... | 改为... |
|---------|---------|
| "添加验证" | "写无效输入的测试，然后让它们通过" |
| "修复 bug" | "写复现 bug 的测试，然后让它通过" |
| "重构 X" | "确保前后测试都通过" |

## 项目结构

```
forrestchang/andrej-karpathy-skills/
├── CLAUDE.md                    # Claude Code 项目指南 (66行)
├── CURSOR.md                    # Cursor IDE 配置指南
├── EXAMPLES.md                  # 使用示例
├── README.md                    # 英文文档
├── README.zh.md                # 中文翻译
└── skills/
    └── karpathy-guidelines/
        └── SKILL.md            # Claude Code 插件格式
```

## 快速安装

### 方式一：Claude Code 插件（推荐）

```bash
/plugin marketplace add forrestchang/andrej-karpathy-skills
/plugin install andrej-karpathy-skills@karpathy-skills
```

### 方式二：CLAUDE.md（项目级）

新项目：
```bash
curl -o CLAUDE.md https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/main/CLAUDE.md
```

现有项目（追加）：
```bash
echo "" >> CLAUDE.md
curl https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/main/CLAUDE.md >> CLAUDE.md
```

## 衍生项目

| 项目 | 说明 |
|------|------|
| [skillmaxxing](https://github.com/) | 多工具、多模式版本 |
| [product-mode](https://github.com/) | 产品级原则 |
| Level Up Coding | 教程系列 |

## 平台支持

- **Claude Code** — 通过 Plugin 或 CLAUDE.md
- **Cursor** — 通过 `.cursor/rules/karpathy-guidelines.mdc`

## 权衡说明

> 这些指南故意偏向**谨慎而非速度**。对于琐碎任务（简单的 typo 修复、明显的一行代码），请自行判断 — 不是每个变更都需要完整的严谨性。
>
> 目标是减少非平凡工作中的高成本错误，而不是拖慢简单任务。

## 原始来源

这些原则最初来自 Andrej Karpathy 的 LLM 训练材料仓库：

- **原始仓库**: [andrej-karpathy/llm.training](https://github.com/andrej-karpathy/llm.training)
- **衍生版本**: [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills) (Claude Code 优化版本)

## 链接

- **GitHub**: https://github.com/forrestchang/andrej-karpathy-skills
- **Issue**: https://github.com/forrestchang/andrej-karpathy-skills/issues
- **原始来源**: https://github.com/andrej-karpathy/llm.training

## 相关资源

<!-- Dataview 自动填充 -->
