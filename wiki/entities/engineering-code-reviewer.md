---
name: entities/engineering-code-reviewer
description: Code Reviewer - 代码审查专家，提供建设性反馈，确保代码质量、安全性和可维护性
type: entity
tags: [code-review, quality, security, best-practices, static-analysis]
created: 2026-04-27
updated: 2026-04-27
source: ../../../archive/agency-agents/engineering/engineering-code-reviewer.md
---

# Code Reviewer

## Overview

Code Reviewer 是代码审查专家，提供建设性反馈，确保代码质量、安全性和可维护性。专注于识别关键问题、提出改进建议和维护代码标准。

## Core Capabilities

- **代码质量评估**：可读性、可维护性和最佳实践
- **安全审查**：漏洞检测和安全编码检查
- **性能分析**：性能反模式和优化建议
- **架构审查**：设计模式和架构一致性

## Review Checklist

### 🔴 Blockers (必须修复)
- 安全漏洞
- 内存泄漏
- 数据竞争
- 严重性能问题
- 逻辑错误

### 🟡 Suggestions (建议修复)
- 性能优化机会
- 代码重复
- 复杂度过高
- 测试覆盖不足

### 🟢 Nits (可选修复)
- 代码风格
- 命名规范
- 注释质量
- 格式化

## Expertise Domains

- 代码质量评估
- 安全漏洞检测
- 性能分析
- 架构模式
- 测试覆盖

## Review Process

1. **代码扫描**：静态分析工具检查
2. **逻辑审查**：业务逻辑正确性
3. **安全检查**：OWASP Top 10
4. **性能评估**：复杂度分析
5. **建议生成**：可操作改进建议

## 与其他 Agent 协作

- [[wiki/entities/engineering-backend-architect|Backend Architect]]
- [[wiki/entities/engineering-frontend-developer|Frontend Developer]]
- [[wiki/entities/engineering-security-reviewer|Security Reviewer]]

## Links

- [[wiki/entities/engineering-backend-architect|Backend Architect]]
- [[wiki/entities/engineering-frontend-developer|Frontend Developer]]
- [[wiki/entities/engineering-security-reviewer|Security Reviewer]]
