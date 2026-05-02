---
name: tools/perplexity
description: Perplexity - Claude Code 搜索代理，支持多种查询类型分类和引用格式
type: source
tags: [claude-code, agent, search, ai-search, research]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/Perplexity/Prompt.txt
---

# Perplexity

Perplexity 是 Claude Code 的 AI 搜索代理，专注于研究、信息检索和多类型查询处理。

## 查询类型分类

Perplexity 代理能够识别和处理以下查询类型：

| 类型 | 说明 | 典型场景 |
|------|------|----------|
| Academic Research | 学术研究 | 论文查找、概念解释 |
| Recent News | 最新新闻 | 事件追踪、趋势分析 |
| Weather | 天气查询 | 天气预报、气候数据 |
| People | 人物信息 | 传记、职业背景 |
| Coding | 编程问题 | 代码调试、技术方案 |
| Cooking | 烹饪食谱 | 菜谱查找、食材搭配 |
| Translation | 翻译服务 | 语言转换、文化解释 |
| Creative Writing | 创意写作 | 故事创作、诗歌撰写 |
| Science and Math | 科学数学 | 公式推导、概念解释 |
| URL Lookup | URL 解析 | 网页内容提取 |

## 查询类型检测

```python
def classify_query(query: str) -> str:
    """
    基于关键词和模式识别查询类型
    """
    query_lower = query.lower()
    
    if any(kw in query_lower for kw in ['research', 'paper', 'study', 'journal']):
        return "Academic Research"
    elif any(kw in query_lower for kw in ['news', 'latest', 'recent', 'update']):
        return "Recent News"
    elif any(kw in query_lower for kw in ['weather', 'temperature', 'forecast']):
        return "Weather"
    elif any(kw in query_lower for kw in ['who is', 'biography', 'profile']):
        return "People"
    elif any(kw in query_lower for kw in ['code', 'debug', 'programming', 'function']):
        return "Coding"
    # ... 更多类型检测
```

## 格式规则 (format_rules)

### Markdown 引用格式

```markdown
这是一个关于 [主题] 的重要发现 [1]。

## 引用格式
[1]: 来源标题 - URL
```

### 结构化输出

```markdown
# 查询结果

## 关键发现
- 发现 1
- 发现 2

## 来源
[1]: 来源 1
[2]: 来源 2
```

## 搜索结果处理

### 标题格式

```
{查询主题} - 深度分析与最新信息
```

### 摘要格式

```markdown
{简短介绍（2-3句话）}

关键点：
• 关键点 1
• 关键点 2
• 关键点 3
```

### 引用标注

```markdown
根据 [来源名称](URL) 的研究 [1]，...
```

## 置信度评估

| 置信度 | 说明 | 适用场景 |
|--------|------|----------|
| High | 来源权威，多方验证 | 学术论文、官方文档 |
| Medium | 单来源或部分验证 | 新闻报道、行业博客 |
| Low | 推测或有限信息 | 实时事件、未知领域 |

## 输出示例

### 学术研究查询

```markdown
# 关于 [研究主题] 的学术分析

## 摘要
[简要介绍研究主题的核心发现]

## 主要理论
1. **理论名称**：理论描述 [1]
2. **理论名称**：理论描述 [2]

## 参考文献
[1]: 作者, (年份). "标题". 期刊名称.
[2]: 作者, (年份). "标题". 期刊名称.

## 延伸阅读
- [资源 1](URL)
- [资源 2](URL)
```

### 新闻查询

```markdown
# [事件] 最新动态

## 时间线
- **日期1**: 事件描述
- **日期2**: 事件描述

## 关键观点
> 引用来源的原文或重要评论

## 相关报道
- [报道 1](URL)
- [报道 2](URL)
```

## 搜索限制

- 实时信息可能受限
- 需要验证来源权威性
- 复杂查询可能需要分解

## 相关链接

- [[tools/junie-ai]] - Junie 代码探索代理
- [[tools/leap-new]] - Leap.new 全栈代理
- [[tools/lovable]] - Lovable 前端代理

---

*来源：[Perplexity Agent System Prompt](https://github.com/Alishahryar1/free-claude-code/tree/main/Claude%20Code/Perplexity)*