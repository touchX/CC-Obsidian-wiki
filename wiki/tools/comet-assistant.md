---
name: tools/comet-assistant
description: Comet - Perplexity 的浏览器自动化代理，专注网页操作和数据提取
type: source
tags: [claude-code, agent, browser-automation, web-scraping, perplexity]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/Comet Assistant/System Prompt.txt
---

# Comet Assistant

Comet 是 Perplexity 开发的浏览器自动化代理，专门用于网页操作、数据提取和自动化任务执行。

## 核心工具集

| 工具 | 功能 |
|------|------|
| navigate | 打开网页或导航 |
| computer | 截图和视觉理解 |
| read_page | 读取页面内容 |
| find | 定位页面元素 |
| form_input | 填写表单 |
| get_page_text | 获取页面文本 |
| search_web | 网络搜索 |
| tabs_create | 多标签页管理 |
| todo_write | 任务管理 |

## 浏览器控制

### 导航操作

```yaml
navigate:
  url: "https://example.com"
  wait_until: "networkidle"
  timeout: 30000
```

### 元素定位

```yaml
find:
  strategy: "css_selector"  # css | xpath | text | aria
  selector: ".login-form input[type='email']"
  timeout: 5000
```

### 表单填写

```yaml
form_input:
  fields:
    email: "user@example.com"
    password: "secret123"
  submit: true
  clear_first: true
```

## 视觉理解

### 截图分析

```yaml
computer:
  action: "screenshot"
  element: ".modal-dialog"  # 可选：特定元素
  
# 返回截图 base64 编码
```

### 状态识别

```markdown
Comet 可以识别：
✅ 按钮状态（启用/禁用）
✅ 加载指示器
✅ 错误消息
✅ 模态对话框
✅ 页面内容布局
```

## 数据提取

### 页面内容读取

```yaml
read_page:
  selector: "article.content"
  extract: "text"  # text | html | attributes
  filter:
    remove: [".ads", ".sidebar"]
```

### 文本提取

```yaml
get_page_text:
  start: "h1.title"  # 从哪个元素开始
  end: "footer"       # 到哪个元素结束
  exclude: [".comments", ".related"]
```

## 网络搜索

### 搜索操作

```yaml
search_web:
  query: "Claude Code best practices 2026"
  engine: "google"  # google | bing | duckduckgo
  num_results: 10
```

## 标签页管理

### 多标签页操作

```yaml
tabs_create:
  url: "https://tab2.example.com"
  position: 1  # 新标签位置

tabs_list:
  # 返回所有标签页信息

tabs_close:
  index: 2  # 关闭指定标签
```

## 任务管理

### Todo 跟踪

```yaml
todo_write:
  todos:
    - content: "登录 GitHub"
      status: "completed"
    - content: "导航到仓库页面"
      status: "in_progress"
    - content: "提取代码统计"
      status: "pending"
```

## 典型工作流

### 示例：自动化数据收集

```yaml
workflow:
  1. navigate:
      url: "https://github.com/trending"
      
  2. find:
      selector: "article.box-shadow"
      
  3. for_each:
      - read_page:
          selector: "h2 a"
          extract: "text"
      - read_page:
          selector: ".text-normal"
          extract: "text"
          
  4. search_web:
      query: "{提取的仓库名} stars"
```

## 安全考虑

### 操作限制

```yaml
restrictions:
  max_navigation: 20
  max_form_submits: 10
  blocked_domains: []
  allowed_actions: [navigate, read, search]
```

## 相关链接

- [[tools/perplexity]] - Perplexity 搜索代理
- [[tools/junie-ai]] - Junie 探索代理
- [[tools/leap-new]] - Leap.new 全栈代理

---

*来源：[Comet Assistant System Prompt](https://github.com/perplexity-ai/comet)*
