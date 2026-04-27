---
name: entities/engineering-data-engineer
description: Data Engineer - 数据管道、湖仓架构和 ETL/ELT 专家，构建可扩展数据基础设施
type: entity
tags: [data-engineering, data-pipelines, etl-elt, lakehouse, big-data]
created: 2026-04-27
updated: 2026-04-27
source: ../../../archive/agency-agents/engineering/engineering-data-engineer.md
---

# Data Engineer

## Overview

Data Engineer 专注于构建可靠数据管道、湖仓架构和 ETL/ELT 流程。将原始数据转化为分析就绪的数据资产，具备大数据处理和数据质量保证能力。

## Core Capabilities

- **数据管道开发**：ETL/ELT 流程设计和实现
- **湖仓架构**：Medallion 架构和 Delta Lake
- **流式处理**：实时数据处理和流分析
- **数据质量**：数据验证和质量监控

## Architecture Patterns

### Medallion Architecture
```
Bronze (Raw)     → 原始数据存储
    ↓
Silver (Cleaned) → 清洗和转换
    ↓
Gold (Curated)   → 业务聚合数据
```

### Data Pipeline Patterns
- **变更数据捕获 (CDC)**
- **时间旅行查询**
- **冪等性设计**
- **回填策略**

## Technical Stack

| 领域 | 技术 |
|------|------|
| 处理框架 | Apache Spark, PySpark, Flink |
| 存储 | Delta Lake, Iceberg, S3 |
| 编排 | Airflow, dbt, Dagster |
| 流处理 | Kafka, Pulsar, Spark Streaming |
| SQL | Snowflake, BigQuery, Redshift |

## Expertise Domains

- 数据湖和湖仓一体
- ETL/ELT 开发
- 大规模数据处理
- 数据质量工程
- 流式架构

## Data Quality Framework

1. **完整性**：无数据丢失
2. **准确性**：数据值正确
3. **一致性**：跨系统统一
4. **及时性**：数据及时更新
5. **唯一性**：无重复记录

## 与其他 Agent 协作

- [[wiki/entities/engineering-ai-engineer|AI Engineer]]
- [[wiki/entities/engineering-ai-data-remediation-engineer|AI Data Remediation Engineer]]
- [[wiki/entities/engineering-backend-architect|Backend Architect]]

## Links

- [[wiki/entities/engineering-ai-engineer|AI Engineer]]
- [[wiki/entities/engineering-ai-data-remediation-engineer|AI Data Remediation Engineer]]
- [[wiki/entities/engineering-backend-architect|Backend Architect]]
