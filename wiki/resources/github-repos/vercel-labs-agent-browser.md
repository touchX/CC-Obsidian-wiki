---
name: vercel-labs-agent-browser
description: Agent Browser - Vercel Labs 出品的超快速浏览器自动化 CLI 工具
type: source
tags: [github, rust, cli, browser-automation, ai, agents, chrome-devtools-protocol]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/vercel-labs-agent-browser-2026-05-05.json
stars: 31729
language: Rust
license: Apache-2.0
github_url: https://github.com/vercel-labs/agent-browser
---

# Agent Browser

> [!info] Repository Overview
> **Agent Browser** 是 Vercel Labs 出品的浏览器自动化 CLI 工具，使用 Rust 编写，专为 AI 代理设计。提供超快的执行速度和丰富的浏览器操作命令。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | 31,729 🔥 |
| 🍴 Forks | 1,942 |
| 💻 语言 | Rust |
| 🏢 所有者 | Vercel Labs (Organization) |
| 📄 许可证 | Apache-2.0 |
| 🔗 链接 | [github.com/vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) |
| 🌐 主页 | [agent-browser.dev](https://agent-browser.dev) |
| 📅 创建时间 | 2026-01-11 |
| 📅 更新时间 | 2026-05-05 |
| 🔌 Open Issues | 440 |

## 🎯 核心特性

### 原生 Rust 性能

- **极快速度**: 原生 Rust 二进制，零启动延迟
- **低资源占用**: 比 Node.js 工具轻量得多
- **无需 Node.js**: 直接使用 Chrome DevTools Protocol

### AI 代理优化

- **AI 友好输出**: `snapshot` 命令生成带引用的可访问性树
- **语义化定位**: 智能元素查找（role、text、label 等）
- **批量执行**: 减少多步骤工作流的进程启动开销
- **稳定引用**: 使用 `@e1` 等引用而非脆弱的选择器

### 丰富功能

- **50+ 命令**: 涵盖所有浏览器操作
- **标签页管理**: 多标签页支持和标签切换
- **网络拦截**: 请求/响应拦截和模拟
- **状态管理**: 保存和加载认证状态
- **调试工具**: 追踪、性能分析、控制台日志

## 🚀 安装方式

### 1. npm 全局安装（推荐）

```bash
npm install -g agent-browser
agent-browser install  # 首次使用时下载 Chrome for Testing
```

### 2. Homebrew（macOS）

```bash
brew install agent-browser
agent-browser install
```

### 3. Cargo（Rust）

```bash
cargo install agent-browser
agent-browser install
```

### 4. 从源码构建

```bash
git clone https://github.com/vercel-labs/agent-browser
cd agent-browser
pnpm install
pnpm build
pnpm build:native   # 需要 Rust
pnpm link --global
agent-browser install
```

### 5. 项目本地依赖

```bash
npm install agent-browser
agent-browser install
```

### 升级

```bash
agent-browser upgrade
```

自动检测安装方式（npm、Homebrew 或 Cargo）并运行相应的更新命令。

## 📖 快速开始

### 基础用法

```bash
# 打开网站
agent-browser open example.com

# 获取可访问性树（AI 友好）
agent-browser snapshot

# 点击元素（通过引用）
agent-browser click @e2

# 填写表单
agent-browser fill @e3 "test@example.com"

# 获取文本
agent-browser get text @e1

# 截图
agent-browser screenshot page.png

# 关闭浏览器
agent-browser close
```

### 传统选择器（也支持）

```bash
# 使用 CSS 选择器
agent-browser click "#submit"
agent-browser fill "#email" "test@example.com"

# 使用语义化定位器
agent-browser find role button click --name "Submit"
```

## 💻 核心命令

### 导航命令

```bash
agent-browser open                    # 启动浏览器（无导航）
agent-browser open <url>              # 启动 + 导航到 URL
agent-browser back                    # 后退
agent-browser forward                 # 前进
agent-browser reload                  # 刷新页面
```

### 交互命令

```bash
agent-browser click <sel>             # 点击元素
agent-browser dblclick <sel>          # 双击
agent-browser focus <sel>             # 聚焦元素
agent-browser type <sel> <text>       # 输入文本
agent-browser fill <sel> <text>       # 清空并填写
agent-browser press <key>             # 按键（Enter、Tab、Ctrl+a）
agent-browser hover <sel>             # 悬停
agent-browser select <sel> <val>      # 选择下拉选项
agent-browser check <sel>             # 勾选复选框
agent-browser uncheck <sel>           # 取消勾选
```

### 信息获取

```bash
agent-browser get text <sel>          # 获取文本内容
agent-browser get html <sel>          # 获取 innerHTML
agent-browser get value <sel>         # 获取输入值
agent-browser get attr <sel> <attr>   # 获取属性
agent-browser get title               # 获取页面标题
agent-browser get url                 # 获取当前 URL
agent-browser get count <sel>         # 计数匹配元素
agent-browser get box <sel>           # 获取边界框
```

### 状态检查

```bash
agent-browser is visible <sel>        # 检查是否可见
agent-browser is enabled <sel>        # 检查是否启用
agent-browser is checked <sel>        # 检查是否选中
```

### 快照命令

```bash
agent-browser snapshot                # 可访问性树（AI 最佳）
agent-browser snapshot -i             # 带索引的快照
agent-browser screenshot              # 截图
agent-browser screenshot --full       # 全页截图
agent-browser screenshot --annotate   # 带注释的截图
```

### 等待命令

```bash
agent-browser wait <sel>              # 等待元素可见
agent-browser wait <ms>                # 等待时间（毫秒）
agent-browser wait --text "Welcome"  # 等待文本出现
agent-browser wait --url "**/dash"   # 等待 URL 模式
agent-browser wait --load networkidle # 等待加载状态
```

## 🔍 语义化定位器

### 智能元素查找

```bash
# 按 ARIA 角色
agent-browser find role button click --name "Submit"

# 按文本内容
agent-browser find text "Sign In" click

# 按标签
agent-browser find label "Email" fill "test@test.com"

# 按占位符
agent-browser find placeholder "Search" type "query"

# 按 alt 文本
agent-browser find alt "Logo" click

# 按 data-testid
agent-browser find testid "submit-btn" click

# 第一个/最后一个/第 N 个匹配
agent-browser find first ".item" click
agent-browser find last "a" text
agent-browser find nth 2 "a" click
```

**操作类型**: `click`, `fill`, `type`, `hover`, `focus`, `check`, `uncheck`, `text`

**选项**:
- `--name <name>` - 按可访问名称过滤角色
- `--exact` - 要求精确文本匹配

## 🔄 批量执行

减少多步骤工作流的进程启动开销。

### 参数模式

```bash
agent-browser batch \
  "open https://example.com" \
  "snapshot -i" \
  "click @e1" \
  "screenshot"
```

### JSON 模式

```bash
echo '[
  ["open", "https://example.com"],
  ["snapshot", "-i"],
  ["click", "@e1"],
  ["screenshot", "result.png"]
]' | agent-browser batch --json
```

### 错误处理

```bash
agent-browser batch --bail \
  "open https://example.com" \
  "click @e1" \
  "screenshot"
```

使用 `--bail` 在第一个错误时停止。

## 🌐 网络功能

### 请求拦截

```bash
# 拦截请求
agent-browser network route <url>

# 阻止请求
agent-browser network route <url> --abort

# 模拟响应
agent-browser network route <url> --body '{"status": "ok"}'

# 按资源类型阻止
agent-browser network route '*' --abort --resource-type script

# 移除路由
agent-browser network unroute [url]
```

### 网络监控

```bash
# 查看请求
agent-browser network requests

# 过滤请求
agent-browser network requests --filter api
agent-browser network requests --type xhr,fetch
agent-browser network requests --method POST
agent-browser network requests --status 2xx

# 查看请求详情
agent-browser network request <requestId>
```

### HAR 记录

```bash
# 开始 HAR 记录
agent-browser network har start

# 停止并保存
agent-browser network har stop output.har
```

## 🍪 Cookies 和存储

### Cookies 管理

```bash
# 获取所有 cookies
agent-browser cookies

# 设置 cookie
agent-browser cookies set <name> <value>

# 从 curl 导入
agent-browser cookies set --curl <file>

# 清除 cookies
agent-browser cookies clear
```

### LocalStorage

```bash
# 获取所有
agent-browser storage local

# 获取特定键
agent-browser storage local <key>

# 设置值
agent-browser storage local set <key> <value>

# 清除所有
agent-browser storage local clear
```

### SessionStorage

```bash
agent-browser storage session
agent-browser storage session <key>
agent-browser storage session set <key> <value>
agent-browser storage session clear
```

## 🏷️ 标签页管理

### 基础操作

```bash
# 列出标签页
agent-browser tab

# 新建标签页
agent-browser tab new [url]

# 新建带标签的标签页
agent-browser tab new --label docs [url]

# 切换标签页
agent-browser tab <t1>              # 按 ID
agent-browser tab docs             # 按标签

# 关闭标签页
agent-browser tab close [t1|label]

# 新建窗口
agent-browser window new
```

### 标签页特性

- **稳定的 ID**: `t1`, `t2`, `t3` - 永不重用
- **用户标签**: `docs`, `app`, `admin` - 永久保留
- **跨命令引用**: 快照和点击使用正确的标签页

```bash
# 创建带标签的标签页
agent-browser tab new --label docs https://docs.example.com

# 切换到标签页
agent-browser tab docs

# 使用该标签页的引用
agent-browser snapshot
agent-browser click @e3
```

## 🎨 调试工具

### 追踪和分析

```bash
# 开始追踪
agent-browser trace start [path]

# 停止并保存
agent-browser trace stop [path]

# 开始性能分析
agent-browser profiler start

# 停止并保存
agent-browser profiler stop [path]
```

### 控制台和错误

```bash
# 查看控制台消息
agent-browser console

# JSON 输出
agent-browser console --json

# 清除控制台
agent-browser console --clear

# 查看页面错误
agent-browser errors

# 清除错误
agent-browser errors --clear
```

### 状态管理

```bash
# 保存认证状态
agent-browser state save <path>

# 加载状态
agent-browser state load <path>

# 列出状态文件
agent-browser state list

# 显示状态摘要
agent-browser state show <file>

# 重命名状态
agent-browser state rename <old> <new>

# 清除会话状态
agent-browser state clear [name]

# 清除所有状态
agent-browser state clear --all

# 清理旧状态
agent-browser state clean --older-than <days>
```

### 其他调试功能

```bash
# 高亮元素
agent-browser highlight <sel>

# 打开 Chrome DevTools
agent-browser inspect

# 获取 CDP WebSocket URL
agent-browser get cdp-url
```

## 🖼️ 截图和 PDF

### 截图

```bash
# 基础截图
agent-browser screenshot

# 指定路径
agent-browser screenshot page.png

# 全页截图
agent-browser screenshot --full

# 带注释的截图
agent-browser screenshot --annotate

# 自定义目录
agent-browser screenshot --screenshot-dir ./shots

# 自定义格式和质量
agent-browser screenshot --screenshot-format jpeg --screenshot-quality 80
```

### PDF

```bash
agent-browser pdf output.pdf
```

## 🔄 Diff 功能

### 快照对比

```bash
# 当前 vs 上次快照
agent-browser diff snapshot

# 当前 vs 保存的基线
agent-browser diff snapshot --baseline before.txt

# 作用域快照对比
agent-browser diff snapshot --selector "#main" --compact
```

### 视觉对比

```bash
# 像素对比
agent-browser diff screenshot --baseline before.png

# 保存差异图
agent-browser diff screenshot --baseline b.png -o d.png

# 调整颜色阈值
agent-browser diff screenshot --baseline b.png -t 0.2
```

### URL 对比

```bash
# 快照对比
agent-browser diff url https://v1.com https://v2.com

# 同时视觉对比
agent-browser diff url https://v1.com https://v2.com --screenshot

# 自定义等待策略
agent-browser diff url https://v1.com https://v2.com --wait-until networkidle

# 作用域对比
agent-browser diff url https://v1.com https://v2.com --selector "#main"
```

## 🎯 高级功能

### AI Chat 模式

```bash
# 单次 AI 控制
agent-browser chat "<instruction>"

# 交互式 REPL 模式
agent-browser chat
```

### 剪贴板

```bash
# 读取剪贴板
agent-browser clipboard read

# 写入剪贴板
agent-browser clipboard write "Hello, World!"

# 复制选区
agent-browser clipboard copy

# 粘贴
agent-browser clipboard paste
```

### 鼠标控制

```bash
agent-browser mouse move <x> <y>      # 移动鼠标
agent-browser mouse down [button]     # 按下按钮
agent-browser mouse up [button]       # 释放按钮
agent-browser mouse wheel <dy> [dx]   # 滚轮
```

### 浏览器设置

```bash
# 设置视口大小
agent-browser set viewport 1920 1080

# 模拟设备
agent-browser set device "iPhone 14"

# 设置地理位置
agent-browser set geo 37.7749 -122.4194

# 离线模式
agent-browser set offline

# 设置 HTTP 头
agent-browser set headers '{"Authorization": "Bearer token"}'

# 设置认证
agent-browser set credentials user pass

# 模拟颜色方案
agent-browser set media dark
```

### 运行时流式传输

```bash
# 启用 WebSocket 流
agent-browser stream enable [--port <port>]

# 查看流状态
agent-browser stream status

# 禁用流
agent-browser stream disable
```

## 💡 使用场景

### 场景 1: AI 代理集成

```
场景: AI 代理需要自动化浏览器任务
操作:
  1. AI 使用 snapshot 获取页面结构
  2. 使用 @e1 引用点击元素
  3. 使用 get text 提取内容
  4. 批量执行多步骤任务
结果: 高效的浏览器自动化
```

### 场景 2: 测试自动化

```
场景: 自动化端到端测试
操作:
  1. 使用批量命令执行测试流程
  2. 使用 wait 确保元素加载
  3. 使用 is checked 验证状态
  4. 使用 diff 对比预期结果
结果: 快速可靠的测试
```

### 场景 3: 数据采集

```
场景: 从网站采集数据
操作:
  1. 使用 snapshot 查看页面结构
  2. 使用语义化定位器查找元素
  3. 使用 get text/html 提取数据
  4. 使用 network requests 监控 API
结果: 高效数据收集
```

### 场景 4: 网页监控

```
场景: 监控网页变化
操作:
  1. 定期截图保存基线
  2. 使用 diff 检测变化
  3. 使用 network 监控性能
  4. 使用 console/errors 检测错误
结果: 实时网页监控
```

## 🆚 核心优势

| 特性 | Playwright/Puppeteer | Agent Browser |
|------|---------------------|---------------|
| **语言** | JavaScript/TypeScript | Rust |
| **启动速度** | 慢（Node.js 启动） | 极快（原生二进制） |
| **内存占用** | 高（Node.js 运行时） | 低（原生代码） |
| **AI 集成** | 需要额外处理 | 原生支持（snapshot） |
| **标签页管理** | 基础 | 高级（稳定 ID + 标签） |
| **批量执行** | 不支持 | 原生支持 |
| **语义化定位** | 有限 | 丰富（8 种方式） |

## 📊 性能指标

### 仓库活跃度

- ⭐ **31,729 Stars** - 高人气项目
- 🍴 **1,942 Forks** - 活跃社区
- 🔧 **440 Open Issues** - 活跃开发中
- 📅 **持续更新** - 2026-05-05 最新更新

### 技术成熟度

- ✅ **生产级代码**: Rust，高性能
- ✅ **Vercel Labs 出品**: 质量保证
- ✅ **Apache-2.0 许可**: 商业友好
- ✅ **完整文档**: 1521 行 README
- ✅ **活跃维护**: 频繁更新和改进

## 🔮 为什么选择 Agent Browser

### 1. 专为 AI 设计

- **AI 友好输出**: `snapshot` 命令生成带引用的可访问性树
- **稳定引用**: 使用 `@e1` 而非脆弱的 CSS 选择器
- **语义化定位**: 8 种智能元素查找方式

### 2. 极致性能

- **零启动延迟**: 原生 Rust 二进制
- **低资源占用**: 无需 Node.js 运行时
- **批量执行**: 减少多步骤工作流开销

### 3. 丰富功能

- **50+ 命令**: 涵盖所有浏览器操作
- **标签页管理**: 多标签页并发操作
- **网络拦截**: 完整的请求/响应控制
- **状态管理**: 保存和加载认证状态

### 4. 开发者体验

- **简洁 CLI**: 直观的命令设计
- **批量模式**: 高效的多步骤执行
- **调试工具**: 追踪、分析、日志
- **Vercel 质量**: 业界领先的工程标准

## 🌐 资源链接

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/vercel-labs/agent-browser)
> - [官网](https://agent-browser.dev)
> - [Vercel Labs](https://github.com/vercel-labs)
> - [npm 包](https://www.npmjs.com/package/agent-browser)

## 📖 文档

- **README**: [1,521 行详细文档](https://github.com/vercel-labs/agent-browser/blob/main/README.md)
- **完整命令参考**: 覆盖所有 50+ 命令
- **使用示例**: 丰富的实际用例
- **最佳实践**: AI 集成指南

## 🤝 贡献与社区

### 如何贡献

1. **报告问题**: 提交 Bug 和功能请求
2. **贡献代码**: 提交 Pull Request
3. **改进文档**: 完善文档和示例
4. **分享经验**: 分享使用案例和最佳实践

### 学习资源

- **GitHub 仓库**: [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser)
- **官网**: [agent-browser.dev](https://agent-browser.dev)
- **Vercel Labs**: [github.com/vercel-labs](https://github.com/vercel-labs)

## 📄 许可证

Apache License 2.0 - 商业友好，可自由使用和修改。

## 🌟 总结

Agent Browser 是一个**业界领先的浏览器自动化工具**，具有以下特点：

1. **极致性能** - 原生 Rust，零启动延迟
2. **AI 原生** - 专为 AI 代理设计
3. **丰富功能** - 50+ 命令，覆盖所有操作
4. **Vercel 质量** - Vercel Labs 出品保证
5. **活跃社区** - 31K+ Stars，持续更新
6. **开发友好** - 简洁 CLI，批量执行

**特别适合**：
- AI 代理浏览器自动化
- 端到端测试自动化
- 网页数据采集
- 自动化运维脚本
- 浏览器测试和监控

这是一个**改变游戏规则的工具**，为浏览器自动化设立了新标准！

---

*最后更新: 2026-05-05*
*数据来源: GitHub API + README.md*
*Made with ❤️ by Vercel Labs*
