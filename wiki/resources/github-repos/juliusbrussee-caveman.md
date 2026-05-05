---
name: juliusbrussee-caveman
description: Caveman — Claude Code 技能，通过原始人说话方式减少 75% 输出 token
type: source
tags: [github, python, llm, token-optimization, claude-code, skill, prompt-engineering, meme]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/juliusbrussee-caveman-2026-05-05.json
stars: 54023
language: Python
license: MIT
github_url: https://github.com/JuliusBrussee/caveman
---

# Caveman

> [!info] Repository Overview
> **Caveman** 是一个创意十足的 Claude Code 技能，通过让 AI 代理像原始人说话来减少约 **75% 的输出 token**，同时保持 100% 技术准确性。基于病毒式传播的观察：原始人语言能显著减少 LLM token 使用而不丢失技术实质。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | 54,023 🔥🔥（超高人气！） |
| 🍴 Forks | 2,939 |
| 💻 语言 | Python |
| 🏢 所有者 | Julius Brussee |
| 📄 许可证 | MIT |
| 🔗 链接 | [github.com/JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman) |
| 🌐 主页 | [getcaveman.dev](https://getcaveman.dev/) |
| 📅 创建时间 | 2026-04-04 |
| 📅 更新时间 | 2026-05-05 |
| 🔌 Open Issues | 179 |

## 🎯 核心特性

### Token 压缩

- **~75% 输出减少** — 跨基准测试平均节省 65%（范围 22-87%）
- **100% 技术准确性** — 所有技术信息保留，只删除填充内容
- **~3x 速度提升** — 更少 token = 更快生成
- **成本节省** — 大幅降低 API 调用成本

### 多强度级别

| 级别 | 触发命令 | 效果 |
|------|---------|------|
| **🪶 Lite** | `/caveman lite` | 删除填充，保持语法。专业但无废话 |
| **🪨 Full** | `/caveman full` | 默认原始人模式。删除冠词，片段化，完全原始 |
| **🔥 Ultra** | `/caveman ultra` | 最大压缩。电报式。缩写一切 |

### 文言文模式

古典文学压缩 — 人类发明的最 token 高效的书面语言：

| 级别 | 触发命令 | 效果 |
|------|---------|------|
| **Wenyan-Lite** | `/caveman wenyan-lite` | 半古典。语法完整，填充消失 |
| **Wenyan-Full** | `/caveman wenyan` | 完整文言文。最大古典简洁 |
| **Wenyan-Ultra** | `/caveman wenyan-ultra` | 极致。预算有限的古代学者 |

## 🆚 Before / After

### 示例 1: React 重渲染问题

| 模式 | 输出 | Token 数 |
|------|------|---------|
| **🗣️ 普通 Claude** | "The reason your React component is re-rendering is likely because you're creating a new object reference on each render cycle. When you pass an inline object as a prop, React's shallow comparison sees it as a different object every time, which triggers a re-render. I'd recommend using useMemo to memoize the object." | 69 |
| **🪨 Caveman** | "New object ref each render. Inline object prop = new ref = re-render. Wrap in `useMemo`." | 19 |

**节省：72%**

### 示例 2: 认证中间件 Bug

| 模式 | 输出 | Token 数 |
|------|------|---------|
| **🗣️ 普通 Claude** | "Sure! I'd be happy to help you with that. The issue you're experiencing is most likely caused by your authentication middleware not properly validating the token expiry. Let me take a look and suggest a fix." | 43 |
| **🪨 Caveman** | "Bug in auth middleware. Token expiry check use `<` not `<=`. Fix:" | 13 |

**节省：70%**

> **同样的修复。75% 更少的词。大脑依然强大。**

## 🚀 安装

### 一键安装（推荐）

**一行命令。检测每个代理。为每个安装。**

```bash
# macOS / Linux / WSL / Git Bash
curl -fsSL https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.sh | bash

# Windows (PowerShell)
irm https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.ps1 | iex
```

检测 **30+ 种代理**（Claude Code, Gemini CLI, Codex, Cursor, Windsurf, Cline, Copilot, Continue, Kilo, Roo, Augment, Aider Desk, Amp, Bob, Crush, Devin, Droid, ForgeCode, Goose, iFlow, JetBrains Junie, Kiro CLI, Mistral Vibe, OpenHands, opencode, Qwen Code, Qoder, Rovo Dev, Tabnine, Trae, Warp, Replit Agent, Antigravity 等）。

运行每个代理的原生安装。跳过你没有的。安全可重复运行。

### 安装选项

| 标志 | 说明 |
|------|------|
| `--all` | 插件 + hooks + statusline + MCP shrink + 当前目录的 per-repo 规则文件。完整体验 |
| `--minimal` | 仅插件/扩展。无 hooks，无 MCP shrink，无 per-repo 规则 |
| `--dry-run` | 预览，不写入任何内容 |
| `--only <agent>` | 仅一个目标（可重复） |
| `--with-hooks` | Claude Code：同时配置独立 hooks + statusline + stats badge。**默认开启** |
| `--with-mcp-shrink` | Claude Code：通过 `npx caveman-shrink` 注册 caveman-shrink MCP 代理。**默认开启** |
| `--with-init` | 将始终开启的规则文件放入当前仓库（Cursor / Windsurf / Cline / Copilot / AGENTS.md）。默认关闭；通过 `--all` 开启 |
| `--list` | 打印完整代理矩阵并退出 |
| `--force` | 即使已安装也重新运行 |

### 手动安装

| 代理 | 命令 |
|------|------|
| **Claude Code** | `claude plugin marketplace add JuliusBrussee/caveman && claude plugin install caveman@caveman` |
| **Gemini CLI** | `gemini extensions install https://github.com/JuliusBrussee/caveman` |
| **Cursor / Windsurf / Cline / Copilot** | `npx skills add JuliusBrussee/caveman -a <cursor\|windsurf\|cline\|github-copilot>` |
| **其他 40+ 代理** | `npx skills add JuliusBrussee/caveman`（自动检测） |

## 💡 使用方法

### 触发方式

- `/caveman` 或 Codex `$caveman`
- "talk like caveman"
- "caveman mode"
- "less tokens please"

### 停止方式

- "stop caveman" 或 "normal mode"

### 级别切换

级别会持续保持，直到你更改它或会话结束。

## 🛠️ Caveman Skills

### 技能列表

| 技能 | 说明 |
|------|------|
| `/caveman-commit` | 简洁提交消息。Conventional Commits，≤50 字符主题。为什么而不是什么 |
| `/caveman-review` | 单行 PR 评论：`L42: 🔴 bug: user null. Add guard.` 无废话 |
| `/caveman-help` | 快速参考卡片。所有模式、技能、命令 |
| `/caveman-stats` | 实际会话 token 使用 + 估计节省 + USD。通过 `--all` 终身聚合，通过 `--since 7d` 时间窗口，通过 `--share` 可分享行。直接读取 Claude Code 会话 JSONL，无需模型端猜测。仅 Claude Code |
| `/caveman:compress <file>` | 将记忆文件（如 `CLAUDE.md`）重写为原始人语言。保存备份为 `<file>.original.md`。每次会话开始节省约 **46% 的输入 token**。代码/URL/路径逐字节保留 |
| `cavecrew-investigator/builder/reviewer` | Claude Code 的原始人子代理。子代理工具输出注入回主上下文 — 这些比普通 `Explore` / reviewer 代理少发射约 **60% token**，使主上下文在长会话中持续更久 |

### Statusline 节省徽章

默认开启。首次运行 `/caveman-stats` 后，statusline 追加 `[CAVEMAN] ⛏ 12.4k`（终身节省的 token）并在每次 `/caveman-stats` 运行时更新。不想要？设置 `CAVEMAN_STATUSLINE_SAVINGS=0` 静音。

## 📦 caveman-compress 压缩工具

### 压缩收据

| 文件 | 原始 | 压缩后 | 节省 |
|------|------|--------|------|
| `claude-md-preferences.md` | 706 | 285 | **59.6%** |
| `project-notes.md` | 1145 | 535 | **53.3%** |
| `claude-md-project.md` | 1122 | 636 | **43.3%** |
| `todo-list.md` | 627 | 388 | **38.1%** |
| `mixed-with-code.md` | 888 | 560 | **36.9%** |
| **平均** | **898** | **481** | **46%** |

### 工作原理

重写记忆文件为原始人语言：
- 代码/URL/路径逐字节保留
- 删除填充和废话
- 保存备份为 `.original.md`
- 每次会话开始节省 ~46% 输入 token

## 🔌 caveman-shrink（MCP 中间件）

Stdio 代理，包装任何 MCP 服务器，拦截 `tools/list` / `prompts/list` / `resources/list` 响应，并压缩 `description` 字段。代码、URL、路径、标识符保持逐字节相同。

```jsonc
{
  "mcpServers": {
    "fs-shrunk": {
      "command": "npx",
      "args": ["caveman-shrink", "npx", "@modelcontextprotocol/server-filesystem", "/path/to/dir"]
    }
  }
}
```

在 npm 上发布为 [`caveman-shrink`](https://www.npmjs.com/package/caveman-shrink)。V1 不触及工具调用响应体或请求负载。由 `install.sh` 自动注册（使用 `--minimal` 跳过）。

## 📊 基准测试

来自 Claude API 的真实 token 计数：

| 任务 | 普通 (tokens) | Caveman (tokens) | 节省 |
|------|--------------:|-----------------:|-----:|
| 解释 React 重渲染 bug | 1180 | 159 | 87% |
| 修复认证中间件 token 过期 | 704 | 121 | 83% |
| 设置 PostgreSQL 连接池 | 2347 | 380 | 84% |
| 解释 git rebase vs merge | 702 | 292 | 58% |
| 重构回调为 async/await | 387 | 301 | 22% |
| 架构：微服务 vs 单体 | 446 | 310 | 30% |
| 审查 PR 安全问题 | 678 | 398 | 41% |
| Docker 多阶段构建 | 1042 | 290 | 72% |
| 调试 PostgreSQL 竞态条件 | 1200 | 232 | 81% |
| 实现 React 错误边界 | 3454 | 456 | 87% |
| **平均** | **1214** | **294** | **65%** |

*跨提示范围：22%-87% 节省*

> [!IMPORTANT]
> Caveman 只影响输出 token — 思考/推理 token 未受影响。Caveman 不会让大脑变小。Caveman 让*嘴巴*变小。最大胜利是**可读性和速度**，成本节省是额外奖励。

### 科学支持

2026 年 3 月的论文["简洁约束逆转语言模型性能层次"](https://arxiv.org/abs/2604.00025)发现，约束大型模型简短回答在某些基准测试上**提高了 26 个百分点的准确性**并完全逆转了性能层次。冗长并不总是更好。有时更少的词 = 更正确。

## 🧪 评估

Caveman 不仅声称 75%。Caveman **证明**它。

`evals/` 目录有一个三臂评估工具，测量相对于适当控制的真实 token 压缩 — 不仅是"冗长 vs 技能"而是"简洁 vs 技能"。因为将 caveman 与冗长 Claude 比较会混淆技能与通用简洁性。那是作弊。Caveman 不作弊。

```bash
# 运行评估（需要 claude CLI）
uv run python evals/llm_run.py

# 读取结果（无 API key，离线运行）
uv run --with tiktoken python evals/measure.py
```

## 🪨 Caveman 生态系统

三个工具。一个哲学：**代理用更少做更多**。

| 仓库 | 功能 | 一句话 |
|------|------|--------|
| [**caveman**](https://github.com/JuliusBrussee/caveman) *(本仓库)* | 输出压缩技能 | *why use many token when few do trick* — 跨 Claude Code, Cursor, Gemini, Codex 约 75% 更少输出 token |
| [**cavemem**](https://github.com/JuliusBrussee/cavemem) | 跨代理持久记忆 | *why agent forget when agent can remember* — 压缩 SQLite + MCP，默认本地 |
| [**cavekit**](https://github.com/JuliusBrussee/cavekit) | 规范驱动的自主构建循环 | *why agent guess when agent can know* — 自然语言 → kits → 并行构建 → 验证 |

它们组合：**cavekit** 编排构建，**caveman** 压缩代理*说的*，**cavemem** 压缩代理*记住的*。安装一个、一些或全部 — 每个都独立存在。

## 💡 使用场景

### 场景 1: 代码审查

```
场景: 大量 PR 需要审查
操作:
  1. 启用 /caveman-review
  2. AI 生成单行评论
  3. 快速扫描所有问题
结果: 审查速度提升 3x，token 使用减少 75%
```

### 场景 2: 提交消息

```
场景: 频繁提交需要描述
操作:
  1. 启用 /caveman-commit
  2. AI 生成简洁提交消息
  3. Conventional Commits 格式
结果: 一致且简洁的提交历史
```

### 场景 3: 项目记忆优化

```
场景: CLAUDE.md 文件过大
操作:
  1. 运行 /caveman:compress CLAUDE.md
  2. 文件重写为原始人语言
  3. 每次会话节省 46% 输入 token
结果: 更快会话启动，更低成本
```

### 场景 4: 长会话管理

```
场景: 复杂任务需要多轮对话
操作:
  1. 使用 cavecrew 子代理
  2. 子代理输出更简洁
  3. 主上下文持续更久
结果: 单会话可完成更多工作
```

## 🎯 核心优势

| 特性 | 传统 Claude | Caveman |
|------|------------|---------|
| **输出长度** | 冗长 | 简洁 |
| **Token 使用** | 基准 | **-75%** |
| **响应速度** | 基准 | **~3x 更快** |
| **技术准确性** | 100% | **100%** |
| **可读性** | 冗长难以扫描 | 简洁易读 |
| **成本** | 基准 | **-65%** |
| **趣味性** | 一般 | **原始人有趣** |

## 📈 性能指标

### 仓库活跃度

- ⭐ **54,023 Stars** - 超高人气（病毒式传播）
- 🍴 **2,939 Forks** - 活跃社区参与
- 🔧 **179 Open Issues** - 活跃开发中
- 📅 **持续更新** - 2026-05-05 最新更新

### 技术成熟度

- ✅ **生产级代码**: Python，企业级质量
- ✅ **30+ 代理支持**: Claude Code, Gemini, Cursor, Codex 等
- ✅ **科学验证**: arXiv 论文支持
- ✅ **完整文档**: 详细 README, 基准测试, 评估工具
- ✅ **活跃社区**: Discussions, Issues, Star History

## 🔮 核心价值

Caveman 的核心价值在于：

1. **成本节省** - 65% 平均输出减少 = 大幅降低 API 成本
2. **速度提升** - 更少 token = 3x 更快响应
3. **可读性** - 无文字墙，只有答案
4. **准确性** - 所有技术信息保留，只删除填充
5. **趣味性** - 每次代码审查都是喜剧
6. **科学支持** - 论证简洁性提高准确性
7. **生态系统** - caveman + cavemem + cavekit 组合

## 🚀 快速上手建议

### 新手推荐

1. **一键安装** - 运行 install.sh 自动检测并安装
2. **从 Lite 开始** - 习惯简洁输出
3. **阅读基准测试** - 了解真实节省
4. **尝试压缩工具** - 优化项目记忆文件

### 进阶用户

1. **自定义级别** - 根据任务选择合适强度
2. **MCP 中间件** - 压缩 MCP 服务器响应
3. **子代理系统** - 使用 cavecrew 提升效率
4. **评估工具** - 运行自己的基准测试

## 🤝 贡献与社区

### 如何贡献

1. **报告问题**: 提交 Bug 和改进建议
2. **分享基准**: 运行评估工具并分享结果
3. **改进文档**: 完善 README 和示例
4. **创建代理**: 为新 AI 代理添加支持

### 学习资源

- **GitHub 仓库**: [JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman)
- **官网**: [getcaveman.dev](https://getcaveman.dev/)
- **基准测试**: [benchmarks/](https://github.com/JuliusBrussee/caveman/tree/main/benchmarks)
- **评估工具**: [evals/](https://github.com/JuliusBrussee/caveman/tree/main/evals)
- **Star History**: [star-history.com](https://star-history.com/#JuliusBrussee/caveman&Date)

## 📄 许可证

MIT License — 开源、免费、商业友好。

> "Free like mass mammoth on open plain"

## 🌟 总结

Caveman 是一个**革命性的 token 优化工具**，具有以下特点：

1. **超高人气** - 54K+ Stars，病毒式传播
2. **创意十足** - 原始人说话方式减少 75% token
3. **科学验证** - arXiv 论文支持简洁性提升准确性
4. **30+ 代理支持** - Claude Code, Gemini, Cursor, Codex 等
5. **多功能** - 输出压缩、输入压缩、MCP 中间件
6. **文言文模式** - 最 token 高效的人类语言
7. **生态系统** - caveman + cavemem + cavekit
8. **完整工具** - 基准测试、评估工具、压缩工具

**特别适合**：
- 频繁使用 AI 代理的开发者
- 需要降低 API 成本的团队
- 希望提升响应速度的用户
- 喜欢创意工具的极客

这是一个**改变游戏规则的 meme 项目**，让 token 优化变得有趣又高效！

---

*最后更新: 2026-05-05*
*数据来源: GitHub API + README.md + 基准测试*
*🪨 why use many token when few do trick*
