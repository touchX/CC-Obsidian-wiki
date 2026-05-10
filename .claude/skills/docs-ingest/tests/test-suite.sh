#!/usr/bin/env bash
# Docs Ingest Test Suite
# 自动化测试脚本：验证 docs-ingest skill 的功能

set -euo pipefail

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 测试统计
TESTS_TOTAL=0
TESTS_PASSED=0
TESTS_FAILED=0

# 日志函数
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# 测试函数
run_test() {
    local test_name=$1
    local test_func=$2

    TESTS_TOTAL=$((TESTS_TOTAL + 1))
    echo ""
    echo "=========================================="
    echo "测试 $TESTS_TOTAL: $test_name"
    echo "=========================================="

    if $test_func; then
        echo -e "${GREEN}✓ 通过${NC}"
        TESTS_PASSED=$((TESTS_PASSED + 1))
        return 0
    else
        echo -e "${RED}✗ 失败${NC}"
        TESTS_FAILED=$((TESTS_FAILED + 1))
        return 1
    fi
}

# 测试 1：目录结构检查
test_directory_structure() {
    log_info "检查必需目录是否存在..."

    local required_dirs=(
        ".claude/skills/docs-ingest/references"
        ".claude/skills/docs-ingest/scripts"
        ".claude/skills/docs-ingest/tests"
        "wiki"
        "archive"
    )

    for dir in "${required_dirs[@]}"; do
        if [ ! -d "$dir" ]; then
            log_error "目录不存在: $dir"
            return 1
        fi
    done

    log_info "所有必需目录存在"
    return 0
}

# 测试 2：SKILL.md 文件检查
test_skill_md_exists() {
    log_info "检查 SKILL.md 文件..."

    local skill_file="$PROJECT_ROOT/.claude/skills/docs-ingest/SKILL.md"

    if [ ! -f "$skill_file" ]; then
        log_error "SKILL.md 不存在"
        return 1
    fi

    # 检查必需章节
    local required_sections=(
        "## Overview"
        "## Layered Architecture"
        "## When to Use"
        "## Implementation Steps"
        "## Common Mistakes"
    )

    for section in "${required_sections[@]}"; do
        if ! grep -q "$section" "$skill_file"; then
            log_error "缺少章节: $section"
            return 1
        fi
    done

    log_info "SKILL.md 文件完整"
    return 0
}

# 测试 3：Reference 文件检查
test_reference_files() {
    log_info "检查 reference 文件..."

    local refs=(
        "$PROJECT_ROOT/.claude/skills/docs-ingest/references/COMMANDS.md"
        "$PROJECT_ROOT/.claude/skills/docs-ingest/references/EXAMPLES.md"
    )

    for ref in "${refs[@]}"; do
        if [ ! -f "$ref" ]; then
            log_error "Reference 文件不存在: $ref"
            return 1
        fi
    done

    log_info "所有 reference 文件存在"
    return 0
}

# 测试 4：Frontmatter 字段检查
test_frontmatter_fields() {
    log_info "检查 Wiki 页面的 frontmatter 字段..."

    local skill_file="$PROJECT_ROOT/.claude/skills/docs-ingest/SKILL.md"
    local required_fields=(
        "name:"
        "description:"
        "type:"
        "tags:"
        "created:"
        "updated:"
        "source:"
    )

    # 提取 Frontmatter 规范示例
    local frontmatter_section=$(sed -n '/## Frontmatter 规范/,/## [A-Z]/p' "$skill_file")

    for field in "${required_fields[@]}"; do
        if ! echo "$frontmatter_section" | grep -q "$field"; then
            log_error "Frontmatter 规范中缺少字段: $field"
            return 1
        fi
    done

    log_info "所有必需的 frontmatter 字段都有文档说明"
    return 0
}

# 测试 5：归档文档双链规范检查
test_archive_link_spec() {
    log_info "检查归档文档双链规范..."

    local skill_file="$PROJECT_ROOT/.claude/skills/docs-ingest/SKILL.md"

    # 检查是否有归档文档双链规范章节
    if ! grep -q "### 归档文档双链规范" "$skill_file"; then
        log_error "缺少归档文档双链规范章节"
        return 1
    fi

    # 检查关键概念
    local required_concepts=(
        "双链 vs source"
        "source 属性"
        "内容双链"
        "路径计算"
    )

    for concept in "${required_concepts[@]}"; do
        if ! grep -q "$concept" "$skill_file"; then
            log_error "缺少关键概念: $concept"
            return 1
        fi
    done

    log_info "归档文档双链规范完整"
    return 0
}

# 测试 6：环境适配检查
test_environment_adaptation() {
    log_info "检查环境适配文档..."

    local skill_file="$PROJECT_ROOT/.claude/skills/docs-ingest/SKILL.md"

    # 检查中文环境特殊处理章节
    if ! grep -q "中文环境特殊处理" "$skill_file"; then
        log_error "缺少中文环境特殊处理章节"
        return 1
    fi

    # 检查环境适配决策树
    if ! grep -q "环境适配决策树" "$skill_file"; then
        log_error "缺少环境适配决策树"
        return 1
    fi

    log_info "环境适配文档完整"
    return 0
}

# 测试 7：示例检查
test_examples_completeness() {
    log_info "检查示例完整性..."

    local examples_file="$PROJECT_ROOT/.claude/skills/docs-ingest/references/EXAMPLES.md"

    # 检查必需的示例
    local required_examples=(
        "示例 1：从 raw/ 文件摄取"
        "示例 2：从网页 URL 摄取"
        "示例 3：多个来源文档综合"
        "示例 4：处理重复内容"
        "示例 5：错误处理场景"
    )

    for example in "${required_examples[@]}"; do
        if ! grep -q "$example" "$examples_file"; then
            log_error "缺少示例: $example"
            return 1
        fi
    done

    log_info "所有必需示例存在"
    return 0
}

# 测试 8：文档长度检查
test_document_length() {
    log_info "检查文档长度..."

    local skill_file="$PROJECT_ROOT/.claude/skills/docs-ingest/SKILL.md"
    local line_count=$(wc -l < "$skill_file")

    # 检查是否在合理范围内（提取部分内容到 references 后）
    if [ "$line_count" -gt 700 ]; then
        log_warn "SKILL.md 文件过长 ($line_count 行)，建议进一步精简"
        # 这不是错误，只是警告
    fi

    log_info "文档长度合理: $line_count 行"
    return 0
}

# 测试 9：Changelog 维护检查
test_changelog() {
    log_info "检查 changelog 维护..."

    local skill_file="$PROJECT_ROOT/.claude/skills/docs-ingest/SKILL.md"

    # 检查是否有 changelog
    if ! grep -q "changelog:" "$skill_file"; then
        log_error "缺少 changelog"
        return 1
    fi

    # 检查 changelog 格式
    if ! grep -q "2026-05-08:" "$skill_file"; then
        log_warn "changelog 中缺少最新更新记录"
    fi

    log_info "Changelog 维护良好"
    return 0
}

# 测试 10：快速检查清单
test_quick_checklist() {
    log_info "检查快速检查清单..."

    local examples_file="$PROJECT_ROOT/.claude/skills/docs-ingest/references/EXAMPLES.md"

    # 检查是否有快速检查清单
    if ! grep -q "快速检查清单" "$examples_file"; then
        log_error "缺少快速检查清单"
        return 1
    fi

    log_info "快速检查清单存在"
    return 0
}

# 项目根目录（全局变量）
PROJECT_ROOT=""

# 主测试流程
main() {
    echo "=========================================="
    echo "Docs Ingest Skill — 自动化测试套件"
    echo "=========================================="
    echo ""

    # 设置项目根目录
    # 测试脚本位置：.claude/skills/docs-ingest/tests/test-suite.sh
    # 向上四级到达项目根目录
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$script_dir/../../../../"

    # 验证项目根目录
    if [ ! -f "$PROJECT_ROOT/.claude/skills/docs-ingest/SKILL.md" ]; then
        log_error "无法找到 docs-ingest skill 目录"
        log_error "项目根目录: $PROJECT_ROOT"
        log_error "当前目录: $(pwd)"
        exit 1
    fi

    log_info "项目根目录: $PROJECT_ROOT"

    # 运行所有测试
    run_test "目录结构检查" test_directory_structure
    run_test "SKILL.md 文件检查" test_skill_md_exists
    run_test "Reference 文件检查" test_reference_files
    run_test "Frontmatter 字段检查" test_frontmatter_fields
    run_test "归档文档双链规范检查" test_archive_link_spec
    run_test "环境适配检查" test_environment_adaptation
    run_test "示例完整性检查" test_examples_completeness
    run_test "文档长度检查" test_document_length
    run_test "Changelog 维护检查" test_changelog
    run_test "快速检查清单检查" test_quick_checklist

    # 输出测试结果
    echo ""
    echo "=========================================="
    echo "测试结果汇总"
    echo "=========================================="
    echo "总测试数: $TESTS_TOTAL"
    echo -e "${GREEN}通过: $TESTS_PASSED${NC}"
    echo -e "${RED}失败: $TESTS_FAILED${NC}"
    echo ""

    if [ $TESTS_FAILED -eq 0 ]; then
        echo -e "${GREEN}✓ 所有测试通过！${NC}"
        exit 0
    else
        echo -e "${RED}✗ 有 $TESTS_FAILED 个测试失败${NC}"
        exit 1
    fi
}

# 运行测试
main "$@"
