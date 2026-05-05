---
name: firecrawl-firecrawl
description: Firecrawl - 为 AI 提供网页搜索、爬取和交互能力的 API
type: source
tags: [github, typescript, web-scraping, ai, llm, data-extraction, agent]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/firecrawl-firecrawl-2026-05-05.json
stars: 115259
language: TypeScript
license: AGPL-3.0
github_url: https://github.com/firecrawl/firecrawl
---

# Firecrawl

> [!info] Repository Overview
> **Firecrawl** 是一个为 AI 系统提供干净网页数据的 API。它能够搜索、爬取和与网页交互，将任何网站转换为 LLM 可用的数据。开源（AGPL-3.0）并提供[托管服务](https://firecrawl.dev)。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | 115,259 🔥🔥🔥（超高人气！Top 0.01%） |
| 🍴 Forks | 7,251 |
| 💻 语言 | TypeScript |
| 🏢 所有者 | Firecrawl (Organization) |
| 📄 许可证 | AGPL-3.0 |
| 🔗 链接 | [github.com/firecrawl/firecrawl](https://github.com/firecrawl/firecrawl) |
| 🌐 主页 | [firecrawl.dev](https://firecrawl.dev) |
| 📅 创建时间 | 2024-04-15 |
| 📅 更新时间 | 2026-05-05 |
| 🔌 Open Issues | 305 |

## 🎯 为什么选择 Firecrawl？

### 核心优势

| 特性 | 说明 |
|------|------|
| **行业领先的可靠性** | 覆盖 96% 的网页，包括重度 JS 页面 — 无代理头痛，只有干净数据 |
| **极快速度** | P95 延迟 3.4 秒，为实时代理和动态应用构建 |
| **LLM 友好输出** | 干净的 Markdown、结构化 JSON、截图等 — 更少 Token，更好的 AI 应用 |
| **处理困难内容** | 代理轮换、编排、速率限制、JS 阻塞内容等 — 零配置 |
| **Agent 就绪** | 单条命令即可连接任何 AI 代理或 MCP 客户端 |
| **媒体解析** | 解析和提取网页托管的 PDF、DOCX 等内容 |
| **Actions** | 提取前点击、滚动、写入、等待和按键 |
| **开源** | 透明和协作开发 — [加入社区](https://github.com/firecrawl/firecrawl) |

### 性能基准

- **网页覆盖率**: 96%
- **P95 延迟**: 3.4 秒
- **处理规模**: 数百万页面
- **可靠性**: 行业领先

## 🔥 核心功能

### 1. Search（搜索）

搜索网页并获取结果的完整内容。

```python
from firecrawl import Firecrawl

app = Firecrawl(api_key="fc-YOUR_API_KEY")

search_result = app.search("firecrawl", limit=5)
```

**输出**：
```json
[
  {
    "url": "https://firecrawl.dev",
    "title": "Firecrawl",
    "markdown": "Turn websites into..."
  },
  {
    "url": "https://docs.firecrawl.dev",
    "title": "Firecrawl Docs",
    "markdown": "# Getting Started..."
  }
]
```

### 2. Scrape（爬取）

从任何网站获取 LLM 就绪的数据 — Markdown、JSON、截图等。

```python
from firecrawl import Firecrawl

app = Firecrawl(api_key="fc-YOUR_API_KEY")

result = app.scrape('firecrawl.dev')
```

**输出**：
```markdown
# Firecrawl

Firecrawl helps AI systems search, scrape, and interact with the web.

## Features
- Search: Find information across the web
- Scrape: Clean data from any page
- Interact: Click, navigate, and operate pages
- Agent: Autonomous data gathering
```

### 3. Interact（交互）

爬取页面，然后使用 AI 提示词或代码与它交互。

```python
from firecrawl import Firecrawl

app = Firecrawl(api_key="fc-YOUR_API_KEY")

result = app.scrape("https://amazon.com")
scrape_id = result.metadata.scrape_id

app.interact(scrape_id, prompt="Search for 'mechanical keyboard'")
app.interact(scrape_id, prompt="Click the first result")
```

**输出**：
```json
{
  "success": true,
  "output": "Keyboard available at $100",
  "liveViewUrl": "https://liveview.firecrawl.dev/..."
}
```

### 4. Agent（代理）

**最简单的网页数据获取方式。** 描述你需要的内容，AI 代理会搜索、导航和检索数据。无需 URL。

```bash
curl -X POST 'https://api.firecrawl.dev/v2/agent' \
  -H 'Authorization: Bearer fc-YOUR_API_KEY' \
  -H 'Content-Type: application/json' \
  -d '{
    "prompt": "Find the pricing plans for Notion"
  }'
```

**响应**：
```json
{
  "success": true,
  "data": {
    "result": "Notion offers the following pricing plans:\n\n1. Free - $0/month...\n2. Plus - $10/seat/month...\n3. Business - $18/seat/month...",
    "sources": ["https://www.notion.so/pricing"]
  }
}
```

#### Agent 功能特性

**结构化输出**：
```python
from firecrawl import Firecrawl
from pydantic import BaseModel, Field
from typing import List

class Founder(BaseModel):
    name: str = Field(description="Full name of the founder")
    role: str = Field(None, description="Role or position")

class FoundersSchema(BaseModel):
    founders: List[Founder] = Field(description="List of founders")

app = Firecrawl(api_key="fc-YOUR_API_KEY")

result = app.agent(
    prompt="Find the founders of Firecrawl",
    schema=FoundersSchema
)
```

**指定 URL（可选）**：
```python
result = app.agent(
    urls=["https://docs.firecrawl.dev", "https://firecrawl.dev/pricing"],
    prompt="Compare the features and pricing information"
)
```

**模型选择**：

| 模型 | 成本 | 最适合 |
|------|------|--------|
| `spark-1-mini` (默认) | 便宜 60% | 大多数任务 |
| `spark-1-pro` | 标准 | 复杂研究、关键数据收集 |

```python
result = app.agent(
    prompt="Compare enterprise features across Firecrawl, Apify, and ScrapingBee",
    model="spark-1-pro"
)
```

### 5. Crawl（爬取）

爬取整个网站并从所有页面获取内容。

```bash
curl -X POST 'https://api.firecrawl.dev/v2/crawl' \
  -H 'Authorization: Bearer fc-YOUR_API_KEY' \
  -H 'Content-Type: application/json' \
  -d '{
    "url": "https://docs.firecrawl.dev",
    "limit": 100,
    "scrapeOptions": {
      "formats": ["markdown"]
    }
  }'
```

**返回作业 ID**：
```json
{
  "success": true,
  "id": "123-456-789",
  "url": "https://api.firecrawl.dev/v2/crawl/123-456-789"
}
```

**检查爬取状态**：
```bash
curl -X GET 'https://api.firecrawl.dev/v2/crawl/123-456-789' \
  -H 'Authorization: Bearer fc-YOUR_API_KEY'
```

**响应**：
```json
{
  "status": "completed",
  "total": 50,
  "completed": 50,
  "creditsUsed": 50,
  "data": [
    {
      "markdown": "# Page Title\n\nContent...",
      "metadata": {"title": "Page Title", "sourceURL": "https://..."}
    }
  ]
}
```

### 6. Map（映射）

立即发现网站上的所有 URL。

```bash
curl -X POST 'https://api.firecrawl.dev/v2/map' \
  -H 'Authorization: Bearer fc-YOUR_API_KEY' \
  -H 'Content-Type: application/json' \
  -d '{"url": "https://firecrawl.dev"}'
```

**响应**：
```json
{
  "success": true,
  "links": [
    {"url": "https://firecrawl.dev", "title": "Firecrawl", "description": "Turn websites into LLM-ready data"},
    {"url": "https://firecrawl.dev/pricing", "title": "Pricing", "description": "Firecrawl pricing plans"},
    {"url": "https://firecrawl.dev/blog", "title": "Blog", "description": "Firecrawl blog"}
  ]
}
```

**带搜索的映射**：
```python
from firecrawl import Firecrawl

app = Firecrawl(api_key="fc-YOUR_API_KEY")

result = app.map("https://firecrawl.dev", search="pricing")
# 返回按与 "pricing" 相关性排序的 URL
```

### 7. Batch Scrape（批量爬取）

同时爬取多个 URL。

```python
from firecrawl import Firecrawl

app = Firecrawl(api_key="fc-YOUR_API_KEY")

job = app.batch_scrape([
    "https://firecrawl.dev",
    "https://docs.firecrawl.dev",
    "https://firecrawl.dev/pricing"
], formats=["markdown"])

for doc in job.data:
    print(doc.metadata.source_url)
```

## 🛠️ SDK 支持

### Python SDK

```bash
pip install firecrawl-py
```

```python
from firecrawl import Firecrawl

app = Firecrawl(api_key="fc-YOUR_API_KEY")

# 爬取单个 URL
doc = app.scrape("https://firecrawl.dev", formats=["markdown"])
print(doc.markdown)

# 使用 Agent 进行自主数据收集
result = app.agent(prompt="Find the founders of Stripe")
print(result.data)

# 爬取网站（自动等待完成）
docs = app.crawl("https://docs.firecrawl.dev", limit=50)
for doc in docs.data:
    print(doc.metadata.source_url, doc.markdown[:100])

# 搜索网页
results = app.search("best AI data tools 2024", limit=10)
print(results)
```

### Node.js SDK

```bash
npm install @mendable/firecrawl-js
```

```javascript
import Firecrawl from '@mendable/firecrawl-js';

const app = new Firecrawl({ apiKey: 'fc-YOUR_API_KEY' });

// 爬取单个 URL
const doc = await app.scrape('https://firecrawl.dev', { formats: ['markdown'] });
console.log(doc.markdown);

// 使用 Agent
const result = await app.agent({ prompt: 'Find the founders of Stripe' });
console.log(result.data);

// 爬取网站
const docs = await app.crawl('https://docs.firecrawl.dev', { limit: 50 });
docs.data.forEach(doc => {
  console.log(doc.metadata.sourceURL, doc.markdown.substring(0, 100));
});

// 搜索网页
const results = await app.search('best AI data tools 2024', { limit: 10 });
results.data.web.forEach(result => {
  console.log(`${result.title}: ${result.url}`);
});
```

### Java SDK

```groovy
repositories {
    mavenCentral()
    maven { url 'https://jitpack.io' }
}

dependencies {
    implementation 'com.github.firecrawl:firecrawl-java-sdk:2.0'
}
```

```java
import dev.firecrawl.client.FirecrawlClient;

FirecrawlClient client = new FirecrawlClient(
    System.getenv("FIRECRAWL_API_KEY"), null, null
);

// 爬取 URL
FirecrawlDocument doc = client.scrapeURL("https://firecrawl.dev", null);
System.out.println(doc.getMarkdown());

// 使用 Agent
AgentResponse start = client.createAgent(
    new AgentParams("Find the founders of Stripe")
);
AgentStatusResponse result = client.getAgentStatus(start.getId());
System.out.println(result.getData());

// 爬取网站
CrawlStatusResponse job = client.crawlURL(
    "https://docs.firecrawl.dev", 
    new CrawlParams(), 
    null, 
    10
);
for (FirecrawlDocument page : job.getData()) {
    System.out.println(page.getMetadata().get("sourceURL"));
}
```

### Elixir SDK

```elixir
def deps do
  [
    {:firecrawl, "~> 1.0"}
  ]
end
```

```elixir
# 爬取 URL
{:ok, response} = Firecrawl.scrape_and_extract_from_url(
  url: "https://firecrawl.dev",
  formats: ["markdown"]
)

# 爬取网站
{:ok, response} = Firecrawl.crawl_urls(
  url: "https://docs.firecrawl.dev",
  limit: 50
)

# 搜索网页
{:ok, response} = Firecrawl.search_and_scrape(
  query: "best AI data tools 2024",
  limit: 10
)

# 映射 URL
{:ok, response} = Firecrawl.map_urls(url: "https://example.com")
```

### Rust SDK

```toml
[dependencies]
firecrawl = "2"
tokio = { version = "1", features = ["macros", "rt-multi-thread"] }
```

```rust
use firecrawl::Client;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let client = Client::new("fc-YOUR_API_KEY")?;

    // 爬取 URL
    let document = client.scrape("https://firecrawl.dev", None).await?;
    println!("{:?}", document.markdown);

    // 爬取网站
    let result = client.crawl("https://docs.firecrawl.dev", None).await?;
    println!("Crawled {} pages", result.data.len());

    // 搜索网页
    let response = client.search("best web scraping tools 2024", None).await?;
    println!("{:?}", response.data);

    Ok(())
}
```

### 社区 SDK

- [Go SDK](https://github.com/firecrawl/firecrawl/tree/main/apps/go-sdk)

## 🔌 集成

### AI 代理和工具

**Firecrawl Skill** - 给你的代理提供实时网页数据：
```bash
npx -y firecrawl-cli@latest init --all --browser
```

支持：
- [Claude Code](https://claude.ai/code)
- [Antigravity](https://antigravity.google)
- [OpenCode](https://opencode.ai)

**Firecrawl MCP** - 连接任何 MCP 兼容客户端到网页：
```json
{
  "mcpServers": {
    "firecrawl-mcp": {
      "command": "npx",
      "args": ["-y", "firecrawl-mcp"],
      "env": {
        "FIRECRAWL_API_KEY": "fc-YOUR_API_KEY"
      }
    }
  }
}
```

### 平台集成

- [Lovable](https://docs.lovable.dev/integrations/firecrawl)
- [Zapier](https://zapier.com/apps/firecrawl/integrations)
- [n8n](https://n8n.io/integrations/firecrawl/)

[查看所有集成 →](https://www.firecrawl.dev/integrations)

## 📖 资源

### 文档

- [文档](https://docs.firecrawl.dev)
- [API 参考](https://docs.firecrawl.dev/api-reference/introduction)
- [Playground](https://firecrawl.dev/playground)
- [更新日志](https://firecrawl.dev/changelog)

### 社区

- [X/Twitter](https://twitter.com/firecrawl)
- [LinkedIn](https://www.linkedin.com/company/104100957)
- [Discord](https://discord.gg/firecrawl)
- [GitHub Discussions](https://github.com/firecrawl/firecrawl/discussions)

## 🆚 开源 vs 云服务

Firecrawl 采用 AGPL-3.0 开源许可证。[firecrawl.dev](https://firecrawl.dev) 的云版本包含额外功能：

### 开源版本

- ✅ 完整的爬取功能
- ✅ 本地部署
- ✅ 社区支持
- ✅ AGPL-3.0 许可证

### 云服务版本

- ✅ 所有开源功能
- ✅ 托管基础设施
- ✅ 更高性能
- ✅ 优先支持
- ✅ 额外功能
- ✅ 企业级 SLA

**本地部署**：参见[贡献指南](https://github.com/firecrawl/firecrawl/blob/main/CONTRIBUTING.md)

**自托管**：参见[自托管指南](https://docs.firecrawl.dev/contributing/self-host)

## 🤝 贡献

欢迎贡献！请在提交 PR 前阅读[贡献指南](https://github.com/firecrawl/firecrawl/blob/main/CONTRIBUTING.md)。

### 贡献者

<a href="https://github.com/firecrawl/firecrawl/graphs/contributors">
  <img alt="contributors" src="https://contrib.rocks/image?repo=firecrawl/firecrawl"/>
</a>

## 📄 许可证

本项目主要采用 **GNU Affero General Public License v3.0 (AGPL-3.0)** 许可证。SDK 和某些 UI 组件采用 MIT 许可证。详情请参阅具体目录中的 LICENSE 文件。

> **重要**: 最终用户有责任在爬取时尊重网站的政策。建议用户遵守适用的隐私政策和使用条款。默认情况下，Firecrawl 遵守 robots.txt 指令。使用 Firecrawl 即表示您同意遵守这些条件。

## 💡 使用场景

### 场景 1: AI 数据收集

```
场景: 为 AI 训练收集网页数据
操作:
  1. 使用 Agent 自动搜索和导航
  2. 提取干净的结构化数据
  3. 批量处理大量页面
  4. 转换为 LLM 友好格式
结果: 高质量训练数据集
```

### 场景 2: 竞争分析

```
场景: 监控竞争对手网站
操作:
  1. 使用 Map 发现所有页面
  2. 定期 Crawl 获取更新
  3. 对比价格和功能
  4. 生成分析报告
结果: 实时竞争情报
```

### 场景 3: 内容聚合

```
场景: 从多个来源聚合内容
操作:
  1. 配置多个数据源
  2. 使用 Batch Scrape 并行处理
  3. 统一格式输出
  4. 自动更新内容
结果: 自动化内容平台
```

### 场景 4: 研究分析

```
场景: 学术或市场研究
操作:
  1. 使用 Search 查找相关资料
  2. 使用 Agent 提取关键信息
  3. 使用结构化输出组织数据
  4. 生成研究报告
结果: 高效研究流程
```

## 🎯 核心优势对比

| 特性 | 传统爬虫 | Firecrawl |
|------|---------|-----------|
| **可靠性** | 低（容易被封锁） | 高（96% 覆盖率） |
| **速度** | 慢（数分钟） | 快（3.4 秒 P95） |
| **输出格式** | HTML（需处理） | Markdown/JSON（LLM 就绪） |
| **JS 支持** | 差 | 优秀（完整 JS 执行） |
| **代理管理** | 手动 | 自动（零配置） |
| **AI 集成** | 需自己开发 | 内置 Agent |
| **可扩展性** | 有限 | 云级规模 |

## 📊 性能指标

### 仓库活跃度

- ⭐ **115,259 Stars** - 超高人气（Top 0.01% GitHub 项目）
- 🍴 **7,251 Forks** - 活跃社区参与
- 🔧 **305 Open Issues** - 活跃开发中
- 📅 **持续更新** - 2026-05-05 最新更新

### 技术成熟度

- ✅ **生产级代码**: TypeScript，企业级质量
- ✅ **多语言支持**: 6 种官方 SDK
- ✅ **丰富集成**: AI 平台、工作流工具
- ✅ **完整文档**: API 文档、示例、指南
- ✅ **活跃社区**: Discord、GitHub Discussions

## 🔮 未来方向

基于项目发展趋势，可能的发展方向：

1. **更多语言 SDK** - 扩展到更多编程语言
2. **增强 Agent 能力** - 更智能的自主数据收集
3. **实时数据流** - 支持实时网页监控
4. **更多集成** - 扩展平台和工具支持
5. **性能优化** - 进一步降低延迟
6. **AI 模型集成** - 深度集成最新 LLM

## 🌟 总结

Firecrawl 是一个**世界级的网页数据 API 项目**，具有以下特点：

1. **超高人气** - 115K+ Stars，Top 0.01% GitHub 项目
2. **行业领先** - 96% 网页覆盖率，3.4 秒 P95 延迟
3. **AI 原生** - 专为 AI 和 LLM 设计的数据格式
4. **开发者友好** - 6 种语言 SDK，丰富的集成
5. **开源透明** - AGPL-3.0 许可，社区驱动
6. **生产就绪** - 托管服务，企业级支持

**特别适合**：
- AI 应用开发
- 数据科学和研究
- 内容聚合平台
- 竞争情报分析
- 自动化测试

这是一个**改变游戏规则的项目**，为 AI 时代的数据访问设立了新标准！

---

*最后更新: 2026-05-05*
*数据来源: GitHub API + README.md + 官方文档*
