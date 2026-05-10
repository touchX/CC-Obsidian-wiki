#!/usr/bin/env bash
# Archive Link Checker — 检查 Wiki 页面是否包含归档文档双链
# 使用方法: cd wiki && ../.claude/skills/docs-ingest/scripts/check-archive-links.sh

set -euo pipefail

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 统计变量
TOTAL_PAGES=0
PAGES_WITH_SOURCE=0
PAGES_WITH_LINK=0
MISSING_LINK=0
INCORRECT_PATH=0

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

log_header() {
    echo -e "${BLUE}==>${NC} $1"
}

# 检查单个文件的归档文档双链
check_file() {
    local file=$1

    # 跳过非 Markdown 文件
    if [[ "$file" != *.md ]]; then
        return
    fi

    TOTAL_PAGES=$((TOTAL_PAGES + 1))

    # 检查是否有 source 属性
    if ! grep -q "^source:" "$file"; then
        # 没有 source 属性，跳过
        return
    fi

    PAGES_WITH_SOURCE=$((PAGES_WITH_SOURCE + 1))

    # 提取 source 路径
    local source_path=$(grep "^source:" "$file" | cut -d':' -f2- | xargs)
    source_path=$(echo "$source_path" | cut -d'#' -f1 | xargs)

    # 提取归档文件名
    local archive_filename=$(basename "$source_path")

    # 检查页面内容中是否包含指向归档文档的双链
    local has_archive_link=0
    local correct_path=0
    local found_links=()

    # 查找所有 [[...]] 链接
    while IFS= read -r line; do
        # 提取链接
        if [[ "$line" =~ \[\[([^\]]+)\]\] ]]; then
            local link="${BASH_REMATCH[1]}"

            # 提取链接路径（去掉显示名称）
            local link_path=$(echo "$link" | sed 's/|.*//')

            # 跳过空链接
            [ -z "$link_path" ] && continue

            # 检查是否指向归档文档（包含 archive/ 和文件名）
            if [[ "$link_path" == *"/archive/"* ]] && [[ "$link_path" == *"$archive_filename" ]]; then
                has_archive_link=1
                found_links+=("$link_path")

                # 验证路径是否与 source 一致
                local normalized_source=$(echo "$source_path" | sed 's|^\./||')
                local normalized_link=$(echo "$link_path" | sed 's|^\./||')

                if [[ "$normalized_link" == "$normalized_source" ]]; then
                    correct_path=1
                fi
            fi
        fi
    done < "$file"

    # 报告结果
    local relative_path="${file#./}"

    if [ $has_archive_link -eq 0 ]; then
        echo -e "${YELLOW}⚠${NC}  $relative_path"
        echo "    问题: 有 source 属性但缺少归档文档双链"
        echo "    source: $source_path"
        echo ""
        MISSING_LINK=$((MISSING_LINK + 1))
    elif [ $correct_path -eq 0 ]; then
        echo -e "${YELLOW}⚠${NC}  $relative_path"
        echo "    问题: 双链路径与 source 不一致"
        echo "    source: $source_path"
        echo "    found links:"
        for link in "${found_links[@]}"; do
            echo "      - $link"
        done
        echo ""
        INCORRECT_PATH=$((INCORRECT_PATH + 1))
    else
        PAGES_WITH_LINK=$((PAGES_WITH_LINK + 1))
    fi
}

# 主流程
main() {
    echo "=========================================="
    echo "Archive Link Checker"
    echo "归档文档双链检查工具"
    echo "=========================================="
    echo ""

    # 检测运行位置
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    project_root="$(dirname "$script_dir")"

    current_dir="$(basename "$(pwd)")"
    if [ "$current_dir" = "wiki" ]; then
        WIKI_DIR="."
    else
        WIKI_DIR="${WIKI_DIR:-wiki}"
    fi

    if [ ! -d "$WIKI_DIR" ]; then
        log_error "Wiki 目录不存在: $WIKI_DIR"
        exit 1
    fi

    log_info "检查目录: $WIKI_DIR"
    echo ""

    # 遍历所有 Markdown 文件
    log_header "扫描 Wiki 页面..."
    while IFS= read -r -d '' file; do
        check_file "$file"
    done < <(find "$WIKI_DIR" -type f -name "*.md" -print0)

    # 输出统计
    echo ""
    echo "=========================================="
    echo "检查结果汇总"
    echo "=========================================="
    echo "总页面数: $TOTAL_PAGES"
    echo "有 source 属性: $PAGES_WITH_SOURCE"
    echo "有归档文档双链: $PAGES_WITH_LINK"
    echo ""

    local total_issues=$((MISSING_LINK + INCORRECT_PATH))

    if [ $MISSING_LINK -gt 0 ]; then
        echo -e "${RED}缺少双链: $MISSING_LINK${NC}"
    fi

    if [ $INCORRECT_PATH -gt 0 ]; then
        echo -e "${YELLOW}路径错误: $INCORRECT_PATH${NC}"
    fi

    if [ $total_issues -eq 0 ]; then
        echo ""
        echo -e "${GREEN}✓ 所有归档文档双链完整！${NC}"
        exit 0
    else
        echo ""
        echo -e "${YELLOW}⚠ 发现 $total_issues 个问题需要修复${NC}"
        exit 1
    fi
}

# 运行检查
main "$@"
