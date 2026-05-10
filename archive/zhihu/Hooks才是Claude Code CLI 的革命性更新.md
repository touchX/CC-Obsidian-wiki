---
title: "Hooks才是Claude Code CLI 的革命性更新"
source: "https://zhuanlan.zhihu.com/p/1961858543805248206"
created: 2026-05-08
description: "前言前面对Claude Code CLI有了基本了解，今天继续深度探索Claude Code CLI Hooks的使用方式。对往期内容感兴趣的小伙伴也可以看往期内容： Claude Code CLI平台与中转站接入汇总及避坑使用Claude Code Router轻松…"
tags:
  - "zhihu"
  - "clippings"
---
[收录于 · AIGC](https://www.zhihu.com/column/c_1826210253475282944)

48 人赞同了该文章

## 前言

前面对Claude Code CLI有了基本了解，今天继续深度探索Claude Code CLI Hooks的使用方式。对往期内容感兴趣的小伙伴也可以看往期内容：

- [Claude Code CLI平台与中转站接入汇总及避坑](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s%3F__biz%3DMzU5Njg3ODUzOA%3D%3D%26mid%3D2247493035%26idx%3D1%26sn%3D9ccc174a34a0ee59e6a609e409b09908%26scene%3D21%23wechat_redirect)
- [使用Claude Code Router轻松切换各种高性价比模型](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s%3F__biz%3DMzU5Njg3ODUzOA%3D%3D%26mid%3D2247493062%26idx%3D1%26sn%3D23bf774d1aef130d687887222bf78483%26scene%3D21%23wechat_redirect)
- [Claude Code CLI MCP配置很难？三种方式轻松掌握](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s%3F__biz%3DMzU5Njg3ODUzOA%3D%3D%26mid%3D2247493089%26idx%3D1%26sn%3D4e33af0b23b37d0af26f0ca1da004ed6%26scene%3D21%23wechat_redirect)
- [深入了解Claude Code CLI自定义命令](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s%3F__biz%3DMzU5Njg3ODUzOA%3D%3D%26mid%3D2247493125%26idx%3D1%26sn%3D853ce6c8f920ef0d86b0b1820f8d0a3f%26scene%3D21%23wechat_redirect)
- [深入了解Claude Code CLI子代理Subagent](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s%3F__biz%3DMzU5Njg3ODUzOA%3D%3D%26mid%3D2247493143%26idx%3D1%26sn%3De7cbb66cacd921cb934f3aaeda3bf30d%26scene%3D21%23wechat_redirect)

## 当前使用版本

1.0.128 (Claude Code)

## 配置文件

Claude Code CLI钩子配置在 [settings.json](https://zhida.zhihu.com/search?content_id=264263103&content_type=Article&match_order=1&q=settings.json&zhida_source=entity) 文件，提供了 用户(全局)配置、项目配置、本地项目配置 3种配置方式：

- 用户(全局)配置：作用于当前用户下单所有项目，路径：~/.claude/settings.json
- 项目配置：作用于特定项目，路径：.claude/settings.json
- 本地项目配置：作用于特定本地项目(git忽略)，路径：.claude/settings.local.json

## Hooks格式

钩子由匹配器组织，每个匹配器可以有多个钩子， 格式如下：

```
{
  "hooks": {
    "EventName": [
      {
        "matcher": "ToolPattern",
        "hooks": [
          {
            "type": "command",
            "command": "your-command-here",
            "timeout": 100
          }
        ]
      }
    ]
  }
}
```
- matcher：匹配工具名称的模式，区分大小写（仅适用于 PreToolUse 和 [PostToolUse](https://zhida.zhihu.com/search?content_id=264263103&content_type=Article&match_order=1&q=PostToolUse&zhida_source=entity) ）
- 支持字符串匹配， 例如：Write匹配写入工具，Bash匹配Shell命令
	- 支持正则表达式，例如：Edit|Write 或者 Notebook.\*
	- 使用 \* 匹配所有工具，也可以不配置或者使用 ""
- hooks：模式匹配时要执行的命令数组
- type：目前仅支持command
	- command：要执行的Shell命令（可以使用 $CLAUDE\_PROJECT\_DIR 等环境变量）
	- timeout：（可选）在取消该特定命令之前，命令应运行多长时间（以秒为单位）

## Hook事件及匹配器

Claude Code提供了几个在工作流程不同时间点运行的Hook事件，其中不同的Hook事件提供了不同的匹配器。

### Hook事件

Claude Code Hook事件：

- PreToolUse：在工具调用之前运行（可以阻止它们）
- PostToolUse：在工具调用完成后运行
- [UserPromptSubmit](https://zhida.zhihu.com/search?content_id=264263103&content_type=Article&match_order=1&q=UserPromptSubmit&zhida_source=entity) ：在用户提交提示词时运行，在 Claude 处理之前
- [Notification](https://zhida.zhihu.com/search?content_id=264263103&content_type=Article&match_order=1&q=Notification&zhida_source=entity) ：在 Claude Code 发送通知时运行
- Stop：在 Claude Code 完成响应时运行
- SubagentStop：在子代理任务完成时运行
- PreCompact：在 Claude Code 即将运行压缩操作之前运行
- [SessionStart](https://zhida.zhihu.com/search?content_id=264263103&content_type=Article&match_order=1&q=SessionStart&zhida_source=entity) ：在 Claude Code 开始新会话或恢复现有会话时运行
- [SessionEnd](https://zhida.zhihu.com/search?content_id=264263103&content_type=Article&match_order=1&q=SessionEnd&zhida_source=entity) ：在 Claude Code 会话结束时运行

### PreToolUse和PostToolUse匹配器

PreToolUse、PostToolUse常见匹配器：

- Task：子代理任务
- Bash： Shell 命令
- Glob： 文件模式匹配
- Grep：内容搜索
- Read：文件读取
- Edit：编辑
- MultiEdit：多重编辑
- Write：文件写入
- WebFetch：Web拉取
- WebSearch：Web搜索

### PreCompact匹配器

PreCompact常见匹配器：

- manual：从 /compact 调用
- auto：从自动压缩调用（由于完整上下文窗口）

### SessionStart匹配器

SessionStart常见匹配器：

- startup：从启动调用
- resume：从 --resume、--continue 或 /resume 调用
- clear：从 /clear 调用
- compact：从自动或手动压缩调用

### SessionEnd匹配器

SessionEnd常见匹配器：

- clear：使用 /clear 命令清除会话
- logout：用户注销
- prompt\_input\_exit：用户在提示输入可见时退出
- other：其他退出原因

## 基本使用

Claude Code CLI提供了创建Hooks的交互式命令，对交互式命令创建Hooks流程还不了解的小伙伴可以看往期内容： [Claude Code CLI初体验](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s%3F__biz%3DMzU5Njg3ODUzOA%3D%3D%26mid%3D2247492929%26idx%3D1%26sn%3D043e21a18f31f1c4c68bf4ee63e28685%26scene%3D21%23wechat_redirect)

在使用示例中我们主要以使用手动配置为主。

### 读取命令行参数

钩子输入JSON格式可以查看官网文档： [docs.anthropic.com/en/d](https://link.zhihu.com/?target=https%3A//docs.anthropic.com/en/docs/claude-code/hooks%23hook-input)

从命令行读取输入参数主要用到jq，简单了解一下jq。

jq是一个轻量级且灵活的命令行 JSON 处理器，它可以对 JSON 数据进行解析、提取、转换和格式化等操作，广泛应用于在 Shell 脚本中处理 JSON 数据，或者在命令行下快速查看和处理 JSON 格式的文件或输出。

jq官网： [jqlang.org/](https://link.zhihu.com/?target=https%3A//jqlang.org/)

以macOS为例，可以使用brew安装jq

```
$ brew install jq
```

在.claude/settings.local.json添加如下配置：

```
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '\"\\(.tool_input.command) - \\(.tool_input.description // \"No description\")\"' >> ~/.claude/bash-command-log.txt"
          }
        ]
      }
    ]
  }
}
```

重启Claude Code CLI，让Claude Code运行一个简单的命令，比如 ls

![](https://pic2.zhimg.com/v2-246f8ac75eccbcf0f02f51e46c99be57_1440w.jpg)

执行完成后，可以看到在项目目录下多了一个 bash-command-log.txt文件，内容为 ls - List files in current directory正是Claude Code执行的ls命令及ls命令描述

![](https://pica.zhimg.com/v2-3101d84e8faba5df9900ad8c50e81886_1440w.jpg)

### 代码格式化

通过命令行也可以实现代码格式化功能，编辑文件后自动格式化文件，这里以格式化TypeScript文件为例，在.claude/settings.local.json添加如下配置：

```
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|MultiEdit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "jq -r '.tool_input.file_path' | { read file_path; if echo \"$file_path\" | grep -q '\\.ts$'; then npx prettier --write \"$file_path\"; fi; }"
          }
        ]
      }
    ]
  }
}
```

随便创建一个ts文件，输入示例内容

![](https://pic4.zhimg.com/v2-1c962b1705073bb370350b93ea69b9e5_1440w.jpg)

重启Claude Code CLI，修改ts文件内容

![](https://pic2.zhimg.com/v2-285b7aea649c51a7e505b91facd9bbd5_1440w.jpg)

使用 Ctrl+R 快捷键查看详细调用信息，可以看到调了 PostToolUse:Edit钩子并执行了自定义的钩子命令

![](https://picx.zhimg.com/v2-18c565bd1449e9f7d120f50e83b708f5_1440w.jpg)

### 执行脚本

从前面例子可以看到Shell命令很强大，通过Hooks事件配合Shell命令可以完成很多事件，但是Shell命令自身也有很多局限性，如需要一定学习成本，对于某些复杂和需要灵活定义的场景表现力不从心，不过我们没必要担心，因为Claude Code CLI也支持调用脚本。其次就是使用Shell命令我们无法查看工具调用的输入参数，导致很多脚本基本上都是在盲写，只有通过验证才看到脚本的错误，这些问题通过脚本将不复存在。

**执行Shell脚本**

在Hooks中使用脚本也很简单，只需要将 command执行内容改成脚本执行方式即可

```
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "sh ./hello.sh"
          }
        ]
      }
    ]
  }
}
```

在项目根目录创建 hello.sh脚本文件，脚本内容如下：

![](https://pica.zhimg.com/v2-38f717604b377453780b255e6e2bb8d6_1440w.jpg)

重启Claude Code CLI，在交互模式随便输入提示词

![](https://pica.zhimg.com/v2-d99f9df23699196ca8997cedb0ba5100_1440w.jpg)

在Claude Code CLI Hooks事件中也可以使用环境变量 CLAUDE\_PROJECT\_DIR(仅限于Claude Code CLI Hooks命令中使用) 来引用项目脚本

```
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "sh $CLAUDE_PROJECT_DIR/.claude/hooks/hello.sh"
          }
        ]
      }
    ]
  }
}
```

**执行 [Python脚本](https://zhida.zhihu.com/search?content_id=264263103&content_type=Article&match_order=1&q=Python%E8%84%9A%E6%9C%AC&zhida_source=entity)**

我们也可以使用Python脚本，修改 settings.local.json 配置如下：

```
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "python $CLAUDE_PROJECT_DIR/.claude/hooks/hooks_input.py"
          }
        ]
      }
    ]
  }
}
```

创建.claude/hooks/hooks\_input.py脚本，注意在Hooks命令中工具调用参数是以标准输入输出方式传递的，使用Python读取参数需要从 sys.stdin中读取

![](https://pic4.zhimg.com/v2-d5634e4141f8ccc010ee0f6143c5f1b7_1440w.jpg)

重启Claude Code CLI，在交互模式读取或修改任意文件内容，使用 Ctrl+R快捷键查看详细调用信息

![](https://pic3.zhimg.com/v2-35e7fce3b9e83190504ea60e7c22d080_1440w.jpg)

将钩子改为 PostToolUse输出信息如下

![](https://pic3.zhimg.com/v2-d062367374f945741af9e8a99b6cdb6e_1440w.jpg)

**执行Ruby脚本**

执行Ruby脚本和其他两种脚本方式类似，修改 settings.local.json 配置如下：

```
{
  "hooks": {
    "PostToolUse": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "ruby $CLAUDE_PROJECT_DIR/.claude/hooks/hooks_input.rb"
          }
        ]
      }
    ]
  }
}
```

创建.claude/hooks/hooks\_input.rb脚本

![](https://picx.zhimg.com/v2-7dcc8c570cd9c4ce1b6267739c553a11_1440w.jpg)

重启Claude Code CLI，在交互模式读取或修改任意文件内容，使用 Ctrl+R快捷键查看详细调用信息

![](https://pic1.zhimg.com/v2-524fe89169ca18e49d3a914a1e5b1516_1440w.jpg)

### 触发通知

借助Hooks事件和苹果脚本我们可以在需要的时候手动触发系统通知，首先修改 settings.local.json 配置如下：

```
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "osascript -e 'display notification \"Awaiting your input\" with title \"Claude Code\" sound name \"default\"'"
          }
        ]
      }
    ]
  }
}
```

重启Claude Code CLI，输入任意提示词，就会系统右侧看到通知信息

![](https://pica.zhimg.com/v2-f1645fe931a4e43b14b68dae65109c88_1440w.jpg)

### 文件保护

使用脚本可以阻止对敏感文件的编辑，修改 settings.local.json 配置如下：

```
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|MultiEdit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "python -c \"import json, sys; data=json.load(sys.stdin); path=data.get('tool_input',{}).get('file_path',''); sys.exit(2 if any(p in path for p in ['.env', 'package-lock.json', '.git/']) else 0)\""
          }
        ]
      }
    ]
  }
}
```

重启Claude Code CLI，输入任意提示词

![](https://pic2.zhimg.com/v2-ff1535e9432229d7dcd7aa90146121db_1440w.jpg)

当编辑或写入安全目录时就会触发安全拦截阻止文件编辑和写入

![](https://pic4.zhimg.com/v2-dc2ac1daaae4c0060fca348ac86553f5_1440w.jpg)

### 敏感提示词过滤

在.claude/hooks/创建一个 sensitive\_prompt.py脚本文件

```
#!/usr/bin/env python3
import json
import sys
import re
import datetime
# Load input from stdin
try:
    input_data = json.load(sys.stdin)
except json.JSONDecodeError as e:
    print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
    sys.exit(1)
prompt = input_data.get("prompt", "")
# Check for sensitive patterns
sensitive_patterns = [
    (r"(?i)\b(password|secret|key|token)\s*[:=]", "Prompt contains potential secrets"),
]
for pattern, message in sensitive_patterns:
    if re.search(pattern, prompt):
        # Use JSON output to block with a specific reason
        output = {
            "decision": "block",
            "reason": f"Security policy violation: {message}. Please rephrase your request without sensitive information."
        }
        print(json.dumps(output))
        sys.exit(0)
# Add current time to context
context = f"Current time: {datetime.datetime.now()}"
print(context)
"""
The following is also equivalent:
print(json.dumps({
  "hookSpecificOutput": {
    "hookEventName": "UserPromptSubmit",
    "additionalContext": context,
  },
}))
"""
# Allow the prompt to proceed with the additional context
sys.exit(0)
```

代码中输出使用了 "decision": "block"，官方文档列举了permissionDecision的几种状态值，更详细内容查看官方文档： [docs.anthropic.com/en/d](https://link.zhihu.com/?target=https%3A//docs.anthropic.com/en/docs/claude-code/hooks%23sessionstart-decision-control)

PreToolUse决策控制：

- allow：绕过权限系统，向用户显示，但不向 Claude 显示(approve已弃用，使用allow代替)
- deny：会阻止工具调用执行，显示给 Claude(block已弃用，使用deny代替)
- ask：要求用户在 UI 中确认工具调用，向用户显示，但不向 Claude 显示

PostToolUse决策控制：

- block：会自动提示 Claude
- undefined：不执行任何作

UserPromptSubmit决策控制：

- block：阻止处理提示，向用户显示，但不会添加到上下文中
- undefined：允许提示正常进行

Stop/SubagentStop决策控制：

- block： 阻止 Claude 停止，必须填充 reason 让 Claude 知道如何继续
- undefined：允许 Claude 停止

修改 settings.local.json 配置如下：

```
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "python $CLAUDE_PROJECT_DIR/.claude/hooks/sensitive_prompt.py"
          }
        ]
      }
    ]
  }
}
```

重启Claude Code CLI，输入带有关键词 password 、secret 的提示词就会触发敏感词拦截

![](https://pic1.zhimg.com/v2-c3de2ebfb8dbef9044388189db88dcae_1440w.jpg)

不涉及敏感词则打印时间，继续任务

![](https://pic4.zhimg.com/v2-f42ba9919e78962d77d389338f728287_1440w.jpg)

### Markdown格式化

该示例功能为自动修复Markdown文件中缺少的语言标记和格式问题，在.claude/hooks/创建一个 markdown\_formatter.py脚本文件

```
#!/usr/bin/env python3
"""
Markdown formatter for Claude Code output.
Fixes missing language tags and spacing issues while preserving code content.
"""
import json
import sys
import re
import os
def detect_language(code):
    """Best-effort language detection from code content."""
    s = code.strip()

    # JSON detection
    if re.search(r'^\s*[{\[]', s):
        try:
            json.loads(s)
            return 'json'
        except:
            pass

    # Python detection
    if re.search(r'^\s*def\s+\w+\s*\(', s, re.M) or \
       re.search(r'^\s*(import|from)\s+\w+', s, re.M):
        return 'python'

    # JavaScript detection  
    if re.search(r'\b(function\s+\w+\s*\(|const\s+\w+\s*=)', s) or \
       re.search(r'=>|console\.(log|error)', s):
        return 'javascript'

    # Bash detection
    if re.search(r'^#!.*\b(bash|sh)\b', s, re.M) or \
       re.search(r'\b(if|then|fi|for|in|do|done)\b', s):
        return 'bash'

    # SQL detection
    if re.search(r'\b(SELECT|INSERT|UPDATE|DELETE|CREATE)\s+', s, re.I):
        return 'sql'

    return 'text'
def format_markdown(content):
    """Format markdown content with language detection."""
    # Fix unlabeled code fences
    def add_lang_to_fence(match):
        indent, info, body, closing = match.groups()
        if not info.strip():
            lang = detect_language(body)
            return f"{indent}\`\`\`{lang}\n{body}{closing}\n"
        return match.group(0)

    fence_pattern = r'(?ms)^([ \t]{0,3})\`\`\`([^\n]*)\n(.*?)(\n\1\`\`\`)\s*$'
    content = re.sub(fence_pattern, add_lang_to_fence, content)

    # Fix excessive blank lines (only outside code fences)
    content = re.sub(r'\n{3,}', '\n\n', content)

    return content.rstrip() + '\n'
# Main execution
try:
    input_data = json.load(sys.stdin)
    file_path = input_data.get('tool_input', {}).get('file_path', '')

    if not file_path.endswith(('.md', '.mdx')):
        sys.exit(0)  # Not a markdown file

    if os.path.exists(file_path):
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        formatted = format_markdown(content)

        if formatted != content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(formatted)
            print(f"✓ Fixed markdown formatting in {file_path}")

except Exception as e:
    print(f"Error formatting markdown: {e}", file=sys.stderr)
    sys.exit(1)
```

修改 settings.local.json 配置如下：

```
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|MultiEdit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "python $CLAUDE_PROJECT_DIR/.claude/hooks/markdown_formatter.py"
          }
        ]
      }
    ]
  }
}
```

重启Claude Code CLI，让AI帮我们创建一个Markdown任务列表，创建完成会触发 PostToolUse:Write钩子

在任务列表添加一个未格式化的代码块

![](https://pic3.zhimg.com/v2-7d58a8518f9e5b9c2fbe7921f6be1446_1440w.jpg)

重新让AI添加一些任务项，此时会触发 PostToolUse:Edit钩子

![](https://pic2.zhimg.com/v2-c75ec5874eef9101a6a723c28b12d43f_1440w.jpg)

格式化完成后，可以看到代码块也被标记上了指定语言类型

![](https://pic4.zhimg.com/v2-553b9b5e369e7605ff636e060648c583_1440w.jpg)

### 自动批准

在.claude/hooks/创建一个 auto-approval.py脚本文件，添加脚本内容：

```
#!/usr/bin/env python3
import json
import sys
# Load input from stdin
try:
    input_data = json.load(sys.stdin)
except json.JSONDecodeError as e:
    print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
    sys.exit(1)
tool_name = input_data.get("tool_name", "")
tool_input = input_data.get("tool_input", {})
# Example: Auto-approve file reads for documentation files
if tool_name == "Read":
    file_path = tool_input.get("file_path", "")
    if file_path.endswith((".md", ".mdx", ".txt", ".json")):
        # Use JSON output to auto-approve the tool call
        output = {
            "decision": "approve",
            "reason": "Documentation file auto-approved",
            "suppressOutput": True  # Don't show in transcript mode
        }
        print(json.dumps(output))
        sys.exit(0)
# For other cases, let the normal permission flow proceed
sys.exit(0)
```

修改 settings.local.json 配置如下：

```
{
  "hooks": {
    "PreToolUse": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "python $CLAUDE_PROJECT_DIR/.claude/hooks/auto-approval.py"
          }
        ]
      }
    ]
  }
}
```

重启Claude Code CLI，让AI执行读取文件操作触发 PreToolUse:Read钩子

![](https://pic1.zhimg.com/v2-08f29dbaacc2d1d4abfe110256373986_1440w.jpg)

### MCP钩子

在Claude Code CLI中MCP 工具遵循模式 mcp\_\_<server>\_\_<tool>，例如：

- mcp\_\_filesystem\_\_read\_file：文件系统服务器的读取文件工具
- mcp\_\_context7\_\_resolve-library-id：context7获取仓库ID
- mcp\_\_github\_\_search\_repositories： GitHub 服务器的搜索工具

修改 settings.local.json 配置如下：

```
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "mcp__context7__.*",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'context7 operation'"
          }
        ]
      },
      {
        "matcher": "mcp__.*__write.*",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'mcp write'"
          }
        ]
      }
    ]
  }
}
```

重启Claude Code CLI，输入提示词

```
React 新特性,use context7
```

当AI调用context7 MCP工具时就会触发 PreToolUse:mcp\_\_context7\_\_.\*钩子

![](https://pic4.zhimg.com/v2-bd1547009798caef4a5ca6ff32cbdff9_1440w.jpg)

## 总结

Claude Code CLI提供了功能强大的Hooks事件及反馈机制，开发者可以使用自己熟悉的不同类型脚本来完成自定义Hooks操作，除了示例中的代码格式化、系统通知、文件保护以及敏感词拦截等还可以利用Hooks做更多事情，比如任务完成进行语音提示、任务完成自动触发commit等等都是可以的，场景越多越能感受到SubAgent虽然强大，Hooks才是Claude Code CLI的革命性创新。

## 友情提示

见原文： [Hooks才是Claude Code CLI 的革命性更新](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s/9zHWqeUakAPEdX7RZvfn3w)

> 本文同步自微信公众号 " [程序员小溪](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s/9zHWqeUakAPEdX7RZvfn3w) " ，这里只是同步，想看及时消息请移步我的公众号，不定时更新我的学习经验。友情提示友情提示

发布于 2025-10-17 13:47・北京[claude](https://www.zhihu.com/topic/27244636)