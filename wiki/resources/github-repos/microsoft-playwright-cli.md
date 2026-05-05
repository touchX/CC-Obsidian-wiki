---
name: microsoft-playwright-cli
description: Playwright CLI with SKILLS - 为 AI 编码代理提供的 Token 高效浏览器自动化命令行工具
type: source
version: 1.0
tags: [github, typescript, playwright, browser-automation, cli, ai-agent, testing]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/microsoft-playwright-cli-2026-05-05.json
stars: 9940
language: TypeScript
license: not specified
github_url: https://github.com/microsoft/playwright-cli
---

# Playwright CLI with SKILLS

> [!tip] 项目亮点
> ⭐ **9,940 Stars** | 🚀 **Microsoft 官方** | 🤖 **专为 AI Agent 设计**

Playwright CLI 是微软官方提供的命令行工具，专为现代 AI 编码代理设计。它通过 **CLI + SKILLS** 模式提供完整的浏览器自动化能力，相比 MCP 模式更节省 Token，更适合与大型代码库和推理任务配合使用。

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [microsoft/playwright-cli](https://github.com/microsoft/playwright-cli) |
| **语言** | TypeScript |
| **Stars** | ⭐ 9,940 |
| **Forks** | 507 |
| **Open Issues** | 19 |
| **创建时间** | 2020-06-19 |
| **最后更新** | 2026-05-05 |
| **主要标签** | playwright |
| **官方文档** | [playwright.dev](https://playwright.dev) |

## CLI vs MCP：设计理念

### 🎯 CLI 模式（本工具）

**优势**：
- **Token 高效**：不强制将大型工具 schema 和冗长的可访问性树加载到模型上下文
- **简洁命令**：通过专门设计的命令实现操作，减少上下文消耗
- **适合高吞吐量**：必须平衡浏览器自动化与大型代码库、测试和推理的 AI Agent

**适用场景**：
- 现代 AI 编码代理（Claude Code、GitHub Copilot 等）
- 需要处理大型代码库和复杂推理任务
- 有限的上下文窗口环境

### 🔄 MCP 模式（[playwright-mcp](https://github.com/microsoft/playwright-mcp)）

**优势**：
- **持久状态**：保持连续的浏览器上下文
- **丰富内省**：提供深入的页面结构检查能力
- **迭代推理**：支持对页面结构的迭代式分析

**适用场景**：
- 探索性自动化
- 自愈测试
- 长时间运行的自主工作流
- 保持连续浏览器上下文比 Token 成本更重要的情况

## 核心特性

### 🚀 Token 高效
不强制将页面数据加载到 LLM，只在需要时提供快照和命令输出。

### 🎭 完整的浏览器自动化
提供 **50+ 命令**，涵盖所有 Playwright 功能：
- 页面导航和交互
- 表单填充和文件上传
- 元素定位和操作
- 存储状态管理（Cookies、LocalStorage、SessionStorage）
- 网络请求拦截和 Mock
- DevTools 集成（Console、Network、Tracing、Video）
- 多浏览器会话管理

### 📸 智能快照机制
每次命令后自动提供页面状态快照，包含元素引用（refs）便于后续操作。

### 🎯 元素定位方式
支持三种定位方式：
1. **快照引用**（推荐）：`playwright-cli click e15`
2. **CSS 选择器**：`playwright-cli click "#main > button.submit"`
3. **Playwright Locator**：
   - `playwright-cli click "getByRole('button', { name: 'Submit' })"`
   - `playwright-cli click "getByTestId('submit-button')"`

### 🖥️ 可视化监控面板
提供实时监控仪表板，可查看和控制所有运行的浏览器会话。

## 安装配置

### 基础安装

```bash
npm install -g @playwright/cli@latest
playwright-cli --help
```

### 安装 Skills

```bash
playwright-cli install --skills
```

安装后，Claude Code、GitHub Copilot 等 AI Agent 将自动使用本地安装的 Skills。

### 无 Skills 运行

也可以让 AI Agent 直接读取 CLI 帮助信息：

```
Test the "add todo" flow on https://demo.playwright.dev/todomvc using playwright-cli.
Check playwright-cli --help for available commands.
```

## 命令参考

### 核心命令

```bash
playwright-cli open [url]               # 打开浏览器，可选导航到 URL
playwright-cli goto <url>               # 导航到指定 URL
playwright-cli close                    # 关闭页面
playwright-cli type <text>              # 在可编辑元素中输入文本
playwright-cli click <ref> [button]     # 点击页面元素
playwright-cli dblclick <ref> [button]  # 双击页面元素
playwright-cli fill <ref> <text>        # 填充文本到可编辑元素
playwright-cli fill <ref> <text> --submit # 填充并按 Enter
playwright-cli drag <startRef> <endRef> # 拖拽操作
playwright-cli drop <ref> --path=<file> # 从外部拖放文件到元素
playwright-cli drop <ref> --data="k=v"  # 拖放数据到元素
playwright-cli hover <ref>              # 鼠标悬停
playwright-cli select <ref> <val>       # 在下拉菜单中选择选项
playwright-cli upload <file>            # 上传一个或多个文件
playwright-cli check <ref>              # 勾选复选框或单选按钮
playwright-cli uncheck <ref>            # 取消勾选
playwright-cli snapshot                 # 捕获页面快照获取元素引用
playwright-cli snapshot --filename=f    # 保存快照到指定文件
playwright-cli snapshot <ref>           # 快照特定元素
playwright-cli snapshot --depth=N       # 限制快照深度以提高效率
playwright-cli eval <func> [ref]        # 在页面或元素上执行 JavaScript
playwright-cli dialog-accept [prompt]   # 接受对话框
playwright-cli dialog-dismiss           # 拒绝对话框
playwright-cli resize <w> <h>           # 调整浏览器窗口大小
```

### 导航命令

```bash
playwright-cli go-back                  # 返回上一页
playwright-cli go-forward               # 前进到下一页
playwright-cli reload                   # 重新加载当前页面
```

### 键盘命令

```bash
playwright-cli press <key>              # 按键，支持 `a`, `arrowleft` 等
playwright-cli keydown <key>            # 按下键
playwright-cli keyup <key>              # 释放键
```

### 鼠标命令

```bash
playwright-cli mousemove <x> <y>        # 移动鼠标到指定位置
playwright-cli mousedown [button]       # 按下鼠标
playwright-cli mouseup [button]         # 释放鼠标
playwright-cli mousewheel <dx> <dy>     # 滚动鼠标滚轮
```

### 保存命令

```bash
playwright-cli screenshot [ref]         # 截取当前页面或元素的屏幕截图
playwright-cli screenshot --filename=f  # 保存截图到指定文件
playwright-cli pdf                      # 保存页面为 PDF
playwright-cli pdf --filename=page.pdf  # 保存 PDF 到指定文件
```

### 标签页管理

```bash
playwright-cli tab-list                 # 列出所有标签页
playwright-cli tab-new [url]            # 创建新标签页
playwright-cli tab-close [index]        # 关闭浏览器标签页
playwright-cli tab-select <index>       # 选择浏览器标签页
```

### 存储管理

```bash
# 存储状态
playwright-cli state-save [filename]    # 保存存储状态
playwright-cli state-load <filename>    # 加载存储状态

# Cookies
playwright-cli cookie-list [--domain]   # 列出 cookies
playwright-cli cookie-get <name>        # 获取 cookie
playwright-cli cookie-set <name> <val>  # 设置 cookie
playwright-cli cookie-delete <name>     # 删除 cookie
playwright-cli cookie-clear             # 清除所有 cookies

# LocalStorage
playwright-cli localstorage-list        # 列出 localStorage 条目
playwright-cli localstorage-get <key>   # 获取 localStorage 值
playwright-cli localstorage-set <k> <v> # 设置 localStorage 值
playwright-cli localstorage-delete <k>  # 删除 localStorage 条目
playwright-cli localstorage-clear       # 清除所有 localStorage

# SessionStorage
playwright-cli sessionstorage-list      # 列出 sessionStorage 条目
playwright-cli sessionstorage-get <k>   # 获取 sessionStorage 值
playwright-cli sessionstorage-set <k> <v> # 设置 sessionStorage 值
playwright-cli sessionstorage-delete <k> # 删除 sessionStorage 条目
playwright-cli sessionstorage-clear     # 清除所有 sessionStorage
```

### 网络请求

```bash
playwright-cli route <pattern> [opts]   # Mock 网络请求
playwright-cli route-list               # 列出活跃的路由
playwright-cli unroute [pattern]        # 移除路由
```

### DevTools

```bash
playwright-cli console [min-level]      # 列出控制台消息
playwright-cli requests                 # 列出加载页面以来的所有网络请求
playwright-cli request <index>          # 显示特定请求的详细信息
playwright-cli run-code <code>          # 运行 Playwright 代码片段
playwright-cli run-code --filename=f    # 从文件运行 Playwright 代码
playwright-cli tracing-start            # 开始追踪记录
playwright-cli tracing-stop             # 停止追踪记录
playwright-cli video-start [filename]   # 开始视频录制
playwright-cli video-chapter <title>    # 向视频添加章节标记
playwright-cli video-stop               # 停止视频录制
playwright-cli show                     # 打开可视化仪表板
playwright-cli show --annotate          # 启动仪表板并带注释提示
playwright-cli generate-locator <ref>   # 为元素生成 Playwright 定位器
playwright-cli highlight <ref>          # 显示持久高亮覆盖层
playwright-cli highlight <ref> --style= # 使用自定义 CSS 样式高亮
playwright-cli highlight <ref> --hide   # 隐藏特定元素的高亮
playwright-cli highlight --hide         # 隐藏所有页面高亮
```

### 会话管理

```bash
playwright-cli -s=name <cmd>            # 在命名会话中运行命令
playwright-cli -s=name close            # 停止命名浏览器
playwright-cli -s=name delete-data      # 删除命名浏览器的用户数据
playwright-cli list                     # 列出所有会话
playwright-cli close-all                # 关闭所有浏览器
playwright-cli kill-all                 # 强制终止所有浏览器进程
```

## 高级功能

### 会话管理

Playwright CLI 默认在内存中保留浏览器配置文件。在同一会话内的 CLI 调用之间保留 Cookies 和存储状态，但浏览器关闭后会丢失。使用 `--persistent` 可将配置文件保存到磁盘以实现跨浏览器重启的持久化。

可以为不同项目使用不同的浏览器实例：

```bash
playwright-cli open https://playwright.dev
playwright-cli -s=example open https://example.com --persistent
playwright-cli list
```

使用环境变量运行 AI Agent：

```bash
PLAYWRIGHT_CLI_SESSION=todo-app claude .
```

### 可视化监控面板

使用 `playwright-cli show` 打开可视化仪表板，可以查看和控制所有运行的浏览器会话：

```bash
playwright-cli show
```

仪表板提供两个视图：

1. **会话网格**：显示所有活动会话（按工作区分组），每个会话都有实时屏幕预览、会话名称、当前 URL 和页面标题。点击任何会话可放大查看。

2. **会话详情**：显示所选会话的实时视图，包含标签栏、导航控件（后退、前进、重新加载、地址栏）和完整的远程控制。点击视口可接管鼠标和键盘输入；按 Escape 释放。

从网格中还可以关闭运行的会话或删除非活动会话的数据。

### 有头模式

Playwright CLI 默认无头运行。如果想查看浏览器，向 `open` 传递 `--headed`：

```bash
playwright-cli open https://playwright.dev --headed
```

### 配置文件

Playwright CLI 可以使用 JSON 配置文件进行配置。可以使用 `--config` 命令行选项指定配置文件：

```bash
playwright-cli --config path/to/config.json open example.com
```

默认从 `.playwright/cli.config.json` 加载配置。

**配置文件结构**：

```json
{
  "browser": {
    "browserName": "chromium" | "firefox" | "webkit",
    "isolated": boolean,
    "userDataDir": string,
    "launchOptions": LaunchOptions,
    "contextOptions": BrowserContextOptions,
    "cdpEndpoint": string,
    "cdpHeaders": Record<string, string>,
    "cdpTimeout": number,
    "remoteEndpoint": string,
    "initPage": string[],
    "initScript": string[]
  },
  "saveVideo": {
    "width": number,
    "height": number
  },
  "outputDir": string,
  "outputMode": "file" | "stdout",
  "console": {
    "level": "error" | "warning" | "info" | "debug"
  },
  "network": {
    "allowedOrigins": string[],
    "blockedOrigins": string[]
  },
  "testIdAttribute": string,
  "timeouts": {
    "action": number,
    "navigation": number
  },
  "allowUnrestrictedFileAccess": boolean,
  "codegen": "typescript" | "none"
}
```

### 环境变量配置

支持大量环境变量配置：

- `PLAYWRIGHT_MCP_BROWSER` - 浏览器或 Chrome 通道
- `PLAYWRIGHT_MCP_HEADLESS` - 是否无头模式运行
- `PLAYWRIGHT_MCP_VIEWPORT_SIZE` - 视口大小（例如 "1280x720"）
- `PLAYWRIGHT_MCP_USER_DATA_DIR` - 用户数据目录路径
- `PLAYWRIGHT_MCP_STORAGE_STATE` - 存储状态文件路径
- `PLAYWRIGHT_MCP_PROXY_SERVER` - 代理服务器
- `PLAYWRIGHT_MCP_SAVE_VIDEO` - 保存视频（例如 "--save-video=800x600"）
- `PLAYWRIGHT_MCP_SAVE_TRACE` - 保存 Playwright Trace
- 等等...

## 使用示例

### 基础使用

```bash
# 打开浏览器并导航
playwright-cli open https://demo.playwright.dev/todomvc/ --headed

# 输入文本
playwright-cli type "Buy groceries"
playwright-cli press Enter

# 勾选项目
playwright-cli check e21
playwright-cli check e35

# 截图
playwright-cli screenshot
```

### AI Agent 提示示例

```
Use playwright skills to test https://demo.playwright.dev/todomvc/.
Take screenshots for all successful and failing scenarios.
```

### 本地安装

如果全局 `playwright-cli` 命令不可用，可以使用本地版本：

```bash
npx --no-install playwright-cli --version
```

或安装为全局命令：

```bash
npm install -g @playwright/cli@latest
```

## 系统要求

- **Node.js**: 18 或更新版本
- **AI Agent**: Claude Code、GitHub Copilot 或其他编码代理

## 相关资源

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/microsoft/playwright-cli)
> - [Playwright MCP](https://github.com/microsoft/playwright-mcp)
> - [官方文档](https://playwright.dev)
> - [Playwright CLI 文档](https://playwright.dev/docs/cli)
> - [Demo 应用](https://demo.playwright.dev/todomvc)

## 项目状态

| 指标 | 状态 |
|------|------|
| **活跃度** | 🔥 高度活跃（最近更新：2026-05-05） |
| **社区参与** | ⭐ 高人气（9.9K Stars） |
| **维护状态** | ✅ Microsoft 官方维护 |
| **文档质量** | ✅ 文档完善 |
| **适用场景** | AI Agent 浏览器自动化、Web 测试、E2E 测试、浏览器自动化 |

## 核心优势总结

1. **Token 高效**：专为 AI Agent 设计，减少上下文消耗
2. **完整功能**：涵盖 Playwright 所有能力（50+ 命令）
3. **灵活定位**：支持快照引用、CSS 选择器、Playwright Locator
4. **会话管理**：多浏览器实例、持久化存储、环境隔离
5. **可视化监控**：实时仪表板查看所有会话状态
6. **官方支持**：Microsoft 官方维护，质量保证
