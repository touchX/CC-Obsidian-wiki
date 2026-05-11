#!/usr/bin/env bash
# Wiki-Lint 测试套件
# 测试 wiki-lint.sh 的 5 个核心检查功能
# 用法: bash .claude/skills/wiki-lint/tests/test-wiki-lint.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"
PROJECT_ROOT="$(cd "$SKILL_DIR/../../.." && pwd)"
WIKI_LINT="$SKILL_DIR/wiki-lint.sh"

PASS=0
FAIL=0
TESTS=()

# wiki-lint.sh 输出报告到 $WIKI_DIR/WIKI-LINT-REPORT.md
# 它默认找 wiki/ 子目录，所以测试在 temp dir 下创建 wiki/ 结构
setup_temp_wiki() {
    TEMP_DIR=$(mktemp -d)
    mkdir -p "$TEMP_DIR/wiki/concepts" "$TEMP_DIR/wiki/guides" "$TEMP_DIR/wiki/entities"

    # valid page
    cat > "$TEMP_DIR/wiki/concepts/valid.md" << 'FM'
---
name: valid-page
description: A valid page
type: concept
tags: [test]
created: 2026-05-11
updated: 2026-05-11
---
# Valid
FM

    # missing name
    cat > "$TEMP_DIR/wiki/concepts/no-name.md" << 'FM'
---
description: Missing name
type: concept
tags: [test]
created: 2026-05-11
updated: 2026-05-11
---
FM

    # no frontmatter at all
    echo "# No Frontmatter" > "$TEMP_DIR/wiki/guides/no-fm.md"

    # has source + bidirectional link
    cat > "$TEMP_DIR/wiki/entities/with-source.md" << 'FM'
---
name: with-source
description: Has source
type: entity
tags: [test]
created: 2026-05-11
updated: 2026-05-11
source: ../../../archive/test/ref.md
---

[[../../../archive/test/ref.md|参考文档]]
FM
}

teardown_temp_wiki() {
    if [ -n "${TEMP_DIR:-}" ] && [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
    fi
}

assert_contains() {
    local label="$1" file="$2" expected="$3"
    if [ ! -f "$file" ]; then
        echo "  ❌ $label — 报告文件不存在: $file"
        FAIL=$((FAIL + 1))
        TESTS+=("$label")
        return
    fi
    if grep -Fq "$expected" "$file"; then
        echo "  ✅ $label"
        PASS=$((PASS + 1))
    else
        echo "  ❌ $label — 未找到: $expected"
        echo "     报告内容:"
        echo "      $(head -c 800 "$file" | tr '\n' ' ')"
        FAIL=$((FAIL + 1))
    fi
    TESTS+=("$label")
}

cleanup() {
    teardown_temp_wiki
}
trap cleanup EXIT

# ===== 测试开始 =====
echo "======================================"
echo " Wiki-Lint 测试套件"
echo " 项目: $PROJECT_ROOT"
echo "======================================"
echo ""

# 检查 wiki-lint.sh 是否存在
if [ ! -f "$WIKI_LINT" ]; then
    echo "❌ wiki-lint.sh 不存在: $WIKI_LINT"
    exit 1
fi
echo "✅ wiki-lint.sh 存在"
echo ""

# 测试 1: Shell 语法
echo "--- 测试 1: Shell 语法 ---"
bash -n "$WIKI_LINT" && echo "  ✅ Shell 语法正确" && PASS=$((PASS + 1)) && TESTS+=("shell syntax") || { echo "  ❌ Shell 语法错误"; FAIL=$((FAIL + 1)); TESTS+=("shell syntax"); }

# ===== 测试 2: 页面统计 =====
echo ""
echo "--- 测试 2: 页面统计功能 ---"
setup_temp_wiki
cd "$TEMP_DIR" && bash "$WIKI_LINT" 2>/dev/null || true
REPORT="$TEMP_DIR/wiki/WIKI-LINT-REPORT.md"
assert_contains "统计 concepts 页面" "$REPORT" "concepts/ | 2"
assert_contains "统计 guides 页面" "$REPORT" "guides/ | 1"
assert_contains "统计 entities 页面" "$REPORT" "entities/ | 1"
teardown_temp_wiki

# ===== 测试 3: Frontmatter 检查 =====
echo ""
echo "--- 测试 3: Frontmatter 检查 ---"
setup_temp_wiki
cd "$TEMP_DIR" && bash "$WIKI_LINT" 2>/dev/null || true
REPORT="$TEMP_DIR/wiki/WIKI-LINT-REPORT.md"
assert_contains "检测缺失 frontmatter" "$REPORT" "缺少 frontmatter"
assert_contains "检测缺失 name 字段" "$REPORT" "缺少 name"
teardown_temp_wiki

# ===== 测试 4: 交叉引用检查 =====
echo ""
echo "--- 测试 4: 交叉引用检查 ---"
TEMP_DIR=$(mktemp -d)
mkdir -p "$TEMP_DIR/wiki/concepts"
cat > "$TEMP_DIR/wiki/concepts/page.md" << 'FM'
---
name: page
description: Test page with broken link
type: concept
tags: [test]
created: 2026-05-11
updated: 2026-05-11
---

参见 [[nonexistent-page]]
FM
cd "$TEMP_DIR" && bash "$WIKI_LINT" 2>/dev/null || true
REPORT="$TEMP_DIR/wiki/WIKI-LINT-REPORT.md"
assert_contains "检测断链引用" "$REPORT" "目标页面不存在"
rm -rf "$TEMP_DIR"

# ===== 测试 5: 归档双链检查 =====
echo ""
echo "--- 测试 5: 归档文档双链检查 ---"
TEMP_DIR=$(mktemp -d)
mkdir -p "$TEMP_DIR/wiki/concepts"
cat > "$TEMP_DIR/wiki/concepts/archive-ref.md" << 'FM'
---
name: archive-ref
description: Page with missing archive bidir link
type: concept
tags: [test]
created: 2026-05-11
updated: 2026-05-11
source: ../../archive/test/doc.md
---

内容（没有归档双链）
FM
cd "$TEMP_DIR" && bash "$WIKI_LINT" 2>/dev/null || true
REPORT="$TEMP_DIR/wiki/WIKI-LINT-REPORT.md"
assert_contains "检测缺失归档双链" "$REPORT" "缺少归档文档双链"
rm -rf "$TEMP_DIR"

# ===== 全部完成 =====
echo ""
echo "======================================"
echo " 测试结果"
echo "======================================"
echo " 通过: $PASS"
echo " 失败: $FAIL"
echo " 总计: $(($PASS + $FAIL))"
echo "======================================"

if [ $FAIL -gt 0 ]; then
    exit 1
fi
exit 0
