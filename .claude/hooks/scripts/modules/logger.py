"""
Hook 事件日志模块 — 将 hook_data 写入 JSONL 日志文件

职责：
- 记录所有 hook 事件到 .claude/hooks/logs/hooks-log.jsonl
- 支持主会话和子代理事件区分
"""

import json
from pathlib import Path

from modules.config import is_logging_disabled


def log_hook_data(hook_data: dict, agent_name: str = None):
    """记录 hook 事件数据到日志文件。"""
    if is_logging_disabled():
        return

    try:
        logs_dir = Path(__file__).resolve().parent.parent.parent / "logs"
        logs_dir.mkdir(parents=True, exist_ok=True)

        entry = hook_data.copy()
        entry.pop("transcript_path", None)
        entry.pop("cwd", None)
        if agent_name:
            entry["invoked_by_agent"] = agent_name

        log_path = logs_dir / "hooks-log.jsonl"
        with open(log_path, "a", encoding="utf-8") as f:
            f.write(json.dumps(entry, ensure_ascii=False) + "\n")
    except Exception as e:
        print(f"Failed to log hook_data: {e}", file=__import__("sys").stderr)
