---
name: browser-use-browser-use
description: Browser Use - 让网站对 AI 代理可访问，轻松实现在线任务自动化
type: source
tags: [github, python, browser-automation, ai, llm, agent, web-scraping]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/browser-use-browser-use-2026-05-05.json
stars: 92169
language: Python
license: MIT
github_url: https://github.com/browser-use/browser-use
---

# Browser Use

> [!info] Repository Overview
> **Browser Use** 是一个让网站对 AI 代理可访问的工具，可以轻松实现在线任务自动化。通过自然语言描述任务，AI 代理就能自动操作浏览器完成各种任务。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | 92,169 🔥（超高人气！） |
| 🍴 Forks | 10,463 |
| 💻 语言 | Python |
| 🏢 所有者 | Browser Use (Organization) |
| 📄 许可证 | MIT |
| 🔗 链接 | [github.com/browser-use/browser-use](https://github.com/browser-use/browser-use) |
| 🌐 主页 | [browser-use.com](https://browser-use.com) |
| 📅 创建时间 | 2024-10-31 |
| 📅 更新时间 | 2026-05-05 |
| 🔌 Open Issues | 234 |

## 🎯 核心特性

### AI 浏览器自动化

- **自然语言控制**: 用自然语言描述任务，AI 自动执行
- **智能交互**: 理解页面结构，自动点击、输入、导航
- **多 LLM 支持**: ChatBrowserUse、ChatGoogle、ChatAnthropic
- **开源免费**: MIT 许可证，完全开源

### 灵活部署

| 部署方式 | 说明 |
|---------|------|
| **开源版本** | 本地运行，完全控制 |
| **云服务** | Browser Use Cloud，更强大的能力 |
| **混合模式** | 开源 Agent + 云浏览器 |

### 1000+ 集成

- Gmail、Slack、Notion 等主流服务
- 持久化文件系统和记忆
- 验证码处理和代理轮换
- 隐身浏览器指纹

## 🚀 快速开始

### 方式 1: Python SDK

```bash
# 1. 创建环境并安装
uv init && uv add browser-use && uv sync

# 2. （可选）安装 Chromium
uvx browser-use install

# 3. 运行第一个代理
python main.py
```

```python
from browser_use import Agent, Browser, ChatBrowserUse
import asyncio

async def main():
    browser = Browser(
        # use_cloud=True,  # 使用云服务的隐身浏览器
    )

    agent = Agent(
        task="Find the number of stars of the browser-use repo",
        llm=ChatBrowserUse(),
        browser=browser,
    )
    await agent.run()

if __name__ == "__main__":
    asyncio.run(main())
```

### 方式 2: 模板快速开始

```bash
# 生成默认模板
uvx browser-use init --template default

# 生成高级模板（所有配置选项）
uvx browser-use init --template advanced

# 生成自定义工具模板
uvx browser-use init --template tools

# 指定输出路径
uvx browser-use init --template default --output my_agent.py
```

### 方式 3: LLM 快速开始

1. 指导你的编码代理（Cursor、Claude Code 等）访问 [Agents.md](https://docs.browser-use.com/llms-full.txt)
2. 直接提示开始使用！

### 方式 4: CLI 工具

```bash
browser-use open https://example.com    # 导航到 URL
browser-use state                       # 查看可点击元素
browser-use click 5                     # 按索引点击元素
browser-use type "Hello"                # 输入文本
browser-use screenshot page.png         # 截图
browser-use close                       # 关闭浏览器
```

CLI 在命令之间保持浏览器运行，实现快速迭代。

### Claude Code Skill

为 [Claude Code](https://claude.ai/code) 安装 Skill：

```bash
mkdir -p ~/.claude/skills/browser-use
curl -o ~/.claude/skills/browser-use/SKILL.md \
  https://raw.githubusercontent.com/browser-use/browser-use/main/skills/browser-use/SKILL.md
```

## 💡 使用演示

### 1. 📋 表单填写

**任务**: "Fill in this job application with my resume and information."

- 自动填写职位申请表
- 从简历提取信息
- 智能匹配表单字段
- 完成多步骤申请流程

[示例代码 ↗](https://github.com/browser-use/browser-use/blob/main/examples/use-cases/apply_to_job.py)

### 2. 🍎 杂货购物

**任务**: "Put this list of items into my instacart."

- 解析购物清单
- 在 Instacart 中搜索商品
- 添加到购物车
- 处理库存和替代选项

[示例代码 ↗](https://github.com/browser-use/browser-use/blob/main/examples/use-cases/buy_groceries.py)

### 3. 💻 个人助手

**任务**: "Help me find parts for a custom PC."

- 理解电脑配置需求
- 在 PCPartPicker 上搜索零件
- 比较价格和兼容性
- 生成配置清单

[示例代码 ↗](https://github.com/browser-use/browser-use/blob/main/examples/use-cases/pcpartpicker.py)

[更多示例 ↗](https://docs.browser-use.com/examples)

## 🆚 开源 vs 云服务

### 开源 Agent

**适合场景**：
- 需要自定义工具
- 深度代码级集成
- 完全控制数据隐私

**特点**：
- ✅ 完全开源
- ✅ 本地运行
- ✅ MIT 许可证
- ✅ 社区支持

**建议**：
- 配合云浏览器使用，获得领先的隐身能力、代理轮换和扩展性
- 或完全自托管在本地机器

### Browser Use Cloud

**适合场景**：
- 复杂任务（成功率更高）
- 快速开始和扩展
- 最佳隐身和验证码处理

**特点**：
- ✅ 更强大的代理能力
- ✅ 最简单的开始方式
- ✅ 代理轮换和验证码解决
- ✅ 1000+ 集成
- ✅ 持久化文件系统和记忆

**性能对比**：

根据 100 个真实浏览器任务的基准测试：

| 任务类型 | 开源 Agent | Cloud Agent |
|---------|-----------|-------------|
| 简单任务 | 高成功率 | 更高成功率 |
| 复杂任务 | 中等成功率 | 显著更高成功率 |
| 平均速度 | 快 | 更快 |

完整基准测试：**[browser-use/benchmark](https://github.com/browser-use/benchmark)**

## 🛠️ 核心功能

### 1. Agent（代理）

核心代理类，执行浏览器自动化任务。

```python
from browser_use import Agent, Browser, ChatBrowserUse

browser = Browser()
agent = Agent(
    task="Your task description",
    llm=ChatBrowserUse(),
    browser=browser,
)
result = await agent.run()
```

### 2. Browser（浏览器）

浏览器配置和管理。

```python
from browser_use import Browser

browser = Browser(
    headless=False,  # 显示浏览器窗口
    disable_security=True,  # 禁用安全限制
    # use_cloud=True,  # 使用云浏览器
)
```

### 3. LLM 集成

#### ChatBrowserUse（推荐）

专为浏览器自动化优化的模型。

```python
from browser_use import ChatBrowserUse

llm = ChatBrowserUse()
# 平均完成任务速度比其他模型快 3-5 倍
# 准确率业界领先
```

**定价**（每 100 万 tokens）：
- Input tokens: $0.20
- Cached input tokens: $0.02
- Output tokens: $2.00

#### ChatGoogle

```python
from browser_use import ChatGoogle

llm = ChatGoogle(model='gemini-3-flash-preview')
```

#### ChatAnthropic

```python
from browser_use import ChatAnthropic

llm = ChatAnthropic(model='claude-sonnet-4-6')
```

### 4. 自定义工具

扩展代理能力。

```python
from browser_use import Tools

tools = Tools()

@tools.action(description='Description of what this tool does.')
def custom_tool(param: str) -> str:
    return f"Result: {param}"

agent = Agent(
    task="Your task",
    llm=llm,
    browser=browser,
    tools=tools,
)
```

### 5. CLI 工具

命令行浏览器自动化。

```bash
# 导航
browser-use open https://example.com

# 查看状态
browser-use state

# 点击
browser-use click 5

# 输入
browser-use type "Hello"

# 截图
browser-use screenshot page.png

# 关闭
browser-use close
```

## 📖 常见问题

### 最好的模型是什么？

我们推荐 **ChatBrowserUse()**，它专为浏览器自动化任务优化。平均完成任务速度比其他模型快 3-5 倍，准确率业界领先。

### 可以免费使用吗？

是的！Browser-Use 开源且免费使用。你只需选择一个 LLM 提供商（OpenAI、Google、ChatBrowserUse，或使用 Ollama 运行本地模型）。

### 如何处理身份验证？

1. **使用真实浏览器配置** - 重用现有 Chrome 配置文件
   - 示例：[real_browser.py](https://github.com/browser-use/browser-use/blob/main/examples/browser/real_browser.py)
2. **临时邮箱** - 选择 AgentMail
3. **同步认证配置到云浏览器** - 运行同步脚本

### 如何解决验证码？

使用 [Browser Use Cloud](https://cloud.browser-use.com)，提供：
- 隐身浏览器指纹
- 代理轮换
- 验证码自动解决

### 如何进入生产环境？

对于生产用例，使用 [Browser Use Cloud API](https://cloud.browser-use.com)：
- 可扩展的浏览器基础设施
- 内存管理
- 代理轮换
- 隐身浏览器指纹
- 高性能并行执行

## 🌐 资源链接

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/browser-use/browser-use)
> - [官网](https://browser-use.com)
> - [文档](https://docs.browser-use.com)
> - [云服务](https://cloud.browser-use.com)
> - [博客](https://browser-use.com/posts)
> - [Discord](https://link.browser-use.com/discord)
> - [Twitter](https://x.com/intent/user?screen_name=browser_use)

## 💡 使用场景

### 场景 1: 自动化测试

```
场景: 自动化测试网站功能
操作:
  1. 描述测试任务
  2. Agent 自动导航和操作
  3. 验证结果
  4. 生成测试报告
结果: 减少手动测试时间
```

### 场景 2: 数据采集

```
场景: 从网站采集结构化数据
操作:
  1. 描述数据需求
  2. Agent 自动浏览和提取
  3. 处理分页和动态内容
  4. 输出结构化数据
结果: 高效数据收集
```

### 场景 3: 表单自动化

```
场景: 批量填写在线表单
操作:
  1. 准备数据源
  2. Agent 自动填写表单
  3. 处理验证和错误
  4. 批量处理
结果: 节省大量手动工作
```

### 场景 4: 网站监控

```
场景: 监控网站变化
操作:
  1. 设置监控任务
  2. Agent 定期检查
  3. 检测变化
  4. 发送通知
结果: 实时网站监控
```

## 🎯 核心优势

| 特性 | 传统自动化 | Browser Use |
|------|-----------|-------------|
| **控制方式** | 编写脚本 | 自然语言 |
| **维护成本** | 高（页面变化需更新） | 低（AI 自适应） |
| **学习曲线** | 陡峭 | 平缓 |
| **灵活性** | 有限 | 高度灵活 |
| **集成性** | 需自己集成 | 开箱即用 |
| **智能程度** | 无 | AI 驱动 |

## 📊 性能指标

### 仓库活跃度

- ⭐ **92,169 Stars** - 超高人气（Top 0.1%）
- 🍴 **10,463 Forks** - 活跃社区参与
- 🔧 **234 Open Issues** - 活跃开发中
- 📅 **持续更新** - 2026-05-05 最新更新

### 技术成熟度

- ✅ **生产级代码**: Python，企业级质量
- ✅ **多 LLM 支持**: ChatBrowserUse、Google、Anthropic
- ✅ **丰富集成**: Claude Code、CLI、云服务
- ✅ **完整文档**: 库文档、云文档、示例
- ✅ **活跃社区**: Discord、GitHub Discussions

### 基准测试

根据 **100 个真实浏览器任务**的基准测试：

| 模型 | 成功率 | 平均速度 |
|------|--------|----------|
| ChatBrowserUse | 业界领先 | 3-5x 更快 |
| 其他 SOTA 模型 | 良好 | 基准 |

完整基准：**[browser-use/benchmark](https://github.com/browser-use/benchmark)**

## 🔮 核心价值

Browser Use 的核心价值在于：

1. **降低门槛** - 自然语言控制，无需编程
2. **提高效率** - AI 自动化，节省大量时间
3. **增强能力** - 做以前难以实现的自动化
4. **灵活部署** - 开源和云服务选择
5. **持续进化** - 活跃开发，快速迭代

## 🚀 快速上手建议

### 新手推荐

1. **从简单任务开始** - 熟悉自然语言描述
2. **使用 Cloud 服务** - 最佳体验，无需配置
3. **参考示例** - 学习已有用例
4. **加入社区** - Discord 获取帮助

### 进阶用户

1. **自定义工具** - 扩展代理能力
2. **混合部署** - 开源 Agent + 云浏览器
3. **性能优化** - 并行执行，批量处理
4. **深度集成** - 嵌入到现有系统

## 🤝 贡献与社区

### 如何贡献

1. **报告问题**: 提交 Bug 和改进建议
2. **贡献代码**: 提交 Pull Request
3. **分享经验**: 分享使用案例和最佳实践
4. **改进文档**: 完善文档和示例

### 学习资源

- **GitHub 仓库**: [browser-use/browser-use](https://github.com/browser-use/browser-use)
- **文档**: [docs.browser-use.com](https://docs.browser-use.com)
- **示例**: [examples/](https://github.com/browser-use/browser-use/tree/main/examples)
- **Discord**: [加入社区](https://link.browser-use.com/discord)

## 📄 许可证

MIT License - 开源、免费、商业友好。

## 🌟 总结

Browser Use 是一个**革命性的浏览器自动化工具**，具有以下特点：

1. **AI 原生** - 用自然语言控制浏览器
2. **超高人气** - 92K+ Stars，Top 0.1% 项目
3. **易于使用** - 无需编程知识
4. **强大能力** - 1000+ 集成，隐身浏览器
5. **灵活部署** - 开源和云服务
6. **活跃社区** - 持续更新和改进

**特别适合**：
- 自动化测试
- 数据采集
- 表单填写
- 网站监控
- 个人助理任务

这是一个**改变游戏规则的项目**，让浏览器自动化变得前所未有的简单！

---

*最后更新: 2026-05-05*
*数据来源: GitHub API + README.md + 官方文档*
*Made with ❤️ in Zurich and San Francisco*
