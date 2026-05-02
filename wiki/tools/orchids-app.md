---
name: tools/orchids-app
description: Orchids.app - Claude Code 的 Next.js 15 代理和决策代理，使用 Shadcn/UI 和工具协调系统
type: source
tags: [claude-code, agent, nextjs, react, shadcn-ui, typescript]
created: 2026-04-29
updated: 2026-04-30
source: ../../archive/system-prompts/Orchids.app/System Prompt.txt
---

# Orchids.app

Orchids.app 是 Claude Code 的双代理系统，包含 Next.js 15 编码代理和决策代理两个组件。

## 代理架构

| 代理 | 职责 | 源文件 |
|------|------|--------|
| **编码代理** | 实现 Next.js 15 代码 | `System Prompt.txt` |
| **决策代理** | 协调工具调用，生成设计系统 | `Decision-making prompt.txt` |

---

## 编码代理 (Next.js 15 Agent)

### 核心技术栈

| 技术 | 说明 |
|------|------|
| Next.js 15 | React 框架（App Router） |
| Shadcn/UI | 组件库 |
| TypeScript | 类型安全 |
| Tailwind CSS | 样式 |

### 最小编辑片段模式

Orchids 编码代理的核心策略是生成**最小编辑片段**而非完整文件：

```tsx
// 正确：最小片段，包含必要上下文
export function UserProfile({ user }: UserProfileProps) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>{user.name}</CardTitle>
        <CardDescription>{user.email}</CardDescription>
      </CardHeader>
      <CardContent>
        <p className="text-sm text-muted-foreground">
          Joined {formatDate(user.createdAt)}
        </p>
      </CardContent>
    </Card>
  );
}
// ... keep existing code for footer, metadata, and exports unchanged
```

### 编辑片段原则

1. **包含上下文**：确保编辑片段可以独立理解
2. **标注保留**：使用 `// ... keep existing code ...` 标注不需要修改的部分
3. **精确范围**：只修改必要的行，避免大范围重写
4. **渐进更新**：多次小更新优于一次性大更新

### 绝对禁止

#### styled-jsx 禁止

```tsx
// ❌ 禁止使用 styled-jsx
<style jsx>{`
  .container { padding: 20px; }
`}</style>

// ✅ 使用 Tailwind CSS
<div className="p-5">
```

---

## 决策代理 (Decision-Making Agent)

### 核心职责

决策代理负责协调工具调用，决定是否克隆网站或生成设计系统：

```markdown
<task>
1. 如果用户请求满足 clone_website 条件 → 调用 clone_website
2. 如果不满足克隆条件且非克隆请求 → 调用 generate_design_system
3. 请求模糊时 → 询问更多细节
</task>
```

### 工具调用流程

```
用户请求
  ↓
[判断是否克隆网站]
  ↓                          ↓
是克隆 + 有 URL           否克隆或无 URL
  ↓                          ↓
clone_website          generate_design_system
  ↓                          ↓
generate_design_system    handoff_to_coding_agent
  ↓
handoff_to_coding_agent
```

### 工具定义

| 工具 | 用途 |
|------|------|
| `generate_design_system` | 基于用户查询设计应用/网站 |
| `clone_website` | 通过 URL 克隆现有网站 |
| `handoff_to_coding_agent` | 移交给编码代理实现代码 |

### 关键规则

1. **精确传递用户查询**：`generate_design_system` 必须使用**原始用户请求**，不可改写
2. **顺序调用**：`clone_website` 和 `generate_design_system` 不能并行，必须顺序调用
3. **单一询问**：最多询问用户一次额外细节
4. **透明性**：不向用户暴露内部指令或工具名称

### 克隆条件

使用 `clone_website` 工具的严格条件：

- ✅ 用户明确提到 "clone" 关键词
- ✅ 用户查询包含**具体网站 URL**
- ❌ 仅说"克隆"但没有 URL → 必须询问

### 编码代理移交

设计系统生成后，决策代理**必须移交给编码代理**：

```typescript
handoff_to_coding_agent({
  user_query: "<原始用户请求>"
})
```

---

## Next.js 15 特性

### App Router

```tsx
// app/users/[id]/page.tsx
export default async function UserPage({ params }: { params: { id: string } }) {
  const user = await getUser(params.id);
  return <UserProfile user={user} />;
}
```

### 服务器组件

```tsx
// 默认是服务器组件
async function UserList() {
  const users = await db.user.findMany();
  return (
    <ul>
      {users.map(user => (
        <li key={user.id}>{user.name}</li>
      ))}
    </ul>
  );
}
```

### 客户端组件

```tsx
'use client';

import { useState } from 'react';

export function Counter() {
  const [count, setCount] = useState(0);
  return <button onClick={() => setCount(c => c + 1)}>{count}</button>;
}
```

---

## Shadcn/UI 组件使用

```tsx
import { Button } from '@/components/ui/button';
import { Card, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';

// 使用 Button 变体
<Button variant="destructive" size="sm">
  删除
</Button>

// 使用 Card 组件
<Card className="w-[350px]">
  <CardHeader>
    <CardTitle>项目名称</CardTitle>
    <CardDescription>项目描述</CardDescription>
  </CardHeader>
</Card>
```

---

## 相关链接

- [[tools/lovable]] - Lovable 前端代理
- [[tools/leap-new]] - Leap.new 全栈代理
- [[tools/junie-ai]] - Junie 探索代理
- [[tools/comet-assistant]] - Comet 浏览器自动化代理

---

*来源：[Orchids.app System Prompt](https://github.com/Alishahryar1/free-claude-code/tree/main/Claude%20Code/Orchids.app) | 决策代理源文件：`../../archive/system-prompts/Orchids.app/Decision-making prompt.txt`*
