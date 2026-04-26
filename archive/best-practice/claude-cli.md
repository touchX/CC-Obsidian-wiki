---
name: claude-cli
description: Anthropic Claude Code CLI 工具完整指南
type: best-practice
tags: [tool, cli, anthropic, tutorial, guide]
created: 2026-04-26
---

# Claude CLI — Anthropic 官方命令行工具

Claude CLI 是 Anthropic 官方提供的命令行界面工具，通过自然语言对话完成代码修改、文件创建、bug 修复等软件开发任务。

## 核心能力

| 能力类别 | 说明 |
|----------|------|
| **自然语言编程** | 用中文/英文描述需求，Claude 自动执行 |
| **文件操作** | 读取、创建、编辑、删除文件 |
| **Git 操作** | commit、branch、PR 创建、代码审查 |
| **终端命令** | 执行 shell 命令，安装依赖 |
| **上下文管理** | `@` 符号引用、Memory 持久化 |
| **MCP 集成** | Model Context Protocol 扩展 |
| **Subagents** | 专用子代理（代码审查、调试等） |
| **Skills** | 可复用的技能扩展 |

## 启动方式

```bash
# 基础启动
claude                    # 默认启动新会话
claude --resume           # 恢复上次会话
claude --print <prompt>   # 单次输出模式（不启动交互）

# 高级选项
claude --model <model>    # 指定模型（opus/sonnet/haiku）
claude --help             # 查看完整选项
```

## 工作流程示例

### 典型开发循环

```
用户描述需求 → Claude 理解并执行 → 显示变更 → 确认/修改 → Git 提交
```

### 常用场景

| 场景 | 命令示例 |
|------|----------|
| 修复 bug | "修复登录页面的验证错误" |
| 添加功能 | "在用户表中添加 email 字段" |
| 重构代码 | "重构 AuthManager，分离验证逻辑" |
| 创建测试 | "为 UserService 创建单元测试" |
| Git 操作 | "创建 feat/auth 分支并提交当前更改" |

## 配置与扩展

### 配置文件

- **全局配置**: `~/.claude/settings.json`
- **项目配置**: `.claude/settings.json`
- **环境变量**: `ANTHROPIC_API_KEY`

### 扩展机制

| 扩展类型 | 说明 |
|----------|------|
| **Commands** | 75 个内置命令（`/help` 查看完整列表） |
| **Skills** | 可复用的技能扩展 |
| **Subagents** | 专用子代理（代码审查、调试等） |
| **MCP Servers** | 外部工具和数据源集成 |

## 相关资源

### 官方文档
- [Claude Code Documentation](https://docs.anthropic.com/claude-code)
- [MCP Specification](https://modelcontextprotocol.io/)
- [GitHub Repository](https://github.com/anthropics/claude-code)

### 最佳实践
- [[entities/claude-commands]] — 内置命令完整列表
- [[entities/claude-settings]] — 配置选项详解
- [[entities/claude-hooks]] — 生命周期钩子
- [[guides/power-ups]] — 交互教程

## 提示与技巧

### 效率优化
- 使用 `@文件名` 快速引用上下文
- 利用 Memory 存储项目特定知识
- 配置项目级 Skills 复用常用模式

### 故障排除
- 认证问题: 检查 `ANTHROPIC_API_KEY` 环境变量
- 上下文不足: 使用 `@` 引用相关文件
- 权限错误: 确保 Claude 有文件访问权限

---

*最后更新: 2026-04-26*
