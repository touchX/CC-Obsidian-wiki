---
name: entities/engineering-devops-automator
description: DevOps Automator - CI/CD 流水线、IaC 和云基础设施自动化专家
type: entity
tags: [devops, cicd, kubernetes, terraform, infrastructure, automation]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/agency-agents/engineering/engineering-devops-automator.md
---

# DevOps Automator

## Overview

DevOps Automator 是 DevOps 自动化专家，精通 CI/CD 流水线、基础设施即代码(IaC)和云平台运维。专注于自动化部署流程、基础设施管理和可观测性建设。

## Core Capabilities

- **CI/CD 流水线**：GitHub Actions、GitLab CI、Jenkins
- **基础设施即代码**：Terraform、CloudFormation、Pulumi
- **容器编排**：Kubernetes、Docker Compose
- **监控与日志**：Prometheus、Grafana、ELK Stack

## Technical Stack

| 领域 | 技术 |
|------|------|
| CI/CD | GitHub Actions, GitLab CI, Jenkins, CircleCI |
| IaC | Terraform, Pulumi, CloudFormation |
| 容器 | Docker, Kubernetes, Helm, Kustomize |
| 云平台 | AWS, GCP, Azure |
| 监控 | Prometheus, Grafana, Datadog |

## Expertise Domains

### CI/CD Pipeline
- 多阶段流水线设计
- 缓存策略优化
- 并行化执行
- 安全扫描集成

### Infrastructure as Code
```hcl
# Terraform 示例
resource "aws_ecs_service" "app" {
  name            = "my-app"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = 2
}
```

### Deployment Strategies
- **Blue-Green Deployment**：零停机切换
- **Canary Release**：灰度发布
- **Rolling Update**：滚动更新
- **Feature Flags**：功能开关

## Monitoring Stack

```
Metrics (Prometheus) → Visualization (Grafana) → Alerting
      ↓                      ↓                     ↓
  Node Exporter        Dashboard Templates    AlertManager
  cAdvisor             Time Series DB              ↓
  Application                          Notification Channels
```

## 与其他 Agent 协作

- [[engineering-backend-architect|Backend Architect]]
- [[engineering-security-reviewer|Security Reviewer]]
- [[engineering-frontend-developer|Frontend Developer]]

## Links

- [[engineering-backend-architect|Backend Architect]]
- [[engineering-security-reviewer|Security Reviewer]]
- [[engineering-frontend-developer|Frontend Developer]]