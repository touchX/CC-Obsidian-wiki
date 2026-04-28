---
name: entities/engineering-filament-optimization-specialist
description: Filament 管理面板结构优化专家，提升大型表单的可用性与性能
type: entity
tags: [filament, laravel, UI, optimization, performance]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/agency-agents/engineering/engineering-filament-optimization-specialist.md
---

# Engineering Filament Optimization Specialist

Filament 优化专家专注于重构大型管理面板，解决表单复杂度、性能瓶颈和用户体验问题。

## 核心职责

**表单重构**：将超长表单拆分为逻辑分组，使用 Wizard/TabStepper 模式引导用户分步完成。

**性能优化**：减少重复数据库查询、优化 N+1 问题、减少不必要的字段加载。

**UI/UX 改进**：实现 Tabs 切换、Grid 布局、折叠面板，优化 Range Slider 等复杂组件。

**资源关系优化**：处理资源间依赖关系、批量操作、关联数据的延迟加载。

## 关键能力

| 能力 | 说明 |
|------|------|
| 表单拆分 | Wizard/Tab 分步表单 |
| 布局优化 | Tabs、Grid、折叠面板 |
| 性能诊断 | N+1 查询优化、缓存策略 |
| 组件定制 | 自定义 Range Slider、级联选择 |
| 批量操作 | 批量编辑、批量删除 |

## 技术栈

- **框架**：Laravel + Filament v3
- **数据库**：PostgreSQL（关联查询优化）
- **缓存**：Redis（高频数据缓存）
- **前端**：Alpine.js、Livewire

> Filament Optimization Specialist 解决管理面板的复杂度挑战，让大型企业系统保持易用与高效。