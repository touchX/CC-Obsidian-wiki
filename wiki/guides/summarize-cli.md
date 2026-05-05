---
name: summarize-cli
description: summarize.sh CLI tool guide - supports URL/YouTube/PDF/file summarization and transcription
type: guide
tags: [cli, summarize, youtube, productivity]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/plugins/summarize-使用指南.md
---

# summarize.sh CLI 工具使用指南

> **目标**：快速总结 URL、视频、播客、文章和本地文件
> **核心工具**：summarize.sh CLI 工具
> **官方主页**：https://summarize.sh
> **阅读时间**：完整阅读约 10 分钟

---

## 核心功能

**summarize** 是一个快速的 CLI 工具，可以总结和转录多种内容类型：

| 内容类型 | 支持情况 | 说明 |
|---------|---------|------|
| **URL/网页** | ✅ | 使用 Firecrawl 提取内容 |
| **YouTube 视频** | ✅ | 最佳努力转录 |
| **播客** | ✅ | 音频转录 |
| **文章** | ✅ | 直接提取文本 |
| **PDF 文档** | ✅ | 本地文件处理 |
| **本地文件** | ✅ | 支持多种文本格式 |

---

## 安装配置

### 前置要求

**必须安装 summarize CLI 工具**：

```bash
# macOS (Homebrew)
brew install steipete/tap/summarize

# 验证安装
summarize --version
```

### API 密钥配置

根据你选择的模型提供商设置相应的 API 密钥：

| 提供商 | 环境变量 | 获取地址 |
|--------|---------|---------|
| **OpenAI** | `OPENAI_API_KEY` | https://platform.openai.com/api-keys |
| **Anthropic** | `ANTHROPIC_API_KEY` | https://console.anthropic.com/settings/keys |
| **xAI** | `XAI_API_KEY` | https://console.x.ai/ |
| **Google** | `GEMINI_API_KEY` | https://aistudio.google.com/app/apikey |

**可选服务**：

| 服务 | 环境变量 | 用途 |
|------|---------|------|
| **Firecrawl** | `FIRECRAWL_API_KEY` | 提取被阻止的站点 |
| **Apify** | `APIFY_API_TOKEN` | YouTube 转录回退 |

---

## 基础用法

### 快速开始

```bash
# 总结 URL
summarize "https://example.com" --model google/gemini-3-flash-preview

# 总结本地 PDF
summarize "/path/to/file.pdf" --model google/gemini-3-flash-preview

# 总结 YouTube 视频
summarize "https://youtu.be/dQw4w9WgXcQ" --youtube auto
```

### 长度控制

使用 `--length` 标志控制摘要长度：

| 标志 | 说明 |
|------|------|
| `short` | 简短摘要（1-2 句话） |
| `medium` | 中等摘要（默认） |
| `long` | 详细摘要 |
| `xl` | 超长摘要 |
| `xxl` | 极长摘要 |
| `<chars>` | 自定义字符数，如 `--length 500` |

**示例**：
```bash
summarize "https://example.com" --length short
summarize "https://example.com" --length 1000  # 1000 字符
```

---

## 高级用法

### YouTube：摘要 vs 转录

**最佳努力转录**（仅 URL）：

```bash
summarize "https://youtu.be/dQw4w9WgXcQ" --youtube auto --extract-only
```

**处理长转录**：

如果用户要求转录但内容巨大：
1. 先返回紧凑摘要
2. 问用户想扩展哪个部分/时间范围
3. 根据用户反馈提供详细内容

### JSON 输出

使用 `--json` 标志获得机器可读输出：

```bash
summarize "https://example.com" --json
```

**输出格式**：
```json
{
  "summary": "...",
  "source": "https://example.com",
  "model": "google/gemini-3-flash-preview",
  "tokens": 1234
}
```

### Firecrawl 集成

对于被阻止或需要 JavaScript 的站点：

```bash
--firecrawl auto|off|always
```

| 选项 | 说明 |
|------|------|
| `auto` | 自动检测是否需要（默认） |
| `off` | 禁用 Firecrawl |
| `always` | 始终使用 Firecrawl |

**前提**：需要设置 `FIRECRAWL_API_KEY`

---

## 命令速查表

### 基础命令

| 任务 | 命令 |
|------|------|
| 总结 URL | `summarize "URL" --model MODEL` |
| 总结文件 | `summarize "/path/to/file" --model MODEL` |
| 总结 YouTube | `summarize "URL" --youtube auto` |
| 提取字幕 | `summarize "URL" --youtube auto --extract-only` |
| 简短摘要 | `summarize "URL" --length short` |
| JSON 输出 | `summarize "URL" --json` |

### 模型选择

| 提供商 | 模型 ID | 环境变量 |
|--------|---------|---------|
| OpenAI | `openai/gpt-4` | `OPENAI_API_KEY` |
| Anthropic | `anthropic/claude-3-opus` | `ANTHROPIC_API_KEY` |
| xAI | `xai/grok-beta` | `XAI_API_KEY` |
| Google | `google/gemini-3-flash-preview` | `GEMINI_API_KEY` |

---

## 故障排除

### 问题 1：命令未找到

**症状**：`bash: summarize: command not found`

**解决**：
```bash
# macOS
brew install steipete/tap/summarize

# 验证
which summarize
```

### 问题 2：API 密钥错误

**症状**：`Error: API key not found`

**解决**：
```bash
# 检查环境变量
echo $OPENAI_API_KEY
echo $ANTHROPIC_API_KEY
echo $GEMINI_API_KEY

# 重新设置
export OPENAI_API_KEY="your-key"
```

### 问题 3：YouTube 转录失败

**症状**：`Error: Could not extract transcript`

**解决**：
```bash
# 设置 Apify token
export APIFY_API_TOKEN="your-token"

# 重试
summarize "https://youtu.be/xxx" --youtube auto
```

---

## 最佳实践

### 1. 根据内容类型选择长度

| 内容类型 | 推荐长度 |
|---------|---------|
| 新闻文章 | `short` 或 `medium` |
| 技术文档 | `long` 或 `xl` |
| 研究论文 | `long` 或自定义 |
| YouTube 视频 | `medium`（先摘要，后决定） |

### 2. 验证摘要质量

对于重要内容：
1. 先用 `short` 快速浏览
2. 如需更多信息，用 `long` 详细总结
3. 对于 YouTube，考虑是否需要完整转录

### 3. 处理多部分内容

对于长视频/文档：
```bash
# 先获取摘要
summarize "URL" --length medium

# 然后询问用户想深入了解的部分
```

---

*来源：summarize.sh CLI 工具官方文档*
*完整文档：参见 [[../../../archive/plugins/summarize-使用指南.md]]*
