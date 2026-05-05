# summarize Skill 使用指南

> **目标**：快速总结 URL、视频、播客、文章和本地文件
> **核心工具**：summarize.sh CLI 工具
> **官方主页**：https://summarize.sh
> **阅读时间**：完整阅读约 10 分钟

---

# 第一部分：理解概念

## 什么是 summarize Skill？

### 核心功能

**summarize** 是一个快速的 CLI 工具，可以总结和转录多种内容类型：

| 内容类型 | 支持情况 | 说明 |
|---------|---------|------|
| **URL/网页** | ✅ | 使用 Firecrawl 提取内容（如需要） |
| **YouTube 视频** | ✅ | 最佳努力转录（无需 yt-dlp） |
| **播客** | ✅ | 音频转录 |
| **文章** | ✅ | 直接提取文本 |
| **PDF 文档** | ✅ | 本地文件处理 |
| **本地文件** | ✅ | 支持多种文本格式 |

### 工作原理

```
┌─────────────────────────────────────────────────────────────┐
│                    summarize 工作流程                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  用户输入                                                     │
│    │                                                        │
│    ├── URL → Firecrawl 提取 → LLM 总结                     │
│    ├── YouTube → Apify 转录 → LLM 总结                    │
│    ├── 文件 → 直接读取 → LLM 总结                          │
│    └── 播客 → 转录 → LLM 总结                              │
│                                                             │
│  输出：结构化摘要（可定制长度）                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 核心优势

| 优势 | 说明 |
|------|------|
| **快速** | 专为速度优化的 CLI 工具 |
| **多源支持** | 一个命令处理 URL、视频、文件 |
| **可定制** | 支持多种长度和输出格式 |
| **模型灵活** | 支持 OpenAI、Anthropic、xAI、Google |
| **智能提取** | 自动处理被阻止的站点（Firecrawl） |

---

## 何时使用

### 触发短语

当用户说以下任何内容时，立即使用此 skill：

```
- "use summarize.sh"
- "这个链接/视频是关于什么的？"
- "总结这个 URL/文章"
- "转录这个 YouTube/视频"
- "summarize this"
- "what's this about"
```

### 典型场景

#### 场景 1：快速了解文章内容
```
用户："这篇文章讲了什么？https://example.com/long-article"
```

**行动**：
```bash
summarize "https://example.com/long-article" --model google/gemini-3-flash-preview
```

#### 场景 2：YouTube 视频摘要
```
用户："这个视频值得看吗？https://youtu.be/xxx"
```

**行动**：
```bash
summarize "https://youtu.be/xxx" --youtube auto
```

#### 场景 3：PDF 文档总结
```
用户："总结一下这份报告 /path/to/report.pdf"
```

**行动**：
```bash
summarize "/path/to/report.pdf" --model google/gemini-3-flash-preview
```

#### 场景 4：提取视频字幕
```
用户："我需要这个视频的完整字幕 https://youtu.be/xxx"
```

**行动**：
```bash
summarize "https://youtu.be/xxx" --youtube auto --extract-only
```

如果字幕太长，先返回紧凑摘要，然后问用户想扩展哪个部分/时间范围。

---

# 第二部分：实践指南

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

### 配置文件

可选：创建 `~/.summarize/config.json`：

```json
{
  "model": "google/gemini-3-flash-preview"
}
```

**默认模型**：如果未设置，使用 `google/gemini-3-flash-preview`

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

### Token 控制

```bash
--max-output-tokens <count>
```

**示例**：
```bash
summarize "https://example.com" --max-output-tokens 500
```

---

## 高级用法

### YouTube：摘要 vs 转录

**最佳努力转录**（仅 URL）：

```bash
summarize "https://youtu.be/dQw4w9WgXcQ" --youtube auto --extract-only
```

**工作流程**：

```
YouTube URL
    │
    ├─ Apify 提取字幕（如 APIFY_API_TOKEN 设置）
    │
    └─ 返回完整转录文本
```

**处理长转录**：

如果用户要求转录但内容巨大：
1. 先返回紧凑摘要
2. 问用户想扩展哪个部分/时间范围
3. 根据用户反馈提供详细内容

**示例对话**：
```
用户："转录这个视频 https://youtu.be/xxx"

AI："这个视频是关于 [主题] 的。由于转录很长（5000+ 字），
      这里是摘要：

      [紧凑摘要]

      你想了解哪个部分的详细内容？可以告诉我：
      - 时间范围（如 10:00-15:00）
      - 特定主题
      - 或者直接说'全部'"
```

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

**示例**：
```bash
summarize "https://blocked-site.com" --firecrawl always
```

**前提**：需要设置 `FIRECRAWL_API_KEY`

### YouTube 回退

当主要方法失败时使用 Apify：

```bash
--youtube auto
```

**前提**：需要设置 `APIFY_API_TOKEN`

---

## 常见工作流

### 工作流 1：快速浏览新闻

```bash
# 总结多篇文章
summarize "https://news.example.com/article1" --length short
summarize "https://news.example.com/article2" --length short
summarize "https://news.example.com/article3" --length short
```

### 工作流 2：研究视频内容

```bash
# 先获取摘要
summarize "https://youtu.be/xxx" --youtube auto

# 决定是否需要完整转录
summarize "https://youtu.be/xxx" --youtube auto --extract-only
```

### 工作流 3：文档快速审查

```bash
# 总结多个 PDF
for file in *.pdf; do
  echo "=== $file ==="
  summarize "$file" --length medium
done
```

### 工作流 4：批量 URL 处理

```bash
# 从文件读取 URL 并总结
while read url; do
  summarize "$url" --length short
done < urls.txt
```

---

# 第三部分：快速参考

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

## 标志速查

| 标志 | 说明 | 示例 |
|------|------|------|
| `--length` | 摘要长度 | `--length short`, `--length 500` |
| `--max-output-tokens` | 最大输出 tokens | `--max-output-tokens 1000` |
| `--extract-only` | 仅提取（URL） | `--extract-only` |
| `--json` | JSON 输出 | `--json` |
| `--firecrawl` | Firecrawl 模式 | `--firecrawl auto` |
| `--youtube` | YouTube 模式 | `--youtube auto` |
| `--model` | 模型选择 | `--model openai/gpt-4` |

---

## 环境变量速查

### 必需（至少一个）

```bash
export OPENAI_API_KEY="sk-..."
export ANTHROPIC_API_KEY="sk-ant-..."
export XAI_API_KEY="xai-..."
export GEMINI_API_KEY="..."
```

### 可选

```bash
export FIRECRAWL_API_KEY="fc-..."       # 被阻止站点
export APIFY_API_TOKEN="..."            # YouTube 回退
```

---

## 配置文件示例

### 基础配置

`~/.summarize/config.json`：
```json
{
  "model": "google/gemini-3-flash-preview",
  "length": "medium"
}
```

### 完整配置

```json
{
  "model": "anthropic/claude-3-opus",
  "length": "long",
  "firecrawl": "auto",
  "maxOutputTokens": 2000
}
```

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

### 问题 4：被阻止站点

**症状**：`Error: Could not extract content`

**解决**：
```bash
# 设置 Firecrawl key
export FIRECRAWL_API_KEY="your-key"

# 使用 Firecrawl
summarize "https://blocked-site.com" --firecrawl always
```

### 问题 5：摘要太长/太短

**解决**：
```bash
# 调整长度
summarize "URL" --length short   # 更短
summarize "URL" --length long    # 更长
summarize "URL" --length 1000    # 自定义字符数
```

---

## 使用技巧

### 技巧 1：批量处理

创建一个脚本处理多个 URL：

```bash
#!/bin/bash
# batch-summarize.sh

while read url; do
  echo "=== $url ==="
  summarize "$url" --length short
  echo ""
done < urls.txt
```

### 技巧 2：管道集成

```bash
# 从剪贴板读取
pbpaste | summarize -

# 从其他命令输出
echo "https://example.com" | summarize -
```

### 技巧 3：别名设置

在 `.bashrc` 或 `.zshrc` 中添加：

```bash
alias sum-short='summarize --length short'
alias sum-long='summarize --length long'
alias sum-yt='summarize --youtube auto'
```

使用：
```bash
sum-short "https://example.com"
sum-yt "https://youtu.be/xxx"
```

### 技巧 4：模型切换

根据任务复杂度选择模型：

```bash
# 简单任务 - 快速模型
summarize "URL" --model google/gemini-3-flash-preview

# 复杂任务 - 强大模型
summarize "URL" --model anthropic/claude-3-opus
```

---

## 性能优化

### 速度优先

```bash
# 使用最快的模型
summarize "URL" --model google/gemini-3-flash-preview --length short
```

### 质量优先

```bash
# 使用最强大的模型
summarize "URL" --model anthropic/claude-3-opus --length long
```

### 成本优先

```bash
# 使用成本最低的模型
summarize "URL" --model google/gemini-3-flash-preview --max-output-tokens 500
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
# "你想了解哪个部分的详细信息？"
```

### 4. 保存结果

```bash
# 保存到文件
summarize "URL" > summary.txt

# 追加到文件
summarize "URL" >> summaries.txt
```

---

## 附录

### 相关资源

- **官方主页**：https://summarize.sh
- **GitHub 仓库**：https://github.com/steipete/summarize.sh
- **依赖工具**：
  - Firecrawl：https://www.firecrawl.dev/
  - Apify：https://apify.com/

### 模型对比

| 模型 | 速度 | 质量 | 成本 | 推荐场景 |
|------|------|------|------|---------|
| `gemini-3-flash-preview` | ⚡⚡⚡ | ⭐⭐⭐ | 💰 | 日常使用 |
| `gpt-4` | ⚡⚡ | ⭐⭐⭐⭐ | 💰💰 | 复杂内容 |
| `claude-3-opus` | ⚡⚡ | ⭐⭐⭐⭐⭐ | 💰💰💰 | 最高质量 |

### 支持的内容类型

| 类型 | 状态 | 备注 |
|------|------|------|
| HTML 网页 | ✅ | 支持 |
| Markdown 文件 | ✅ | 支持 |
| PDF 文档 | ✅ | 支持 |
| Word 文档 | ⚠️ | 部分支持 |
| YouTube 视频 | ✅ | 最佳努力 |
| Vimeo 视频 | ⚠️ | 需要手动转录 |
| 播客（音频） | ✅ | 需要转录服务 |

---

*文档生成日期：2026-05-05*
*基于 summarize skill v1.0*
*作者：Claude Code Superpowers Workflow*
