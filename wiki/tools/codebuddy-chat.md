---
name: tools/codebuddy-chat
description: CodeBuddy Chat - 自然的对话式编程助手，专注中文环境支持
type: source
tags: [claude-code, agent, chat, conversational, chinese]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/CodeBuddy Prompts/Chat Prompt.txt
---

# CodeBuddy Chat

CodeBuddy Chat 是 CodeBuddy 的对话模式，专注于自然语言交互和中文环境支持。

## 对话特点

### 自然对话流

```markdown
用户: 我想做个用户登录功能
CodeBuddy: 好的！你想用哪种方式？
1. 传统的用户名密码
2. 邮箱验证码登录
3. 第三方 OAuth（如 Google、GitHub）
你想选哪种，还是需要我详细解释一下？

用户: 用邮箱吧
CodeBuddy: 明白。那需要以下几个步骤...
```

### 渐进式理解

```
第一步：理解用户意图
第二步：确认关键需求
第三步：提供方案选择
第四步：执行实现
```

## 中文环境支持

### 语言识别

| 输入语言 | 响应语言 |
|----------|----------|
| 中文 | 中文 |
| 英文 | 英文 |
| 混合 | 中文为主 |

### 中文编码

```markdown
✅ 好的，我来帮你实现这个功能
✅ 这个实现方式有什么问题
✅ 让我解释一下这段代码的作用

❌ OK, let me help you
❌ The implementation has some issues
```

## 对话模式

### 追问式交互

```markdown
用户: 帮我写个排序算法
CodeBuddy: 你想用哪种排序算法？
- 快速排序：平均 O(n log n)
- 归并排序：稳定 O(n log n)
- 冒泡排序：简单 O(n²)
你有特定的性能要求或者数据规模吗？
```

### 解释式回复

```markdown
用户: 这段代码怎么工作的？
CodeBuddy: 这是一个二分查找算法，分三步：
1. 确定中间元素
2. 与目标值比较
3. 缩小搜索范围

代码流程：
[1, 3, 5, 7, 9] 找 7
→ 中间是 5，比 7 小
→ 在 [7, 9] 继续
→ 找到 7
```

## CodeBuddy 模式对比

| 特性 | Chat 模式 | Craft 模式 |
|------|-----------|------------|
| 交互风格 | 自然对话 | 指令执行 |
| 响应长度 | 适中 | 完整 |
| 解释程度 | 详细 | 简洁 |
| 适用场景 | 学习理解 | 快速实现 |

## 聊天功能

### 代码片段生成

```markdown
用户: 写个计算器
CodeBuddy: 好的，这是一个基础计算器：

```python
def calculator(a, op, b):
    operations = {
        '+': lambda x, y: x + y,
        '-': lambda x, y: x - y,
        '*': lambda x, y: x * y,
        '/': lambda x, y: x / y if y != 0 else 'Error'
    }
    return operations.get(op, lambda x, y: 'Invalid')(a, b)
```

需要我加上 GUI 界面吗？
```

### 错误调试

```markdown
用户: 程序报错了
CodeBuddy: 能把错误信息发给我吗？
另外，这个错误是在什么情况下出现的？
```

## 相关链接

- [[tools/codebuddy-craft]] - CodeBuddy 创作模式
- [[tools/cluely-default]] - Cluely 默认版本
- [[tools/junie-ai]] - Junie 探索代理

---

*来源：[CodeBuddy Chat System Prompt](https://github.com/codebuddy-ai)*
