---
name: tmux-terminal-multiplexer
description: tmux 终端复用器 — 多任务管理大师，让你的终端变成超级工作站
type: tutorial
tags: [tmux, terminal, multiplexer, productivity, devtools, 中文教程]
created: 2026-05-11
updated: 2026-05-11
source: ../../archive/clippings/bilibili/2026-05-11-终端神器tmux：多任务管理大师.md
external_url: https://www.bilibili.com/video/BV1ML411h7tF
video_author: TheCW
video_bvid: BV1ML411h7tF
---

# tmux：终端多任务管理大师

## 原始文档

> [!info] 来源
> - Bilibili 视频：[终端神器tmux：多任务管理大师](https://www.bilibili.com/video/BV1ML411h7tF)
> - 作者：TheCW
> - 上传日期：2023-05-09
> - 归档副本：[[../../archive/clippings/bilibili/2026-05-11-终端神器tmux：多任务管理大师.md|本地归档]]

---

## 什么是 tmux

**tmux** = **terminal multiplexer**（终端复用器）

**核心作用**：
1. 让同一个终端当成很多个终端来使用
2. 保留远程工作环境（SSH 断开后继续运行）

**官方定义**：让你的同一个终端能当做很多个终端来使用。

## 为什么需要 tmux

### 问题场景

1. **窗口管理混乱**：
   - 开发需要多个终端窗口
   - 写代码、管理软件、调试程序
   - 窗口太多难以管理

2. **SSH 会话丢失**：
   - SSH 到远程服务器安装软件
   - 连接断开或意外关闭
   - 正在运行的进程被终止

### 解决方案

**tmux 提供的能力**：
- ✅ 用一个终端窗口干十个终端的事情
- ✅ SSH 断开后工作环境被保留
- ✅ 重新连接后恢复工作状态

## 核心概念

tmux 有三个层次的概念：

```
Session（会话/工作空间）
    └── Window（大窗口）
            └── Pane（小窗口/分屏）
```

| 概念 | 说明 | 类比 |
|------|------|------|
| **Session** | 工作空间，可以包含多个 Window | 多桌面 |
| **Window** | 大窗口，可以包含多个 Pane | 标签页 |
| **Pane** | 小窗口，Window 的分屏 | 分屏窗口 |

## 基础操作

### 前置键（Prefix Key）

**默认前置键**：`Ctrl+b`

**工作流程**：
1. 先按 `Ctrl+b`
2. 松开
3. 再按命令键

> [!WARNING] 重要提醒
> 默认的 `Ctrl+b` 键位非常"阴间"（难用），但需要熟悉，因为在别人的服务器或新环境上都是默认配置。

### Session（会话）操作

| 操作 | 命令 | 说明 |
|------|------|------|
| **创建新会话** | `tmux` | 创建并进入新会话 |
| **分离会话** | `Ctrl+b` 然后按 `d` | 暂时离开，保留会话 |
| **重新连接** | `tmux attach` 或 `tmux a` | 连回上一个会话 |
| **连接指定会话** | `tmux attach -t <session-name>` | 连接到指定会话 |
| **列出所有会话** | `tmux ls` | 查看所有会话 |
| **杀死会话** | `tmux kill-session -t <session-name>` | 删除指定会话 |

### Window（窗口）操作

| 操作 | 命令 | 说明 |
|------|------|------|
| **创建新窗口** | `Ctrl+b` 然后按 `c` | 创建新窗口 |
| **切换到窗口 N** | `Ctrl+b` 然后按 `0-9` | 切换到指定编号窗口 |
| **切换到左边窗口** | `Ctrl+b` 然后按 `p` | Previous |
| **切换到右边窗口** | `Ctrl+b` 然后按 `n` | Next |
| **查看所有窗口** | `Ctrl+b` 然后按 `w` | 显示窗口列表 |
| **重命名窗口** | `Ctrl+b` 然后按 `,` | 修改窗口名称 |
| **关闭窗口** | `Ctrl+b` 然后按 `&` | 关闭当前窗口 |

### Pane（分屏）操作

| 操作 | 命令 | 说明 |
|------|------|------|
| **横向分屏** | `Ctrl+b` 然后按 `%` | 左右分屏 |
| **纵向分屏** | `Ctrl+b` 然后按 `"` | 上下分屏 |
| **切换 Pane** | `Ctrl+b` 然后按 `方向键` | 在分屏间移动 |
| **显示 Pane 编号** | `Ctrl+b` 然后按 `q` | 显示编号，按数字选择 |
| **最大化 Pane** | `Ctrl+b` 然后按 `z` | 最大化/恢复 |
| **关闭 Pane** | `Ctrl+b` 然后按 `x` | 关闭当前分屏 |
| **切换布局** | `Ctrl+b` 然后按 `space` | 切换分屏布局 |

## Copy Mode（复制模式）

**进入复制模式**：
```bash
Ctrl+b 然后按 :
# 输入 copy-mode
```

**默认快捷键**：emacs 键位
**推荐配置**：vim 键位（见配置文件）

**用途**：
- 复制终端内容
- 查看历史输出
- 选择文本块

## 去阴间化配置

### 配置文件位置

两个选择：
1. `~/.tmux.conf`（传统位置）
2. `~/.config/tmux/tmux.conf`（XDG 标准）

### 推荐配置（去阴间化）

```bash
# ~/.tmux.conf

# 1. 修改前置键（从 Ctrl-b 改为 Ctrl-s）
unbind C-b
set-option -g prefix C-s
bind-key C-s send-prefix

# 2. 设置默认工作路径（继承上一个 Pane 的路径）
bind c new-window -c "#{pane_current_path}"
bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

# 3. 使用 vim 键位
set-window-option -g mode-keys vi

# 4. 窗口和 Pane 操作优化
bind -n M-1 select-window -t 1
bind -n M-2 select-window -t 2
bind -n M-3 select-window -t 3
bind -n M-4 select-window -t 4

# 5. Pane 快速切换
bind -n M-h select-pane -L
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-l select-pane -R

# 6. Pane 移动到其他窗口
bind-key M-1 move-pane -t 1
bind-key M-2 move-pane -t 2
bind-key M-3 move-pane -t 3
bind-key M-4 move-pane -t 4

# 7. 分屏快捷键优化
bind h split-window -h -c "#{pane_current_path}"
bind j split-window -v -c "#{pane_current_path}"
bind k split-window -v -c "#{pane_current_path}"
bind l split-window -h -c "#{pane_current_path}"

# 8. 最大化 Pane（改为 Alt+f）
bind -n M-f resize-pane -Z

# 9. 交换 Pane 位置
bind < swap-pane -U
bind > swap-pane -D

# 10. 鼠标支持
set -g mouse on

# 11. 状态栏优化
set -g status-interval 1
set -g status-justify centre
set -g status-left-length 100
set -g status-right-length 100
```

### 配置生效

```bash
# 方法 1：重启 tmux
tmux kill-server
tmux

# 方法 2：在 tmux 内重载配置
Ctrl+b 然后按 :
source-file ~/.tmux.conf
```

## 状态栏美化

### tmux-powerline

**GitHub**: https://github.com/erikw/tmux-powerline

**功能**：
- 显示系统信息
- 自定义显示内容
- 支持天气、邮件、IP 地址等

### rainbow-chunk

**功能**：显示 CPU 和内存使用情况

**颜色含义**：
- 🟢 绿色：完全可用内存
- 🔴 红色：系统使用
- 🟡 黄色：其他程序使用
- 🔵 蓝色：Inactive memory（可复用）

## 实际使用场景

### 场景 1：远程服务器开发

```bash
# SSH 到服务器
ssh user@server

# 创建 tmux 会话
tmux

# 开多个窗口：
# Window 0: Vim 编辑代码
# Window 1: 运行测试
# Window 2: 查看日志

# 意外断开 SSH？没问题
# 重新连接：
ssh user@server
tmux attach

# 所有窗口和进程都在！
```

### 场景 2：本地多任务开发

```
Session: "project-x"
├── Window 0: 编辑器 (Vim)
│   ├── Pane 1: 代码文件
│   ├── Pane 2: 终端
│   └── Pane 3: Git diff
├── Window 1: 测试
│   ├── Pane 1: 运行测试
│   └── Pane 2: 查看覆盖率
└── Window 2: 文档
    └── Pane 1: 查看文档
```

### 场景 3：长时间任务

```bash
# 启动长时间任务（如编译、训练模型）
tmux
cd /path/to/project
make build  # 或 python train.py

# 分离会话
Ctrl+b d

# 关闭电脑，回家
# ...

# 第二天继续
tmux attach
# 任务还在运行！
```

## 快捷键速查表

### 默认快捷键（必须掌握）

| 操作 | 快捷键 |
|------|--------|
| **前置键** | `Ctrl+b` |
| **创建会话** | `tmux` |
| **分离会话** | `Ctrl+b` → `d` |
| **重新连接** | `tmux attach` |
| **创建窗口** | `Ctrl+b` → `c` |
| **切换窗口** | `Ctrl+b` → `0-9` |
| **横向分屏** | `Ctrl+b` → `%` |
| **纵向分屏** | `Ctrl+b` → `"` |
| **切换 Pane** | `Ctrl+b` → `方向键` |
| **最大化 Pane** | `Ctrl+b` → `z` |
| **关闭 Pane** | `Ctrl+b` → `x` |

### 推荐快捷键（自定义后）

| 操作 | 快捷键 |
|------|--------|
| **前置键** | `Ctrl+s` |
| **切换窗口** | `Alt+1-4` |
| **切换 Pane** | `Alt+h/j/k/l` |
| **横向分屏** | `Ctrl+s` → `l` |
| **纵向分屏** | `Ctrl+s` → `j` |
| **最大化** | `Alt+f` |

## 相关资源

| 资源 | 链接 |
|------|------|
| **tmux 官方文档** | https://github.com/tmux/tmux/wiki |
| **tmux Cheat Sheet** | https://tmuxcheatsheet.com/ |
| **作者配置** | https://github.com/theniceboy/.config/blob/master/.tmux.conf |
| **tmux-powerline** | https://github.com/erikw/tmux-powerline |
| **B站视频教程** | https://www.bilibili.com/video/BV1ML411h7tF |

## 学习建议

1. **第一阶段（1天）**：
   - 熟悉默认快捷键
   - 掌握 Session/Window/Pane 概念
   - 练习基本操作

2. **第二阶段（3天）**：
   - 应用去阴间化配置
   - 修改前置键和常用快捷键
   - 适配个人习惯

3. **第三阶段（1周）**：
   - 集成到日常工作流
   - 配合状态栏美化
   - 形成肌肉记忆

## 总结

**tmux 的价值**：
- ✅ 一个终端 = 多个终端
- ✅ SSH 断线不影响工作
- ✅ 提高终端使用效率
- ✅ 可高度定制化

**投入产出比**：
- 学习成本：1-3 天
- 长期收益：每天节省 30+ 分钟窗口切换时间

**核心理念**：
> 磨刀不误砍柴工 — 现在投入时间，未来节省大量时间和精力。

---

*文档创建于 2026-05-11*
*来源：Bilibili - TheCW*
*主题：终端工具*
*类型：视频教程*
