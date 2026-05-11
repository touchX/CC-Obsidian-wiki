---
name: deepseek-v4-claude-code
description: DeepSeek V4 Pro 接入 Claude Code 教程 — 解锁 1M 上下文和 Max 思考等级
type: tutorial
tags: [deepseek, claude-code, api-integration, model-switching, cc-switch, 视频教程]
created: 2026-05-11
updated: 2026-05-11
source: ../../../archive/clippings/bilibili/2026-05-11-DeepSeek-V4-pro接入Claude Code教程-解锁1m上下文+Max思考等级.md
external_url: https://www.bilibili.com/video/BV1pQRNBsEGs
video_author: 小陈同学c_z
video_bvid: BV1pQRNBsEGs
---

# DeepSeek V4 接入 Claude Code 教程

> [!info] 来源
> - Bilibili 视频：[DeepSeek-V4-pro接入Claude Code教程，解锁1m上下文+Max思考等级](https://www.bilibili.com/video/BV1pQRNBsEGs)
> - 作者：小陈同学c_z
> - 上传日期：2026-05-01
> - 归档副本：[[../../../archive/clippings/bilibili/2026-05-11-DeepSeek-V4-pro接入Claude Code教程-解锁1m上下文+Max思考等级.md|本地归档]]

---

## 核心内容

### 教程目标

将 DeepSeek 最新的 V4 模型接入 Claude Code，解锁：
- **1M 上下文窗口**
- **Max 思考等级**
- **V4 Flash 和 V4 Pro 模型**

### 优势

| 特性 | 说明 |
|------|------|
| **性价比高** | V4 Pro 降价后，价格更优 |
| **Agent 适配** | 对 Agent 有专门优化 |
| **1M 上下文** | 对大多数人更友好 |

---

## 安装流程

### 第一步：安装 Claude Code

> [!tip] 重要说明
> Claude Code 软件可以正常下载安装，被封的是个人账号（官方模型）。不订阅官方模型，依旧可以使用框架。

#### 安装命令

**macOS/Linux**：
```bash
curl -fsSL https://code.claude.com/install.sh | sh
```

**Windows PowerShell**：
```powershell
irm https://code.claude.com/install.ps1 | iex
```

**Windows CMD**：
```cmd
powershell -c "irm https://code.claude.com/install.ps1 | iex"
```

> [!warning] Windows 用户注意
> 需要先安装 Git：https://git-scm.com/downloads

#### 配置环境变量

安装后如果提示未加入环境变量，执行提供的命令，然后验证：
```bash
claude --version
```

---

### 第二步：安装 CC Switch

> [!tip] CC Switch 是什么？
> 开源工具，让 Claude Code 方便切换模型。累计下载 300 万+，GitHub 5万+ Stars。

#### 核心功能

| 功能 | 说明 |
|------|------|
| **配置同步** | 一份配置同步到多个应用 |
| **热切换** | 不需要退出应用即可切换模型 |
| **用量仪表盘** | 查看请求数和 Token 用量 |

#### 下载安装

1. 访问项目 Releases 页面
2. 滑到最底部选择对应版本：
   - **macOS**：下载 `.dmg` 版本
   - **Windows**：下载 `.exe` 版本
3. 直接点击安装包安装

---

### 第三步：购买 API 并配置

#### DeepSeek 开放平台

**官方链接**：
- API 开放平台：https://platform.deepseek.com/api_keys
- 官方文档：https://api-docs.deepseek.com/zh-cn/quick_start/agent_integrations/claude_code

#### 价格信息

| 模型 | 价格（每百万 Tokens） |
|------|---------------------|
| **V4 Pro 输入** | ¥0.025（缓存命中）/ ¥3（未命中） |
| **V4 Pro 输出** | ¥6 |
| **折扣** | 2.5 折（截止 2026-05-31） |

> [!tip] 计费方式
> - 网页对话：完全免费
- API 调用：需要充值（用多少花多少，无月费套餐）

#### 充值配置

1. 登录 DeepSeek 开放平台
2. 点击充值按钮
3. 选择金额和支付方式
4. 建议：先小额充值，根据使用情况再追加

---

## 模型配置

### 1M 上下文配置

在 Claude Code 配置中设置：
- **上下文长度**：1M Tokens
- **思考等级**：Max

### 模型切换

通过 CC Switch 实现：
1. 打开 CC Switch
2. 添加 DeepSeek API Key
3. 选择 V4 Flash 或 V4 Pro
4. 在 Claude Code 中热切换

---

## 测试效果

### 真实任务测试

使用 DeepSeek V4 Pro + Claude Code 组合：
- 测试实际开发任务
- 评估响应速度
- 检查代码质量
- 计算成本

### 成本对比

| 场景 | 官方模型 | DeepSeek V4 Pro |
|------|---------|-----------------|
| **小任务** | 按月订阅 | 按量计费 |
| **大任务** | Token Plan | 更低单价 |

---

## 相关链接

| 资源 | 链接 |
|------|------|
| **DeepSeek API** | https://platform.deepseek.com/api_keys |
| **官方文档** | https://api-docs.deepseek.com/zh-cn/quick_start/agent_integrations/claude_code |
| **CC Switch** | https://github.com/farion1231/cc-switch |
| **Claude Code** | https://code.claude.com/docs/zh-CN/overview |

---

## 视频时间戳

| 时间 | 章节 |
|------|------|
| `00:00` | 介绍 |
| `00:41` | 安装 Claude Code |
| `02:12` | 安装 CC Switch |
| `03:00` | 购买 API 并配置 |
| `06:05` | 演示操作 |
| `09:01` | 查看花费 |

---

## 相关资源

- [[opencode-alternative]] — OpenCode 开源替代方案
- [[claude-commands]] — Claude Code 命令参考
- [[agent-teams]] — Agent 团队协作

---

*文档创建于 2026-05-11*
*来源：Bilibili - 小陈同学c_z*
*主题：DeepSeek V4 接入 Claude Code*
*类型：视频教程*
