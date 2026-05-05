---
name: puppeteer-puppeteer
description: JavaScript API for Chrome and Firefox
type: source
tags: [github, typescript, testing, automation, browser]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/puppeteer-puppeteer-2026-05-05.json
stars: 94244
language: TypeScript
license: apache-2.0
github_url: https://github.com/puppeteer/puppeteer
---

# Puppeteer

> [!tip] Repository Overview
> ⭐ **94244 Stars** | 🔥 JavaScript API for Chrome and Firefox

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [puppeteer/puppeteer](https://github.com/puppeteer/puppeteer) |
| **Stars** | ⭐ 94244 |
| **语言** | TypeScript |
| **许可证** | Apache License 2.0 |
| **创建时间** | 2017-05-09 |
| **更新时间** | 2026-05-05 |
| **Forks** | 9414 |

## 核心特性

Puppeteer 是一个 JavaScript 库，提供了高级 API 来控制 Chrome 或 Firefox 浏览器：

- 🤖 **浏览器自动化** - 通过 DevTools Protocol 或 WebDriver BiDi 控制浏览器
- 🎭 **无头模式** - 默认运行在无头模式（无可见 UI）
- 🧪 **测试工具** - 用于 Web 应用的自动化测试
- 📸 **截图和 PDF** - 生成页面截图和 PDF 文件
- 🚀 **爬虫工具** - 爬取 SPA（单页应用）并生成预渲染内容
- 🔍 **性能分析** - 捕获网站的时间轴跟踪以诊断性能问题
- 🎯 **精准操作** - 支持键盘输入、表单填写、点击等用户交互

## 安装使用

```bash
npm i puppeteer  # 下载兼容的 Chrome 浏览器
npm i puppeteer-core  # 仅安装库，不下载浏览器
```

### 快速示例

```typescript
import puppeteer from 'puppeteer';

// 启动浏览器
const browser = await puppeteer.launch();
const page = await browser.newPage();

// 导航到 URL
await page.goto('https://example.com');

// 截图
await page.screenshot({path: 'example.png'});

// 关闭浏览器
await browser.close();
```

## 标签

headless-chrome, testing, web, developer-tools, node-module, automation, chrome, chromium, firefox

## 相关资源

- [官方文档](https://pptr.dev/docs)
- [API 参考](https://pptr.dev/api)
- [FAQ](https://pptr.dev/faq)
- [chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) - 基于 Puppeteer 的 MCP 服务器
