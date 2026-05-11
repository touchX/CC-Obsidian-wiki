---
name: opencode-alternative
description: OpenCode 开源方案 — 开源版 Claude Code，支持任意模型、多厂商对接
type: tutorial
tags: [opencode, 开源方案, claude-code-alternative, multi-agent, 视频教程]
created: 2026-05-11
updated: 2026-05-11
source: ../../../archive/clippings/bilibili/2026-05-11-Claude Code又封号-别折腾了-这个开源方案省心多了.md
external_url: https://www.bilibili.com/video/BV1u1cxzrEGM
video_author: 程序员阿江-Relakkes
video_bvid: BV1u1cxzrEGM
---

# OpenCode 开源方案

> [!info] 来源
> - Bilibili 视频：[Claude Code又封号？别折腾了，这个开源方案省心多了](https://www.bilibili.com/video/BV1u1cxzrEGM)
> - 作者：程序员阿江-Relakkes
> - 上传日期：2026-02-11
> - 归档副本：[[../../../archive/clippings/bilibili/2026-05-11-Claude Code又封号-别折腾了-这个开源方案省心多了.md|本地归档]]

---

## 核心痛点与解决方案

### 被封号的困境

Claude Code 官方订阅面临的问题：
- 被封号后申诉无门
- 需要翻墙使用
- 模型选择受限

### OpenCode 解决方案

| 优势 | 说明 |
|------|------|
| **任意模型支持** | 支持多家厂商，国内外模型均可 |
| **代码完全开源** | 免费、可定制、社区贡献 |
| **多 Agent 协作** | 通过插件实现多模型分工 |

---

## OpenCode 是什么

一句话：**开源版的 Claude Code**

功能与 Claude Code 相似，但有独特优势：

```
用户输入 → 会话管理 → Agent → Plan → Build → 结果
                              ↓
                     OpenCode 独有：多厂商模型调度层
```

### 核心架构

```
┌─────────────────────────────────────────────┐
│                   用户输入层                  │
└─────────────────────────────────────────────┘
                      ↓
┌─────────────────────────────────────────────┐
│                 会话管理层                    │
└─────────────────────────────────────────────┘
                      ↓
         ┌─────────────────────────────┐
         │      Agent 调度层          │
         │  (主控/代码/探索/UI 等)     │
         └─────────────────────────────┘
                      ↓
┌─────────────────────────────────────────────┐
│  OpenCode 独有：多厂商模型调度层              │
│  • 支持 Anthropic 协议                      │
│  • 支持其他各种供应商                       │
│  • 国产/国际模型均可                        │
└─────────────────────────────────────────────┘
```

---

## Oh My OpenCode 插件

> [!tip] 社区插件
> oh-my-opencode 是社区开发的插件，现已 **30k Stars**，提供完整的多 Agent 多模型协作机制。

### 内置 10 个 Agent

| Agent | 职责 |
|-------|------|
| **主控 Agent** | 协调和调度 |
| **代码 Agent** | 编写和执行代码 |
| **探索 Agent** | 代码库探索 |
| **UI Agent** | 前端界面开发 |
| ... | 更多专业 Agent |

### 工作流程

```
用户输入
    ↓
拦截 OpenCode 钩子
    ↓
增强上下文 / 选择 Agent
    ↓
多模型协作（并行）
    ↓
返回结果
```

### 设计理念

| 理念 | 说明 |
|------|------|
| **专业 Agent 做专业事** | 每个 Agent 专注特定任务 |
| **规划与执行分离** | Plan 和 Build 解耦 |
| **并行执行** | 复杂任务可同时处理 |

---

## 多模型协作策略

### 模型分工

| 模型 | 用途 |
|------|------|
| **Claude 4.6** | 架构设计 |
| **GPT 5.3 Codex** | 代码执行 |
| **Gemini 3.0 Pro** | 前端 UI |

### 理想状态

```
复杂任务 → 专业模型处理
简单任务 → 轻量模型处理
```

---

## 安装与配置

### 安装步骤

1. 安装 OpenCode
2. 安装 Oh My OpenCode 插件
3. 配置多模型 API
4. 配置 Agent

### 配置示例

```yaml
# 模型配置
models:
  - provider: anthropic
    model: claude-4-6
  - provider: openai
    model: gpt-5.3-codex
  - provider: google
    model: gemini-3.0-pro

# Agent 配置
agents:
  - name: architect
    model: claude-4-6
  - name: coder
    model: gpt-5.3-codex
  - name: ui-designer
    model: gemini-3.0-pro
```

### 接口 AI 中转站

解决封号问题的方案：
- 注册送 $3 额度
- 支持多模型切换
- 稳定可靠的 API

---

## 相关链接

| 资源 | 链接 |
|------|------|
| **接口AI** | https://jiekou.ai/referral?invited_code=HNUXWY |
| **OpenCode** | https://github.com/anomalyco/opencode |
| **Oh My OpenCode** | https://github.com/code-yeongyu/oh-my-opencode |

---

## 视频时间戳

| 时间 | 章节 |
|------|------|
| `00:00` | 开场 |
| `00:27` | OpenCode 介绍 |
| `00:51` | oh-my-opencode 插件 |
| `01:50` | 多 Agent 机制 |
| `03:24` | 安装教程 |
| `05:15` | 模型配置 |
| `06:18` | 接口 AI 中转站 |
| `08:46` | 实战演示 |
| `13:04` | 总结 |

---

## 相关资源

- [[agent-teams]] — Claude Code 官方多 Agent 协作方案
- [[subagents]] — Claude Code 子代理配置
- [[claude-commands]] — Claude Code 命令参考

---

*文档创建于 2026-05-11*
*来源：Bilibili - 程序员阿江-Relakkes*
*主题：OpenCode 开源替代方案*
*类型：视频教程*
