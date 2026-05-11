#!/usr/bin/env python3
"""
Claude Code Hook Handler — 事件分发入口。

将所有 hook 事件分派到对应模块处理。
当前职责：音效播放 + 事件日志 + 配置检查。

模块化架构：.claude/hooks/scripts/modules/
  - sound.py:  平台音效检测与播放
  - config.py: 钩子配置读写（hooks-config.json）
  - logger.py: 事件日志记录（hooks-log.jsonl）

使用方式（settings.json 自动调用）：
  python3 hooks.py                    # 主会话事件
  python3 hooks.py --agent=<name>     # 子代理事件
"""

import sys
import json
import argparse

from modules.config import is_hook_disabled
from modules.logger import log_hook_data
from modules.sound import resolve as resolve_sound, play as play_sound


def parse_args():
    parser = argparse.ArgumentParser(description="Claude Code Hook Handler")
    parser.add_argument("--agent", type=str, default=None,
                        help="Agent name for agent-specific sounds")
    return parser.parse_args()


def main():
    try:
        args = parse_args()
        stdin = sys.stdin.read().strip()
        if not stdin:
            sys.exit(0)

        data = json.loads(stdin)
        event = data.get("hook_event_name", "")

        # 日志记录
        log_hook_data(data, agent_name=args.agent)

        # 禁用检查（仅主会话）
        if not args.agent and is_hook_disabled(event):
            sys.exit(0)

        # 音效播放
        sound = resolve_sound(data, agent_name=args.agent)
        if sound:
            play_sound(sound)

        sys.exit(0)

    except json.JSONDecodeError:
        sys.exit(0)
    except Exception:
        sys.exit(0)


if __name__ == "__main__":
    main()
