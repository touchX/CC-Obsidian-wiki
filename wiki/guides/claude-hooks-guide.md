---
claude.hooks.guide
name: guides/claude-hooks-guide
description: Claude Code Hooks 实用指南：7 个常见场景的即用型配置（通知、自动格式化、阻止编辑、上下文补充等）
type: guide
tags: [claude, hooks, quickstart, automation, tutorial]
created: 2026-05-04
updated: 2026-05-04
source: ../../raw/claude/Automate workflows with hooks.md
---

# Claude Hooks 实用指南

> 本页面提供 Claude Code Hooks 的实用配置示例，涵盖 7 个常见场景。如需完整的 30+ 事件参考，参见 [[claude-hooks-configuration-guide|Claude Hooks 配置指南]]。

## 场景一：发送通知

### 发送 Slack 通知

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "curl -X POST -H 'Content-type: application/json' --data '{\"text\":\"Build completed in ${tool_output.duration}ms\"}' https://hooks.slack.com/services/XXX",
            "async": true
          }
        ]
      }
    ]
  }
}
```

### 发送邮件通知

```json
{
  "hooks": {
    "SessionEnd": [
      {
        "matcher": "end",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'Session completed at $(date)' | sendmail user@example.com",
            "async": true
          }
        ]
      }
    ]
  }
}
```

## 场景二：自动格式化

### Prettier 自动格式化

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "prettier --write \"$CLAUDE_PROJECT_DIR/${tool_input.file_path}\"",
            "async": true
          }
        ]
      }
    ]
  }
}
```

### ESLint 检查后自动修复

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Bash(npm test*)",
        "hooks": [
          {
            "type": "command",
            "command": "npm run lint:fix",
            "async": true
          }
        ]
      }
    ]
  }
}
```

## 场景三：阻止编辑

### 阻止直接编辑 schema 文件

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "check-schema-edit.sh \"${tool_input.file_path}\""
          }
        ]
      }
    ]
  }
}
```

### check-schema-edit.sh 实现

```bash
#!/bin/bash
file="$1"
if [[ "$file" == *"schema.ts" ]]; then
  echo '{"continue": false, "stopReason": "请编辑 src/schema.ts 并运行 bun generate 而不是直接修改生成的 schema 文件"}'
  exit 2
fi
exit 0
```

## 场景四：自动批准权限

### 批准测试命令

```json
{
  "hooks": {
    "PermissionRequest": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "if": "Bash(npm test*|pytest *|cargo test*)",
            "command": "echo '{\"hookSpecificOutput\": {\"hookEventName\": \"PermissionRequest\", \"decision\": {\"behavior\": \"allow\"}}}'"
          }
        ]
      }
    ]
  }
}
```

### 批准安全路径

```json
{
  "hooks": {
    "PermissionRequest": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "if": "Bash(git *|npm install|npm build*|cargo check*)",
            "command": "echo '{\"hookSpecificOutput\": {\"hookEventName\": \"PermissionRequest\", \"decision\": {\"behavior\": \"allow\"}}}'"
          }
        ]
      }
    ]
  }
}
```

## 场景五：上下文补充

### 从环境文件注入变量

```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "matcher": "user",
        "hooks": [
          {
            "type": "command",
            "command": "cat .env | grep -E '^MYVAR' | sed 's/^/Your MYVAR environment variables are: /'"
          }
        ]
      }
    ]
  }
}
```

### 从项目文件注入 API 状态

```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "matcher": "start",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.api_status' \"$CLAUDE_PROJECT_DIR/.status.json\" 2>/dev/null || echo 'No API status available'"
          }
        ]
      }
    ]
  }
}
```

## 场景六：使用 direnv

### .env 文件自动加载

```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "startup",
        "hooks": [
          {
            "type": "command",
            "command": "if [ -f .env ]; then direnv allow .; fi",
            "timeout": 30
          }
        ]
      }
    ]
  }
}
```

### 使用 .env 模板

```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "startup",
        "hooks": [
          {
            "type": "command",
            "command": "if [ ! -f .env ] && [ -f .env.example ]; then cp .env.example .env; direnv allow .; fi",
            "timeout": 30
          }
        ]
      }
    ]
  }
}
```

## 场景七：配置变更审计

### 记录配置变更

```json
{
  "hooks": {
    "ConfigChange": [
      {
        "matcher": "hooks",
        "hooks": [
          {
            "type": "command",
            "command": "audit-hooks.sh \"$CLAUDE_PROJECT_DIR/.claude/settings.json\""
          }
        ]
      }
    ]
  }
}
```

### 审计脚本示例

```bash
#!/bin/bash
config_file="$1"
timestamp=$(date '+%Y-%m-%d %H:%M:%S')
git diff "$config_file" > /tmp/hooks-diff.txt
if [ -s /tmp/hooks-diff.txt ]; then
  echo "[$timestamp] Hooks 配置变更" >> "$CLAUDE_PROJECT_DIR/.claude/hooks-audit.log"
  cat /tmp/hooks-diff.txt >> "$CLAUDE_PROJECT_DIR/.claude/hooks-audit.log"
fi
```

## 进阶技巧

### Prompt Hook 评估代码质量

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "prompt",
            "prompt": "Review this code for best practices. Respond with 'approve' or 'suggest changes' with specific suggestions: $ARGUMENTS"
          }
        ]
      }
    ]
  }
}
```

### Agent Hook 复杂验证

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "agent",
            "prompt": "Verify this command is safe. Check for: 1) No destructive operations, 2) Proper file paths, 3) No secrets. Report back with verdict and reasoning.",
            "timeout": 60
          }
        ]
      }
    ]
  }
}
```

### HTTP Hook 发送 Webhook

```json
{
  "hooks": {
    "SessionEnd": [
      {
        "matcher": "end",
        "hooks": [
          {
            "type": "http",
            "url": "https://api.example.com/webhooks/claude",
            "headers": { "Authorization": "Bearer $WEBHOOK_TOKEN" },
            "allowedEnvVars": ["WEBHOOK_TOKEN"]
          }
        ]
      }
    ]
  }
}
```

## 故障排除

### Hook 不触发

检查项：
1. Matcher 语法是否正确
2. 权限规则是否允许执行
3. 规则文件路径是否正确

### Exit Code 问题

| Exit Code | 含义 | 处理 |
|-----------|------|------|
| 0 | 成功 | 正常处理 JSON 输出 |
| 2 | 阻止 | 操作被阻止，显示错误消息 |
| 其他 | 非阻止错误 | 显示错误，执行继续 |

### JSON 解析失败

常见原因：
- shell profile 打印额外文本
- 命令输出包含非 JSON 内容

修复方法：
```bash
# 使用 subshell 隔离输出
(command) 2>/dev/null
```

## 相关资源

- [[claude-hooks-configuration-guide|Claude Hooks 配置指南]] — 完整 30+ 事件参考
- [Claude Code Hooks 官方文档](https://code.claude.com/docs/en/hooks)
- [Claude Code 产品页](https://www.claude.com/product/claude-code)
