---
name: implementation/plugins-reference
description: Claude Code Plugin 系统完整参考 — 架构、生命周期和开发指南
type: implementation
tags: [plugins, reference, architecture, hooks, monitors]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/Plugins 参考.md
---

# Claude Code Plugin 参考

Plugin 系统允许您扩展 Claude Code 的功能，通过声明式配置添加新能力。

## 核心概念

| 概念 | 说明 |
| --- | --- |
| Plugin | 扩展 Claude Code 功能的模块 |
| Resource | 通过 MCP 协议暴露的静态数据 |
| Tool | 通过 MCP 协议暴露的可调用操作 |
| Prompt | 可作为命令执行的模板 |
| Monitor | 自动启动的后台任务 |

## Plugin 结构

```json
{
  "name": "plugin-name",
  "version": "1.0.0",
  "description": "Plugin description",
  "author": "Author Name",
  "homepage": "https://example.com",
  "permissions": ["read", "write"],
  "contributes": {
    "resources": [],
    "tools": [],
    "prompts": [],
    "monitors": [],
    "commands": []
  }
}
```

## 资源 (Resources)

资源是插件暴露的静态数据，通过 `ListMcpResourcesTool` 列出，`ReadMcpResourceTool` 读取。

```typescript
interface Resource {
  name: string;        // 唯一标识符
  description?: string;
  mimeType?: string;
  uri: string;         // plugin-name://path/to/resource
}
```

## 工具 (Tools)

工具是插件暴露的可调用操作，通过 MCP 协议执行。

```typescript
interface Tool {
  name: string;        // 唯一标识符
  description?: string;
  inputSchema: object; // JSON Schema
}
```

## Prompts

Prompts 是可作为命令执行的模板，显示在 `/` 命令列表中。

```typescript
interface Prompt {
  name: string;        // 命令名称 (不含 /)
  description?: string;
  arguments?: {
    name: string;
    description?: string;
    required?: boolean;
  }[];
}
```

## Monitors

Monitors 是在插件处于活动状态时自动启动的监视。

```typescript
interface Monitor {
  name: string;
  description?: string;
  watch: {
    type: 'file' | 'process' | 'custom';
    pattern?: string;
  };
}
```

## Hooks 集成

Plugin 可以声明 Hook 来拦截工具执行：

```typescript
interface PluginHook {
  name: string;
  events: ('PreToolUse', 'PostToolUse', 'Stop')[];
  handler: string;  // 导出函数名
}
```

## 生命周期

| 阶段 | 说明 |
| --- | --- |
| Discovery | Claude Code 发现并加载插件 |
| Activation | 插件被激活，资源/工具可用 |
| Execution | 用户调用插件功能 |
| Deactivation | 插件被停用，清理资源 |

## 创建 Plugin

1. 创建插件目录结构
2. 编写 `plugin.json` 清单
3. 实现资源、工具、prompts
4. 测试并打包发布

## 相关页面

- [[plugins-implementation]] — Plugin 开发指南
- [[claude-hooks]] — Hook 系统
- [[skills]] — Skills 系统
