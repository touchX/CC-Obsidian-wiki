---
name: tools/leap-new
description: Leap.new - Claude Code 全栈开发代理，使用 Encore.ts 后端和 <leapArtifact> 格式
type: source
tags: [claude-code, agent, fullstack, encore, react, typescript]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/Leap.new/Prompts.txt
---

# Leap.new

Leap.new 是 Claude Code 的全栈开发代理，结合 Encore.ts 后端框架和 React 前端技术栈。

## 核心技术栈

### 后端 (Encore.ts)

| 功能 | 说明 |
|------|------|
| SQL Database | 数据库操作 |
| Object Storage | 文件存储 |
| Pub/Sub | 消息队列 |
| Secrets | 密钥管理 |
| Auth | 身份认证（Clerk） |

### 前端

| 技术 | 说明 |
|------|------|
| React | UI 框架 |
| TypeScript | 类型安全 |
| Vite | 构建工具 |
| Tailwind CSS | 样式框架 |
| shadcn-ui | 组件库 |

## XML 输出格式

Leap.new 使用 `<leapArtifact>` XML 标签输出完整的文件内容：

```xml
<leapArtifact id="..." title="..." description="...">
  <leapFile path="backend/service.ts">
    // 完整文件内容
  </leapFile>
  <leapFile path="frontend/App.tsx">
    // 完整文件内容
  </leapFile>
</leapArtifact>
```

## 工作流程

1. **需求分析**：理解用户需求，确定技术方案
2. **后端开发**：使用 Encore.ts 创建 API、服务、数据库模型
3. **前端开发**：使用 React + TypeScript + Tailwind 构建 UI
4. **组件集成**：使用 shadcn-ui 组件库快速构建

## 文件结构规范

```
backend/
├── services/          # Encore 服务
├── models/            # 数据模型
├── middleware/        # 中间件
└── config/            # 配置文件

frontend/
├── components/        # React 组件
├── pages/            # 页面组件
├── hooks/            # 自定义 Hooks
├── lib/              # 工具函数
└── types/            # TypeScript 类型
```

## 身份认证

使用 Clerk 进行身份认证：
- 用户注册/登录
- Session 管理
- 权限控制

## 数据库操作

```typescript
// 使用 Encore 的 SQL Database
import { sql } from 'encore.dev/db';

const db = sql<User>`SELECT * FROM users WHERE id = $1`;
```

## 存储服务

使用 Object Storage 处理文件上传：
- 用户头像
- 文档附件
- 媒体文件

## 相关链接

- [[tools/junie-ai]] - Junie 只读探索代理
- [[tools/lovable]] - Lovable 前端代理
- [[tools/orchids-app]] - Orchids Next.js 代理
- [[resources/github-repos/obra-superpowers]] - Superpowers 工作流

---

*来源：[Leap.new Agent System Prompts](https://github.com/Alishahryar1/leap-new)*