---
agent.skills.progressive.disclosure
name: agent-skills-progressive-disclosure
description: Agent Skills 渐进式披露机制：三层架构详解（元数据层、指令层、资源层）实现极致 token 优化
type: guide
tags: [claude, skills, progressive-disclosure, token-optimization, reference, script]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-agent-skills-progressive-disclosure.md
---

# Agent Skills 渐进式披露机制

> [!summary] Agent Skills 的核心设计机制 — 通过三层渐进式披露实现极致 token 优化
>
> **视频来源**：[马克的技术工作坊 - Bilibili](https://www.bilibili.com/video/BV1cGigBQE6n)

---

## 核心概念

**Agent Skills** 是大模型可以随时翻阅的说明文档，但它的强大之处在于**渐进式披露机制**（Progressive Disclosure）。

### 什么是渐进式披露？

通过**分层加载**策略，只在必要时才向模型暴露详细内容，从而：
- ✅ 节省大量 token
- ✅ 提升响应速度
- ✅ 保持上下文聚焦

---

## 三层架构详解

### 📊 第一层：元数据层（Metadata Layer）

**内容**：所有 Agent Skills 的 `name` + `description`

**加载机制**：始终加载

**作用**：相当于大模型的"目录"，模型每次回答前都会查看这一层，决定用户问题是否与某个 Skill 匹配

**示例**：
```yaml
name: meeting-summarizer
description: 用于总结会议录音内容，提取参会人员、议题和决定
```

**Token 消耗**：极低（只有名称和描述）

---

### 📝 第二层：指令层（Instruction Layer）

**内容**：`SKILL.md` 文件中的 instruction 部分（除元数据外的所有内容）

**加载机制**：按需加载（On-demand）

**触发条件**：只有当大模型发现用户问题与某个 Agent Skill 匹配时，才会加载该 Skill 的完整指令

**示例**：
```markdown
## 会议总结规则

你必须总结以下内容：
1. 参会人员
2. 议题
3. 决定

### 输出格式
- 参会人员：姓名
- 议题：讨论主题
- 决定：具体行动项
```

**Token 消耗**：中等（只在匹配时消耗）

---

### 📦 第三层：资源层（Resource Layer）

**内容**：Reference（读取） + Script（执行） + Assets（资源）

**加载机制**：按需中的按需（On-demand inside On-demand）

**触发条件**：只有在指令层中明确指定，且用户问题触发特定条件时才加载

#### Reference：条件触发读取

**特性**：
- 📖 读取文件内容到模型上下文
- 🎯 条件触发（如提到"钱"、"预算"时才读取财务手册）
- 💾 会消耗 token

**示例**：
```markdown
## 财务提醒规则

仅在提到钱、预算、采购、费用时触发：
- 读取 `集团财务手册.md`
- 指出会议决定中的金额是否超标
- 明确审批人
```

**效果**：
- ✅ 技术复盘会 → 不加载财务手册（节省 token）
- ✅ 预算讨论会 → 加载财务手册（提供合规提醒）

#### Script：执行不读取

**特性**：
- ⚡ 只执行脚本，不读取内容
- 🚀 几乎不消耗 token（即使脚本 1 万行）
- 📤 只关心执行方法和结果

**示例**：
```markdown
## 上传规则

如果用户提到"上传"、"同步"、"发送到服务器"：
- 必须运行 `upload.py` 脚本
- 将总结内容上传到服务器
```

**关键差异**：
- **Reference**：读取内容 → 消耗 token
- **Script**：执行代码 → 几乎不消耗 token

---

## 完整工作流示例

### 场景：会议总结 + 财务合规 + 自动上传

#### 1. 初始阶段（元数据层）

```
用户输入："总结以下会议内容"
↓
Claude Code 发送：
- 用户请求
- 所有 Skills 的 name + description
↓
Claude 判断：
→ 匹配 "meeting-summarizer"
→ 请求读取完整 SKILL.md
```

#### 2. 指令加载阶段（指令层）

```
用户确认同意
↓
Claude Code 读取：
- meeting-summarizer/SKILL.md 完整内容
↓
Claude 发现：
→ 会议内容涉及"预算 1200 元/晚"
→ 触发财务提醒规则
→ 请求读取财务手册
```

#### 3. 资源加载阶段（资源层 - Reference）

```
用户确认同意
↓
Claude Code 读取：
- 集团财务手册.md 内容
↓
Claude 生成总结：
- 参会人员、议题、决定
- 💰 财务提醒：1200 元/晚超标（标准 510 元/晚）
- 审批人：需财务总监批准
```

#### 4. 脚本执行阶段（资源层 - Script）

```
用户提到："上传到服务器"
↓
Claude Code 执行：
- upload.py 脚本
↓
上传完成，返回执行结果
```

---

## Token 优化效果

### 传统方案 vs 渐进式披露

| 方案 | Token 消耗 | 假设场景 |
|------|-----------|----------|
| **一次性加载所有内容** | 基准 100% | 每次对话都加载所有 Skills + 参考资料 |
| **渐进式披露** | **5-15%** | 只加载元数据，按需加载指令和资源 |

**具体案例**：
- 技术复盘会（无财务内容）：
  - ❌ 传统方案：加载财务手册（浪费 2000 tokens）
  - ✅ 渐进式披露：不加载财务手册（节省 2000 tokens）

- 预算讨论会（有财务内容）：
  - ❌ 传统方案：加载所有参考资料（包括不需要的法律手册）
  - ✅ 渐进式披露：只加载财务手册（精准匹配）

---

## 最佳实践

### 1. 编写强描述（元数据层）

**好的描述**：
```markdown
Comprehensive meeting summarizer for extracting attendees, topics, and decisions. 
Triggers financial compliance checks when budget/costs mentioned. 
Supports auto-upload to server via script.
```

**特点**：
- 明确触发场景
- 说明高级能力
- 提及相关资源

### 2. 条件触发 Reference（资源层）

**原则**：
- ✅ 明确触发条件（关键词、场景）
- ✅ 说明读取后的处理逻辑
- ✅ 避免过度加载

**示例**：
```markdown
## 法律合规检查

触发条件：提到"合同"、"协议"、"法律条款"
动作：
- 读取 `法律条款手册.md`
- 检查会议决定是否符合规定
- 标注潜在法律风险
```

### 3. Script 执行规范

**关键点**：
- ✅ 在 instruction 中清晰说明何时运行
- ✅ 明确脚本的输入和输出
- ✅ 提供执行失败的处理建议

**示例**：
```markdown
## 自动上传

触发：用户说"上传"、"同步"、"发送到服务器"

执行步骤：
1. 运行 `upload.py`，传入总结内容
2. 等待上传完成
3. 向用户展示上传结果（URL、文件大小等）

失败处理：
- 如果上传失败，提示用户检查网络连接
- 如果返回错误码，解释错误含义
```

---

## 高级技巧

### 1. 组合使用 Reference + Script

**场景**：会议总结 + 财务检查 + 自动上传

```markdown
## 完整工作流

1. 总结会议（基础功能）
2. 如果提到预算/费用：
   - 读取财务手册
   - 添加合规提醒
3. 如果用户说"上传"：
   - 运行 upload.py
   - 返回上传结果
```

### 2. 多 Reference 条件加载

**示例**：
```markdown
## 多维合规检查

- 提到"钱" → 读取 `财务手册.md`
- 提到"合同" → 读取 `法律条款.md`
- 提到"技术" → 读取 `技术规范.md`
```

### 3. Script 错误处理

**在 instruction 中说明**：
```markdown
## 上传失败处理

如果 upload.py 返回错误：
- HTTP 500：服务器错误，建议稍后重试
- HTTP 401：认证失败，检查 API 密钥
- HTTP 403：权限不足，联系管理员
```

---

## 常见问题

### Q1: 为什么 Script 不占 token？

**A**: Script 只执行，不读取。Claude Code 关心的是：
- 如何运行脚本（命令、参数）
- 运行结果是什么（输出、错误）

除非脚本无法运行，Claude Code 才会去查看代码内容（这时会消耗 token）。

### Q2: Reference 和 Script 如何选择？

| 场景 | 推荐方案 | 原因 |
|------|----------|------|
| 需要模型理解内容 | Reference | 必须读取到上下文 |
| 纯执行操作 | Script | 不需要理解代码 |
| 复杂数据处理 | Script | 代码逻辑不占 token |
| 简单数据查询 | Reference | 数据量小，直接读取 |

### Q3: 如何避免过度加载？

**策略**：
1. **精确的触发条件**：明确关键词和场景
2. **分层设计**：通用规则在指令层，特殊规则在资源层
3. **测试验证**：用不同场景测试，确认按需加载有效

---

## 相关页面

- [[concepts/agents-skills-paradigm]] - Agent Skills 范式概述
- [[concepts/agent-skills-vs-mcp]] - Agent Skill vs MCP 对比
- [[guides/skills-creation-guide]] - Skills 创建基础指南

---

## 参考资源

- **视频**：[Agent Skill 从使用到原理，一次讲清](https://www.bilibili.com/video/BV1cGigBQE6n)
- **官方文档**：[Anthropic Skills](https://www.anthropic.com/blog/skills)
- **GitHub**：[skills 示例仓库](https://github.com/anthropics/skills)

---

*最后更新：2026-05-04*
