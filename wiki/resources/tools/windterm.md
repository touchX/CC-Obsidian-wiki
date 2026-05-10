---
name: windterm
description: WindTerm 开源终端模拟器使用指南 - 高性能跨平台终端工具
type: guide
tags: [tools, terminal, ssh, sftp, windterm, 开源]
created: 2026-05-08
updated: 2026-05-08
source: ../../archive/zhihu/WindTerm 使用指南：一款开源的高性能终端模拟器.md
external_url: https://zhuanlan.zhihu.com/p/564584941
---

# WindTerm 使用指南

## 原始文档

> [!info] 来源
> - 知乎专栏：[WindTerm 使用指南](https://zhuanlan.zhihu.com/p/564584941)
> - 作者：阿拉平平
> - 归档副本：[[../../archive/zhihu/WindTerm 使用指南：一款开源的高性能终端模拟器.md|本地归档]]

---

## 概述

WindTerm 是一个基于 C 语言开发的开源终端模拟器，支持跨平台运行。相较于基于 Electron 开发的终端工具（如 Tabby），WindTerm 具有更小的体积和更快的启动速度。

**核心优势**：
- ✅ C 语言开发，性能优越
- ✅ 体积小，启动快
- ✅ 跨平台支持
- ✅ 集成 SFTP 文件传输
- ✅ 命令提示与补全
- ✅ 会话管理功能

**相关资源**：
- [[../github-repos/kingToolbox-WindTerm|GitHub 仓库详情]]
- [官方网站](https://kingtoolbox.github.io/)
- [GitHub 仓库](https://github.com/kingToolbox/WindTerm)

## 下载安装

目前 WindTerm 最新版本为 2.5.0，可以从以下渠道获取：

- 官网下载
- [GitHub Releases](https://github.com/kingToolbox/WindTerm/releases)
- 软件解压即用，无需安装

## 使用说明

### 调整窗格

WindTerm 默认界面包含多个窗格：
- 左侧：资源管理器、文件管理器
- 右侧：会话、历史命令

**简化界面**：
1. 关闭不需要的窗格
2. 路径：『查看』→『窗格』
3. 可按需重新开启

### 新建会话

**步骤**：
1. 点击『会话』→『新建会话』
2. 填写连接信息（主机地址、端口）
3. 点击连接
4. 输入用户名和密码

### 文件传输

WindTerm 集成了 SFTP 传输功能：

**拖拽传输**：
- 打开『文件管理器』窗格
- 直接拖拽文件到目标目录

**大文件优化**：
- 勾选『使用高速传输』选项
- 提升大文件传输速度

### 命令提示与补全

**功能特性**：
- 命令参数提示
- 自动补全
- 结果折叠显示（便于回看历史记录）

### 锁屏功能

**默认设置**：
- 超时时间：30 分钟
- 未设置密码时直接回车解锁

**关闭锁屏**：
1. 『会话』→『首选项』→『设置』→『安全』
2. 将锁屏超时时间改为 0 分钟

## 技术特点

### 性能对比

| 特性 | WindTerm | Electron 终端（如 Tabby） |
|------|----------|---------------------------|
| 开发语言 | C | JavaScript/Electron |
| 体积 | 小 | 大 |
| 启动速度 | 快 | 慢 |
| 资源占用 | 低 | 高 |

### 功能对比

与 Tabby 等终端模拟器相比：
- ✅ 更轻量级
- ✅ 更好的性能
- ✅ 集成文件传输
- ⚠️ 插件生态相对较弱
- ⚠️ 自定义配色选项较少

## 适用场景

**推荐使用**：
- 需要高性能终端工具
- 经常进行 SSH/SFTP 连接
- 需要快速启动和响应
- 资源受限的环境

**可能不太适合**：
- 需要丰富的插件生态
- 高度定制化的界面需求
- 依赖 Electron 生态的集成工具

## 进阶技巧

更多使用技巧参考：
- [官方网站文档](https://kingtoolbox.github.io/)
- [[../github-repos/kingToolbox-WindTerm|仓库 Wiki]]

## 总结

WindTerm 是一款优秀的开源终端模拟器，特别适合追求性能和简洁的用户。如果你厌倦了 Electron 终端的臃肿和慢速，WindTerm 是一个值得尝试的替代方案。

---

*文档创建于 2026-05-08*
*来源：知乎专栏 - 阿拉平平*
