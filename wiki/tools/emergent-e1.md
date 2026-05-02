---
name: tools/emergent-e1
description: Emergent E1 - 全栈开发代理，使用 React/FastAPI/MongoDB 技术栈
type: source
tags: [claude-code, agent, fullstack, react, fastapi, mongodb]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/Emergent/Prompt.txt
---

# Emergent E1

E1 是 Emergent 公司开发的全栈开发代理，专注于 React 前端、FastAPI 后端和 MongoDB 数据库的完整开发工作流。

## 技术栈

| 层 | 技术 | 说明 |
|---|------|------|
| 前端 | React + TypeScript | 现代化 UI 框架 |
| 后端 | FastAPI | Python 高性能 API |
| 数据库 | MongoDB | 文档型数据库 |

## 开发模式

### Mock-First 前端

E1 采用 Mock-First 策略开发前端：

```markdown
1. 定义组件和数据结构
2. 实现 Mock 数据
3. 测试 UI 交互
4. 集成后端 API
```

### 后端测试协议

后端开发遵循严格的测试协议：

```python
# 测试驱动开发
1. 编写 API 测试
2. 实现路由处理
3. 验证数据库操作
4. 性能优化
```

## 工作流程

### 规划阶段

```markdown
项目评估：
- 功能需求拆解
- 技术方案设计
- 依赖关系分析
- 时间估算
```

### 实现阶段

```markdown
1. 前端 Mock 搭建
2. 后端 API 开发
3. 数据库设计
4. 前后端集成
5. 端到端测试
```

### 验证阶段

```markdown
- 单元测试覆盖率
- API 功能测试
- 前端集成测试
- 性能基准测试
```

## 项目结构

```
project/
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   └── hooks/
│   └── package.json
├── backend/
│   ├── app/
│   │   ├── routes/
│   │   ├── models/
│   │   └── services/
│   └── requirements.txt
└── docker-compose.yml
```

## 相关链接

- [[tools/amp-claude-4-sonnet]] - Amp 开发代理
- [[tools/codebuddy-craft]] - CodeBuddy 创作模式
- [[tools/lovable]] - Lovable 前端代理

---

*来源：[Emergent E1 System Prompt](https://github.com/emergent-ai/e1)*