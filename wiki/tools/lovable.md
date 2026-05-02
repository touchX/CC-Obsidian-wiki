---
name: tools/lovable
description: Lovable - Claude Code 前端开发代理，专注于 React/Vite/Tailwind 和 SEO 优化
type: source
tags: [claude-code, agent, frontend, react, vite, tailwind, seo]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/Lovable/Agent Prompt.txt
---

# Lovable

Lovable 是 Claude Code 的前端开发代理，专注于 React + Vite + Tailwind 技术栈，并强调 SEO 优化和设计系统一致性。

## 技术栈

| 技术 | 说明 |
|------|------|
| React | UI 框架 |
| Vite | 构建工具 |
| Tailwind CSS | 样式框架 |
| shadcn-ui | 组件库 |

## SEO 要求

Lovable 代理在生成前端代码时必须遵循严格的 SEO 规范：

### 标题标签

```tsx
<title>页面标题 | 品牌名</title>
```

### Meta 描述

```tsx
<meta name="description" content="页面描述（150-160字符）" />
```

### 语义化 HTML

```tsx
<header>
  <nav aria-label="主导航">
    <a href="/">首页</a>
  </nav>
</header>
<main>
  <article>
    <h1>文章标题</h1>
    <section>
      <h2>章节标题</h2>
      <p>内容...</p>
    </section>
  </article>
</main>
<footer>
  <nav aria-label="页脚导航">...</nav>
</footer>
```

### JSON-LD 结构化数据

```tsx
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "WebPage",
  "name": "页面标题",
  "description": "页面描述"
}
</script>
```

## 设计系统

### 语义化 Token

使用语义化的设计变量，而非硬编码颜色值：

```css
/* 正确：使用语义化 token */
background-color: var(--color-primary);
color: var(--text-primary);
border-color: var(--border-default);

/* 错误：硬编码颜色 */
background-color: #3b82f6;
color: #1f2937;
```

### HSL 颜色格式

```css
--primary: 217.2 91.2% 59.8%;
--background: 0 0% 100%;
--foreground: 222.2 84% 4.9%;
```

### Variant 模式

组件应支持多种变体：

```tsx
<Button variant="primary" size="sm" />
<Button variant="secondary" size="md" />
<Button variant="outline" size="lg" />
<Button variant="ghost" />
```

## 后端限制

Lovable 主要专注于前端，后端仅支持：
- **Supabase** 集成

如需其他后端功能，应使用其他专门的代理。

## 组件规范

### 响应式设计

```tsx
<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
  {items.map(item => <Card key={item.id} {...item} />)}
</div>
```

### 可访问性

```tsx
<button
  aria-label="关闭对话框"
  aria-expanded={isOpen}
  onClick={handleClose}
>
  <Icon name="close" />
</button>
```

## 相关链接

- [[tools/leap-new]] - Leap.new 全栈代理
- [[tools/orchids-app]] - Orchids Next.js 代理
- [[tools/junie-ai]] - Junie 探索代理

---

*来源：[Lovable Agent System Prompt](https://github.com/Alishahryar1/free-claude-code)*