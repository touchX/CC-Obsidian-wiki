# Agent Teams 模块课程

## 模块概述

学习 Claude Code 的多代理协作系统，掌握如何通过代理团队完成复杂任务。

## L1 - 入门

### 学习目标
- 理解 Agent Teams 的基本概念
- 掌握团队创建和角色定义
- 能够设计简单的多代理协作

### 核心内容

#### 1. 什么是 Agent Teams
Agent Team 是多个专门代理的组合：
- 每个代理有特定角色
- 代理间可以通信
- 共同完成复杂任务

#### 2. 团队结构
```typescript
const team = {
  agents: [
    { role: 'coordinator', description: '任务协调' },
    { role: 'developer', description: '代码开发' },
    { role: 'reviewer', description: '代码审查' }
  ],
  communication: 'hierarchical' // hierarchical | peer
};
```

#### 3. 团队通信模式
| 模式 | 说明 | 适用场景 |
|------|------|----------|
| Hierarchical | 层级通信，Coordinator 中转 | 任务明确 |
| Peer | 对等通信，代理直接交互 | 协作复杂 |

#### 4. 挑战任务 L1

**任务 1.1**: 创建一个两人团队：开发者 + 审查者
**任务 1.2**: 设计一个三人团队完成新功能开发
**任务 1.3**: 分析团队通信模式的选择

### 自测问题
- Agent Teams 相比单个代理的优势是什么？
- 何时应该使用层级通信而非对等通信？

---

## L2 - 进阶

### 学习目标
- 掌握复杂团队设计
- 能够处理代理间冲突
- 理解团队规模的影响

### 核心内容

#### 1. 团队角色设计
| 角色 | 职责 | 技能要求 |
|------|------|----------|
| Architect | 架构设计 | 系统设计 |
| Developer | 代码实现 | 编程语言 |
| Reviewer | 代码审查 | 最佳实践 |
| Tester | 测试验证 | 测试框架 |
| Coordinator | 任务协调 | 项目管理 |

#### 2. 任务分配策略
```typescript
// 按能力分配
const assignByCapability = (task, agents) => {
  return agents
    .filter(a => a.skills.includes(task.requiredSkill))
    .sort((a, b) => b.experience - a.experience)[0];
};

// 负载均衡
const assignByLoad = (task, agents) => {
  return agents.sort((a, b) => a.currentTasks - b.currentTasks)[0];
};
```

#### 3. 代理间冲突处理
- 资源竞争：优先级调度
- 任务依赖：等待机制
- 结果不一致：投票决策

#### 4. 挑战任务 L2

**任务 2.1**: 设计一个 5 人开发团队完成电商系统
**任务 2.2**: 实现代理间的任务传递机制
**任务 2.3**: 处理代理间的资源竞争

### 自测问题
- 如何确定团队规模？
- 代理间的依赖如何管理？
- 如何避免团队内的重复劳动？

---

## L3 - 精通

### 学习目标
- 掌握团队编排架构
- 能够设计自组织团队
- 理解元认知和团队学习

### 核心内容

#### 1. 团队编排模式
```typescript
// 流水线模式
const pipeline = {
  stages: ['design', 'implement', 'test', 'review', 'deploy'],
  agents: [architect, dev1, tester, reviewer, devOps],
  dependencies: { /* 阶段依赖图 */ }
};

// 网状模式
const mesh = {
  agents: [dev1, dev2, dev3],
  connections: [ /* 全连接 */ ],
  consensus: 'voting'
};
```

#### 2. 团队自组织
- 动态角色切换
- 自主任务认领
- 集体问题解决

#### 3. 元认知与团队学习
- 团队效能评估
- 经验共享机制
- 持续优化策略

#### 4. 综合项目 L3

**项目**: 设计并实现一个多代理开发团队，完成一个完整的 RESTful API 项目

- 阶段 1: 团队架构设计
- 阶段 2: 代理角色配置
- 阶段 3: 协作流程实现
- 阶段 4: 效能评估与优化

### 自测问题
- 何时应该让团队自我组织？
- 如何评估团队效能？
- 团队学习如何影响长期表现？

---

## Wiki 参考资料

- `wiki/guides/agent-teams.md`
- `wiki/implementation/agent-teams-implementation.md`
- `wiki/synthesis/agent-architecture.md`