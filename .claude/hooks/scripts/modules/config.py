"""
Hook 配置管理模块 — 读取 hooks-config.json / hooks-config.local.json

职责：
- 检查特定 hook 是否被禁用
- 检查日志是否被禁用
- 提供统一的配置访问接口
"""

import json
from pathlib import Path


def _config_dir():
    return Path(__file__).resolve().parent.parent.parent / "config"


def _load_config(filename):
    path = _config_dir() / filename
    if path.exists():
        try:
            return json.loads(path.read_text(encoding="utf-8"))
        except (json.JSONDecodeError, OSError):
            return None
    return None


def is_hook_disabled(event_name: str) -> bool:
    """
    检查指定 hook 是否在配置中被禁用。

    优先级：hooks-config.local.json → hooks-config.json → False（启用）
    """
    config_key = f"disable{event_name}Hook"
    local = _load_config("hooks-config.local.json")
    if local and config_key in local:
        return local[config_key]
    default = _load_config("hooks-config.json")
    if default and config_key in default:
        return default[config_key]
    return False


def is_logging_disabled() -> bool:
    """
    检查日志是否在配置中被禁用。

    优先级：hooks-config.local.json → hooks-config.json → False（启用）
    """
    local = _load_config("hooks-config.local.json")
    if local and "disableLogging" in local:
        return local["disableLogging"]
    default = _load_config("hooks-config.json")
    if default and "disableLogging" in default:
        return default["disableLogging"]
    return False
