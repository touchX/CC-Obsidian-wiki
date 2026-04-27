# Hooks 模块课程

## 模块概述

学习 Claude Code 的钩子系统，掌握如何通过钩子自动化工作流和扩展功能。

## L1 - 入门

### 学习目标
- 理解 Hooks 的基本概念
- 掌握常用钩子类型
- 能够配置简单的钩子

### 核心内容

#### 1. 什么是 Hooks
Hooks 是在特定事件发生时自动触发的脚本：
- **PreToolUse** - 工具执行前
- **PostToolUse** - 工具执行后
- **Stop** - 会话结束时

#### 2. 钩子配置结构
```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "git push",
        "hooks": [{ "type": "command", "command": "echo 'Review changes'" }]
      }
    ]
  }
}
```

#### 3. 挑战任务 L1

**任务 1.1**: 配置一个 PreToolUse 钩子，在 git 命令前打印提示
**任务 1.2**: 配置一个 PostToolUse 钩子，在编辑文件后自动格式化
**任务 1.3**: 配置一个 Stop 钩子，在会话结束时保存进度

### 自测问题
- PreToolUse 和 PostToolUse 的区别是什么？
- 钩子可以执行哪些类型的操作？

---

## L2 - 进阶

### 学习目标
- 掌握钩子参数和条件匹配
- 能够编写复杂的钩子逻辑
- 理解钩子链和错误处理

### 核心内容

#### 1. Matcher 条件匹配
| 模式 | 示例 | 匹配 |
|------|------|------|
| 精确匹配 | `"git push"` | 精确命令 |
| 通配符 | `"git *"` | git 开头 |
| 正则 | `"^npm.*"` | npm 命令 |

#### 2. 钩子类型
| 类型 | 用途 |
|------|------|
| `command` | 执行 shell 命令 |
| `edit` | 自动修改文件 |
| `confirm` | 请求确认 |

#### 3. 错误处理
```json
{
  "hooks": {
    "PostToolUseFailure": [
      {
        "matcher": ".*",
        "hooks": [{ "type": "command", "command": "echo 'Error occurred'" }]
      }
    ]
  }
}
```

#### 4. 挑战任务 L2

**任务 2.1**: 编写一个钩子，在 TypeScript 文件修改后自动运行类型检查
**任务 2.2**: 创建一个钩子链：PreToolUse 检查 → PostToolUse 验证 → Stop 记录
**任务 2.3**: 实现一个带条件的钩子，只有在特定条件下才触发

---

## L3 - 精通

### 学习目标
- 掌握钩子系统架构
- 能够深度定制钩子行为
- 理解钩子与 Skill 的协作

### 核心内容

#### 1. 钩子系统架构
```
事件触发 → Matcher 匹配 → 钩子执行器 → 结果处理 → 继续/中断
```

#### 2. 高级钩子模式
- 异步钩子执行
- 钩子间数据共享
- 条件分支逻辑

#### 3. 钩子与 Skill
```typescript
const hook = {
  type: 'skill',
  skill: 'my-custom-hook-skill',
  params: { mode: 'strict' }
};
```

#### 4. 综合项目 L3

**项目**: 为团队设计一套开发流程钩子系统
- 代码风格检查钩子
- 自动化测试钩子
- 文档更新钩子
- 部署前验证钩子

---

## Wiki 参考资料

- `wiki/entities/claude-hooks.md`
- `wiki/sources/claude-hooks-full.md`
