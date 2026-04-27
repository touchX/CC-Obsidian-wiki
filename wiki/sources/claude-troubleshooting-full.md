---
name: sources/claude-troubleshooting-full
description: 故障排除完整官方文档 — Claude Code 安装、连接和常见问题解决
type: source
tags: [source, claude, troubleshooting, installation, errors, debug]
created: 2026-04-27
updated: 2026-04-27
source: ../../archive/cc-doc/故障排除.md
---

# 故障排除

## 安装问题

### Claude Code 未安装

```shellscript
# 重新安装
npm uninstall -g @anthropic-ai/claude-code
npm install -g @anthropic-ai/claude-code
```

### 权限错误

```shellscript
# Linux/macOS
sudo npm install -g @anthropic-ai/claude-code
```

## 连接问题

### API 密钥问题

确保 `ANTHROPIC_API_KEY` 环境变量设置正确：

```shellscript
# 检查
echo $ANTHROPIC_API_KEY

# 设置
export ANTHROPIC_API_KEY="sk-ant-..."
```

### 网络代理

如果使用代理，设置 `HTTP_PROXY` 和 `HTTPS_PROXY` 环境变量。

## 诊断命令

```shellscript
# 运行诊断
claude doctor

# 检查配置
claude --doctor

# 调试模式
claude --debug
```

## 常见错误

| 错误 | 解决方案 |
| --- | --- |
| `API key not found` | 设置 ANTHROPIC_API_KEY |
| `Connection timeout` | 检查网络/代理设置 |
| `Permission denied` | 检查文件权限 |
| `Context limit exceeded` | 减少对话历史 |

## 相关资源

- [调试配置](https://code.claude.com/docs/zh-CN/debug-your-config)
- [错误参考](https://code.claude.com/docs/zh-CN/error-reference)
