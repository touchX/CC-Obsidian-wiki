# ERR-001: Command 语法幻觉错误

## 错误元数据

```yaml
error_id: ERR-001
date: 2026-05-02
time: 6:01 PM
severity: critical
category: hallucination
status: resolved
root_cause: violated_wiki_first_principle
```

## 错误描述

### 错误内容

教用户 Command 使用 XML 标签语法：
- `<invoke name="Agent">`
- `<parameter name="prompt">xxx</parameter>`

### 正确内容

Command 实际使用纯 Markdown 自然语言：
```
使用 Agent 工具调用...
- subagent_type: xxx
- prompt: xxx
```

### 影响范围

- 创建了完全错误的教学文档（`2026-05-02-command-complete-guide.md`）
- 传播了不存在的语法知识
- 浪费了用户的学习时间
- 损害了项目的专业信誉

## 根因分析

### 流程层面

| 问题 | 说明 |
|------|------|
| ❌ 违反 Wiki-First | 没有先查询 `wiki/index.md` |
| ❌ 没有读取实际示例 | 项目中有 `weather-orchestrator.md` 但没有读取 |
| ❌ 凭记忆回答 | 依赖训练数据而非验证 |

### 认知层面

| 错误思维 | 实际情况 |
|----------|----------|
| "Command 需要特殊语法" | ✅ 确实需要，但是自然语言 |
| "XML 标签看起来专业" | ❌ 完全编造，无任何依据 |
| "我记住的应该是对的" | ❌ 过度自信，没有验证 |

### 资源层面

| 被忽视的资源 | 实际价值 |
|-------------|----------|
| `wiki/index.md` | 包含所有相关页面链接 |
| `.claude/commands/weather-orchestrator.md` | 真实正确的示例 |
| `CLAUDE.md` 中的 Wiki-First 原则 | 明确规定的强制规则 |

## 防止再犯措施

### 已创建的机制

1. ✅ **强制检查清单** → `.claude/rules/teaching-accuracy.md`
2. ✅ **三重验证协议** → `.claude/rules/verification-protocol.md`
3. ✅ **实时监控清单** → `.claude/rules/real-time-monitor.md`
4. ✅ **错误追踪系统** → `.claude/rules/error-tracking.md`

### 新增强制规则

```
【强制规则】技术教学三重验证

1. Wiki 验证（必须）
   - 读取 wiki/index.md
   - 读取相关 Wiki 页面

2. 实际示例验证（必须）
   - 读取项目中的真实文件
   - 验证语法格式完全一致

3. 来源标注（必须）
   - 每个技术事实标注来源
   - 引用具体文件路径和行号

违反任何一项 → 立即停止 → 执行验证
```

## 验证检查

```
[x] 检查清单已创建
[x] 验证协议已建立
[x] 监控机制已实施
[x] 错误已记录和分析
[x] 类似错误可以防止
```

## 经验教训

### 对个人

1. **准确性 > 速度**：30秒验证 > 10分钟错误修正
2. **Wiki-First 不是建议**：这是强制规则
3. **不确定时说不知道**：诚实比错误更好
4. **项目资源优先**：先利用已有资料

### 对项目

1. **建立强制机制**：不能依赖自觉，必须有流程
2. **可执行清单**：抽象原则不够，需要具体步骤
3. **实时监控**：每次操作前都要检查
4. **错误追踪**：记录、分析、改进

## 成功指标

| 指标 | ERR-001 前 | 目标 |
|------|------------|------|
| 验证执行率 | 0% | 100% |
| Wiki-First 遵守率 | 0% | 100% |
| 技术错误率 | 1次严重错误 | 0次 |
| 来源标注率 | 0% | 100% |

---

**状态**：✅ 已解决
**下次审查**：每周检查是否遵守新机制
**长期目标**：建立零错误技术教学标准
