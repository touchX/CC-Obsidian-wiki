#!/usr/bin/env bash
# Wiki Lint Tool — 检查 Wiki 健康状况
# 使用方法: cd wiki && ../scripts/wiki-lint.sh

set -euo pipefail

# 检测脚本运行位置，自动设置 WIKI_DIR
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_root="$(dirname "$script_dir")"

# 如果当前在 wiki/ 目录内，WIKI_DIR 为当前目录
# 否则从项目根目录计算
current_dir="$(basename "$(pwd)")"
if [ "$current_dir" = "wiki" ]; then
    WIKI_DIR="${WIKI_DIR:-.}"
    REPORT_FILE="WIKI-LINT-REPORT.md"
else
    WIKI_DIR="${WIKI_DIR:-wiki}"
    REPORT_FILE="${WIKI_DIR}/WIKI-LINT-REPORT.md"
fi

# 特殊处理 WIKI-LINT-REPORT.md - 保留其 frontmatter
if [ -f "$REPORT_FILE" ] && grep -q "^---$" "$REPORT_FILE" 2>/dev/null; then
    # 报告文件已存在且有 frontmatter，提取 frontmatter 到临时文件
    temp_frontmatter=$(mktemp)
    awk '/^---$/ && !first {first=1; next} first {print; if (/^---$/) exit}' "$REPORT_FILE" > "$temp_frontmatter"
    # 清空报告文件并写入报告头部
    echo "# Wiki Lint Report" > "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    echo "> 生成时间: $(date '+%Y-%m-%d %H:%M:%S')" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    echo "---" >> "$REPORT_FILE"
    # 追加原有 frontmatter
    cat "$temp_frontmatter" >> "$REPORT_FILE"
    echo "---" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    rm -f "$temp_frontmatter"
else
    # 创建新报告
    echo "# Wiki Lint Report" > "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    echo "> 生成时间: $(date '+%Y-%m-%d %H:%M:%S')" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    echo "---" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
fi

# 统计函数
count_pages() {
    local dir=$1
    find "$WIKI_DIR/$dir" -type f -name "*.md" 2>/dev/null | wc -l
}

# 1. 页面统计
echo "## 页面统计" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "| 分类 | 页面数 |" >> "$REPORT_FILE"
echo "|------|--------|" >> "$REPORT_FILE"
total=0
for dir in concepts entities sources synthesis guides tips tutorial implementation orchestration-workflow; do
    count=$(count_pages "$dir")
    total=$((total + count))
    echo "| $dir/ | $count |" >> "$REPORT_FILE"
done
echo "| **总计** | **$total** |" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 2. Frontmatter 检查
echo "## Frontmatter 检查" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

missing_frontmatter=0
missing_name=0
missing_description=0
missing_type=0

while IFS= read -r -d '' file; do
    # 跳过报告文件本身
    if [[ "$file" == *"/WIKI-LINT-REPORT.md" ]] || [[ "$file" == *"WIKI-LINT-REPORT.md" ]]; then
        continue
    fi

    # 检查是否有 frontmatter
    if ! grep -q "^---$" "$file"; then
        echo "- ❌ $file: 缺少 frontmatter" >> "$REPORT_FILE"
        missing_frontmatter=$((missing_frontmatter + 1))
        continue
    fi

    # 检查必需字段
    if ! grep -q "^name:" "$file"; then
        echo "- ⚠️  $file: 缺少 name 字段" >> "$REPORT_FILE"
        missing_name=$((missing_name + 1))
    fi

    if ! grep -q "^description:" "$file"; then
        echo "- ⚠️  $file: 缺少 description 字段" >> "$REPORT_FILE"
        missing_description=$((missing_description + 1))
    fi

    if ! grep -q "^type:" "$file"; then
        echo "- ⚠️  $file: 缺少 type 字段" >> "$REPORT_FILE"
        missing_type=$((missing_type + 1))
    fi
done < <(find "$WIKI_DIR" -type f -name "*.md" -print0)

if [ $missing_frontmatter -eq 0 ] && [ $missing_name -eq 0 ] && [ $missing_description -eq 0 ] && [ $missing_type -eq 0 ]; then
    echo "✅ 所有页面 frontmatter 完整" >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

# 3. 交叉引用检查
echo "## 交叉引用检查" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# 查找所有 [[...]] 引用
temp_refs=$(mktemp)
find "$WIKI_DIR" -type f -name "*.md" -exec grep -ho '\[\[[^]]*\]\]' {} \; | sort -u > "$temp_refs"

broken_refs=0
while IFS= read -r ref; do
    # 提取页面名称
    page_name=$(echo "$ref" | sed 's/\[\[//g' | sed 's/\]\]//g' | sed 's/|.*//')

    # 跳过空链接
    if [ -z "$page_name" ]; then
        continue
    fi

    # 跳过非 wiki 链接（外部 URL、文件路径）
    if [[ "$page_name" == http* ]] || [[ "$page_name" == ../* ]] || [[ "$page_name" == /* ]]; then
        continue
    fi

    # 去掉路径前缀（如 concepts/agent-harness → agent-harness）
    page_name=$(basename "$page_name")

    # 查找对应的 .md 文件（搜索整个 wiki 目录树）
    if ! find "$WIKI_DIR" -type f -name "${page_name}.md" 2>/dev/null | grep -q .; then
        echo "- ⚠️  $ref: 目标页面不存在" >> "$REPORT_FILE"
        broken_refs=$((broken_refs + 1))
    fi
done < "$temp_refs"

rm -f "$temp_refs"

if [ $broken_refs -eq 0 ]; then
    echo "✅ 所有交叉引用有效" >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

# 4. Source 引用检查
echo "## Source 引用检查" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

missing_sources=0
while IFS= read -r -d '' file; do
    if grep -q "^source:" "$file"; then
        source_path=$(grep "^source:" "$file" | cut -d':' -f2- | xargs)
        # 移除可能的注释
        source_path=$(echo "$source_path" | cut -d'#' -f1 | xargs)

        # 获取 wiki 页面所在目录
        wiki_dir_abs="$(cd "$WIKI_DIR" && pwd)"
        file_dir="$(dirname "$file")"

        # 相对于 WIKI_DIR 的目录路径
        rel_dir="${file_dir#$wiki_dir_abs}"
        [ -z "$rel_dir" ] && rel_dir="." || rel_dir="${rel_dir#/}"

        # 从文件目录解析 source 相对路径
        if [ -d "$rel_dir" ]; then
            full_path="$(cd "$rel_dir" && realpath "$source_path" 2>/dev/null)"
        else
            full_path="$(cd "$WIKI_DIR/$rel_dir" && realpath "$source_path" 2>/dev/null)"
        fi

        if [ -z "$full_path" ] || [ ! -f "$full_path" ]; then
            echo "- ❌ $file: source 指向不存在的文件 ($source_path)" >> "$REPORT_FILE"
            missing_sources=$((missing_sources + 1))
        fi
    fi
done < <(find "$WIKI_DIR" -type f -name "*.md" -print0)

if [ $missing_sources -eq 0 ]; then
    echo "✅ 所有 source 引用有效" >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

# 5. 总结
echo "## 总结" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "- 总页面数: $total" >> "$REPORT_FILE"
echo "- Frontmatter 问题: $((missing_frontmatter + missing_name + missing_description + missing_type))" >> "$REPORT_FILE"
echo "- 交叉引用问题: $broken_refs" >> "$REPORT_FILE"
echo "- Source 引用问题: $missing_sources" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

total_issues=$((missing_frontmatter + missing_name + missing_description + missing_type + broken_refs + missing_sources))

if [ $total_issues -eq 0 ]; then
    echo "✅ Wiki 健康状况良好" >> "$REPORT_FILE"
    exit 0
else
    echo "⚠️  发现 $total_issues 个问题需要修复" >> "$REPORT_FILE"
    exit 1
fi
