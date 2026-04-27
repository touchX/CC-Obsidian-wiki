# Subagents 模块课程

## 模块概述

学习 Claude Code 的子代理系统，掌握如何通过代理分工提高复杂任务的处理效率。

## L1 - 入门

### 学习目标
- 理解 Subagent 的基本概念
- 掌握子代理的创建和调用
- 能够使用子代理分解简单任务

### 核心内容

#### 1. 什么是 Subagents
Subagent 是从主会话中派生的独立代理：
- 独立的工作上下文
- 可以并行执行
- 结果返回主会话

#### 2. 调用子代理
```typescript
const result = await Agent({
  description: "代码审查专家",
  tools: ["Read", "Grep"],
  prompt: "审查以下代码..."
});
```

#### 3. 子代理参数
| 参数 | 说明 |
|------|------|
| `description` | 代理角色描述 |
| `tools` | 可用工具列表 |
| `prompt` | 具体任务指令 |

#### 4. 挑战任务 L1

**任务 1.1**: 创建一个代码审查子代理，审查指定文件
**任务 1.2**: 创建一个文档生成子代理，为代码生成注释
**任务 1.3**: 尝试并行调用两个子代理

### 自测问题
- Subagent 和普通函数调用有什么区别？
- 什么时候应该使用子代理？

---

## L2 - 进阶

### 学习目标
- 掌握子代理间的数据传递
- 能够设计代理协作模式
- 理解代理生命周期管理

### 核心内容

#### 1. 数据传递模式
```typescript
// 模式1: 上下文注入
const agent = new Agent({
  context: { files: fileList }
});

// 模式2: 结果聚合
const results = await Promise.all(agents);
const merged = results.reduce(...)
```

#### 2. 代理编排模式
| 模式 | 适用场景 |
|------|----------|
| 并行 | 独立任务同时执行 |
| 串行 | 任务有依赖关系 |
| 分支 | 根据条件选择代理 |
| 聚合 | 多个代理结果合并 |

#### 3. 生命周期管理
- 代理启动和初始化
- 中间状态检查点
- 超时和错误处理
- 结果验证

#### 4. 挑战任务 L2

**任务 2.1**: 设计一个并行代码分析流程：语法检查 + 安全扫描 + 性能分析
**任务 2.2**: 实现一个串行文档处理流程：提取 → 转换 → 验证 → 生成
**任务 2.3**: 创建一个带重试机制的子代理调用

---

## L3 - 精通

### 学习目标
- 掌握多代理系统设计
- 能够设计复杂的代理协作
- 理解代理架构最佳实践

### 核心内容

#### 1. 多代理架构
```
Orchestrator Agent
├── Code Reviewer Agent
├── Security Auditor Agent
├── Performance Analyzer Agent
└── Documentation Agent
```

#### 2. 代理通信协议
```typescript
interface AgentMessage {
  from: string;
  to: string;
  type: 'task' | 'result' | 'error';
  payload: any;
}
```

#### 3. 代理状态管理
- 共享状态 vs 私有状态
- 状态同步机制
- 一致性保证

#### 4. 综合项目 L3

**项目**: 设计一个自动化代码质量分析系统
- 架构设计
- 代理角色定义
- 协作流程实现
- 结果聚合和报告

---

## Wiki 参考资料

- `wiki/guides/subagents.md`
- `wiki/entities/claude-subagents.md`
- `wiki/implementation/subagents-implementation.md`
