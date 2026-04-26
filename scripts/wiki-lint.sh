#!/usr/bin/env bash
# Wiki Lint Tool — 检查 Wiki 健康状况
# 使用方法: cd wiki && ../scripts/wiki-lint.sh

set -euo pipefail

WIKI_DIR="${WIKI_DIR:-wiki}"
REPORT_FILE="${WIKI_DIR}/WIKI-LINT-REPORT.md"

echo "# Wiki Lint Report" > "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "> 生成时间: $(date '+%Y-%m-%d %H:%M:%S')" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "---" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

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

    # 查找对应的 .md 文件
    if ! find "$WIKI_DIR" -type f -name "${page_name}.md" | grep -q .; then
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

        # 将相对路径转换为绝对路径
        # source 路径是相对于 wiki/ 页面的，需要解析到项目根目录
        script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
        project_root="$(dirname "$script_dir")"

        # 获取 wiki 页面所在目录（相对于项目根目录）
        file_dir="$(dirname "$file")"

        # source_path 是相对于 file_dir 的路径
        # 需要从项目根目录开始计算绝对路径
        # 例如：wiki/entities/xxx.md + ../archive/best-practice/yyy.md
        # 应该解析为：archive/best-practice/yyy.md

        # 使用 cd 在项目根目录下解析相对路径
        full_path="$(cd "$project_root" && realpath -m "$file_dir/$source_path" 2>/dev/null)"

        if [ ! -f "$full_path" ]; then
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
