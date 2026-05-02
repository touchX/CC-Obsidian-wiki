---
name: tools/gemini-cli
description: Google Gemini CLI 编程助手系统提示词、工作流和最佳实践
type: source
tags: [gemini-cli, google, agent, tools, system-prompt, gemini, workflow]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Open Source prompts/Gemini CLI/google-gemini-cli-system-prompt.txt
---

# Gemini CLI 编程助手

## 概述

Gemini CLI 是 Google 开发的命令行 AI 编程助手，基于 Gemini 模型。它采用最少输出原则，专注于快速、高效地完成任务。Gemini CLI 的核心理念是用最少的交互完成最多的工作，减少开发者的等待时间。

## 核心定位

| 维度 | 说明 |
|------|------|
| **开发者** | Google |
| **运行环境** | 命令行 |
| **调用格式** | 工具调用 |
| **核心能力** | 代码编辑、文件操作、分析 |

## 工作流阶段

Gemini CLI 将工作流程分为 7 个阶段，每个阶段都有明确的输入和输出。

### 1. Understand（理解阶段）

分析用户请求并理解上下文：

```
输入: 用户的问题或请求
输出: 理解摘要和初步计划

示例:
用户: "优化这个慢查询"
理解:
- 当前查询涉及 3 个表联接
- 缺少索引
- 需要添加 EXPLAIN 分析
```

### 2. Plan（计划阶段）

制定具体的实施计划：

```
输入: 理解阶段的输出
输出: 详细的任务列表

示例:
计划:
1. 分析当前查询计划
2. 识别性能瓶颈
3. 设计索引方案
4. 实施优化
5. 验证效果
```

### 3. Implement（实现阶段）

执行计划中的任务：

```
输入: 计划阶段的输出
输出: 代码变更或操作结果

示例:
实施:
- 修改 query.sql
- 添加索引 migration_001.sql
- 更新文档
```

### 4. Verify（验证阶段）

验证实现的正确性：

```
输入: 实现阶段的输出
输出: 验证结果

示例:
验证:
✓ 查询时间从 5s 降至 200ms
✓ 索引大小 100MB
✓ 不影响现有功能
```

## 路径规范

### 绝对路径要求

Gemini CLI 使用绝对路径避免歧义：

```bash
# 正确
/home/user/project/src/app.py

# 错误（可能产生歧义）
./src/app.py
src/app.py
```

### 路径转换规则

读取相对路径时自动转换：

```
用户输入: src/utils/helper.py
↓ 自动转换
绝对路径: /home/user/project/src/utils/helper.py
```

## 最少输出原则

### 输出规则

Gemini CLI 采用 `<3 行输出` 原则：

| 场景 | 最大输出行数 |
|------|--------------|
| 确认操作 | 1 行 |
| 简单查询 | 2 行 |
| 复杂任务 | 3 行 |

### 示例对比

```bash
# ❌ 过度输出
正在读取文件...
文件大小: 1.2KB
共 45 行
开始分析...
找到 3 个函数
...

# ✅ 最少输出
✓ 找到 3 个函数可优化
```

### 何时可增加输出

- 代码审查和详细分析
- 错误诊断和修复建议
- 性能优化建议

## 禁止闲聊政策

### 闲聊限制

Gemini CLI 不参与闲聊：

| 类型 | 是否允许 |
|------|----------|
| 技术讨论 | ❌ 禁止 |
| 代码哲学 | ❌ 禁止 |
| 闲聊寒暄 | ❌ 禁止 |
| 工作相关 | ✅ 允许 |

### 响应模式

```bash
# 用户: 你好
# ❌ 响应
你好！很高兴为你服务。有什么编程问题我可以帮助？

# ✅ 响应
了解。有什么代码任务需要完成？
```

## 工具集

### 1. 文件读取

```bash
# 读取文件
read_file(path="/home/user/project/src/app.py")
```

### 2. 文件写入

```bash
# 写入文件
write_file(
  path="/home/user/project/src/utils/helper.py",
  content="export function helper() {\n  return 'hello'\n}"
)
```

### 3. 文件编辑

```bash
# 编辑文件
edit_file(
  path="/home/user/project/src/app.py",
  old_string="const VERSION = '1.0'",
  new_string="const VERSION = '2.0'"
)
```

### 4. Shell 命令

```bash
# 执行命令
run_command(
  command="npm install",
  working_directory="/home/user/project"
)
```

### 5. 搜索

```bash
# 搜索文件
search_files(
  path="/home/user/project/src",
  regex="TODO",
  file_pattern="*.ts"
)
```

## 工作流示例

### 1. 快速任务

```
用户: 查看当前目录结构

Gemini:
✓ src/ lib/ tests/ package.json README.md
```

### 2. 代码修改

```
用户: 将 VERSION 常量从 1.0 改为 2.0

Gemini:
✓ 已更新 src/config.ts
```

### 3. 调试任务

```
用户: 修复登录失败的问题

Gemini:
1. read_file: 检查 auth.ts
2. edit_file: 修复 token 验证逻辑
3. run_command: 测试登录流程
✓ 已修复，测试通过
```

### 4. 完整功能

```
用户: 添加深色模式支持

计划:
1. 添加 ThemeProvider
2. 更新样式变量
3. 添加主题切换逻辑

执行:
✓ 创建 context/ThemeContext.tsx
✓ 更新 styles/variables.css
✓ 修改 components/Layout.tsx

验证:
✓ 暗色模式正常
✓ 主题切换正常
```

## 配置选项

### 全局配置

```json
// .gemini-cli/config.json
{
  "model": "gemini-2.0-pro",
  "output_lines": 3,
  "enable_telemetry": false,
  "default_shell": "/bin/bash"
}
```

### 项目配置

```json
// .gemini-cli/project.json
{
  "root": "/home/user/project",
  "exclude": ["node_modules", ".git"],
  "tools": ["read", "write", "edit", "search"]
}
```

## 与其他工具对比

| 维度 | Gemini CLI | Claude Code | Codex CLI | Cline |
|------|------------|-------------|-----------|-------|
| 开发者 | Google | Anthropic | OpenAI | Cline |
| 输出原则 | 最少输出 | 适度输出 | 适度输出 | 详细输出 |
| 路径规范 | 绝对路径 | 相对路径 | 相对路径 | 相对路径 |
| 工作流 | 7 阶段 | 4 阶段 | 4 阶段 | 10 工具 |
| 闲聊政策 | 禁止 | 允许 | 允许 | 允许 |

## 最佳实践

### 1. 请求清晰

```
# ❌ 模糊请求
帮我看看这个代码

# ✅ 清晰请求
分析 src/api/users.ts 的性能问题
```

### 2. 指定范围

```
# ❌ 宽泛范围
优化整个项目

# ✅ 明确范围
优化 src/database/queries.ts 的查询性能
```

### 3. 验证结果

- 每次修改后验证
- 使用测试确认功能
- 检查代码质量

## 相关资源

- [[claude-code]] — Claude Code 编程助手
- [[codex-cli]] — Codex CLI 编程助手
- [[cline]] — Cline VSCode 扩展
- [[windsurf-ai]] — Windsurf Cascade
- [[agent-command-skill-comparison]] — 扩展机制对比