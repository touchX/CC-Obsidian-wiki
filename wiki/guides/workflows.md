---
workflows
name: guides/workflows
description: Claude Code 常见工作流程：代码探索、调试、重构、测试和会话管理
type: guide
tags: [workflows, debugging, refactoring, testing]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/常见工作流程.md
---

# 常见工作流程

## 理解新代码库

### 快速获取概览

刚加入新项目时，从广泛问题开始：

```text
了解这个代码库的整体结构和主要模块
```

然后缩小到特定领域：

```text
这个项目使用什么编码约定？
有哪些主要的领域模型？
```

### 查找相关代码

```text
找到处理用户认证的代码
```

使用代码智能插件进行精确导航：
- "转到定义" — 跳转到符号定义
- "查找引用" — 找到所有使用位置

---

## 修复错误

提供完整上下文给 Claude：

```text
运行 `npm test` 时出现这个错误：
[粘贴错误信息]

复现步骤：
1. 登录为管理员
2. 点击"用户管理"
3. 尝试删除用户

错误是间歇性的/持续性的
```

---

## 重构代码

```text
解释为什么使用 Promise 而不 async/await
将这段代码重构为使用现代模式
保持向后兼容性
以小的、可测试的增量进行
```

---

## 使用 Plan Mode

适合：多步骤实现、代码探索、安全审查。

### 启动方式

| 方式 | 命令 |
|------|------|
| 会话中切换 | `Shift+Tab` 循环切换权限模式 |
| 新会话 | `claude --permission-mode plan` |
| 无头查询 | `claude --permission-mode plan -p "分析认证系统"` |

### Plan Mode 特性

- Claude 使用**只读操作**分析代码库
- 使用 `AskUserQuestion` 收集需求和澄清目标
- 按 `Ctrl+G` 在编辑器中打开计划可直接编辑
- 接受计划后自动命名会话

### 配置为默认值

```json
// .claude/settings.json
{
  "permissions": {
    "defaultMode": "plan"
  }
}
```

---

## 编写测试

```text
为 auth.ts 添加测试，验证：
- 有效 token 允许访问
- 过期 token 返回 401
- 无 token 返回 403

匹配项目中现有的测试风格和框架
```

识别边界情况：

```text
分析代码找出可能被遗漏的测试场景
包括错误条件、边界值和意外输入
```

---

## 创建 Pull Request

```text
用中文创建 PR，标题简洁，描述包含：
- 解决的问题
- 主要改动
- 测试验证
```

会话自动链接到 PR：`claude --from-pr <number>` 恢复。

---

## 使用扩展思考（Thinking Mode）

### 配置方式

| 方式 | 操作 |
|------|------|
| 努力级别 | `/effort` 或 `/model` 调整 |
| Ultrathink 关键字 | 在提示中包含 "ultrathink" |
| 切换快捷键 | `Option+T` (macOS) / `Alt+T` (Win/Linux) |
| 全局默认值 | `/config` 设置 `alwaysThinkingEnabled` |
| 令牌预算 | `MAX_THINKING_TOKENS` 环境变量 |

### 查看思考过程

按 `Ctrl+O` 切换详细模式，显示灰色斜体文本的内部推理。

### 自适应推理

支持努力级别的模型动态分配思考令牌：
- 常规提示：快速响应
- 复杂任务：深度思考

---

## 恢复会话

| 命令 | 用途 |
|------|------|
| `claude --continue` | 继续当前目录最近的对话 |
| `claude --resume` | 打开会话选择器 |
| `claude --resume <name>` | 按名称恢复 |
| `claude --from-pr 123` | 恢复链接到 PR 的会话 |

### 会话选择器快捷键

| 快捷键 | 操作 |
|--------|------|
| `↑` / `↓` | 导航会话 |
| `→` / `←` | 展开/折叠分组 |
| `Enter` | 选择并恢复 |
| `Space` | 预览内容 |
| `Ctrl+R` | 重命名 |
| `Ctrl+A` | 显示所有项目会话 |
| `Ctrl+W` | 显示当前 repo 所有 worktrees |
| `Ctrl+B` | 过滤当前分支会话 |

---

## 引用文件和目录

使用 `@` 快速包含文件：

```text
查看 @src/auth/login.ts 和 @src/auth/logout.ts
```

- 相对或绝对路径均可
- 目录引用显示文件列表
- 单条消息可引用多个文件

---

## 相关页面

- [[best-practices]] — 最佳实践指南
- [[claude-code]] — Claude Code 核心机制
- [[claude-subagents]] — 子代理系统

## 来源

- [常见工作流程](https://code.claude.com/docs/zh-CN/common-workflows) — 官方文档
