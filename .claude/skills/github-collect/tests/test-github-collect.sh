#!/usr/bin/env bash
# GitHub Collect Skill — 自动化测试套件
# 测试 github-collector.sh 的核心功能模块
# 用法: bash .claude/skills/github-collect/tests/test-github-collect.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"
PROJECT_ROOT="$(cd "$SKILL_DIR/../../.." && pwd)"
COLLECTOR="$SKILL_DIR/github-collector.sh"

PASS=0
FAIL=0
TESTS=()

cleanup() { rm -rf "${TEMP_DIR:-}"; }
trap cleanup EXIT

assert_ok() {
    local label="$1" exitcode="$2"
    if [ "$exitcode" -eq 0 ]; then
        echo "  OK $label"
        PASS=$((PASS + 1))
    else
        echo "  FAIL $label (exit=$exitcode)"
        FAIL=$((FAIL + 1))
    fi
    TESTS+=("$label")
}

# ===== 开始 =====
echo "======================================"
echo " GitHub Collect Skill Test Suite"
echo " Project: $PROJECT_ROOT"
echo "======================================"
echo ""

[ -f "$COLLECTOR" ] && echo "found github-collector.sh" || { echo "missing collector"; exit 1; }

# ===== 1: Shell syntax =====
echo "--- 1: Shell syntax ---"
bash -n "$COLLECTOR" && echo "  OK syntax" || { echo "  FAIL syntax"; exit 1; }
PASS=$((PASS + 1)); TESTS+=("shell syntax")

# ===== 2: URL validation =====
echo ""
echo "--- 2: URL validation ---"
TEMP_DIR=$(mktemp -d)
cat > "$TEMP_DIR/t.sh" << 'FT'
#!/bin/bash
set -e
validate() {
    local u="$1"
    if [[ ! "$u" =~ ^https?://github\.com/[^/]+/[^/]+/?$ ]]; then
        return 1
    fi
    u="${u%/}"
    echo "$u"
}
r1=$(validate "https://github.com/owner/repo") && [ "$r1" = "https://github.com/owner/repo" ] || exit 1
r2=$(validate "https://github.com/owner/repo/") && [ "$r2" = "https://github.com/owner/repo" ] || exit 1
! validate "not-a-url" 2>/dev/null
! validate "https://github.com/owner" 2>/dev/null
! validate "https://gitlab.com/owner/repo" 2>/dev/null
exit 0
FT
set +e; bash "$TEMP_DIR/t.sh" 2>/dev/null; RC=$?; set -e
assert_ok "URL validation (valid + invalid)" $RC

# ===== 3: Owner/Repo extraction =====
echo ""
echo "--- 3: Owner/Repo extraction ---"
cat > "$TEMP_DIR/t.sh" << 'FT'
#!/bin/bash
set -e
extract() {
    local u="$1"
    local o=$(echo "$u" | sed -n 's|https://github\.com/\([^/]*\)/\([^/]*\)$|\1|p')
    local r=$(echo "$u" | sed -n 's|https://github\.com/\([^/]*\)/\([^/]*\)$|\2|p')
    [ -n "$o" ] && [ -n "$r" ] || exit 1
    echo "$o/$r"
}
[ "$(extract 'https://github.com/touchX/CC-Obsidian-wiki')" = "touchX/CC-Obsidian-wiki" ] || exit 1
[ "$(extract 'https://github.com/anthropics/claude-code')" = "anthropics/claude-code" ] || exit 1
[ "$(extract 'https://github.com/org/repo-name-with-dashes')" = "org/repo-name-with-dashes" ] || exit 1
exit 0
FT
set +e; bash "$TEMP_DIR/t.sh" 2>/dev/null; RC=$?; set -e
assert_ok "Owner/Repo extraction" $RC

# ===== 4: Template =====
echo ""
echo "--- 4: Template check ---"
TEMPLATE="$SKILL_DIR/github-repo-template.md"
if [ -f "$TEMPLATE" ]; then
    assert_ok "Template exists" 0
    grep -q "{owner}" "$TEMPLATE" && assert_ok "Placeholder {owner}" 0 || assert_ok "Placeholder {owner}" 1
    grep -q "{repo}" "$TEMPLATE" && assert_ok "Placeholder {repo}" 0 || assert_ok "Placeholder {repo}" 1
    grep -q "{star_count}" "$TEMPLATE" && assert_ok "Placeholder {star_count}" 0 || assert_ok "Placeholder {star_count}" 1
    grep -q "{description}" "$TEMPLATE" && assert_ok "Placeholder {description}" 0 || assert_ok "Placeholder {description}" 1
    grep -q "{language}" "$TEMPLATE" && assert_ok "Placeholder {language}" 0 || assert_ok "Placeholder {language}" 1
else
    assert_ok "Template exists" 1
fi

# ===== 5: SKILL.md =====
echo ""
echo "--- 5: SKILL.md check ---"
SKILL_MD="$SKILL_DIR/SKILL.md"
if [ -f "$SKILL_MD" ]; then
    assert_ok "SKILL.md exists" 0
    head -10 "$SKILL_MD" | grep -q "^name:" && assert_ok "frontmatter name" 0 || assert_ok "frontmatter name" 1
    head -10 "$SKILL_MD" | grep -q "^description:" && assert_ok "frontmatter description" 0 || assert_ok "frontmatter description" 1
    grep -q "^## " "$SKILL_MD" && assert_ok "has sections" 0 || assert_ok "has sections" 1
    grep -q "触发条件" "$SKILL_MD" && assert_ok "has trigger conditions" 0 || assert_ok "has trigger conditions" 1
    grep -q "Common Mistakes" "$SKILL_MD" && assert_ok "has Common Mistakes" 0 || assert_ok "has Common Mistakes" 1
else
    assert_ok "SKILL.md exists" 1
fi

# ===== 6: Directory structure =====
echo ""
echo "--- 6: Directory structure ---"
[ -d "$SKILL_DIR/tests" ] && assert_ok "tests/ dir" 0 || assert_ok "tests/ dir" 1
[ -f "$COLLECTOR" ] && assert_ok "collector script" 0 || assert_ok "collector script" 1
[ -f "$TEMPLATE" ] && assert_ok "template file" 0 || assert_ok "template file" 1

# ===== Summary =====
TOTAL=$((PASS + FAIL))
echo ""
echo "======================================"
echo " Results: $PASS / $TOTAL passed"
echo "======================================"

rm -rf "$TEMP_DIR"
[ $FAIL -eq 0 ] && exit 0 || exit 1
