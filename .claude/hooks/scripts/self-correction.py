#!/usr/bin/env python3
"""
自纠错 PreToolUse 钩子 — 在工具执行前检查是否符合项目规则。

检查项：
1. Write 到 wiki/ 目录 → 提醒使用 obsidian create
2. Grep/Glob 搜索 wiki 内容 → 提醒使用 obsidian search
3. 创建 Wiki 页面后 → 提醒运行 wiki-lint

读取 stdin 获取工具调用 JSON，输出到 stderr 不影响工具执行。
"""
import sys
import json

try:
    data = json.load(sys.stdin)
except (json.JSONDecodeError, SystemExit):
    sys.exit(0)

tool_name = data.get("tool", "")
params = data.get("parameters", {})

reminders = []

if tool_name == "Write":
    file_path = params.get("file_path", "")
    if "wiki/" in file_path.replace("\\", "/"):
        reminders.append(
            "⚠️ 自纠错: 写入 wiki/ 目录？考虑用 obsidian create 替代 Write"
        )

elif tool_name == "Grep":
    pattern = params.get("pattern", "")
    path = params.get("path", "")
    if "wiki" in path or "wiki" in pattern:
        reminders.append(
            "⚠️ 自纠错: 搜索 Wiki 内容？考虑用 obsidian search 替代 Grep"
        )

elif tool_name == "Glob":
    pattern = params.get("pattern", "")
    if "wiki" in pattern:
        reminders.append(
            "⚠️ 自纠错: 搜索 Wiki 文件？考虑用 obsidian search 替代 Glob"
        )

if reminders:
    for msg in reminders:
        print(msg, file=sys.stderr)
