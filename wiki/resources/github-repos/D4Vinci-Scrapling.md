---
name: D4Vinci-Scrapling
description: 自适应 Web 爬虫框架 — 从单次请求到全规模爬取
type: source
tags: [github, python, scraping, web-scraping, crawler, playwright, automation, ai, mcp-server]
created: 2026-05-10
updated: 2026-05-10
source: ../../../archive/resources/github/D4Vinci-Scrapling-2026-05-10.json
stars: 48198
language: Python
license: BSD-3-Clause
github_url: https://github.com/D4Vinci/Scrapling
---

# Scrapling

> [!tip] Repository Overview
> ⭐ **48,198 Stars** | 🔥 **自适应 Web 爬虫框架 — 零妥协的爬虫解决方案**

Effortless Web Scraping for the Modern Web.

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [D4Vinci/Scrapling](https://github.com/D4Vinci/Scrapling) |
| **Stars** | ⭐ 48,198 |
| **Forks** | 4,499 |
| **语言** | Python |
| **许可证** | BSD-3-Clause |
| **创建时间** | 2024-10-13 |
| **更新时间** | 2026-05-09 |

## 项目介绍

Scrapling 是一个自适应 Web 爬虫框架，能够处理从单次请求到全规模爬取的所有场景。

**核心特点**：
- 🔄 **自适应解析器** — 能够从网站变化中学习，当页面更新时自动重新定位元素
- 🛡️ **反爬虫绕过** — 内置 Cloudflare Turnstile 等反机器人系统绕过能力
- 🕷️ **完整爬虫框架** — 支持并发、多会话、暂停恢复、自动代理轮换
- ⚡ **极致性能** — 优化架构，性能超越大多数 Python 爬虫库
- 🤖 **AI 集成** — 内置 MCP Server，支持 AI 辅助 Web 爬取

## 核心功能

### Spider 框架

| 功能 | 说明 |
|------|------|
| **Scrapy 风格 API** | `start_urls`、异步 `parse` 回调、`Request`/`Response` 对象 |
| **并发爬取** | 可配置并发限制、每域限流、下载延迟 |
| **多会话支持** | HTTP 请求与隐身浏览器统一接口，按 ID 路由 |
| **暂停恢复** | 基于检查点的持久化，Ctrl+C 优雅关闭，重启自动恢复 |
| **流式模式** | `async for item in spider.stream()` 实时流式输出 |
| **阻塞检测** | 自动检测和重试被阻塞的请求 |
| **Robots.txt** | 可选遵守 `Disallow`、`Crawl-delay`、`Request-rate` 指令 |
| **开发模式** | 首次运行缓存响应到磁盘，后续重放而不访问服务器 |
| **内置导出** | 通过 hooks 或内置 JSON/JSONL 导出结果 |

### 高级网站获取

| 类型 | 功能 |
|------|------|
| **HTTP 请求** | `Fetcher` 类 — 快速隐身 HTTP 请求，支持 TLS 指纹伪装、HTTP/3 |
| **动态加载** | `DynamicFetcher` — 基于 Playwright Chromium/Chrome 的完整浏览器自动化 |
| **反爬虫绕过** | `StealthyFetcher` — 高级隐身能力，可绕过 Cloudflare Turnstile/Interstitial |
| **会话管理** | `FetcherSession`、`StealthySession`、`DynamicSession` — Cookie 和状态持久化 |
| **代理轮换** | 内置 `ProxyRotator`，支持循环或自定义轮换策略 |
| **域名/广告屏蔽** | 阻止特定域名请求，内置 ~3500 个广告/追踪域名屏蔽 |
| **DNS 泄漏防护** | DNS-over-HTTPS 支持，防止代理 DNS 泄漏 |

### 自适应爬取与 AI 集成

- 🔄 **智能元素追踪** — 使用智能相似算法在网站变化后重新定位元素
- 🎯 **灵活选择器** — CSS 选择器、XPath 选择器、过滤器搜索、文本搜索、正则搜索
- 🔍 **查找相似元素** — 自动定位与找到元素相似的元素
- 🤖 **MCP Server** — 内置 MCP Server，用于 AI 辅助 Web 爬取，减少 token 使用

## 性能基准测试

### 文本提取速度测试（5000 个嵌套元素）

| 排名 | 库 | 时间 (ms) | vs Scrapling |
|------|-----|----------|-------------|
| 1 | **Scrapling** | **2.02** | 1.0x |
| 2 | Parsel/Scrapy | 2.04 | 1.01x |
| 3 | Raw Lxml | 2.54 | 1.257x |
| 4 | PyQuery | 24.17 | ~12x |
| 5 | Selectolax | 82.63 | ~41x |
| 6 | MechanicalSoup | 1549.71 | ~767.1x |
| 7 | BS4 with Lxml | 1584.31 | ~784.3x |
| 8 | BS4 with html5lib | 3391.91 | ~1679.1x |

### 元素相似性与文本搜索性能

| 库 | 时间 (ms) | vs Scrapling |
|-----|----------|-------------|
| **Scrapling** | **2.39** | 1.0x |
| AutoScraper | 12.45 | 5.209x |

## 安装与使用

### 基础安装

```bash
pip install scrapling
```

### 完整安装（含浏览器）

```bash
pip install "scrapling[fetchers]"
scrapling install
```

### 快速上手

#### HTTP 请求与会话

```python
from scrapling.fetchers import Fetcher, FetcherSession

# 使用会话
with FetcherSession(impersonate='chrome') as session:
    page = session.get('https://quotes.toscrape.com/', stealthy_headers=True)
    quotes = page.css('.quote .text::text').getall()

# 单次请求
page = Fetcher.get('https://quotes.toscrape.com/')
quotes = page.css('.quote .text::text').getall()
```

#### 高级隐身模式

```python
from scrapling.fetchers import StealthyFetcher, StealthySession

with StealthySession(headless=True, solve_cloudflare=True) as session:
    page = session.fetch('https://nopecha.com/demo/cloudflare', google_search=False)
    data = page.css('#padded_content a').getall()
```

#### 完整浏览器自动化

```python
from scrapling.fetchers import DynamicFetcher, DynamicSession

with DynamicSession(headless=True, disable_resources=False, network_idle=True) as session:
    page = session.fetch('https://quotes.toscrape.com/', load_dom=False)
    data = page.xpath('//span[@class="text"]/text()').getall()
```

#### Spider 示例

```python
from scrapling.spiders import Spider, Response

class QuotesSpider(Spider):
    name = "quotes"
    start_urls = ["https://quotes.toscrape.com/"]
    concurrent_requests = 10
    
    async def parse(self, response: Response):
        for quote in response.css('.quote'):
            yield {
                "text": quote.css('.text::text').get(),
                "author": quote.css('.author::text').get(),
            }
        
        next_page = response.css('.next a')
        if next_page:
            yield response.follow(next_page[0].attrib['href'])

result = QuotesSpider().start()
result.items.to_json("quotes.json")
```

#### 暂停与恢复

```python
QuotesSpider(crawldir="./crawl_data").start()
# Ctrl+C 优雅关闭，进度自动保存
# 再次运行相同命令，自动从上次停止处恢复
```

## CLI 命令行工具

### 交互式爬虫 Shell

```bash
scrapling shell
```

### 直接提取内容（无需编程）

```bash
# 提取 body 内容到文件
scrapling extract get 'https://example.com' content.md
# 提取文本内容
scrapling extract get 'https://example.com' content.txt
# 使用 CSS 选择器
scrapling extract get 'https://example.com' content.md --css-selector '#fromSkipToProducts' --impersonate 'chrome'
# 使用隐身模式绕过 Cloudflare
scrapling extract stealthy-fetch 'https://nopecha.com/demo/cloudflare' captchas.html --css-selector '#padded_content a' --solve-cloudflare
```

## 核心特性

- 🕷️ **自适应解析** — 从网站变化中学习，自动更新元素定位
- 🛡️ **反爬虫绕过** — 内置 Cloudflare Turnstile 绕过能力
- ⚡ **高性能** — 优化架构，速度超越大多数 Python 爬虫库
- 🔌 **MCP Server** — AI 辅助 Web 爬取，减少 token 使用
- 📊 **实时统计** — 并发爬取时的实时统计和流式输出
- 🎯 **灵活选择器** — CSS、XPath、过滤器、文本搜索、正则搜索
- 💾 **暂停恢复** — 检查点持久化，优雅关闭与自动恢复
- 🧪 **开发模式** — 缓存响应，离线开发和调试
- 📦 **内置导出** — JSON/JSONL 导出，hooks 集成

## 技术架构

- **语言**：Python 3.10+
- **依赖**：
  - Playwright（浏览器自动化）
  - lxml（高性能解析）
  - httpx（HTTP/3 支持）
- **架构模式**：Spider 框架 + Fetcher 层 + Parser 层
- **并发模型**：asyncio 异步并发
- **数据结构**：优化内存占用，懒加载策略

## 相关链接

### 项目资源
- [GitHub 仓库](https://github.com/D4Vinci/Scrapling)
- [官方文档](https://scrapling.readthedocs.io)
- [PyPI 包](https://pypi.org/project/scrapling/)
- [Discord 社区](https://discord.gg/EMgGbDceNQ)
- [X/Twitter](https://x.com/Scrapling_dev)

### 生态集成
- [Agent Skill 目录](https://github.com/D4Vinci/Scrapling/tree/main/agent-skill)
- [OpenClaw Skill](https://clawhub.ai/D4Vinci/scrapling-official)
- [MCP Server 文档](https://scrapling.readthedocs.io/en/latest/ai/mcp-server.html)

### 相关工具
- [Scrapy](https://scrapy.org/) — 灵感来源
- [Playwright](https://playwright.dev/) — 浏览器自动化
- [BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/) — 解析器灵感
