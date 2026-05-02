---
name: google-antigravity-prompts
description: Google DeepMind Antigravity AI 编程助手系统提示词 — Fast Prompt 与 Planning Mode 两个版本的完整集合
type: source
tags: [google, antigravity, deepmind, ai-assistant, system-prompts, planning-mode, knowledge-items, agent-tools]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/sources/system-prompts/Google/Antigravity/
github_url: https://deepmind.google/technologies/antigravity/
language: Text
license: Proprietary
---

# Google Antigravity 系统提示词

> **Google DeepMind Antigravity AI 编程助手系统提示词** — Fast Prompt 与 Planning Mode 两个版本的完整集合，涵盖任务边界、工具调用、工作流和通信风格

## 基本信息

| 项目 | 信息 |
|------|------|
| **工具** | Google Antigravity |
| **开发商** | Google DeepMind |
| **提示词数量** | 2 个文件（Fast Prompt + Planning Mode）|
| **总行数** | 522 行 |
| **核心特点** | 任务可视化、用户通知、知识系统 |

## 核心价值

### 📝 双模式设计

Antigravity 系统提示词提供了两种互补的工作模式：

| 模式 | 文件 | 行数 | 特点 |
|------|------|------|------|
| **Fast Prompt** | Fast Prompt.txt | 214 | 快速响应，标准代理模式 |
| **Planning Mode** | planning-mode.txt | 308 | 增强知识发现，持久上下文 |

### 🔑 关键演进

**Fast Prompt → Planning Mode**:
- 新增 **knowledge_discovery** 模块
- 新增 **persistent_context** 模块
- 强调 **KI (Knowledge Items)** 系统
- 增强对话日志检索能力
- 优化长期上下文管理

## 提示词分类

### 1. Fast Prompt（标准模式）

**文件**: `Fast Prompt.txt` (214 行)

**核心模块**:
- **identity**: Antigravity AI 编程助手身份定义
- **user_information**: 用户上下文和偏好设置
- **agentic_mode_overview**: 代理模式概览
- **tool_calling**: 工具调用规范和策略
- **web_application_development**: Web 应用开发指导
- **workflows**: 标准工作流程
- **communication_style**: 通信风格和用户交互

**工具定义**:
- `task_boundary`: 定义任务边界和范围
- `notify_user`: 向用户发送通知和更新

**适用场景**: 日常编码任务、快速原型开发、标准编程工作流

### 2. Planning Mode（增强模式）

**文件**: `planning-mode.txt` (308 行)

**新增模块**:
- **knowledge_discovery**: 知识发现系统
  - KI (Knowledge Items) 检查流程
  - 代码库语义搜索
  - 相关性排序和过滤

- **persistent_context**: 持久上下文管理
  - 对话日志检索策略
  - 长期记忆维护
  - 上下文窗口优化

**核心增强**:
1. **KI 检查流程**:
   ```
   用户查询 → KI 检索 → 相关性排序 → 上下文注入
   ```

2. **对话日志检索**:
   - 基于语义相似度
   - 时间衰减权重
   - 多轮对话聚合

3. **任务可视化**:
   - 实时进度更新
   - 里程碑通知
   - 阶段性总结

**适用场景**: 复杂项目规划、长期代码库维护、知识密集型任务

## 技术架构

### 模块对比

| 模块 | Fast Prompt | Planning Mode | 增强 |
|------|-------------|---------------|------|
| identity | ✅ | ✅ | 一致 |
| tool_calling | ✅ | ✅ | 一致 |
| knowledge_discovery | ❌ | ✅ | **新增** |
| persistent_context | ❌ | ✅ | **新增** |
| workflows | ✅ | ✅ | 增强 |
| communication_style | ✅ | ✅ | 增强 |

### 工具定义

**Fast Prompt 工具**:
```json
{
  "task_boundary": {
    "description": "定义任务边界",
    "parameters": ["scope", "constraints", "deliverables"]
  },
  "notify_user": {
    "description": "通知用户",
    "parameters": ["message", "progress", "milestone"]
  }
}
```

**Planning Mode 工具**（继承 + 新增）:
```json
{
  "ki_search": {
    "description": "搜索知识项",
    "parameters": ["query", "filters", "limit"]
  },
  "context_retrieve": {
    "description": "检索对话历史",
    "parameters": ["session_id", "time_range", "relevance_threshold"]
  }
}
```

## 工作流程

### Fast Prompt 工作流

```
用户请求 → 理解需求 → 工具调用 → 执行任务 → 通知用户
```

### Planning Mode 工作流

```
用户请求 → KI 检索 → 上下文注入 → 规划任务 → 执行 → 持久化知识 → 通知用户
```

## 使用指南

### 模式选择

| 需求 | 推荐模式 |
|------|----------|
| 简单编码任务 | Fast Prompt |
| 快速原型开发 | Fast Prompt |
| 复杂项目规划 | Planning Mode |
| 长期代码库维护 | Planning Mode |
| 知识密集型任务 | Planning Mode |

### 配置建议

**Fast Prompt 配置**:
- 专注于当前任务
- 最小化上下文
- 快速响应优先

**Planning Mode 配置**:
- 启用 KI 检索
- 配置对话日志保留期
- 设置相关性阈值
- 优化上下文窗口

## 相关资源

| 链接 | 说明 |
|------|------|
| [Google DeepMind](https://deepmind.google) | DeepMind 官网 |
| [Antigravity 产品页](https://deepmind.google/technologies/antigravity/) | Antigravity 产品介绍 |
| [AI 工具系统提示词大全](../sources/ai-tools-system-prompts.md) | 50+ AI 工具提示词集合 |

## 标签

#google #antigravity #deepmind #ai-assistant #system-prompts #planning-mode #knowledge-items #agent-tools

---

*收集时间：2026-04-29*
