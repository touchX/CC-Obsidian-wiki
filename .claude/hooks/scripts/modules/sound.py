"""
Hook 音效播放模块 — 平台检测、路径解析、音频播放

职责：
- 检测当前平台的音频播放器
- 按事件类型播放对应音效
- 安全防止目录遍历攻击
"""

import subprocess
import re
import platform
import sys
from pathlib import Path

try:
    import winsound
except ImportError:
    winsound = None

# 事件 → 音效文件夹映射
HOOK_SOUND_MAP = {
    "PreToolUse": "pretooluse",
    "PermissionRequest": "permissionrequest",
    "PostToolUse": "posttooluse",
    "PostToolUseFailure": "posttoolusefailure",
    "UserPromptSubmit": "userpromptsubmit",
    "Notification": "notification",
    "Stop": "stop",
    "SubagentStart": "subagentstart",
    "SubagentStop": "subagentstop",
    "PreCompact": "precompact",
    "PostCompact": "postcompact",
    "SessionStart": "sessionstart",
    "SessionEnd": "sessionend",
    "Setup": "setup",
    "TeammateIdle": "teammateidle",
    "TaskCreated": "taskcreated",
    "TaskCompleted": "taskcompleted",
    "ConfigChange": "configchange",
    "WorktreeCreate": "worktreecreate",
    "WorktreeRemove": "worktreeremove",
    "InstructionsLoaded": "instructionsloaded",
    "Elicitation": "elicitation",
    "ElicitationResult": "elicitationresult",
    "StopFailure": "stopfailure",
    "CwdChanged": "cwdchanged",
    "FileChanged": "filechanged",
    "PermissionDenied": "permissiondenied",
}

AGENT_HOOK_SOUND_MAP = {
    "PreToolUse": "agent_pretooluse",
    "PostToolUse": "agent_posttooluse",
    "PermissionRequest": "agent_permissionrequest",
    "PostToolUseFailure": "agent_posttoolusefailure",
    "Stop": "agent_stop",
    "SubagentStop": "agent_subagentstop",
}

# Bash 命令 → 特殊音效
BASH_SOUND_PATTERNS = [
    (r'git commit', "pretooluse-git-committing"),
]


def _get_audio_player():
    system = platform.system()
    if system == "Darwin":
        return ["afplay"]
    elif system == "Linux":
        for player in [["paplay"], ["aplay"], ["ffplay", "-nodisp", "-autoexit"], ["mpg123", "-q"]]:
            try:
                subprocess.run(["which", player[0]], stdout=subprocess.DEVNULL,
                               stderr=subprocess.DEVNULL, check=True)
                return player
            except (subprocess.CalledProcessError, FileNotFoundError):
                continue
        return None
    elif system == "Windows":
        return ["WINDOWS"]
    return None


def play(sound_name: str) -> bool:
    """播放指定名称的音效文件。"""
    if "/" in sound_name or "\\" in sound_name or ".." in sound_name:
        print(f"Invalid sound name: {sound_name}", file=sys.stderr)
        return False

    player = _get_audio_player()
    if not player:
        return False

    sounds_dir = Path(__file__).resolve().parent.parent.parent / "sounds"
    folder = sounds_dir / sound_name.split('-')[0]
    is_windows = player[0] == "WINDOWS"
    exts = ['.wav'] if is_windows else ['.wav', '.mp3']

    for ext in exts:
        path = folder / f"{sound_name}{ext}"
        if path.exists():
            try:
                if is_windows and winsound:
                    winsound.PlaySound(str(path), winsound.SND_FILENAME | winsound.SND_NODEFAULT)
                    return True
                elif not is_windows:
                    subprocess.Popen(player + [str(path)], stdout=subprocess.DEVNULL,
                                     stderr=subprocess.DEVNULL, start_new_session=True)
                    return True
            except Exception as e:
                print(f"Sound error {path.name}: {e}", file=sys.stderr)
                return False
    return False


def detect_special_sound(command: str) -> str | None:
    """检测 bash 命令是否匹配特殊音效模式。"""
    if not command:
        return None
    for pattern, name in BASH_SOUND_PATTERNS:
        if re.search(pattern, command.strip()):
            return name
    return None


def resolve(hook_data: dict, agent_name: str = None) -> str | None:
    """确定应播放哪个音效。"""
    event = hook_data.get("hook_event_name", "")
    if agent_name:
        return AGENT_HOOK_SOUND_MAP.get(event)
    if event == "PreToolUse" and hook_data.get("tool_name") == "Bash":
        special = detect_special_sound(hook_data.get("tool_input", {}).get("command", ""))
        if special:
            return special
    return HOOK_SOUND_MAP.get(event)
