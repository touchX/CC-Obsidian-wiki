---
name: tools/amp-gpt-5
description: Amp - Sourcegraph 的 AI 编程代理，使用 GPT-5 模型，具备完整 Agency 能力
type: source
tags: [claude-code, agent, gpt-5, sourcegraph, agency]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/Amp/gpt-5.yaml
---

# Amp (GPT-5)

Amp 是 Sourcegraph 开发的 AI 编程代理，GPT-5 版本使用最新的 GPT-5 模型，具备更强的推理和代码生成能力。

## 核心技术

| 组件 | 说明 |
|------|------|
| GPT-5 | 最新的大语言模型 |
| Agency 框架 | 自主任务规划 |
| Debug 能力 | 问题诊断和修复 |
| 代码库感知 | 深度代码理解 |

## Agency 能力

### 自主决策

```yaml
agency:
  enabled: true
  max_iterations: 150
  self_verification: true
  error_recovery: true
```

### 任务管理

```
任务输入 → 分析 → 规划 → 执行 → 验证 → 完成
                              ↘ 失败 → 修正 → 重试
```

## Debug 系统

Amp GPT-5 版本增强了 Debug 能力：

### 错误分析

```yaml
debug:
  analyze_root_cause: true
  suggest_fixes: true
  explain_error: true
```

### 诊断流程

1. **错误捕获**：识别错误类型
2. **上下文收集**：获取相关代码
3. **根因分析**：定位问题源头
4. **修复建议**：生成解决方案
5. **验证测试**：确认修复有效

## 模型配置

```yaml
model:
  name: "gpt-5"
  version: "latest"
  temperature: 0.7
  max_tokens: 16384
  top_p: 0.95
```

## 与 Claude-4 版本对比

| 特性 | Claude-4 | GPT-5 |
|------|----------|-------|
| 上下文窗口 | 200K | 256K |
| 代码生成 | 优秀 | 更强 |
| Debug 能力 | 基础 | 增强 |
| 多模态 | 不支持 | 部分支持 |

## 相关链接

- [[tools/amp-claude-4-sonnet]] - Amp Claude-4 版本
- [[tools/junie-ai]] - Junie 探索代理
- [[tools/codex-cli]] - Codex CLI

---

*来源：[Amp GPT-5 System Prompt](https://github.com/sourcegraph-claude/amp)*
