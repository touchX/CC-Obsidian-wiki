---
name: entities/claude-interactive-mode
description: Claude Code 交互模式 — 键盘快捷键、Vim 编辑、命令历史和后台任务
type: entity
tags: [interactive, shortcuts, vim, history, background-tasks]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/交互模式.md
---

# 交互模式

Claude Code 会话中键盘快捷键、输入模式和交互功能的完整参考。

## 键盘快捷键

### 常规控制

| 快捷键 | 描述 | 上下文 |
| --- | --- | --- |
| `Ctrl+C` | 取消当前输入或生成 | 标准中断 |
| `Ctrl+X Ctrl+K` | 终止所有后台代理 | 后台代理控制 |
| `Ctrl+D` | 退出 Claude Code 会话 | EOF 信号 |
| `Ctrl+G` / `Ctrl+X Ctrl+E` | 在默认文本编辑器中打开 | 编辑提示或响应 |
| `Ctrl+L` | 清除提示输入并重绘屏幕 | 清除并重绘 |
| `Ctrl+O` | 切换转录查看器 | 显示详细工具使用 |
| `Ctrl+R` | 反向搜索命令历史 | 交互式搜索 |
| `Ctrl+B` | 后台运行任务 | 后台运行 bash |
| `Ctrl+T` | 切换任务列表 | 显示/隐藏任务 |
| `Esc + Esc` | 回退或总结 | 恢复到上一个点 |
| `Shift+Tab` / `Alt+M` | 循环权限模式 | 在模式间切换 |

### 文本编辑

| 快捷键 | 描述 |
| --- | --- |
| `Ctrl+A` | 光标移动到行开始 |
| `Ctrl+E` | 光标移动到行末尾 |
| `Ctrl+K` | 删除到行尾 |
| `Ctrl+U` | 从光标删除到行首 |
| `Ctrl+W` | 删除上一个单词 |
| `Ctrl+Y` | 粘贴已删除的文本 |
| `Alt+B` / `Alt+F` | 向前/后移动单词 |

### 多行输入

| 方法 | 快捷键 |
| --- | --- |
| 快速转义 | `\` + `Enter` |
| Option 键 | `Option+Enter` (macOS) |
| Shift+Enter | 开箱即用 (iTerm2, WezTerm, etc.) |
| 控制序列 | `Ctrl+J` |

### 快速命令

| 前缀 | 功能 |
| --- | --- |
| `/` | 命令或 skill |
| `!` | Bash 模式 — 直接运行命令 |
| `@` | 文件路径提及 |

## Vim 编辑器模式

通过 `/config` → 编辑器模式启用。

### 模式切换

| 命令 | 操作 | 来自模式 |
| --- | --- | --- |
| `Esc` | 进入 NORMAL 模式 | INSERT, VISUAL |
| `i` / `I` | 在光标前/行首插入 | NORMAL |
| `a` / `A` | 在光标后/行尾插入 | NORMAL |
| `o` / `O` | 在下方/上方打开行 | NORMAL |

### 导航 (NORMAL 模式)

| 命令 | 操作 |
| --- | --- |
| `h/j/k/l` | 向左/下/上/右移动 |
| `w/e/b` | 下一个/末尾/上一个单词 |
| `0/$` | 行首/行尾 |
| `gg/G` | 输入开始/结束 |
| `f{char}` | 跳转到字符 |

## 命令历史

- 输入历史按工作目录存储
- `/clear` 启动新会话时会重置
- 使用 `Ctrl+R` 反向搜索

### Ctrl+R 反向搜索

1. 按 `Ctrl+R` 激活搜索
2. 输入查询文本
3. 再次按 `Ctrl+R` 循环浏览匹配
4. `Tab/Esc` 接受并继续编辑
5. `Enter` 接受并执行

## 后台 Bash 命令

Claude Code 支持在后台运行命令：

- 异步运行命令，立即返回任务 ID
- 输出写入文件供后续检索
- 按 `Ctrl+B` 将命令移到后台
- 使用 `!` 前缀直接运行 bash 命令

```bash
! npm test
! git status
```

## 任务列表

- 按 `Ctrl+T` 切换任务列表视图
- 显示最多 5 个任务
- 任务在上下文压缩中持续存在
- 使用 `CLAUDE_CODE_TASK_LIST_ID` 跨会话共享

## 侧面问题 (/btw)

使用 `/btw` 快速提问而不添加到对话：

```text
/btw what was the name of that config file?
```

特点：
- 可在 Claude 工作时使用
- 仅从上下文内容回答
- 无工具访问
- 单一响应，无后续轮次

## 会话回顾

离开后返回时显示会话摘要：

- 三分钟无活动后生成
- 运行 `/recap` 按需生成
- 禁用： `/config` → 关闭会话回顾

## 相关页面

- [[claude-cli]] — CLI 基础
- [[claude-commands]] — 命令参考
- [[claude-settings]] — 配置选项
