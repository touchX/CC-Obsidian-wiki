---
name: ChromeDevTools-chrome-devtools-mcp
description: Chrome DevTools for coding agents - 为 AI 编码助手提供完整的 Chrome DevTools 访问能力
type: source
version: 1.0
tags: [github, typescript, mcp, chrome-devtools, browser, debugging, puppeteer]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/ChromeDevTools-chrome-devtools-mcp-2026-05-05.json
stars: 38118
language: TypeScript
license: not specified
github_url: https://github.com/ChromeDevTools/chrome-devtools-mcp
---

# Chrome DevTools MCP Server

> [!tip] 项目亮点
> ⭐ **38,118 Stars** | 🔥 **超热门项目** | 🤖 **AI Agent 浏览器自动化标准工具**

Chrome DevTools for Agents (`chrome-devtools-mcp`) 是一个让 AI 编码助手（如 Gemini、Claude、Cursor 或 Copilot）能够控制和检查实时 Chrome 浏览器的 MCP (Model Context Protocol) 服务器。它为 AI 提供了完整的 Chrome DevTools 能力，包括可靠的自动化、深度调试和性能分析。

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) |
| **语言** | TypeScript |
| **Stars** | ⭐ 38,118 |
| **Forks** | 2,379 |
| **Open Issues** | 106 |
| **创建时间** | 2025-09-11 |
| **最后更新** | 2026-05-05 |
| **主要标签** | browser, chrome, chrome-devtools, debugging, devtools, mcp, mcp-server, puppeteer |

## 核心特性

### 🚀 性能洞察
使用 [Chrome DevTools](https://github.com/ChromeDevTools/devtools-frontend) 记录性能追踪并提取可操作的性能洞察。

### 🐛 高级浏览器调试
- 分析网络请求
- 截取屏幕截图
- 检查浏览器控制台消息（含源映射堆栈跟踪）

### 🤖 可靠的自动化
使用 [puppeteer](https://github.com/puppeteer/puppeteer) 自动执行 Chrome 操作，并自动等待操作结果。

## 工具分类

该项目提供 **42 个工具**，分为 7 大类：

### 输入自动化（10 个工具）
- `click` - 点击元素
- `drag` - 拖拽操作
- `fill` - 填充表单字段
- `fill_form` - 批量填充表单
- `handle_dialog` - 处理对话框
- `hover` - 鼠标悬停
- `press_key` - 按键操作
- `type_text` - 输入文本
- `upload_file` - 上传文件
- `click_at` - 坐标点击

### 导航自动化（6 个工具）
- `close_page` - 关闭页面
- `list_pages` - 列出所有页面
- `navigate_page` - 导航到 URL
- `new_page` - 新建页面
- `select_page` - 选择页面
- `wait_for` - 等待条件

### 模拟（2 个工具）
- `emulate` - 模拟设备/网络
- `resize_page` - 调整视口大小

### 性能分析（3 个工具）
- `performance_analyze_insight` - 分析性能洞察
- `performance_start_trace` - 开始性能追踪
- `performance_stop_trace` - 停止性能追踪

### 网络（2 个工具）
- `get_network_request` - 获取网络请求详情
- `list_network_requests` - 列出网络请求

### 调试（10 个工具）
- `evaluate_script` - 执行 JavaScript
- `get_console_message` - 获取控制台消息
- `lighthouse_audit` - Lighthouse 审计
- `list_console_messages` - 列出控制台消息
- `take_screenshot` - 截取屏幕截图
- `take_snapshot` - 获取页面快照
- `execute_webmcp_tool` - 执行 WebMCP 工具
- `list_webmcp_tools` - 列出 WebMCP 工具
- `screencast_start` - 开始屏幕录制
- `screencast_stop` - 停止屏幕录制

### 内存（4 个工具）
- `take_memory_snapshot` - 拍摄内存快照
- `get_memory_snapshot_details` - 获取内存快照详情
- `get_nodes_by_class` - 按类获取节点
- `load_memory_snapshot` - 加载内存快照

### 扩展（5 个工具）
- `install_extension` - 安装扩展
- `list_extensions` - 列出扩展
- `reload_extension` - 重新加载扩展
- `trigger_extension_action` - 触发扩展操作
- `uninstall_extension` - 卸载扩展

## 安装配置

### 基础配置

在 MCP 客户端中添加以下配置：

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": ["-y", "chrome-devtools-mcp@latest"]
    }
  }
}
```

### Claude Code 安装

**方式 1：通过 CLI 安装（仅 MCP）**

```bash
claude mcp add chrome-devtools --scope user npx chrome-devtools-mcp@latest
```

**方式 2：作为插件安装（MCP + Skills）**

```bash
# 添加 marketplace 注册表
/plugin marketplace add ChromeDevTools/chrome-devtools-mcp

# 安装插件
/plugin install chrome-devtools-mcp

# 重启 Claude Code
```

### Slim 模式（基础任务）

如果只需要基础浏览器任务，使用 `--slim` 模式：

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": ["-y", "chrome-devtools-mcp@latest", "--slim", "--headless"]
    }
  }
}
```

### 连接到运行的 Chrome 实例

如果需要连接到已运行的 Chrome 实例：

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": [
        "-y",
        "chrome-devtools-mcp@latest",
        "--browser-url=http://127.0.0.1:9222"
      ]
    }
  }
}
```

> [!warning] 安全提醒
> 启用远程调试端口会打开调试端口，机器上的任何应用都可以连接并控制浏览器。在调试端口打开时，请勿浏览敏感网站。

## 系统要求

- **Node.js**: v20.19 或更新的 [LTS 版本](https://github.com/nodejs/Release#release-schedule)
- **Chrome**: 当前稳定版或更新版本
- **npm**: 最新版本

## 使用示例

安装后，在 MCP 客户端中输入以下提示进行测试：

```
Check the performance of https://developers.chrome.com
```

MCP 客户端应该会自动打开浏览器并记录性能追踪。

## 重要说明

### 数据收集

Google 默认收集使用统计（工具调用成功率、延迟、环境信息）以提高可靠性和性能。可以通过 `--no-usage-statistics` 标志选择退出。

### 隐私和免责

`chrome-devtools-mcp` 将浏览器实例的内容暴露给 MCP 客户端，允许它们检查、调试和修改浏览器或 DevTools 中的任何数据。避免分享不想与 MCP 客户端共享的敏感或个人信息。

### 浏览器支持

官方支持 Google Chrome 和 [Chrome for Testing](https://developer.chrome.com/blog/chrome-for-testing/)。其他基于 Chromium 的浏览器可能可用，但不保证。

## 相关资源

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/ChromeDevTools/chrome-devtools-mcp)
> - [NPM 包](https://npmjs.org/package/chrome-devtools-mcp)
> - [工具参考文档](https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/tool-reference.md)
> - [CLI 文档](https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/cli.md)
> - [故障排除指南](https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/troubleshooting.md)
> - [Slim 工具参考](https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/slim-tool-reference.md)

## 项目状态

| 指标 | 状态 |
|------|------|
| **活跃度** | 🔥 高度活跃（最近更新：2026-05-05） |
| **社区参与** | ⭐ 超高人气（38K+ Stars） |
| **维护状态** | ✅ 积极维护 |
| **文档质量** | ✅ 文档完善 |
| **适用场景** | AI Agent 浏览器自动化、性能测试、Web 调试 |
