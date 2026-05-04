---
name: agent-skills-vs-mcp
description: Agent Skills 与 MCP 的核心定位差异、使用场景对比及组合最佳实践
type: concept
tags: [claude, skills, mcp, comparison, architecture]
created: 2026-05-04
updated: 2026-05-04
source: ../../../archive/clippings/bilibili/2026-05-04-agent-skills.md
---

# Agent Skills vs MCP

> [!summary] 两个不同的技术方向：MCP 连接数据，Skills 定义行为
>
> **视频来源**：[马克的技术工作坊 - Bilibili](https://www.bilibili.com/video/BV1cGigBQE6n)

---

## 核心定位差异

### MCP (Model Context Protocol)
**本质**：数据供给管道
- 让 Claude 连接到外部数据源（数据库、API、文件系统）
- **角色**：数据提供者
- **核心问题**：Claude 有没有拿到正确的信息

### Agent Skills
**本质**：行为定义系统
- 教 Claude 如何处理数据、执行任务、响应特定场景
- **角色**：行为教练
- **核心问题**：Claude 知道在拿到数据后做什么

> [!quote] 关键洞察
> **MCP 回答"数据从哪来"**，**Skills 回答"拿到数据后怎么处理"**

---

## 详细对比

### 架构层面

| 维度 | MCP | Agent Skills |
|------|-----|--------------|
| **定位** | 数据连接协议 | 行为定义框架 |
| **关注点** | 数据获取 | 任务执行 |
| **工作层** | Context Engineering | Harness Engineering |
| **核心价值** | 扩展 Claude 知识边界 | 提升 Claude 执行稳定性 |
| **技术实现** | JSON-RPC 协议 | Markdown 指令文件 |

### 功能对比

| 能力 | MCP | Agent Skills | 说明 |
|------|-----|--------------|------|
| **读取文件** | ✅ 原生支持 | ✅ 通过 Reference | Skills 依赖 MCP 读取 |
| **执行脚本** | ✅ 工具调用 | ✅ Script 指令 | Skills 不占 token |
| **数据库查询** | ✅ 专用服务器 | ❌ 不支持 | MCP 的强项 |
| **API 调用** | ✅ 专用服务器 | ⚠️ 有限支持 | MCP 更灵活 |
| **条件触发** | ❌ 不支持 | ✅ Reference 条件加载 | Skills 独有特性 |
| **渐进式披露** | ❌ 不支持 | ✅ 三层架构 | Skills 独有特性 |
| **行为约束** | ❌ 不支持 | ✅ Instruction 规则 | Skills 独有特性 |

### 使用场景

#### MCP 最佳场景

**数据密集型任务**：
- 连接 PostgreSQL 数据库查询数据
- 读取 Google Drive 文件内容
- 调用外部 API 获取实时信息
- 访问文件系统读取配置文件

**技术优势**：
- 标准化协议，易于扩展
- 支持多种数据源（SQL、API、文件系统）
- 服务器端处理复杂逻辑
- 客户端轻量化，跨平台支持

#### Agent Skills 最佳场景

**行为定义型任务**：
- 会议总结规范（提取什么、如何格式化）
- 财务合规检查（提到预算时触发规则）
- 代码审查流程（检查清单、输出格式）
- 自动化工作流（多步骤任务编排）

**技术优势**：
- 渐进式披露节省 token
- 条件触发精准加载资源
- 行为约束确保一致性
- 易于版本控制和维护

---

## 决策框架

### 选择流程图

```
开始
  ↓
需要连接外部数据源吗？
  ↓ 是
  ↓
是标准数据源（SQL/文件/API）？
  ↓ 是
  ↓
✅ 使用 MCP
  ↓
  否
  ↓
需要定义复杂行为规则吗？
  ↓ 是
  ↓
✅ 使用 Agent Skills
  ↓
  否
  ↓
🤝 组合使用：MCP 获取数据 + Skills 处理行为
```

### 快速决策表

| 需求 | 推荐方案 | 理由 |
|------|----------|------|
| 读取数据库 | MCP | 原生支持，性能最优 |
| 定义任务流程 | Skills | 行为约束，渐进式披露 |
| 调用外部 API | MCP | 标准化协议，易于扩展 |
| 条件触发检查 | Skills | 独有特性，精准加载 |
| 文件系统操作 | MCP | 工具丰富，跨平台 |
| 自动化工作流 | Skills | 指令清晰，易于维护 |
| Token 优化 | Skills | 渐进式披露机制 |

---

## 组合使用最佳实践

### 典型架构

```
┌─────────────────────────────────────────┐
│          Claude Code                    │
└─────────────────┬───────────────────────┘
                  │
        ┌─────────┴─────────┐
        │                   │
   ┌────▼────┐         ┌────▼────┐
   │   MCP   │         │  Skills │
   │  服务器  │         │  指令集  │
   └────┬────┘         └────┬────┘
        │                   │
    数据供给              行为定义
        │                   │
        └─────────┬─────────┘
                  │
            ┌─────▼─────┐
            │ 实际执行  │
            └───────────┘
```

### 真实案例

#### 案例 1：会议总结 + 财务合规

**架构**：
- **Skills**：定义会议总结规则、财务检查触发条件
- **MCP**：读取会议录音文件、查询财务数据库

**工作流**：
```
1. Skills 定义：会议内容提取规则
2. MCP 执行：读取会议录音文件
3. Skills 触发：检测到"预算"关键词
4. MCP 执行：查询财务数据库获取审批标准
5. Skills 生成：合规性提醒 + 总结输出
```

#### 案例 2：代码审查 + 自动修复

**架构**：
- **Skills**：定义代码审查清单、修复规则
- **MCP**：读取代码文件、执行 Git 操作

**工作流**：
```
1. Skills 定义：代码质量检查清单
2. MCP 执行：读取 Git 仓库文件
3. Skills 分析：根据清单逐项检查
4. MCP 执行：应用修复（Git commit）
5. Skills 验证：运行测试确认修复成功
```

---

## 技术实现对比

### MCP 服务器示例

```typescript
// PostgreSQL MCP Server
import { Server } from '@modelcontextprotocol/sdk/server/index.js';
import { Client } from 'pg';

const server = new Server({
  name: 'postgres-server',
  version: '1.0.0'
});

// 连接数据库
const client = new Client({
  connectionString: process.env.DATABASE_URL
});

await client.connect();

// 提供查询工具
server.setRequestHandler(CallToolRequestSchema, async (request) => {
  if (request.params.name === 'query') {
    const sql = request.params.arguments?.sql;
    const result = await client.query(sql);
    return {
      content: [{ type: 'text', text: JSON.stringify(result.rows) }]
    };
  }
});
```

### Agent Skills 示例

```markdown
---
name: code-reviewer
description: 代码审查技能，检查代码质量、安全性和最佳实践
---

## 代码审查规则

### 必须检查项
1. **安全性**：无硬编码密钥、输入验证、SQL 注入防护
2. **性能**：无 N+1 查询、适当索引、缓存策略
3. **可维护性**：命名清晰、函数长度、注释完整

### 输出格式
- 严重性：[critical/high/medium/low]
- 位置：文件路径 + 行号
- 建议：具体修复方案

### 触发条件
仅当用户提到"审查"、"review"或"检查代码"时激活

### Reference 资源
当检测到安全问题：
- 读取 `security-checklist.md`
- 对照 OWASP Top 10 检查

### Script 执行
如果用户说"自动修复"：
- 运行 `fix-security-issues.py`
- 应用修复并创建 Git commit
```

---

## 优势互补

### MCP 的不可替代性

**场景**：连接 PostgreSQL 数据库
- ✅ MCP：专用服务器，高性能，支持复杂查询
- ❌ Skills：无法直接连接数据库，依赖 MCP 提供数据

**场景**：调用 GitHub API
- ✅ MCP：标准化 HTTP 客户端，支持认证、分页
- ❌ Skills：需要编写复杂脚本，维护成本高

### Skills 的不可替代性

**场景**：定义复杂行为规则
- ✅ Skills：自然语言描述，易于理解和修改
- ❌ MCP：只能提供工具，无法定义行为

**场景**：条件触发资源加载
- ✅ Skills：渐进式披露，节省 token
- ❌ MCP：一次性加载所有资源，浪费 token

---

## 常见误区

### 误区 1：MCP 可以替代 Skills

**错误认知**：MCP 提供了所有工具，Skills 没必要

**正确理解**：
- MCP 回答"能做什么"（能力边界）
- Skills 回答"怎么做"（执行规范）
- 两者互补，而非替代

### 误区 2：Skills 可以替代 MCP

**错误认知**：Skills 的 Script 可以执行任何操作

**正确理解**：
- Skills 的 Script 执行不占 token，但需要预先编写
- MCP 提供标准化、可复用的数据连接
- 对于数据密集型任务，MCP 更高效

### 误区 3：必须二选一

**错误认知**：选择 MCP 或 Skills 作为主要方案

**正确理解**：
- 大多数实际场景需要组合使用
- MCP 负责数据供给，Skills 负责行为定义
- 最佳实践：根据需求灵活组合

---

## 未来趋势

### MCP 演进方向

1. **标准化**：更多官方 MCP 服务器（GitHub、Google、Notion）
2. **安全性**：细粒度权限控制、审计日志
3. **性能**：连接池、缓存、流式传输

### Agent Skills 演进方向

1. **智能化**：自动触发、自适应学习
2. **协作化**：Skills 之间的互相调用和组合
3. **可视化**：Skills 编辑器、调试工具

### 融合趋势

```
MCP 提供标准数据接口
    ↓
Skills 定义标准行为模式
    ↓
形成"数据 + 行为"的完整解决方案
```

---

## 相关页面

- [[guides/agent-skills-progressive-disclosure]] - Agent Skills 渐进式披露机制详解
- [[concepts/harness-engineering]] - AI 工程第三次演进
- [[implementation/mcp-servers]] - MCP 服务器实现指南

---

## 参考资源

- **视频**：[Agent Skill 从使用到原理，一次讲清](https://www.bilibili.com/video/BV1cGigBQE6n)
- **官方文档**：[Anthropic MCP](https://modelcontextprotocol.io/)
- **官方文档**：[Anthropic Skills](https://www.anthropic.com/blog/skills)
- **GitHub**：[skills 示例仓库](https://github.com/anthropics/skills)

---

*最后更新：2026-05-04*
