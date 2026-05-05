---
name: resources/github-repos/garrytan-gstack
description: 23 个为 Claude Code 设计的技能集合，模拟 CEO、设计师、工程经理、发布经理、文档工程师和 QA 等角色
type: source
version: 1.0
tags: [github, typescript, claude-code, skills, productivity, tools, ai-assistant]
created: 2026-05-01
updated: 2026-05-01
source: ../../../archive/resources/github/garrytan-gstack-2026-05-01.json
stars: 87415
language: TypeScript
license: MIT
github_url: https://github.com/garrytan/gstack
---

# gstack

Garry Tan 的个人 Claude Code 技能集合 — 23 个精心设计的工具，担任 CEO、设计师、工程经理、发布经理、文档工程师、QA 等角色。

## 作者背景

**Garry Tan** — Y Combinator 总裁兼 CEO
- 早期 Palantir 工程师/PM/设计师
- Posterous 联合创始人（被 Twitter 收购）
- 构建 Bookface（YC 内部社交网络）
- 投资了 Coinbase、Instacart、Rippling 等数千家初创公司

## 核心理念

> "I don't think I've typed like a line of code probably since December"
> — Andrej Karpathy, No Priors podcast, March 2026

当听到 Karpathy 这句话时，Garry Tan 想找到答案：一个人如何像20人的团队一样交付产品？Peter Steinberger 基本上独自用 AI 代理构建了 OpenClaw（247K GitHub stars）。革命已经到来。

**gstack 是他的答案。** 经过二十年的产品开发，现在的交付速度前所未有：
- **过去 60 天**: 3 个生产服务、40+ 功能（兼职运行 YC）
- **效率提升**: 810× 2013 年代码产出速度（11,417 vs 14 逻辑行/天）
- **2026 年产出**: 240× 整个 2013 年全年（截至 4 月 18 日）

## 技能组成（23 个工具）

| 角色 | 功能 |
|------|------|
| **CEO** | 产品愿景、战略决策、优先级管理 |
| **设计师** | UI/UX 设计、视觉审查、品牌一致性 |
| **工程经理** | 技术规划、团队协调、进度跟踪 |
| **发布经理** | 版本管理、发布流程、回滚策略 |
| **文档工程师** | API 文档、README、技术写作 |
| **QA** | 测试策略、Bug 报告、质量保证 |

## 关键特性

- **经过实战验证**: 在 40+ 公共和私人 `garrytan/*` 仓库中使用（包括 Bookface）
- **初创公司导向**: 专为车库阶段的 1-2 人团队设计
- **AI 主导**: 大部分代码由 AI 编写，重点是交付而不是谁输入的

## 影响力

| 指标 | 数据 |
|------|------|
| **Stars** | 87,415 (持续增长中) |
| **Forks** | 12,503+ |
| **Open Issues** | 472 |
| **Subscribers** | 525 |

## 技能模块

### OpenClaw Skills
位于 `openclaw/skills/` 目录：

| 技能 | 说明 |
|------|------|
| **gstack-openclaw-ceo-review** | CEO 角色的代码审查技能 |
| **gstack-openclaw-investigate** | 问题调查和根因分析 |
| **gstack-openclaw-office-hours** | 定期团队同步和讨论 |
| **gstack-openclaw-retro** | 回顾会议和改进建议 |

### Browser Skills
位于 `browser-skills/` 目录：

| 技能 | 说明 |
|------|------|
| **hackernews-frontpage** | Hacker News 前端页面浏览和分析 |

## 相关资源

- GitHub: [[https://github.com/garrytan/gstack]]
- 作者: [Garry Tan (@garrytan)](https://x.com/garrytan)
- 对标项目: [[resources/github-repos/openclaw-openclaw]] (247K stars)

## 启发

这个技能集合展示了 AI 代理时代的新型开发模式：
1. **从编码转向架构** — AI 处理实现，人类专注于设计
2. **一人=十人团队** — 正确的工具链让单人胜过传统团队
3. **质量不减** — 810× 产出不等于 810× bug，反而更少（因为有专职 QA）

## 项目结构

```
garrytan/gstack/
├── openclaw/
│   └── skills/
│       ├── gstack-openclaw-ceo-review/
│       ├── gstack-openclaw-investigate/
│       ├── gstack-openclaw-office-hours/
│       └── gstack-openclaw-retro/
├── browser-skills/
│   └── hackernews-frontpage/
├── README.md
└── package.json
```

## 快速开始

### 安装

```bash
# 克隆仓库
git clone https://github.com/garrytan/gstack.git

# 进入目录
cd gstack

# 安装依赖（如需要）
npm install
```

### 配置 Claude Code

1. 将技能复制到 Claude Code skills 目录
2. 在 Claude Code 中启用相应技能
3. 根据需要配置技能参数

### 使用示例

```markdown
# 使用 CEO 技能进行代码审查
/ceo-review 请审查这段代码的架构设计

# 使用调查技能分析问题
/investigate 分析这个性能问题的根因

# 开始回顾会议
/retro 开始本周的团队回顾
```

## 适用场景

| 场景 | 推荐技能 |
|------|----------|
| 代码审查 | gstack-openclaw-ceo-review |
| 问题调试 | gstack-openclaw-investigate |
| 团队同步 | gstack-openclaw-office-hours |
| 改进复盘 | gstack-openclaw-retro |
| 市场调研 | hackernews-frontpage |

## 技术特点

- **TypeScript** - 类型安全的技能开发
- **模块化** - 每个技能独立可维护
- **可扩展** - 易于添加自定义技能
- **生产就绪** - 经过实战验证的技能集

---

*归档时间: 2026-05-01*
