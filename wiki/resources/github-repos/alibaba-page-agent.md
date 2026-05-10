---
name: alibaba-page-agent
description: Page Agent — 阿里开源的网页 GUI Agent，用自然语言控制网页界面
type: source
tags: [github, typescript, gui-agent, browser-automation, web-automation, ai-agent, natural-language]
created: 2026-05-06
updated: 2026-05-06
source: ../../../archive/resources/github/alibaba-page-agent-2026-05-05.json
language: TypeScript
license: MIT
github_url: https://github.com/alibaba/page-agent
---

# Page Agent

> [!info] Repository Overview
> **Page Agent** 是阿里巴巴开源的网页 GUI Agent，让用户可以用自然语言控制网页界面。它是一个客户端网页增强工具，不需要浏览器扩展、Python 或无头浏览器，只需要在网页中嵌入 JavaScript 即可工作。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | Active（阿里开源） |
| 🍴 Forks | 活跃社区 |
| 💻 语言 | TypeScript |
| 📄 许可证 | MIT |
| 🔗 链接 | [github.com/alibaba/page-agent](https://github.com/alibaba/page-agent) |
| 🌐 主页 | [alibaba.github.io/page-agent](https://alibaba.github.io/page-agent) |
| 📅 类型 | 前端框架/AI Agent |

## 🎯 核心特性

### 四大特点

| 特性 | 说明 |
|------|------|
| **🎯 简易集成** | 无需浏览器扩展 / Python / 无头浏览器，只需在页面中嵌入 JavaScript |
| **📖 文本化 DOM 操作** | 不依赖截图，不需要多模态 LLM，基于文本理解页面结构 |
| **🧠 Bring Your Own LLM** | 支持自定义语言模型（Qwen、通义千问等） |
| **🐙 Chrome 扩展** | 可选扩展支持多页面任务和 MCP Server（Beta） |

## 💡 使用场景

### 五大应用场景

| 场景 | 说明 |
|------|------|
| **SaaS AI Copilot** | 在产品中嵌入 AI 助手，无需后端改造 |
| **智能表单填写** | 将 20 次点击的工作流转化为一句话指令 |
| **无障碍访问** | 通过自然语言让任何网页都可访问，支持语音命令 |
| **多页面 Agent** | 使用 Chrome 扩展让 Agent 跨浏览器标签页工作 |
| **MCP 集成** | 让外部 Agent 客户端控制你的浏览器 |

## 🚀 快速开始

### 方式一：CDN 一行代码（最快）

```html
<!-- 全局 CDN -->
<script src="https://cdn.jsdelivr.net/npm/page-agent@1.8.1/dist/iife/page-agent.demo.js" crossorigin="true"></script>

<!-- 中国镜像 -->
<script src="https://registry.npmmirror.com/page-agent/1.8.1/files/dist/iife/page-agent.demo.js" crossorigin="true"></script>
```

> ⚠️ CDN 演示版使用免费的测试 LLM API，仅供技术评估使用。

### 方式二：NPM 安装

```bash
npm install page-agent
```

```javascript
import { PageAgent } from 'page-agent'

const agent = new PageAgent({
    model: 'qwen3.5-plus',
    baseURL: 'https://dashscope.aliyuncs.com/compatible-mode/v1',
    apiKey: 'YOUR_API_KEY',
    language: 'en-US',
})

await agent.execute('Click the login button')
```

## 📖 架构设计

### 核心原理

```
┌─────────────────────────────────────────────────────────┐
│                    Page Agent 架构                       │
├─────────────────────────────────────────────────────────┤
│                                                          │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────┐  │
│  │   Web Page   │───▶│  DOM Parser │───▶│  LLM API │  │
│  └──────────────┘    └──────────────┘    └──────────┘  │
│         │                   │                   │        │
│         ▼                   ▼                   ▼        │
│  ┌──────────────────────────────────────────────────┐  │
│  │              Natural Language Command              │  │
│  │         "Click the login button"                 │  │
│  └──────────────────────────────────────────────────┘  │
│                           │                             │
│                           ▼                             │
│  ┌──────────────────────────────────────────────────┐  │
│  │              Action Executor                      │  │
│  │    DOM Query → Element Click → State Check      │  │
│  └──────────────────────────────────────────────────┘  │
│                           │                             │
│                           ▼                             │
│                    Web Page Update                      │
│                                                          │
└─────────────────────────────────────────────────────────┘
```

### 与 Browser-Use 的关系

Page Agent 借鉴了 [browser-use](https://github.com/browser-use/browser-use) 的 DOM 处理组件和提示词设计，但专注于**客户端网页增强**而非服务端自动化。

## 🔧 技术对比

### Page Agent vs Browser-Use

| 维度 | Page Agent | Browser-Use |
|------|------------|-------------|
| **运行位置** | 客户端（网页内） | 服务端（本地/远程） |
| **依赖** | 仅 JavaScript | Python + 浏览器 |
| **部署复杂度** | ⭐ 极简 | ⭐⭐⭐ 复杂 |
| **交互方式** | 自然语言 | 自然语言 |
| **截图需求** | ❌ 不需要 | ✅ 需要 |
| **多模态 LLM** | ❌ 不需要 | ✅ 需要 |
| **适用场景** | 网页内嵌 AI | 自动化测试、数据采集 |

### Page Agent vs Playwright CLI

| 维度 | Page Agent | Playwright CLI |
|------|------------|----------------|
| **交互方式** | 自然语言描述 | 命令行指令 |
| **LLM 集成** | ✅ 内置 | ❌ 需自行集成 |
| **适用用户** | 非技术用户 | 开发者 |
| **复杂度** | 低 | 中 |

## 🛠️ 进阶功能

### Chrome 扩展（多页面任务）

安装 Chrome 扩展后，可以：
- 跨多个浏览器标签页执行任务
- 保持会话状态
- 与外部 Agent 通过 MCP 协议通信

### MCP Server（Beta）

```javascript
// 配置 MCP Server
const agent = new PageAgent({
    // ... 基础配置
    mcpServer: {
        enabled: true,
        port: 3000
    }
})
```

### 支持的模型

| 模型 | 说明 |
|------|------|
| **Qwen3.5-plus** | 通义千问（推荐） |
| **Claude** | Anthropic Claude 系列 |
| **GPT-4** | OpenAI GPT-4 系列 |
| **自定义** | 支持任何兼容 OpenAI API 的模型 |

## 🎨 应用示例

### 场景 1：智能表单填写

```javascript
await agent.execute(`
    Fill the registration form:
    - Username: john_doe
    - Email: john@example.com
    - Password: SecurePass123!
    Then click the Submit button
`)
```

### 场景 2：无障碍访问

```javascript
await agent.execute(`
    Read the main content of this page aloud
    Find and click the "Contact Us" link
`)
```

### 场景 3：自动化工作流

```javascript
await agent.execute(`
    1. Log in with username "admin" and password "secret"
    2. Navigate to the Dashboard
    3. Download the monthly report
    4. Send it to admin@company.com
`)
```

## 📚 相关资源

| 资源 | 链接 |
|------|------|
| **官方文档** | [alibaba.github.io/page-agent/docs](https://alibaba.github.io/page-agent/docs/introduction/overview) |
| **在线演示** | [alibaba.github.io/page-agent](https://alibaba.github.io/page-agent) |
| **HN 讨论** | [Hacker News](https://news.ycombinator.com/item?id=47264138) |
| **Chrome 扩展** | [文档](https://alibaba.github.io/page-agent/docs/features/chrome-extension) |
| **MCP Server** | [文档](https://alibaba.github.io/page-agent/docs/features/mcp-server) |
| **模型配置** | [文档](https://alibaba.github.io/page-agent/docs/features/models) |

## 🤝 贡献指南

欢迎社区贡献！请参阅：
- [CONTRIBUTING.md](https://github.com/alibaba/page-agent/blob/main/CONTRIBUTING.md)
- [开发者指南](https://github.com/alibaba/page-agent/blob/main/docs/developer-guide.md)

> ⚠️ 不接受完全由 Bot 或 AI 生成无实质性人类参与的贡献。

## 🔮 核心价值

Page Agent 的核心价值在于：

1. **极简集成** — 一行代码即可在任何网页中加入 AI 能力
2. **无需截图** — 基于文本的 DOM 操作，不依赖多模态 LLM
3. **客户端运行** — 不需要服务端基础设施
4. **自然语言交互** — 用自然语言描述操作，而非编写代码
5. **阿里开源** — 背靠阿里巴巴技术团队，持续维护

## 🚀 快速上手建议

### 新手推荐

1. **体验 Demo** — 访问 [alibaba.github.io/page-agent](https://alibaba.github.io/page-agent)
2. **CDN 试用** — 复制一行代码到你的网页
3. **阅读文档** — 官方文档的快速开始指南
4. **尝试示例** — 从简单的点击操作开始

### 进阶用户

1. **NPM 集成** — 在项目中使用完整功能
2. **自定义模型** — 配置你喜欢的 LLM
3. **Chrome 扩展** — 启用多页面任务
4. **MCP 集成** — 与外部 Agent 系统集成
5. **贡献代码** — 提交 PR 参与开源

## 🌟 总结

Page Agent 是一个**革命性的网页 AI 增强工具**，具有以下特点：

1. **极简集成** — 一行代码，无需后端改造
2. **文本优先** — 不需要截图，不需要多模态 LLM
3. **客户端运行** — 纯前端实现，部署简单
4. **自然语言** — 用说话的方式操作网页
5. **多场景支持** — Copilot、表单、无障碍、MCP
6. **开源免费** — MIT 许可证，商业友好
7. **阿里背书** — 阿里巴巴开源，持续维护

**特别适合**：
- 在产品中嵌入 AI 助手的开发者
- 需要自动化网页表单的企业用户
- 希望让网页更易访问的产品经理
- 构建 AI Agent 系统的架构师

这是一个**改变游戏规则的工具**，让网页智能化变得前所未有的简单！🚀

---

*最后更新: 2026-05-06*
*数据来源: GitHub README + 官方文档*
*用自然语言控制网页界面*
