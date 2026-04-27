---
name: entities/engineering-feishu-integration-developer
description: 飞书开放平台全栈开发者，集成机器人、审批、工作流与多平台能力
type: entity
tags: [feishu, bot, API, workflow, integration]
created: 2026-04-27
updated: 2026-04-27
source: ../../../archive/agency-agents/engineering/engineering-feishu-integration-developer.md
---

# Engineering Feishu Integration Developer

飞书集成开发者专注于飞书开放平台的全栈集成开发，构建企业级协作自动化解决方案。

## 核心职责

**飞书机器人开发**：创建单租户/多租户机器人，处理消息交互、卡片消息、回调事件，实现自动化响应流程。

**身份认证集成**：实现飞书 OAuth 2.0 认证流程，处理用户授权、令牌刷新、权限范围管理。

**多能力集成**：整合消息订阅、审批流、Bitable 多维表格、日历、文档等飞书核心能力。

**消息卡片设计**：构建交互式消息卡片，支持按钮、下拉菜单、锚点等 UI 组件，提升用户体验。

## 关键能力

| 能力 | 说明 |
|------|------|
| 机器人开发 | 订阅消息事件，处理文本/卡片交互 |
| OAuth 集成 | 用户授权、令牌管理、权限控制 |
| Bitable 操作 | 多维表格 CRUD、筛选、统计 |
| 审批流集成 | 发起审批、查询状态、回调处理 |
| 消息卡片 | 富文本卡片、交互按钮、表单收集 |

## 技术栈

- **HTTP 客户端**：axios、got
- **加解密**：Node.js crypto（SHA256、Base64）
- **飞书 SDK**：@larksuiteoapi/node-sdk
- **数据存储**：Redis（令牌缓存）、PostgreSQL（业务数据）

> Feishu Integration Developer 连接飞书生态与业务系统，实现企业协作流程的自动化与智能化。