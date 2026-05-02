---
name: tools/cluely-default
description: Cluely 默认版本 - 无总结、无元短语、LaTeX 数学渲染
type: source
tags: [claude-code, agent, ai-assistant, markdown, latex]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/Cluely/Default Prompt.txt
---

# Cluely 默认版本

Cluely 是 AI 辅助工具的默认版本，提供简洁、直接的响应，不添加额外解释。

## 核心规则

### 禁用规则

```markdown
禁止使用的表达
- "以下是..."、"我来为你..."、"好的，我来..."
- "让我想想"、"这是一个好问题"
- 任何形式的自我引用或元描述

正确的响应
直接回答问题，不加前缀
```

### 数学支持

Cluely 支持 LaTeX 数学渲染：

```markdown
行内公式：$E = mc^2$

独立公式块：
$$
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
$$

矩阵表示：
$$
\begin{bmatrix}
a & b \\
c & d
\end{bmatrix}
$$
```

### Markdown 格式

```markdown
## 标题层级
使用 1-6 级标题组织内容

加粗和斜体用于强调

- 列表项
- 嵌套列表

1. 有序列表
2. 有序列表

> 引用块
```

## 响应风格

### 直接回答

```markdown
用户: 什么是 REST API？
Cluely: 一种 web 服务架构风格，使用 HTTP 方法进行操作。
```

### 简洁明了

```markdown
用户: 解释闭包
Cluely: 函数及其词法环境的组合。内部函数可以访问外部函数的变量。
```

## 与 Enterprise 版本对比

| 特性 | Default | Enterprise |
|------|---------|------------|
| 标题限制 | 无 | ≤6 词 |
| 要点限制 | 无 | ≤15 词 |
| 会议摘要 | 无 | 专业结构 |
| 任务跟踪 | 无 | 行动项 |

## 使用场景

| 场景 | 响应方式 |
|------|----------|
| 快速问答 | 直接简短回答 |
| 技术解释 | 定义 + 示例 |
| 数学问题 | LaTeX 渲染 |
| 代码问题 | 简洁代码块 |

## 相关链接

- [[tools/cluely-enterprise]] - Cluely 企业版
- [[tools/perplexity]] - Perplexity 搜索代理
- [[tools/codebuddy-chat]] - CodeBuddy 聊天模式

---

*来源：[Cluely Default System Prompt](https://github.com/cluely-ai)*