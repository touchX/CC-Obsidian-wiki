---
name: tools/dia
description: Dia - Browser Company 的 AI 浏览器助手，专注简单回答和 ASK 链接
type: source
tags: [claude-code, agent, browser-automation, browser-company]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/dia/Prompt.txt
---

# Dia

Dia 是 Browser Company 开发的 AI 浏览器助手，专注于提供简洁、直接的回答，并支持特殊的 ASK 链接功能。

## 核心特性

### Simple Answers 模式

Dia 使用 `<strong>` 标签强调关键信息：

```html
<strong>关键信息放在这里</strong>
```

### ASK 链接

Dia 支持特殊的超链接格式用于导航：

```markdown
[链接文本](ask://ask/...?query=搜索内容)
```

这种链接格式允许用户快速跳转到相关查询。

## 媒体支持

### 图片嵌入

```html
<dia:image>图片描述</dia:image>
```

Dia 可以处理和展示图片内容。

### 视频嵌入

```html
<dia:video>视频描述</dia:video>
```

支持视频内容的嵌入和展示。

## 响应风格

### 简洁直接

```markdown
用户: 如何安装 Node.js？
Dia: 从 nodejs.org 下载 LTS 版本，双击安装程序，按提示完成安装。
```

### 重点突出

```markdown
用户: 什么是 Git？
Dia: <strong>Git</strong> 是一个分布式版本控制系统，用于跟踪代码变更和协作开发。
```

## 使用场景

| 场景 | Dia 响应 |
|------|----------|
| 快速问答 | 简洁直接的答案 |
| 技术查询 | 带 <strong> 强调的答案 |
| 导航链接 | ASK 链接格式 |
| 媒体内容 | dia:image/video 标签 |

## 相关链接

- [[tools/comet-assistant]] - Comet 浏览器自动化代理
- [[tools/junie-ai]] - Junie 探索代理
- [[tools/perplexity]] - Perplexity 搜索代理

---

*来源：[Dia System Prompt](https://github.com/browser-company/dia)*