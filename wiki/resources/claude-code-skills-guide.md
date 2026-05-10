---
name: claude-code-skills-guide
description: Claude Code Skills 完全指南（2026 最新版）- Skills 是什么、如何安装、热门推荐
type: guide
tags: [claude-code, skills, guide, zhihu, installation]
created: 2026-05-08
updated: 2026-05-08
source: ../../../raw/zhihu/Claude Code Skills 完全指南（2026 最新版）.md
---

# Claude Code Skills 完全指南（2026 最新版）

> [!info] 原文信息
> 来源：[知乎专栏](https://zhuanlan.zhihu.com/p/2034659438850750016)
> 发布：2026-05-04

## 一、什么是 Skills？

**Skills（技能）是 Claude Code 的能力扩展包。**

你可以把 Claude Code 想象成一个全能但有点泛的通才工程师。他什么都会一点，但在某些专业领域——比如 Spring Boot 安全最佳实践、Go 语言惯用法、TDD 测试驱动开发——可能不够深入。

而 Skills，就是给他额外报的「专业培训课」。

安装一个 `go-review` Skill，他就懂 Go 的最佳实践了；安装 `claude-mem`，他就拥有了跨会话的项目记忆，不再每次都是「初来乍到」。

**Skills 能做什么？**

- 代码审查与测试驱动开发（TDD）
- 项目上下文记忆，跨会话保持一致
- 特定语言/框架的最佳实践（Spring Boot、Django、Go、Swift 等）
- 部署、数据库迁移、安全扫描等工程化能力
- 文档处理、内容创作、市场研究等通用能力

## 二、Skills vs 传统提示词

| 对比项 | 传统提示词 | Skills |
|--------|-----------|--------|
| 复用性 | 每次都要复制粘贴 | 安装一次，永久可用 |
| 跨会话 | 新会话需要重新提供 | 自动加载，始终一致 |
| 触发方式 | 手动输入完整提示词 | 自动感知上下文，智能触发 |
| 团队协作 | 难以分享给团队 | 可打包成插件，一键安装 |
| 版本管理 | 无法追踪变更 | 支持 Git 版本控制 |

**结论：** 临时用一次？写提示词就够了。长期用、团队用？就该用 Skills。

## 三、三个核心概念

### Skill（技能）—— 最小能力单元

一个 Skill 就是一个具体的专业能力，比如「Go 代码审查」或「跨会话记忆」。

**必须包含 `SKILL.md` 文件**（全大写！），这是 Claude 识别并激活它的关键。

### Plugin（插件）—— 安装的最小单位

插件相当于一个「礼盒」，里面可以装一个或多个 Skills，还可以包含自定义命令（Commands）和钩子（Hooks）。

### Marketplace（市场）—— 插件的集合仓库

就像应用商店一样，是存放和分发插件的地方。

## 四、Skills 的文件结构

```bash
~/.claude/skills/
└── my-skill/
    └── SKILL.md
```

核心规则：
- 文件夹名 = Skill 的唯一标识
- `SKILL.md` 必须全大写（`SKILL` 大写，`.md` 小写）

### SKILL.md 示例

```markdown
---
name: explain-code
description: Explains code with visual diagrams and analogies
---

When explaining code, always include:
1. **Start with an analogy**
2. **Draw a diagram** using ASCII art
3. **Walk through the code** step-by-step
4. **Highlight a gotcha** or common mistake
```

**关键点：** `description` 是灵魂——Claude 靠这段描述来判断「什么时候该激活这个 Skill」。

## 五、自动触发机制

大部分 Skills 安装后会自动激活，你不需要手动输入命令。

| 场景 | 自动激活的 Skill |
|------|-----------------|
| 打开 Go 项目并问代码问题 | go-review、golang-patterns 自动提供最佳实践 |
| 粘贴一段报错堆栈 | 调试相关 Skills 自动分析根因 |
| 修改代码后说「帮我提交」 | Git 集成 Skills 自动生成 commit message |
| 在 Spring Boot 项目加新功能 | springboot-patterns 自动提供架构指导 |

## 六、安装方式

### 方式一：插件市场安装（推荐）

#### 官方市场

```bash
# 添加官方市场（只需做一次）
/plugin marketplace add https://github.com/anthropics/claude-plugins-official

# 安装某个插件
/plugin install code-simplifier@claude-plugins-official
```

#### 社区市场

```bash
# 添加社区市场
/plugin marketplace add https://github.com/affaan-m/everything-claude-code

# 安装插件（获得全部 50+ Skills）
/plugin install everything-claude-code@everything-claude-code
```

### 方式二：本地手动安装

```bash
# macOS/Linux：复制到用户范围
cp -r <skill-folder> ~/.claude/skills/

# Windows PowerShell
Copy-Item -Recurse ".\skill-folder" "$env:USERPROFILE\.claude\skills\"
```

## 七、热门 Skills 推荐

### 🥇 everything-claude-code（必装）

> GitHub: `affaan-m/everything-claude-code` | ⭐ 41k+

Anthropic 黑客松冠军项目，奖金 $15,000，打磨了 10 个月。

**核心能力：**
- 50+ Skills 覆盖全开发流程
- 热门命令：`/tdd`、`/plan`、`/go-review`、`/security-review`
- 框架全覆盖：Spring Boot、Django、Go、Python、Swift、React/Next.js

```bash
/plugin marketplace add https://github.com/affaan-m/everything-claude-code
/plugin install everything-claude-code@everything-claude-code
```

### 🥈 claude-mem（必装）

> GitHub: `thedotmack/claude-mem` | ⭐ 16k+

**核心能力：**
- 跨会话记忆项目上下文、业务规则、历史修改
- 智能渐进式披露，按需检索相关记忆
- 自动压缩记忆内容，节省 Token

### 🥉 superpowers（必装）

> GitHub: `obra/superpowers` | ⭐ 22k+

由 Claude Code 核心贡献者 Jesse Vincent 开发。

**核心能力：**
- TDD 测试驱动开发
- 结构化调试方法论
- 自动代码审查

## 八、按场景推荐

| 场景 | 推荐插件 |
|------|---------|
| 大型项目开发 | everything-claude-code + claude-mem + superpowers |
| 追求代码质量 | superpowers + code-simplifier |
| 国内内容创作 | baoyu-skills |
| 离线环境 | CCPlugins（手动安装） |

## 九、新手安装优先级

| 优先级 | 插件 | 理由 |
|--------|------|------|
| 🥇 第一 | everything-claude-code | 50+ Skills 全覆盖，必装 |
| 🥈 第二 | claude-mem | 解决记忆问题，长期项目必备 |
| 🥉 第三 | superpowers | TDD + 代码审查，提升代码质量 |
| 4 | code-simplifier（官方） | 代码简化重构 |
| 5 | skill-creator（官方） | 创建自定义技能 |

---

*最后更新: 2026-05-08*
*来源: 知乎专栏*
*收录于: Claude Code 最佳实践 Wiki*