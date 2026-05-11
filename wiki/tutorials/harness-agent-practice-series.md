---
name: harness-agent-practice-series
description: 码士集团-小森的基于Harness的Agent实战系列教程 — 从0到1开发完整Agent
type: tutorial
tags: [bilibili, 码士集团, 小森, harness-engineering, agent实战, claude-code]
created: 2026-05-11
updated: 2026-05-11
source: ../../../archive/clippings/bilibili/基于Harness的Agent实战/
external_url: https://www.bilibili.com/video/BV1nJQFBcEb3
---

# 基于Harness的Agent实战系列教程

> [!summary] 码士集团-小森的完整实战教程 — 从0到1开发基于Harness的Agent（Claude Code源码解析）
> **课程特色**：源码级讲解 + 6个完整模块 + 实战项目演示

**来源**：[Claude Code 源码解析：从0到1开发一个基于Harness的Agent实战](https://www.bilibili.com/video/BV1nJQFBcEb3)
**作者**：码士集团-小森
**发布时间**：2026-04-10
**视频系列**：6集完整教程
**总时长**：约 2 小时

---

## 原始文档

> [!info] 来源
> 本页面综合了系列教程的6个部分，归档文档见：
> - [[../../../archive/clippings/bilibili/基于Harness的Agent实战/基于Harness的Agent实战-P2-什么是Harness Engineering.md|P2：什么是Harness Engineering]]
> - [[../../../archive/clippings/bilibili/基于Harness的Agent实战/基于Harness的Agent实战-P3-Harness Engineering架构.md|P3：Harness Engineering架构]]
> - [[../../../archive/clippings/bilibili/基于Harness的Agent实战/基于Harness的Agent实战-P4-Harness和Agent的关系？.md|P4：Harness和Agent的关系]]
> - [[../../../archive/clippings/bilibili/基于Harness的Agent实战/基于Harness的Agent实战-P5-Harness有哪些能力.md|P5：Harness有哪些能力]]
> - [[../../../archive/clippings/bilibili/基于Harness的Agent实战/基于Harness的Agent实战-P6-开发一个基于Harness的Agent实战.md|P6：开发实战]]

---

## 课程概述

### 课程特色

**源码级讲解**：
- 基于 Claude Code 的实际源码解析
- 从理论到实践的完整路径
- 每个概念都对应实际代码

**实战导向**：
- 从0到1开发完整的基于Harness的Agent
- 包含完整的项目演示和代码实现
- 涵盖开发、测试、部署全流程

**系统化教学**：
- 6个模块，层层递进
- 从基础概念到高级应用
- 适合零基础到进阶开发者

---

## 模块一：什么是Harness Engineering

### 核心定义

**Harness Engineering（马具工程）**：
- Anthropic 提出的专业术语
- 翻译为"马厩工程"或"马具工程"
- **核心**：围绕AI模型搭建的完整工作环境和流程

### Claude Code中的应用

**为什么Claude Code好用**：
- 用TypeScript开发了新的智能体架构
- 使用了**Harness**这个专业术语
- 这种新的智能体架构是Claude Code强大的核心原因

### Agent = Model + Harness

**业界共识公式**：
- Agent = Model（模型）+ Harness（马具）
- Model提供智能和推理能力
- Harness提供工具、规则、流程、检查机制

---

## 模块二：Harness Engineering架构

### 核心组件

#### 1. 上下文管理

**问题**：
- 前期有大量的上下文信息
- 上下文即将撑爆，超过大模型的最大上下文长度

**解决方案**：
- 将部分上下文持久化
- 将子任务产生的临时数据持久化
- 在需要时重新加载

#### 2. 沙盒环境

**隔离执行**：
- 每个任务在独立的沙盒中运行
- 沙盒 = Docker容器
- 创建新沙盒 = 创建新的Docker容器

**管理机制**：
- 可以加载新的沙盒
- 可以加载旧的沙盒
- 创建沙盒会自动创建新的Docker容器
- 可以看到多个容器同时运行

---

## 模块三：Harness和Agent的关系

### 智能体架构

**主智能体（Main Agent）**：
- 使用框架提供的函数创建
- 可以累加子智能体

**子智能体（Sub Agent）**：
- 放在配置文件中
- 可以动态加载和管理
- 处理特定的子任务

**配置文件结构**：
```typescript
// 子智能体配置示例
subAgents: {
  agent1: {
    task: "specific_task",
    harness: "custom_harness"
  }
}
```

---

## 模块四：Harness有哪些能力

### 核心能力

#### 1. 技能管理（Skills）

**配置**：
- `app`目录设置为 `skills`
- 配置为 `4K` 是正确的
- Skills是Harness的核心能力

**沙箱配置**：
- 使用自定义沙箱
- 可以随意设置沙盒参数
- 沙箱隔离保证安全性

#### 2. 工具集成

**MCP（Model Context Protocol）**：
- 扩展AI的操作范围
- 连接外部数据源
- 增强Agent的能力

#### 3. 任务编排

**并行执行**：
- 多个子任务可以并行处理
- 提高整体效率
- 资源隔离和管理

---

## 模块五：实战开发

### 项目启动

**运行Agent**：
- 启动后可以加载新的沙盒
- 加载旧的沙盒
- 创建沙盒会创建新的Docker容器

**容器管理**：
- 使用 `docker ps` 查看运行的容器
- 容器自动管理和清理
- 之前运行的容器会被自动清理

### 开发流程

**完整流程**：
1. 设计Harness架构
2. 配置Skills和工具
3. 实现主智能体
4. 添加子智能体
5. 测试和调试
6. 部署和运行

---

## 模块六：完整实战项目

### 项目特点

**从0到1完整开发**：
- 包含完整的项目演示
- 涵盖所有核心概念
- 实际代码实现

**关键技术点**：
- Claude Code源码解析
- Harness架构设计
- Agent开发实践
- 沙盒环境配置
- Skills开发

### 学习收获

**理论到实践**：
- 理解Harness的核心概念
- 掌握Agent开发流程
- 学会源码级分析
- 具备独立开发能力

---

## 技术栈和工具

### 核心技术

- **Claude Code**：AI编程助手
- **TypeScript**：主要开发语言
- **Docker**：容器化沙盒
- **MCP**：扩展协议

### 开发环境

- **操作系统**：支持Docker的系统
- **IDE**：VS Code + Claude Code插件
- **版本控制**：Git

---

## 课程优势

### 1. 源码级讲解

**深度解析**：
- 不是停留在表面使用
- 深入到源码层面
- 理解底层原理

**实战导向**：
- 每个概念都有实际代码
- 可以直接应用到项目
- 避免纸上谈兵

### 2. 系统化教学

**完整体系**：
- 6个模块层层递进
- 从基础到高级
- 理论+实践结合

**循序渐进**：
- 适合零基础
- 每个知识点讲解清楚
- 配合实例演示

### 3. 实战项目

**完整项目**：
- 从0到1开发
- 包含所有环节
- 可直接复用

**代码质量**：
- 符合生产标准
- 遵循最佳实践
- 易于维护扩展

---

## 学习路径

### 前置知识

**必备基础**：
- 基础的编程能力
- 了解AI/LLM概念
- 熟悉命令行操作

**推荐准备**：
- 观看前几个模块的介绍
- 了解Claude Code基础
- 准备开发环境

### 学习建议

**循序渐进**：
1. 按顺序观看6个模块
2. 每个模块实践一次
3. 跟随代码实现
4. 完成实战项目

**重点模块**：
- **P2**：理解核心概念
- **P3**：掌握架构设计
- **P6**：完成实战项目

---

## 实践建议

### 动手实践

**边学边做**：
- 不要只看不动手
- 每个概念都要实践
- 完成实战项目

**代码复用**：
- 参考课程中的代码
- 理解每行代码的作用
- 修改和优化

### 问题排查

**常见问题**：
- 环境配置问题
- Docker容器问题
- Agent通信问题

**解决方法**：
- 查看课程演示
- 检查日志输出
- 参考文档和社区

---

## 进阶学习

### 相关资源

**官方文档**：
- Claude Code官方文档
- Anthropic Harness指南
- MCP协议规范

**社区资源**：
- GitHub上的开源项目
- 技术博客和文章
- 开发者社区讨论

**推荐课程**：
- [[tutorials/harness-engineering-yupi]] — 程序员鱼皮的保姆级教程
- [[guides/harness-engineering-for-users]] — Martin Fowler的用户指南
- [[concepts/agent-harness-anatomy]] — LangChain的核心组件分析

### 持续学习

**深入方向**：
- 高级Harness模式
- 多Agent协作
- 性能优化
- 生产环境部署

---

## 关键要点总结

### 核心概念

1. **Harness = AI的马具**
   - 不是新技术，而是工程实践的系统化
   - 围绕Model的工具、规则、流程集合

2. **Agent = Model + Harness**
   - Model提供智能
   - Harness提供能力

3. **上下文管理是关键**
   - 持久化重要信息
   - 按需加载
   - 避免上下文爆炸

### 实践要点

1. **沙盒隔离**
   - 每个任务独立环境
   - Docker容器化
   - 自动管理和清理

2. **模块化设计**
   - 主Agent + 子Agent
   - 配置文件管理
   - 动态加载

3. **技能集成**
   - Skills封装复杂逻辑
   - MCP扩展能力
   - 工具链集成

---

## 适用场景

### 适合人群

✅ **零基础学习者**：
- 系统化教学
- 从概念到实践
- 循序渐进

✅ **有经验的开发者**：
- 源码级深度
- 实战项目参考
- 最佳实践学习

✅ **AI编程爱好者**：
- Claude Code用户
- Harness Engineering学习者
- Agent开发者

### 应用场景

- **个人项目**：快速开发AI Agent
- **团队协作**：标准化开发流程
- **学习研究**：理解AI编程原理
- **生产环境**：构建可靠的Agent系统

---

## 常见问题

### Q: 需要什么基础？

**A**: 基础的编程能力和对AI/LLM的了解即可。课程从零开始，适合零基础学习者。

### Q: 和其他教程的区别？

**A**: 本课程是源码级讲解，不是简单的使用教程。会深入到Claude Code的源码，理解Harness的实现原理。

### Q: 实战项目可以商用吗？

**A**: 课程中的项目是教学示例，可以作为起点。商用需要根据具体需求进行调整和优化。

### Q: 需要多长时间学习？

**A**: 建议按模块学习，每个模块1-2小时，加上实践时间，总计约15-20小时可完成全部内容。

---

## 更新日志

- **2026-05-11**：创建系列教程综合页面
- 综合6个模块的核心内容
- 提取关键要点和实践建议

---

## 相关页面

- [[harness-engineering]] — Harness Engineering 理论框架
- [[tutorials/harness-engineering-yupi]] — 鱼皮的保姆级教程
- [[guides/harness-engineering-for-users]] — Martin Fowler的用户指南
- [[concepts/agent-harness-anatomy]] — LangChain的核心组件分析
- [[tutorials/agent-teams-guide]] — Agent Teams实战指南

---

> [!info] 来源
> - **视频系列**：Bilibili - 码士集团-小森
> - **URL**：https://www.bilibili.com/video/BV1nJQFBcEb3
> - **作者**：码士集团-小森
> - **类型**：实战教程 + 源码解析
> - **价值**：⭐⭐⭐⭐⭐ 从0到1的完整实战教程

---

*文档创建于 2026-05-11*
*来源：Bilibili 视频系列*
*类型：实战教程*
