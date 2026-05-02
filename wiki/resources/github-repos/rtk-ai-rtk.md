---
name: resources/github-repos/rtk-ai-rtk
description: RTK — 高性能 CLI 代理工具，减少 60-90% LLM token 消耗，单个 Rust 二进制文件，支持 100+ 命令
type: source
tags: [github, rust, cli, claude-code, token-optimization, developer-tools, ai-coding, copilot, cursor]
created: 2026-05-01
updated: 2026-05-01
source: ../../../../archive/resources/github/rtk-ai-rtk-2026-05-01.json
stars: 39165
language: Rust
license: Other
github_url: https://github.com/rtk-ai/rtk
---

# rtk-ai/rtk

> 高性能 CLI 代理，将常见开发命令的 LLM token 消耗降低 60-90%

## 核心亮点

- 🚀 **极致性能** — 单个 Rust 二进制文件，零依赖，<10ms 开销
- 💰 **大幅节省** — 平均减少 80% token 消耗（30分钟会话从 118K → 24K）
- 🔌 **透明代理** — Hook 系统透明重写命令，AI 工具无感知
- 🛠️ **广泛支持** — 100+ 命令覆盖 Git、测试、构建、包管理等
- 🎯 **智能过滤** — 四种策略（过滤、分组、截断、去重）

## 基本信息

| 属性 | 值 |
|------|-----|
| **Stars** | 39,165 |
| **语言** | Rust |
| **许可证** | Other |
| **主页** | https://www.rtk-ai.app |
| **仓库** | https://github.com/rtk-ai/rtk |

## Token 节省效果（30分钟 Claude Code 会话）

| 操作 | 频率 | 标准 | rtk | 节省 |
|------|------|------|-----|------|
| `ls` / `tree` | 10x | 2,000 | 400 | -80% |
| `cat` / `read` | 20x | 40,000 | 12,000 | -70% |
| `grep` / `rg` | 8x | 16,000 | 3,200 | -80% |
| `git status` | 10x | 3,000 | 600 | -80% |
| `git diff` | 5x | 10,000 | 2,500 | -75% |
| `git log` | 5x | 2,500 | 500 | -80% |
| `git add/commit/push` | 8x | 1,600 | 120 | -92% |
| `cargo test` / `npm test` | 5x | 25,000 | 2,500 | -90% |
| `ruff check` | 3x | 3,000 | 600 | -80% |
| `pytest` | 4x | 8,000 | 800 | -90% |
| **总计** | | **~118,000** | **~23,900** | **-80%** |

## 工作原理

```
  Without rtk:                                    With rtk:

  Claude  --git status-->  shell  -->  git         Claude  --git status-->  RTK  -->  git
    ^                                   |            ^                      |          |
    |        ~2,000 tokens (raw)        |            |   ~200 tokens        | filter   |
    +-----------------------------------+            +------- (filtered) ---+----------+
```

**四种优化策略**：
1. **智能过滤** — 移除噪音（注释、空白、样板代码）
2. **分组聚合** — 按目录、类型聚合相似项
3. **智能截断** — 保留相关上下文，去除冗余
4. **去重压缩** — 折叠重复日志行并计数

## 支持的 AI 工具

```bash
rtk init -g                     # Claude Code / Copilot (默认)
rtk init -g --gemini            # Gemini CLI
rtk init -g --codex             # Codex (OpenAI)
rtk init -g --agent cursor      # Cursor
rtk init --agent windsurf       # Windsurf
rtk init --agent cline          # Cline / Roo Code
rtk init --agent kilocode       # Kilo Code
rtk init --agent antigravity    # Google Antigravity
```

## 核心命令

### 文件操作
```bash
rtk ls .                        # Token 优化的目录树
rtk read file.rs                # 智能文件读取
rtk read file.rs -l aggressive  # 仅签名（剥离函数体）
rtk smart file.rs               # 2 行启发式代码摘要
rtk find "*.rs" .               # 紧凑 find 结果
rtk grep "pattern" .            # 分组搜索结果
rtk diff file1 file2            # 精简 diff
```

### Git 命令
```bash
rtk git status                  # 紧凑状态
rtk git log -n 10               # 单行提交
rtk git diff                    # 精简 diff
rtk git add                     # → "ok"
rtk git commit -m "msg"         # → "ok abc1234"
rtk git push                    # → "ok main"
rtk git pull                    # → "ok 3 files +10 -2"
```

### 测试运行器
```bash
rtk jest / vitest / playwright  # 仅失败用例
rtk pytest                      # Python 测试（-90%）
rtk go test                     # Go 测试（NDJSON, -90%）
rtk cargo test                  # Cargo 测试（-90%）
rtk rake test / rspec           # Ruby 测试（-60%+）
rtk err <cmd>                   # 仅过滤错误
rtk test <cmd>                  # 通用测试包装器
```

### 构建与 Lint
```bash
rtk lint / ruff check / golangci-lint  # 按规则/文件分组
rtk tsc                         # TypeScript 错误按文件分组
rtk cargo build / clippy        # Cargo 构建（-80%）
rtk prettier --check .          # 需要格式化的文件
```

## 安装方式

### Homebrew（推荐）
```bash
brew install rtk
```

### 快速安装（Linux/macOS）
```bash
curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh
```

### Cargo
```bash
cargo install --git https://github.com/rtk-ai/rtk
```

### 预编译二进制
下载 [releases](https://github.com/rtk-ai/rtk/releases)：
- macOS: `rtk-x86_64-apple-darwin.tar.gz` / `rtk-aarch64-apple-darwin.tar.gz`
- Linux: `rtk-x86_64-unknown-linux-musl.tar.gz` / `rtk-aarch64-unknown-linux-gnu.tar.gz`
- Windows: `rtk-x86_64-pc-windows-msvc.zip`

## 项目结构

```
rtk-ai/rtk/
├── .claude/           # Claude Code 配置
├── hooks/             # Hook 系统
├── src/               # Rust 源码
├── docs/              # 文档
├── scripts/           # 工具脚本
├── install.sh         # 安装脚本
├── Cargo.toml         # Rust 项目配置
└── README.md          # 项目说明
```

## 技术栈

| 组件 | 技术 |
|------|------|
| **语言** | Rust |
| **包管理** | Cargo |
| **平台** | Linux, macOS, Windows |
| **集成** | Claude Code, Copilot, Cursor, Gemini CLI |

## 相关链接

- **主页**: https://www.rtk-ai.app
- **文档**: https://www.rtk-ai.app/guide/troubleshooting
- **架构**: [ARCHITECTURE.md](https://github.com/rtk-ai/rtk/blob/master/ARCHITECTURE.md)
- **Discord**: https://discord.gg/RySmvNF5kF
- **发布**: https://github.com/rtk-ai/rtk/releases

## 对标分析

| 项目 | Stars | 特色 |
|------|-------|------|
| **gstack** | - | Y Combinator CEO 开发的虚拟工程团队工具集 |
| **claude-code-best-practice** | - | Claude Code 最佳实践项目 |
| **rtk** | 39,165 | 💫 **专注 token 优化，透明代理，零依赖单二进制** |

---

*收录时间: 2026-05-01*
*数据来源: GitHub API*
