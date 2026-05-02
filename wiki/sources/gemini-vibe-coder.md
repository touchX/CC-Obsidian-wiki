---
name: gemini-vibe-coder
description: Google AI Studio Vibe Coder 模式完整指南 — React 18+、TypeScript、Tailwind CSS 现代开发规范与 Gemini API 集成
type: source
version: 1.0
tags: [google, gemini, ai-studio, vibe-coder, react, typescript, tailwind, web-development, api-integration, function-calling]
created: 2026-04-29
updated: 2026-04-29
source: ../../archive/sources/system-prompts/Google/Gemini/
github_url: https://aistudio.google.com
language: Text
license: Proprietary
---

# Gemini Vibe Coder

> **Google AI Studio Vibe Coder 模式完整指南** — React 18+、TypeScript、Tailwind CSS 现代开发规范与 Gemini API 深度集成

## 基本信息

| 项目 | 信息 |
|------|------|
| **平台** | Google AI Studio |
| **模式** | Vibe Coder |
| **文档长度** | 1,645 行 |
| **技术栈** | React 18+, TypeScript, Tailwind CSS, Gemini API |
| **核心特点** | 设计美学驱动，API 完整集成 |

## 核心价值

### 🎨 设计与功能并重

Vibe Coder 模式强调：

| 维度 | 要求 |
|------|------|
| **设计美学** | 现代视觉设计，出色用户体验 |
| **代码质量** | TypeScript 类型安全，React 最佳实践 |
| **API 集成** | Gemini API 深度集成（Function Calling、Live API、Grounding） |
| **开发效率** | 快速迭代，实时预览，生产就绪 |

### 🛠️ 技术栈规范

**前端框架**:
- React 18+ (函数组件、Hooks、Suspense)
- TypeScript 5+ (严格类型检查)
- Tailwind CSS 3+ (实用优先样式)

**API 集成**:
- Google Gemini API (Generate Content、Streaming、Function Calling)
- Live API (实时音频/视频交互)
- Grounding (Search、Maps 实时数据)

## 文档结构

### 1. React 开发规范

**组件模式**:
```typescript
// 函数组件 + Hooks
export function Component({ prop }: Props) {
  const [state, setState] = useState(initial)

  useEffect(() => {
    // 副作用
  }, [deps])

  return <div>{/* JSX */}</div>
}
```

**最佳实践**:
- 使用函数组件，避免类组件
- 自定义 Hooks 逻辑复用
- Context API 状态管理
- 错误边界处理

### 2. TypeScript 规范

**类型定义**:
```typescript
interface Props {
  title: string
  count: number
  onClick: () => void
}

type Status = 'loading' | 'success' | 'error'
```

**严格模式**:
- 启用 `strict: true`
- 避免使用 `any`
- 使用类型断言 sparingly
- 泛型约束

### 3. Tailwind CSS 规范

**实用优先**:
```html
<div class="flex items-center justify-between p-4 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow">
  <!-- 内容 -->
</div>
```

**设计系统**:
- 一致的颜色调色板
- 响应式断点 (sm, md, lg, xl, 2xl)
- 深色模式支持
- 可访问性 (ARIA)

## Gemini API 集成

### 1. 初始化与配置

**API 客户端设置**:
```typescript
import { GoogleGenerativeAI } from '@google/generative-ai'

const genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY)
const model = genAI.getGenerativeModel({ model: 'gemini-2.0-flash-exp' })
```

**模型选择**:
| 模型 | 用途 | 特点 |
|------|------|------|
| **gemini-2.0-flash-exp** | 快速响应 | 实时交互 |
| **gemini-1.5-pro** | 复杂任务 | 深度推理 |
| **gemini-1.5-flash** | 轻量级 | 快速原型 |

### 2. Generate Content API

**基础调用**:
```typescript
const prompt = "Write a React component for a todo list"
const result = await model.generateContent(prompt)
const response = await result.response.text()
```

**高级选项**:
```typescript
const result = await model.generateContent({
  contents: [{ role: 'user', parts: [{ text: prompt }] }],
  generationConfig: {
    temperature: 0.7,
    topK: 40,
    topP: 0.95,
    maxOutputTokens: 8192,
  },
})
```

### 3. Streaming API

**实时流式输出**:
```typescript
const result = await model.generateContentStream(prompt)

for await (const chunk of result.stream) {
  const chunkText = chunk.text()
  console.log(chunkText)
}
```

**UI 集成**:
```typescript
const [streaming, setStreaming] = useState(false)
const [content, setContent] = useState('')

const handleStream = async () => {
  setStreaming(true)
  const result = await model.generateContentStream(prompt)

  for await (const chunk of result.stream) {
    setContent(prev => prev + chunk.text())
  }
  setStreaming(false)
}
```

### 4. Function Calling

**工具定义**:
```typescript
const tools = [
  {
    functionDeclarations: [
      {
        name: 'get_weather',
        description: 'Get weather information for a location',
        parameters: {
          type: 'object',
          properties: {
            location: {
              type: 'string',
              description: 'City name',
            },
          },
          required: ['location'],
        },
      },
    ],
  },
]
```

**Function Calling 调用**:
```typescript
const model = genAI.getGenerativeModel({ model: 'gemini-2.0-flash-exp', tools })

const result = await model.generateContent(prompt)
const functionCall = result.response.functionCalls()[0]

if (functionCall.name === 'get_weather') {
  const { location } = functionCall.args
  const weather = await getWeatherData(location)
  // 发送结果回模型
}
```

### 5. Live API

**实时音频交互**:
```typescript
import { GoogleAICoreHelper } from '@google/generative-ai'

const helper = new GoogleAICoreHelper({ apiKey: process.env.GEMINI_API_KEY })

// 音频输入
await helper.sendAudioChunk(audioChunk)

// 实时响应
helper.on('text', (text) => {
  console.log('Live response:', text)
})
```

### 6. Grounding (Search & Maps)

**Search Grounding**:
```typescript
const model = genAI.getGenerativeModel({
  model: 'models/gemini-2.0-flash-exp',
  tools: [{ googleSearchRetrieval: {} }],
})

const result = await model.generateContent(prompt)
const groundingInfo = await result.response.groundingMetadata
```

**Maps Grounding**:
```typescript
const model = genAI.getGenerativeModel({
  model: 'models/gemini-2.0-flash-exp',
  tools: [{ googleMapsRetrieval: {} }],
})
```

## 开发工作流

### 1. 项目初始化

```bash
# 创建 Vite + React + TypeScript 项目
npm create vite@latest my-app -- --template react-ts

# 安装依赖
cd my-app
npm install

# 安装 Tailwind CSS
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
```

### 2. 配置 Tailwind

**tailwind.config.js**:
```javascript
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        primary: '#your-brand-color',
      },
    },
  },
  plugins: [],
}
```

### 3. 配置 Gemini API

**src/lib/gemini.ts**:
```typescript
import { GoogleGenerativeAI } from '@google/generative-ai'

const apiKey = import.meta.env.VITE_GEMINI_API_KEY
export const genAI = new GoogleGenerativeAI(apiKey)
export const model = genAI.getGenerativeModel({
  model: 'gemini-2.0-flash-exp'
})
```

### 4. 创建组件

**src/components/ChatComponent.tsx**:
```typescript
import { useState } from 'react'
import { model } from '@/lib/gemini'

export function ChatComponent() {
  const [messages, setMessages] = useState<Array<{role: string, text: string}>>([])
  const [input, setInput] = useState('')

  const handleSubmit = async () => {
    const userMessage = { role: 'user', text: input }
    setMessages(prev => [...prev, userMessage])

    const result = await model.generateContent(input)
    const response = await result.response.text()

    setMessages(prev => [...prev, { role: 'assistant', text: response }])
    setInput('')
  }

  return (
    <div className="flex flex-col h-screen bg-gray-50">
      {/* Chat UI */}
    </div>
  )
}
```

## 最佳实践

### 性能优化

| 技术 | 说明 |
|------|------|
| **Code Splitting** | React.lazy + Suspense |
| **Memoization** | useMemo, useCallback |
| **Virtualization** | 长列表优化 |
| **Image Optimization** | next/image 或自定义懒加载 |

### 安全性

| 实践 | 说明 |
|------|------|
| **API Key 保护** | 环境变量，服务端代理 |
| **输入验证** | Zod schema 验证 |
| **XSS 防护** | React 自动转义，dangerouslySetInnerHTML 谨慎使用 |
| **CSRF 防护** | SameSite cookies |

### 可访问性

| 标准 | 实现 |
|------|------|
| **语义 HTML** | 正确使用 header, main, nav 等 |
| **ARIA 属性** | aria-label, role, aria-live |
| **键盘导航** | Tab 顺序，焦点管理 |
| **屏幕阅读器** | alt 文本，aria-description |

## 相关资源

| 链接 | 说明 |
|------|------|
| [AI Studio](https://aistudio.google.com) | Google AI Studio |
| [Gemini API 文档](https://ai.google.dev/gemini-api/docs) | 官方 API 文档 |
| [React 文档](https://react.dev) | React 18+ 文档 |
| [Tailwind CSS](https://tailwindcss.com) | Tailwind 官方文档 |

## 标签

#google #gemini #ai-studio #vibe-coder #react #typescript #tailwind #web-development #api-integration #function-calling

---

*收集时间：2026-04-29*
