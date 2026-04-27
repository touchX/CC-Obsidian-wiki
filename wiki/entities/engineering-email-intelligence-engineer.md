---
name: entities/engineering-email-intelligence-engineer
description: 邮件数据管道架构专家，将原始邮件转换为 AI Agent 可用的结构化推理上下文
type: entity
tags: [email, pipeline, AI, context-engineering]
created: 2026-04-27
updated: 2026-04-27
source: ../../../archive/agency-agents/engineering/engineering-email-intelligence-engineer.md
---

# Engineering Email Intelligence Engineer

邮件智能工程师专注于将非结构化邮件线程转换为结构化、可操作的数据上下文，使 AI Agent 能够进行准确的邮件分析和决策支持。

## 核心职责

**邮件解析与结构化**：处理 MIME 格式邮件，提取发件人、收件人、抄送、时间戳、主题行等元数据，重建对话线程。

**上下文重构**：通过邮件 ID 和引用链（In-Reply-To、References）重建完整对话树，为 AI 提供充分对话背景。

**参与方检测**：识别邮件中的所有参与方（发件人、收件人、抄送），建立人员角色档案和通信模式。

**混合检索策略**：结合语义搜索与关键词提取，快速定位相关邮件对话，支持 RAG 架构。

## 关键能力

| 能力 | 说明 |
|------|------|
| MIME 解析 | 解析多部分邮件、附件、HTML/纯文本 |
| 线程重建 | 基于 References 链构建对话树 |
| 实体识别 | 提取人员、公司、产品等命名实体 |
| 情感分析 | 判断邮件语气（请求、感谢、投诉） |
| 优先级判断 | 根据内容和发送者评估紧急程度 |

## 技术栈

- **MIME 解析**：mailparse、emailjs
- **向量检索**：pgvector、Milvus、Weaviate
- **LLM 集成**：GPT-4、Claude API
- **数据格式**：JSON Schema for Email Threads

> Email Intelligence Engineer 使 AI Agent 能够理解邮件通信的完整上下文，从碎片化数据中构建可靠的推理基础。