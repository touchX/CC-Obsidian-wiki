---
name: chrome-devtools-mcp-complete-guide
description: Chrome DevTools MCP 完整使用指南 — AI 原生浏览器自动化与调试平台
type: guide
tags: [chrome-devtools, mcp, browser, automation, debugging, performance, 内存分析]
created: 2026-05-05
updated: 2026-05-05
---

# Chrome DevTools MCP 完整使用指南

## 📋 目录

- [核心概述](#核心概述)
- [快速开始](#快速开始)
- [42 个工具详解](#42-个工具详解)
- [实战案例](#实战案例)
- [高级配置](#高级配置)
- [与其他工具对比](#与其他工具对比)
- [最佳实践](#最佳实践)
- [故障排除](#故障排除)

## 核心概述

### 什么是 Chrome DevTools MCP？

**Chrome DevTools MCP** (`chrome-devtools-mcp`) 是由 Google Chrome 官方团队开发的 MCP (Model Context Protocol) 服务器，为 AI 编码助手提供完整的 Chrome DevTools 能力。

> [!tip] 核心价值
> - ⭐ **38,118 Stars** — 超高人气项目
> - 🤖 **AI 原生** — 深度集成 Claude、Gemini、Copilot 等 AI 助手
> - 🔧 **42 个工具** — 覆盖自动化、调试、性能、内存全场景
> - 🚀 **专业级** — 使用 Puppeteer + Chrome DevTools Protocol

### 与传统工具的区别

| 特性             | chrome-devtools-mcp | playwright-cli | Puppeteer |
| -------------- | ------------------- | -------------- | --------- |
| **交互方式**       | AI 自然语言             | 命令行            | 代码 API    |
| **性能分析**       | ✅ 专业级               | ❌ 无            | ⚠️ 需手动    |
| **内存快照**       | ✅ 支持                | ❌ 无            | ⚠️ 需手动    |
| **Lighthouse** | ✅ 集成                | ❌ 无            | ⚠️ 需插件    |
| **扩展管理**       | ✅ 可管理               | ❌ 无            | ❌ 无       |
| **学习曲线**       | ⭐⭐⭐                 | ⭐⭐             | ⭐⭐⭐⭐      |
| **自动化能力**      | ⭐⭐⭐⭐⭐               | ⭐⭐             | ⭐⭐⭐⭐      |

### 核心优势

#### 1. AI 原生设计

```
用户：分析 https://example.com 的性能瓶颈
  ↓
AI 自动规划：
  1. new_page → 创建页面
  2. navigate_page → 访问 URL
  3. performance_start_trace → 开始追踪
  4. 等待加载完成
  5. performance_stop_trace → 停止追踪
  6. performance_analyze_insight → 分析结果
  ↓
返回结构化性能报告
```

#### 2. 专业级调试能力

- **性能追踪**：基于 Chrome DevTools Performance Panel
- **内存快照**：检测内存泄漏和对象保留链
- **网络分析**：详细的请求/响应头、时序、瀑布图
- **Lighthouse 集成**：一键运行性能审计

#### 3. 完整的工具生态

```
chrome-devtools-mcp
├── 输入自动化 (10) — 点击、填表、拖拽
├── 导航控制 (6) — 页面管理、等待
├── 模拟 (2) — 设备、网络
├── 性能分析 (3) — 追踪、洞察
├── 网络 (2) — 请求监控
├── 调试 (10) — 截图、快照、脚本
├── 内存 (4) — 快照、分析
└── 扩展 (5) — 安装、管理
```

## 快速开始

### 系统要求

| 组件 | 最低版本 | 推荐版本 |
|------|---------|---------|
| **Node.js** | v20.19 LTS | 最新 LTS |
| **Chrome** | 当前稳定版 | Chrome for Testing |
| **npm** | 最新版 | 最新版 |
| **Claude Code** | v1.0+ | 最新版 |

### 安装方式

#### 方式 1：Claude Code 插件（推荐）

> [!tip] 最简单的安装方式
> 一键安装，自动配置，包含内置 Skills

```bash
# 步骤 1：添加 Chrome DevTools marketplace
/plugin marketplace add ChromeDevTools/chrome-devtools-mcp

# 步骤 2：安装插件
/plugin install chrome-devtools-mcp

# 步骤 3：重启 Claude Code
# 插件自动配置完成
```

**安装后验证**：
```
测试：打开 https://example.com 并截图
```

如果成功，AI 会自动调用工具并返回截图。

#### 方式 2：MCP 服务器配置

> [!warning] 需要手动配置
> 适合需要自定义参数的高级用户

在 `~/.claude/settings.json` 中添加：

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

**重启 Claude Code** 使配置生效。

#### 方式 3：Slim 模式（轻量级）

> [!tip] 资源受限环境
> 仅包含基础浏览器自动化工具

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

**Slim 模式限制**：
- ❌ 无性能分析工具
- ❌ 无内存快照工具
- ❌ 无 Lighthouse 审计
- ❌ 无扩展管理
- ✅ 仅基础自动化（点击、填表、导航）

#### 方式 4：连接到现有 Chrome 实例

> [!warning] 安全风险
> 调试端口打开时，任何应用都可控制浏览器

```bash
# 启动 Chrome 并开启调试端口
chrome --remote-debugging-port=9222
```

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

### 快速验证

安装完成后，测试基本功能：

```
任务 1：打开 GitHub 首页
任务 2：截图
任务 3：获取页面标题
```

AI 应该能自动执行这些任务。

## 42 个工具详解

### 工具分类总览

| 分类 | 工具数 | 核心能力 |
|------|-------|---------|
| **输入自动化** | 10 | 点击、填表、拖拽、上传 |
| **导航控制** | 6 | 页面管理、等待、切换 |
| **模拟** | 2 | 设备模拟、视口调整 |
| **性能分析** | 3 | 追踪、洞察、瓶颈分析 |
| **网络** | 2 | 请求监控、详情查看 |
| **调试** | 10 | 截图、快照、脚本、控制台 |
| **内存** | 4 | 快照、分析、节点查找 |
| **扩展** | 5 | 安装、管理、触发 |

---

## 1. 输入自动化工具（10 个）

### click - 点击元素

**功能**：点击页面上的元素

**参数**：
```json
{
  "pageId": "页面 ID",
  "element": "元素选择器",
  "waitForNavigation": true
}
```

**使用示例**：
```
点击登录按钮
点击 #submit-btn
点击 class="btn-primary" 的元素
```

**AI 自动执行**：
1. 定位元素（使用选择器）
2. 等待元素可见
3. 点击元素
4. 等待导航（可选）

### fill - 填充字段

**功能**：填充单个表单字段

**参数**：
```json
{
  "pageId": "页面 ID",
  "element": "元素选择器",
  "value": "填充值"
}
```

**使用示例**：
```
在 #username 输入 "test@example.com"
在 input[name="email"] 填充 "user@test.com"
```

### fill_form - 批量填充表单

**功能**：一次性填充多个表单字段

**参数**：
```json
{
  "pageId": "页面 ID",
  "fields": [
    {"selector": "#username", "value": "testuser"},
    {"selector": "#password", "value": "pass123"},
    {"selector": "#email", "value": "test@example.com"}
  ]
}
```

**使用示例**：
```
填写登录表单：
- 用户名：testuser
- 密码：pass123
- 邮箱：test@example.com
```

### type_text - 输入文本

**功能**：模拟键盘输入（支持特殊键）

**参数**：
```json
{
  "pageId": "页面 ID",
  "element": "元素选择器",
  "text": "输入内容",
  "delay": 100
}
```

**使用示例**：
```
在 #editor 输入 "Hello World"
在 textarea 输入多行文本
```

**与 fill 的区别**：
- `fill`：直接设置值（快速）
- `type_text`：模拟键盘输入（支持延迟、特殊键）

### hover - 鼠标悬停

**功能**：悬停在元素上（触发 hover 效果）

**参数**：
```json
{
  "pageId": "页面 ID",
  "element": "元素选择器"
}
```

**使用示例**：
```
悬停在导航菜单上
悬停在 .dropdown-trigger 上查看子菜单
```

### press_key - 按键操作

**功能**：模拟键盘按键

**参数**：
```json
{
  "pageId": "页面 ID",
  "key": "Enter"
}
```

**支持的键**：
- `Enter`, `Tab`, `Escape`, `Backspace`
- `ArrowUp`, `ArrowDown`, `ArrowLeft`, `ArrowRight`
- `F1` - `F12`
- 组合键：`Control+C`, `Shift+A`

**使用示例**：
```
按 Enter 键提交表单
按 Escape 关闭弹窗
按 Control+C 复制
```

### drag - 拖拽操作

**功能**：拖拽元素到目标位置

**参数**：
```json
{
  "pageId": "页面 ID",
  "source": "源元素选择器",
  "target": "目标元素选择器"
}
```

**使用示例**：
```
拖拽 #file 到 #upload-zone
拖拽 .task-card 到 .done-column
```

### upload_file - 上传文件

**功能**：上传文件到文件输入框

**参数**：
```json
{
  "pageId": "页面 ID",
  "element": "文件输入选择器",
  "path": "/path/to/file.pdf"
}
```

**使用示例**：
```
上传 report.pdf 到 #file-input
上传图片到 input[type="file"]
```

### click_at - 坐标点击

**功能**：在指定坐标点击

**参数**：
```json
{
  "pageId": "页面 ID",
  "x": 100,
  "y": 200
}
```

**使用场景**：
- Canvas 交互
- 地图点击
- 无法通过选择器定位的元素

### handle_dialog - 处理对话框

**功能**：接受或拒绝 alert/confirm/prompt 对话框

**参数**：
```json
{
  "pageId": "页面 ID",
  "accept": true,
  "promptText": "输入内容"
}
```

**使用示例**：
```
接受弹窗
拒绝确认对话框
在 prompt 输入 "Hello"
```

---

## 2. 导航控制工具（6 个）

### new_page - 新建页面

**功能**：创建新的浏览器标签页

**参数**：
```json
{
  "url": "https://example.com"
}
```

**使用示例**：
```
打开新标签页
打开 https://github.com
```

### navigate_page - 导航到 URL

**功能**：在现有页面导航到新 URL

**参数**：
```json
{
  "pageId": "页面 ID",
  "url": "https://example.com",
  "waitUntil": "networkidle"
}
```

**waitUntil 选项**：
- `load` - 页面加载完成
- `domcontentloaded` - DOM 解析完成
- `networkidle` - 网络空闲（推荐）

**使用示例**：
```
访问 https://example.com
刷新页面
```

### close_page - 关闭页面

**功能**：关闭指定页面

**参数**：
```json
{
  "pageId": "页面 ID"
}
```

### list_pages - 列出所有页面

**功能**：获取所有打开的页面列表

**返回示例**：
```json
[
  {"pageId": "1", "url": "https://example.com", "title": "Example"},
  {"pageId": "2", "url": "https://github.com", "title": "GitHub"}
]
```

**使用示例**：
```
显示所有打开的标签页
列出当前浏览器会话
```

### select_page - 选择页面

**功能**：切换到指定页面（后续操作在该页面执行）

**参数**：
```json
{
  "pageId": "页面 ID"
}
```

**使用示例**：
```
切换到第二个标签页
选择 GitHub 页面
```

### wait_for - 等待条件

**功能**：等待特定条件满足

**参数**：
```json
{
  "pageId": "页面 ID",
  "condition": "networkidle",
  "timeout": 30000
}
```

**条件类型**：
- `networkidle` - 网络空闲
- `selector` - 选择器出现
- `timeout` - 固定延迟

**使用示例**：
```
等待加载完成
等待 #result 出现
等待 5 秒
```

---

## 3. 模拟工具（2 个）

### emulate - 模拟设备/网络

**功能**：模拟移动设备或网络条件

**参数**：
```json
{
  "pageId": "页面 ID",
  "device": "iPhone 12",
  "network": "Fast 3G"
}
```

**预设设备**：
- `iPhone 12`, `iPhone 12 Pro`, `iPad Pro`
- `Pixel 5`, `Galaxy S21`
- `Desktop Chrome`

**网络条件**：
- `Fast 3G`, `Slow 3G`, `Offline`

**使用示例**：
```
模拟 iPhone 12 访问页面
模拟慢速 3G 网络
```

### resize_page - 调整视口大小

**功能**：设置浏览器视口尺寸

**参数**：
```json
{
  "pageId": "页面 ID",
  "width": 1920,
  "height": 1080
}
```

**使用示例**：
```
设置窗口大小为 1920x1080
调整到移动设备尺寸 375x667
```

---

## 4. 性能分析工具（3 个）⭐ 独有优势

### performance_start_trace - 开始性能追踪

**功能**：开始记录性能追踪数据

**参数**：
```json
{
  "pageId": "页面 ID",
  "traceName": "my-trace"
}
```

**追踪内容**：
- 网络请求时序
- JavaScript 执行时间
- 渲染性能
- 内存使用

### performance_stop_trace - 停止性能追踪

**功能**：停止追踪并保存结果

**参数**：
```json
{
  "pageId": "页面 ID"
}
```

### performance_analyze_insight - 分析性能洞察

**功能**：分析性能数据，提取可操作的洞察

**返回内容**：
```json
{
  "score": 85,
  "insights": [
    {
      "category": "network",
      "title": "主线程阻塞",
      "description": "JavaScript 执行时间过长",
      "suggestion": "考虑代码分割和懒加载"
    }
  ]
}
```

**使用示例**：
```
完整流程：
1. 打开 https://example.com
2. 开始性能追踪
3. 等待页面加载
4. 停止追踪
5. 分析性能瓶颈
```

> [!tip] 性能分析是 chrome-devtools-mcp 的核心优势
> playwright-cli 完全不具备此能力

---

## 5. 网络工具（2 个）

### list_network_requests - 列出网络请求

**功能**：获取页面的所有网络请求

**返回示例**：
```json
[
  {
    "url": "https://api.example.com/data",
    "method": "GET",
    "status": 200,
    "type": "xhr",
    "size": 12345,
    "time": 234
  }
]
```

**使用示例**：
```
显示所有网络请求
列出失败的请求
按大小排序请求
```

### get_network_request - 获取请求详情

**功能**：获取单个请求的详细信息

**返回内容**：
- 请求头
- 响应头
- 请求体
- 响应体
- 时序数据

**使用示例**：
```
查看第一个请求的详情
显示 API 请求的响应头
```

---

## 6. 调试工具（10 个）

### take_screenshot - 截图

**功能**：截取页面或元素的截图

**参数**：
```json
{
  "pageId": "页面 ID",
  "path": "/path/to/screenshot.png",
  "fullPage": true
}
```

**使用示例**：
```
截取当前页面
截取整个页面（含滚动）
截取 #header 元素
```

### take_snapshot - 获取页面快照

**功能**：获取页面的 DOM 结构快照

**返回内容**：
```json
{
  "title": "页面标题",
  "url": "https://example.com",
  "elements": [
    {
      "selector": "#main",
      "text": "内容",
      "attributes": {}
    }
  ]
}
```

**使用示例**：
```
获取页面快照
分析页面结构
```

### evaluate_script - 执行 JavaScript

**功能**：在页面上下文中执行 JavaScript

**参数**：
```json
{
  "pageId": "页面 ID",
  "script": "document.title"
}
```

**使用示例**：
```
执行 document.title
获取 localStorage 内容
执行复杂计算
```

### list_console_messages - 列出控制台消息

**功能**：获取所有控制台日志

**返回示例**：
```json
[
  {
    "level": "error",
    "text": "Uncaught TypeError",
    "url": "https://example.com/app.js",
    "line": 42
  }
]
```

**使用示例**：
```
显示所有控制台消息
只显示错误日志
过滤警告信息
```

### get_console_message - 获取消息详情

**功能**：获取单条消息的详细信息

**返回内容**：
- 完整堆栈跟踪
- 源映射位置
- 相关对象

### lighthouse_audit - Lighthouse 审计

**功能**：运行 Google Lighthouse 性能审计

**参数**：
```json
{
  "pageId": "页面 ID",
  "categories": ["performance", "accessibility", "best-practices"]
}
```

**审计类别**：
- `performance` - 性能
- `accessibility` - 可访问性
- `best-practices` - 最佳实践
- `seo` - SEO

**返回内容**：
```json
{
  "performance": 92,
  "accessibility": 85,
  "best-practices": 90,
  "seo": 88
}
```

**使用示例**：
```
运行 Lighthouse 审计
检查性能分数
获取优化建议
```

### screencast_start - 开始屏幕录制

**功能**：开始录制浏览器屏幕

**参数**：
```json
{
  "pageId": "页面 ID",
  "path": "/path/to/recording.webm"
}
```

### screencast_stop - 停止屏幕录制

**功能**：停止录制并保存文件

### execute_webmcp_tool - 执行 WebMCP 工具

**功能**：执行 WebMCP 协议的工具（高级）

### list_webmcp_tools - 列出 WebMCP 工具

**功能**：列出可用的 WebMCP 工具

---

## 7. 内存分析工具（4 个）⭐ 独有优势

### take_memory_snapshot - 拍摄内存快照

**功能**：捕获当前内存状态的快照

**参数**：
```json
{
  "pageId": "页面 ID"
}
```

**快照内容**：
- 所有 JavaScript 对象
- DOM 节点
- 内存占用大小
- 对象引用关系

### get_memory_snapshot_details - 获取快照详情

**功能**：分析内存快照，查找内存泄漏

**返回内容**：
```json
{
  "totalSize": "45.2 MB",
  "objects": [
    {
      "name": "HTMLElement",
      "count": 1234,
      "size": "12.3 MB"
    }
  ],
  "dominators": [
    {
      "name": "window",
      "retainedSize": "30.1 MB"
    }
  ]
}
```

**使用示例**：
```
完整流程：
1. 打开应用
2. 拍摄初始快照
3. 执行操作（如切换页面 10 次）
4. 拍摄对比快照
5. 分析内存增长
```

### get_nodes_by_class - 按类获取节点

**功能**：查找特定类的所有对象

**参数**：
```json
{
  "snapshotId": "快照 ID",
  "className": "HTMLElement"
}
```

**使用示例**：
```
查找所有 HTMLElement 节点
查找所有 EventListener
查找所有 Promise 对象
```

### load_memory_snapshot - 加载内存快照

**功能**：从文件加载保存的内存快照

**参数**：
```json
{
  "path": "/path/to/snapshot.heapsnapshot"
}
```

> [!tip] 内存分析是检测内存泄漏的利器
> playwright-cli 和 Puppeteer 都不具备此能力

---

## 8. 扩展管理工具（5 个）⭐ 独有优势

### install_extension - 安装扩展

**功能**：安装浏览器扩展

**参数**：
```json
{
  "path": "/path/to/extension.crx"
}
```

**使用示例**：
```
安装 React DevTools
安装 Vue.js devtools
```

### list_extensions - 列出扩展

**功能**：获取所有已安装的扩展列表

**返回示例**：
```json
[
  {
    "id": "fmkadmapgofadopljbjfkapdkoienihi",
    "name": "React Developer Tools",
    "version": "4.24"
  }
]
```

### reload_extension - 重新加载扩展

**功能**：重新加载指定扩展（开发时有用）

**参数**：
```json
{
  "extensionId": "扩展 ID"
}
```

### trigger_extension_action - 触发扩展操作

**功能**：触发扩展的浏览器操作

**参数**：
```json
{
  "extensionId": "扩展 ID"
}
```

**使用示例**：
```
触发 AdBlock 扩展
触发翻译扩展
```

### uninstall_extension - 卸载扩展

**功能**：卸载指定扩展

**参数**：
```json
{
  "extensionId": "扩展 ID"
}
```

---

## 实战案例

### 案例 1：性能分析与优化

**场景**：分析电商网站首页性能

**任务描述**：
```
分析 https://shop.example.com 的性能，
找出加载慢的原因并提供优化建议
```

**AI 自动执行流程**：

```javascript
// 1. 创建页面
new_page("https://shop.example.com")

// 2. 开始性能追踪
performance_start_trace({
  traceName: "homepage-load"
})

// 3. 等待页面完全加载
wait_for({
  pageId: "current",
  condition: "networkidle",
  timeout: 30000
})

// 4. 停止追踪
performance_stop_trace({
  pageId: "current"
})

// 5. 分析性能
performance_analyze_insight({
  pageId: "current"
})
```

**返回结果**：
```json
{
  "score": 65,
  "insights": [
    {
      "category": "network",
      "title": "主图片过大",
      "description": "hero-banner.jpg (2.3MB) 阻塞首屏渲染",
      "suggestion": "压缩图片或使用 WebP 格式"
    },
    {
      "category": "javascript",
      "title": "主线程阻塞",
      "description": "analytics.js 执行时间 850ms",
      "suggestion": "延迟加载非关键脚本"
    },
    {
      "category": "rendering",
      "title": "布局抖动",
      "description": "检测到 15 次布局偏移",
      "suggestion": "为图片元素预留空间"
    }
  ]
}
```

### 案例 2：内存泄漏检测

**场景**：检测单页应用是否存在内存泄漏

**任务描述**：
```
检测 https://app.example.com 是否有内存泄漏
执行流程：打开应用 → 拍摄快照 → 切换页面 20 次 → 拍摄对比快照 → 分析差异
```

**AI 自动执行流程**：

```javascript
// 1. 打开应用
new_page("https://app.example.com")

// 2. 初始快照
take_memory_snapshot({
  pageId: "current"
})

// 3. 执行操作
for (let i = 0; i < 20; i++) {
  click("#nav-home")
  wait_for("networkidle")
  click("#nav-about")
  wait_for("networkidle")
}

// 4. 对比快照
take_memory_snapshot({
  pageId: "current"
})

// 5. 分析差异
get_memory_snapshot_details({
  snapshotId: "latest"
})
```

**检测结果**：
```json
{
  "initialSize": "45.2 MB",
  "finalSize": "78.5 MB",
  "growth": "+33.3 MB",
  "leaks": [
    {
      "object": "EventListener",
      "count": 245,
      "growth": "+200",
      "retainedSize": "18.2 MB",
      "suggestion": "检查事件监听器是否正确移除"
    },
    {
      "object": "HTMLElement",
      "count": 1234,
      "growth": "+800",
      "retainedSize": "12.1 MB",
      "suggestion": "检查 DOM 引用是否被清理"
    }
  ]
}
```

### 案例 3：网络请求监控

**场景**：监控 API 请求性能

**任务描述**：
```
打开 https://api.example.com，
监控所有 API 请求，
找出响应时间超过 1 秒的请求
```

**AI 执行**：

```javascript
// 1. 导航
navigate_page("https://api.example.com")

// 2. 获取所有请求
list_network_requests({
  pageId: "current"
})

// 3. 筛选慢请求
// AI 自动过滤并分析
```

**返回结果**：
```json
{
  "totalRequests": 23,
  "slowRequests": [
    {
      "url": "https://api.example.com/v1/products",
      "method": "GET",
      "duration": 2345,
      "size": "1.2 MB",
      "suggestion": "考虑实现分页或数据压缩"
    },
    {
      "url": "https://api.example.com/v1/analytics",
      "method": "POST",
      "duration": 1823,
      "size": "45 KB",
      "suggestion": "考虑批量发送或异步处理"
    }
  ]
}
```

### 案例 4：自动化 E2E 测试

**场景**：测试用户注册流程

**任务描述**：
```
测试注册流程：
1. 打开 /register
2. 填写表单（用户名、邮箱、密码）
3. 点击注册
4. 验证跳转到 /dashboard
5. 截图保存
```

**AI 执行**：

```javascript
// 1. 导航到注册页
navigate_page("https://app.example.com/register")

// 2. 填写表单
fill_form({
  pageId: "current",
  fields: [
    {"selector": "#username", "value": "testuser"},
    {"selector": "#email", "value": "test@example.com"},
    {"selector": "#password", "value": "SecurePass123!"}
  ]
})

// 3. 点击注册
click({
  pageId: "current",
  element: "#register-btn",
  waitForNavigation: true
})

// 4. 验证跳转
evaluate_script({
  pageId: "current",
  script: "window.location.href"
})

// 5. 截图
take_screenshot({
  pageId: "current",
  path: "/path/to/dashboard.png"
})
```

### 案例 5：Lighthouse 性能审计

**场景**：综合性能评估

**任务描述**：
```
对 https://example.com 运行 Lighthouse 审计，
评估性能、可访问性、最佳实践、SEO
```

**AI 执行**：

```javascript
lighthouse_audit({
  pageId: "current",
  categories: [
    "performance",
    "accessibility",
    "best-practices",
    "seo"
  ]
})
```

**返回结果**：
```json
{
  "performance": 78,
  "accessibility": 92,
  "best-practices": 85,
  "seo": 88,
  "opportunities": [
    {
      "category": "performance",
      "title": "启用文本压缩",
      "description": "启用文本压缩可节省 245 KB",
      "impact": "high"
    },
    {
      "category": "accessibility",
      "title": "改进链接可读性",
      "description": "部分链接缺少描述性文本",
      "impact": "medium"
    }
  ]
}
```

## 高级配置

### 自定义浏览器启动参数

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": [
        "-y",
        "chrome-devtools-mcp@latest",
        "--",
        "--disable-blink-features=AutomationControlled",
        "--no-sandbox",
        "--disable-setuid-sandbox"
      ]
    }
  }
}
```

### 配置代理

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": [
        "-y",
        "chrome-devtools-mcp@latest",
        "--proxy-server=http://proxy.example.com:8080"
      ]
    }
  }
}
```

### 设置下载目录

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": [
        "-y",
        "chrome-devtools-mcp@latest",
        "--download-path=/path/to/downloads"
      ]
    }
  }
}
```

## 与其他工具对比

### vs Playwright MCP

| 特性 | chrome-devtools-mcp | Playwright MCP |
|------|---------------------|----------------|
| **性能分析** | ✅ 专业级 | ⚠️ 基础 |
| **内存快照** | ✅ 支持 | ❌ 无 |
| **Lighthouse** | ✅ 集成 | ❌ 无 |
| **扩展管理** | ✅ 支持 | ❌ 无 |
| **多浏览器** | ⚠️ 仅 Chrome | ✅ 全支持 |
| **跨平台** | ⚠️ Chrome 依赖 | ✅ 真正跨平台 |
| **调试深度** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

**选择建议**：
- **Chrome DevTools MCP**：性能分析、内存调试、Chrome 深度集成
- **Playwright MCP**：跨浏览器测试、标准自动化

### vs playwright-cli

| 特性 | chrome-devtools-mcp | playwright-cli |
|------|---------------------|----------------|
| **交互方式** | AI 自然语言 | 命令行 |
| **性能分析** | ✅ 专业级 | ❌ 无 |
| **内存分析** | ✅ 支持 | ❌ 无 |
| **学习曲线** | ⭐⭐⭐ | ⭐⭐ |
| **调试能力** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| **自动化** | ⭐⭐⭐⭐⭐ | ⭐⭐ |

**选择建议**：
- **Chrome DevTools MCP**：AI 自动化、性能分析、生产环境
- **playwright-cli**：手动调试、学习探索、快速验证

## 最佳实践

### 1. 性能优化工作流

```
开发阶段：
  ├─ playwright-cli 快速验证
  ├─ 修复明显问题
  │
测试阶段：
  ├─ chrome-devtools-mcp 性能追踪
  ├─ Lighthouse 审计
  ├─ 识别瓶颈
  │
优化阶段：
  ├─ 实施优化
  ├─ 对比前后性能
  └─ 验证改进效果
```

### 2. 内存泄漏检测流程

```
1. 基线快照
   ├─ 打开应用
   ├─ 执行 GC
   └─ take_memory_snapshot

2. 压力测试
   ├─ 重复操作（切换页面、滚动、点击）
   └─ 记录次数

3. 对比快照
   ├─ 执行 GC
   └─ take_memory_snapshot

4. 分析差异
   ├─ get_memory_snapshot_details
   ├─ 识别泄漏对象
   └─ 定位根因
```

### 3. 网络监控最佳实践

```
1. 基线监控
   ├─ list_network_requests
   └─ 记录正常请求模式

2. 异常检测
   ├─ 监控失败的请求
   ├─ 识别慢请求（>1s）
   └─ 检查大文件传输

3. 优化建议
   ├─ 启用压缩
   ├─ 实现缓存
   └─ CDN 加速
```

### 4. 自动化测试建议

```
✅ DO：
- 使用 describe 块组织测试
- 提供清晰的测试步骤
- 验证关键指标
- 保存截图作为证据

❌ DON'T：
- 硬编码选择器
- 忽略错误处理
- 测试过多功能
- 依赖隐式等待
```

### 5. AI 提示词优化

**好的提示词**：
```
打开 https://example.com，
等待加载完成后，
点击 #login-btn，
填写表单（用户名：test，密码：pass123），
点击登录，
验证跳转到 /dashboard，
截图保存
```

**不好的提示词**：
```
登录网站
```

## 故障排除

### 问题 1：MCP 服务器无法启动

**症状**：
```
Error: Cannot connect to MCP server
```

**解决方案**：
```bash
# 1. 检查 Node.js 版本
node --version  # 应该 ≥ v20.19

# 2. 清理 npm 缓存
npm cache clean --force

# 3. 重新安装
npx -y chrome-devtools-mcp@latest
```

### 问题 2：浏览器无法启动

**症状**：
```
Error: Failed to launch browser
```

**解决方案**：
```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": [
        "-y",
        "chrome-devtools-mcp@latest",
        "--no-sandbox",
        "--disable-setuid-sandbox"
      ]
    }
  }
}
```

### 问题 3：性能追踪无数据

**症状**：
```
performance_analyze_insight 返回空结果
```

**解决方案**：
```javascript
// 确保等待时间足够
performance_start_trace()
wait_for("networkidle", { timeout: 30000 })
performance_stop_trace()
// 现在分析
performance_analyze_insight()
```

### 问题 4：内存快照文件过大

**症状**：
```
Memory snapshot file is too large (500MB+)
```

**解决方案**：
```javascript
// 1. 执行垃圾回收
evaluate_script("window.gc()")

// 2. 清理不必要的引用
// 3. 使用快照对比而非全量分析
```

### 问题 5：网络请求不完整

**症状**：
```
list_network_requests 只显示部分请求
```

**解决方案**：
```javascript
// 确保等待网络空闲
wait_for("networkidle", { timeout: 30000 })
// 现在列出请求
list_network_requests()
```

## 总结

### 核心优势

1. **AI 原生**：自然语言交互，自动任务规划
2. **专业级调试**：性能分析、内存快照、网络监控
3. **Chrome 集成**：完整 DevTools 能力
4. **42 个工具**：覆盖所有浏览器自动化场景

### 适用场景

| 场景 | 推荐工具 |
|------|---------|
| **性能分析** | chrome-devtools-mcp ⭐⭐⭐⭐⭐ |
| **内存调试** | chrome-devtools-mcp ⭐⭐⭐⭐⭐ |
| **AI 自动化** | chrome-devtools-mcp ⭐⭐⭐⭐⭐ |
| **跨浏览器测试** | Playwright MCP ⭐⭐⭐⭐⭐ |
| **手动调试** | playwright-cli ⭐⭐⭐⭐⭐ |

### 学习路径

```
第 1 周：基础工具
  ├─ 导航、点击、填表
  ├─ 截图、快照
  └─ 简单自动化

第 2 周：调试工具
  ├─ 控制台日志
  ├─ 网络监控
  └─ JavaScript 执行

第 3 周：性能分析
  ├─ 性能追踪
  ├─ Lighthouse 审计
  └─ 瓶颈识别

第 4 周：高级功能
  ├─ 内存快照
  ├─ 内存泄漏检测
  └─ 扩展管理
```

### 相关资源

- [GitHub 仓库](https://github.com/ChromeDevTools/chrome-devtools-mcp)
- [工具参考文档](https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/tool-reference.md)
- [CLI 文档](https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/cli.md)
- [故障排除指南](https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/troubleshooting.md)
- [Slim 工具参考](https://github.com/ChromeDevTools/chrome-devtools-mcp/blob/main/docs/slim-tool-reference.md)

---

**文档版本**：v1.0
**最后更新**：2026-05-05
**维护者**：Claude Code Best Practice 项目
**反馈**：如发现问题或有改进建议，请提交 Issue 或 Pull Request
