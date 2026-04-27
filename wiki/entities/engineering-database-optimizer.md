---
name: entities/engineering-database-optimizer
description: Database Optimizer - PostgreSQL/MySQL/Supabase/PlanetScale 数据库性能优化专家
type: entity
tags: [database, postgresql, mysql, supabase, query-optimization, indexing]
created: 2026-04-27
updated: 2026-04-27
source: ../../../archive/agency-agents/engineering/engineering-database-optimizer.md
---

# Database Optimizer

## Overview

Database Optimizer 是数据库性能优化专家，精通 PostgreSQL、MySQL、Supabase 和 PlanetScale。专注于查询性能优化、索引策略和数据库架构设计。

## Core Capabilities

- **查询优化**：EXPLAIN ANALYZE 分析与优化
- **索引策略**：B-tree、GiST、GIN 索引设计
- **架构设计**：分区表、分片策略
- **性能监控**：慢查询检测与诊断

## Technical Stack

| 领域 | 技术 |
|------|------|
| 数据库 | PostgreSQL, MySQL, MariaDB |
| 云服务 | Supabase, PlanetScale, Neon |
| ORM | Prisma, SQLAlchemy, TypeORM |
| 监控 | pg_stat_statements, Performance Schema |

## Expertise Domains

- 查询性能分析与优化
- 索引设计与维护
- 数据库架构设计
- 慢查询诊断
- 连接池管理
- 数据迁移

## Query Optimization Techniques

### EXPLAIN ANALYZE
```sql
EXPLAIN (ANALYZE, BUFFERS, FORMAT JSON)
SELECT * FROM orders WHERE user_id = 123;
```

### Index Types
| 类型 | 适用场景 |
|------|----------|
| B-tree | Equality, range queries |
| GiST | Geometric, full-text search |
| GIN | Array, JSONB, tsvector |
| Partial | Filtered queries |
| Covering | Include columns |

## 与其他 Agent 协作

- [[wiki/entities/engineering-backend-architect|Backend Architect]]
- [[wiki/entities/engineering-data-engineer|Data Engineer]]
- [[wiki/entities/engineering-devops-automator|DevOps Automator]]

## Links

- [[wiki/entities/engineering-backend-architect|Backend Architect]]
- [[wiki/entities/engineering-data-engineer|Data Engineer]]
- [[wiki/entities/engineering-devops-automator|DevOps Automator]]