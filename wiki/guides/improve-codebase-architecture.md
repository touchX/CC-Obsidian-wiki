# improve-codebase-architecture Skill 使用指南

> **目标**：改进代码库架构，识别设计改进机会
> **核心概念**：Module、Interface、Depth、Seam、Adapter、Leverage、Locality
> **阅读时间**：完整阅读约 15 分钟

---

## 核心概念

### 7 大核心概念

| 概念 | 定义 | 作用 |
|------|------|------|
| **Module** | 模块 — 代码的逻辑分组 | 理解系统架构基础 |
| **Interface** | 接口 — 模块间的契约 | 降低耦合，提高灵活性 |
| **Depth** | 深度 — 调用栈的层次 | 识别性能瓶颈和复杂度 |
| **Seam** | 接缝 — 可替换的边界 | 提取可测试组件 |
| **Adapter** | 适配器 — 转换接口的层 | 解耦外部依赖 |
| **Leverage** | 杠杆作用 — 小改动大影响 | 找到高价值改进点 |
| **Locality** | 局部性 — 变更影响范围 | 降低维护成本 |

---

## 工作流程

### 1. Explore（探索）

**目标**：理解现有架构

- 列出所有 modules
- 识别 interfaces
- 测量 depth
- 找到 seams

### 2. Present Candidates（呈现候选）

**目标**：提出改进建议

- 按 leverage 排序
- 估算 effort vs impact
- 推荐优先级

### 3. Grilling Loop（质询循环）

**目标**：验证设计决策

---

## 真实案例

### 案例 1：订单处理系统

**问题**：
- OrderController 直接依赖 5 个服务
- 深度不均匀（2-7 层）
- 测试困难

**改进**：
```
OrderController
    │
    └── OrderService (新增 seam)
            │
            ├── PaymentAdapter (adapter)
            ├── InventoryAdapter (adapter)
            └── ShippingAdapter (adapter)
```

**效果**：
- ✅ 深度统一为 3 层
- ✅ 每个 adapter 可独立测试
- ✅ 外部服务变更不影响核心逻辑

---

## 快速参考

### 触发时机

当用户说以下任何内容时，使用此 skill：
- "改进这个代码库的架构"
- "如何重构这个项目？"
- "设计有什么问题？"
- "improve architecture"

### 关键问题

**探索阶段**：
- "列出所有模块"
- "识别关键接口"
- "测量调用深度"

**改进阶段**：
- "哪些改动有最高 leverage？"
- "如何提高 locality？"
- "在哪里添加 seams？"

---

*来源：obra/superpowers 插件 improve-codebase-architecture skill*
*完整文档：参见 raw/plugins/improve-codebase-architecture-使用指南.md*