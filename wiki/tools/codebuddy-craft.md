---
name: tools/codebuddy-craft
description: CodeBuddy Craft - 高效代码生成模式，专注快速实现
type: source
tags: [claude-code, agent, code-generation, productivity]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/system-prompts/CodeBuddy Prompts/Craft Prompt.txt
---

# CodeBuddy Craft

CodeBuddy Craft 是 CodeBuddy 的高效代码生成模式，专注于快速生成完整的、可直接使用的代码。

## 模式特点

### 完整性优先

```markdown
用户: 创建一个 REST API
Craft: [直接生成完整代码]

✅ 包含路由定义
✅ 包含数据模型
✅ 包含错误处理
✅ 包含 API 文档
```

### 最小对话

```
指令 → 执行 → 交付
```

## 代码模板

### 项目结构

```
project/
├── src/
│   ├── index.ts
│   ├── routes/
│   ├── models/
│   └── utils/
├── tests/
├── package.json
└── README.md
```

### 模板系统

```yaml
templates:
  rest_api:
    framework: express
    orm: prisma
    auth: jwt
    
  next_app:
    framework: next.js
    ui: tailwind
    state: zustand
```

## 实现模式

### 一步到位

```markdown
用户: 用 Express 创建一个用户 API
Craft → 直接生成:

```typescript
// routes/users.ts
import { Router } from 'express';
import { UserController } from '../controllers';

const router = Router();

router.get('/', UserController.list);
router.post('/', UserController.create);
router.get('/:id', UserController.get);
router.put('/:id', UserController.update);
router.delete('/:id', UserController.delete);

export default router;
```
```

### 上下文复用

```markdown
Craft 记住：
- 项目结构
- 已使用的技术栈
- 代码风格
- 命名规范
```

## CodeBuddy 模式对比

| 特性 | Chat 模式 | Craft 模式 |
|------|-----------|------------|
| 交互风格 | 自然对话 | 指令执行 |
| 响应速度 | 较慢 | 快速 |
| 代码完整性 | 按需生成 | 完整模板 |
| 适用场景 | 学习探索 | 快速开发 |

## 最佳实践

### 清晰指令

```markdown
✅ 好的指令
"创建一个 Express REST API，包含用户 CRUD"

❌ 模糊指令
"帮我做个后端"
```

### 明确范围

```markdown
✅ 明确范围
"用 TypeScript，写好类型定义，包含单元测试"

❌ 模糊范围
"尽量完整一点"
```

## 性能优化

### 代码效率

```typescript
// Craft 自动优化
// ❌ 低效
for (let i = 0; i < arr.length; i++) {
  if (arr[i] > 0) result.push(arr[i]);
}

// ✅ 高效
const result = arr.filter(n => n > 0);
```

### 类型安全

```typescript
// Craft 强制类型定义
interface User {
  id: string;
  email: string;
  name: string;
  createdAt: Date;
}
```

## 相关链接

- [[tools/codebuddy-chat]] - CodeBuddy 聊天模式
- [[tools/lovable]] - Lovable 前端代理
- [[tools/orchids-app]] - Orchids Next.js 代理

---

*来源：[CodeBuddy Craft System Prompt](https://github.com/codebuddy-ai)*
