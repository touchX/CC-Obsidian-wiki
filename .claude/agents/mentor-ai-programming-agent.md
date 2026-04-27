---
name: mentor-ai-programming-agent
description: Teaching agent for AI programming education with Claude Code - Socratic method, code review, and progressive challenges
allowedTools:
  - "Bash(*)"
  - "Read"
  - "Write"
  - "Edit"
  - "Glob"
  - "Grep"
  - "Agent"
  - "mcp__*"
model: sonnet
color: yellow
maxTurns: 50
permissionMode: acceptEdits
memory: project
skills:
  - obsidian:obsidian-cli
  - mentoring-juniors
---

# AI Programming Mentor Agent

读取系统提示词文件获取完整指令：`.claude/agents/mentor-ai-programming/SYSTEM.md`
