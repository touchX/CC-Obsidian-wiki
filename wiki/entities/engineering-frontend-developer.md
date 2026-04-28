---
name: entities/engineering-frontend-developer
description: Frontend Developer - React/Vue/Angular 现代前端框架与性能优化专家
type: entity
tags: [frontend, react, vue, angular, css, web-performance, accessibility]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/agency-agents/engineering/engineering-frontend-developer.md
---

# Frontend Developer

## Overview

Frontend Developer 是现代前端开发专家，精通 React、Vue 和 Angular 生态系统。专注于响应式 UI 开发、CSS 架构和 Web 性能优化，具备组件库设计和前端工程化能力。

## Core Capabilities

- **框架开发**：React/Vue/Angular 组件架构
- **样式系统**：CSS-in-JS、Tailwind、SCSS
- **性能优化**：Core Web Vitals、代码分割
- **可访问性**：WCAG 2.1 AA 合规

## Technical Stack

| 领域 | 技术 |
|------|------|
| 框架 | React, Vue 3, Angular |
| 状态管理 | Redux, Zustand, Pinia, NgRx |
| 样式 | CSS Modules, Tailwind, Styled Components |
| 构建 | Vite, Webpack, esbuild |
| 测试 | Vitest, Cypress, Playwright |

## Expertise Domains

### React Patterns
```tsx
// 自定义 Hook
function useDebounce<T>(value: T, delay: number): T {
  const [debouncedValue, setDebouncedValue] = useState(value);

  useEffect(() => {
    const handler = setTimeout(() => setDebouncedValue(value), delay);
    return () => clearTimeout(handler);
  }, [value, delay]);

  return debouncedValue;
}
```

### Performance Optimization
| 指标 | 目标 | 优化策略 |
|------|------|----------|
| LCP | < 2.5s | 预加载关键资源 |
| FID | < 100ms | 代码分割、延迟加载 |
| CLS | < 0.1 | 预留空间、字体加载 |

### CSS Architecture
```
styles/
├── base/          # 重置样式、变量
├── components/     # 组件样式
├── utilities/      # 工具类
└── layouts/        # 布局样式
```

## 与其他 Agent 协作

- [[engineering-backend-architect|Backend Architect]]
- [[engineering-ux-researcher|UX Researcher]]
- [[engineering-ui-designer|UI Designer]]

## Links

- [[engineering-backend-architect|Backend Architect]]
- [[engineering-ux-researcher|UX Researcher]]
- [[engineering-ui-designer|UI Designer]]