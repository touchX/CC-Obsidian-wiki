#!/bin/bash

# GitHub 资源收集器 - 完整实现版
# 用法: bash .claude/skills/github-collect/github-collector.sh <github-url>
#
# 完整流程：
# 1. 验证 URL 格式
# 2. 去重检查（搜索 Wiki）
# 3. gh-cli 获取元数据
# 4. gh-api 获取 README
# 5. 归档 JSON + README
# 6. 创建 Wiki 页面
# 7. 更新日志

set -e

# ============================================================
# 配置
# ============================================================
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
WIKI_DIR="$PROJECT_ROOT/wiki"
ARCHIVE_DIR="$PROJECT_ROOT/archive"
TEMPLATE_FILE="$SCRIPT_DIR/github-repo-template.md"
CURRENT_DATE=$(date +%Y-%m-%d)
ARCHIVE_JSON_DIR="$ARCHIVE_DIR/resources/github"
WIKI_REPOS_DIR="$WIKI_DIR/resources/github-repos"

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# ============================================================
# 日志函数
# ============================================================
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

# ============================================================
# 检查依赖
# ============================================================
check_dependencies() {
    log_step "检查依赖..."

    if ! command -v gh &> /dev/null; then
        log_error "gh-cli 未安装，请运行: winget install GitHub.cli"
        exit 1
    fi

    if ! command -v jq &> /dev/null; then
        log_error "jq 未安装，请运行: winget install jq"
        exit 1
    fi

    # 检查 gh 认证
    if ! gh auth status &> /dev/null; then
        log_error "gh 未登录，请运行: gh auth login"
        exit 1
    fi

    log_info "依赖检查通过"
}

# ============================================================
# 验证 URL 格式
# ============================================================
validate_url() {
    local url="$1"

    if [[ ! "$url" =~ ^https?://github\.com/[^/]+/[^/]+/?$ ]]; then
        log_error "无效的 GitHub URL 格式"
        echo "示例: https://github.com/owner/repo"
        exit 1
    fi

    # 移除尾部斜杠
    url="${url%/}"
    echo "$url"
}

# ============================================================
# 提取 owner 和 repo
# ============================================================
extract_owner_repo() {
    local url="$1"
    OWNER=$(echo "$url" | sed -n 's|https://github\.com/\([^/]*\)/\([^/]*\)$|\1|p')
    REPO=$(echo "$url" | sed -n 's|https://github\.com/\([^/]*\)/\([^/]*\)$|\2|p')

    if [[ -z "$OWNER" || -z "$REPO" ]]; then
        log_error "无法提取 owner/repo"
        exit 1
    fi

    log_info "仓库: $OWNER/$REPO"
}

# ============================================================
# 去重检查
# ============================================================
duplicate_check() {
    log_step "去重检查..."

    # 搜索 Wiki 是否已存在
    local search_result
    search_result=$(gh search code "$OWNER $REPO" --owner "$OWNER" --repo "$REPO" 2>/dev/null || echo "")

    # 也检查文件是否存在
    local wiki_file="$WIKI_REPOS_DIR/${OWNER}-${REPO}.md"
    if [[ -f "$wiki_file" ]]; then
        log_warn "仓库 $OWNER/$REPO 已存在于 Wiki"
        read -p "是否更新现有页面? (y/n): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            log_info "已取消"
            exit 0
        fi
        UPDATE_MODE=true
    else
        UPDATE_MODE=false
    fi
}

# ============================================================
# 获取元数据
# ============================================================
fetch_metadata() {
    log_step "获取仓库元数据..."

    local repo_json="$ARCHIVE_JSON_DIR/${OWNER}-${REPO}-${CURRENT_DATE}.json"

    # 确保目录存在
    mkdir -p "$ARCHIVE_JSON_DIR"

    # 使用 gh-cli 获取完整元数据
    gh repo view "$OWNER/$REPO" \
        --json name,description,stargazerCount,forkCount,createdAt,updatedAt,licenseInfo,primaryLanguage,repositoryTopics,url,homepageUrl \
        > "$repo_json" 2>/dev/null

    if [[ ! -s "$repo_json" ]]; then
        log_error "无法获取仓库元数据，仓库可能不存在或无访问权限"
        exit 1
    fi

    log_info "元数据已保存: $repo_json"

    # 提取关键字段
    DESCRIPTION=$(jq -r '.description // ""' "$repo_json")
    STARS=$(jq -r '.stargazerCount // 0' "$repo_json")
    FORKS=$(jq -r '.forkCount // 0' "$repo_json")
    LANGUAGE=$(jq -r '.primaryLanguage.name // "Unknown"' "$repo_json")
    LICENSE=$(jq -r '.licenseInfo.key // "unknown"' "$repo_json")
    CREATED_AT=$(jq -r '.createdAt // ""' "$repo_json")
    UPDATED_AT=$(jq -r '.updatedAt // ""' "$repo_json")
    HOMEPAGE=$(jq -r '.homepageUrl // ""' "$repo_json")
    REPO_URL=$(jq -r '.url // ""' "$repo_json")

    # Topics
    TOPICS=$(jq -r '.repositoryTopics[].topic.name[]' "$repo_json" 2>/dev/null | tr '\n' ',' | sed 's/,$//')
    if [[ -z "$TOPICS" ]]; then
        TOPICS="$ LANGUAGE"
    fi

    log_info "Stars: $STARS | Language: $LANGUAGE | License: $LICENSE"
}

# ============================================================
# 获取 README
# ============================================================
fetch_readme() {
    log_step "获取 README..."

    local readme_file="$ARCHIVE_JSON_DIR/${OWNER}-${REPO}-README-${CURRENT_DATE}.md"

    # 使用 gh-api 获取 README（base64 编码）
    local readme_content
    readme_content=$(gh api "repos/$OWNER/$REPO/readme" --jq '.content' 2>/dev/null)

    if [[ -z "$readme_content" ]]; then
        log_warn "无法获取 README，内容为空"
        README_CONTENT=""
    else
        # base64 解码
        README_CONTENT=$(echo "$readme_content" | base64 -d 2>/dev/null || echo "")
    fi

    echo "$README_CONTENT" > "$readme_file"
    log_info "README 已保存: $readme_file"
}

# ============================================================
# 创建 Wiki 页面
# ============================================================
create_wiki_page() {
    log_step "创建 Wiki 页面..."

    local wiki_file="$WIKI_REPOS_DIR/${OWNER}-${REPO}.md"
    mkdir -p "$WIKI_REPOS_DIR"

    # 生成日期格式化
    local created_fmt=$(echo "$CREATED_AT" | sed 's/T.*//')
    local updated_fmt=$(echo "$UPDATED_AT" | sed 's/T.*//')

    # Homepage 行（如果有）
    local homepage_line=""
    if [[ -n "$HOMEPAGE" && "$HOMEPAGE" != "null" ]]; then
        homepage_line="homepage: $HOMEPAGE"
    fi

    # 提取 README 前 500 字符作为简介
    local readme_excerpt=""
    if [[ -n "$README_CONTENT" ]]; then
        readme_excerpt=$(echo "$README_CONTENT" | head -c 500 | tail -c 300)
        # 移除多余空白
        readme_excerpt=$(echo "$readme_excerpt" | sed '/^#/d' | tr '\n' ' ' | sed 's/  */ /g')
    fi

    # 生成 Wiki 页面
    cat > "$wiki_file" << EOF
---
name: ${OWNER}-${REPO}
description: ${DESCRIPTION:-$REPO}
type: source
tags: [github, ${LANGUAGE,}]
created: ${created_fmt:-$CURRENT_DATE}
updated: ${updated_fmt:-$CURRENT_DATE}
source: ../../../archive/resources/github/${OWNER}-${REPO}-${CURRENT_DATE}.json
stars: ${STARS}
forks: ${FORKS}
language: ${LANGUAGE}
license: ${LICENSE}
github_url: ${REPO_URL}
${homepage_line}
---

# ${REPO}

> [!tip] Repository Overview
> ⭐ **${STARS} Stars** | 🔥 **${DESCRIPTION:-No description}**

## 基本信息

| 属性 | 值 |
|------|-----|
| **仓库** | [${OWNER}/${REPO}](https://github.com/${OWNER}/${REPO}) |
| **Stars** | ⭐ ${STARS} |
| **Forks** | ${FORKS} |
| **语言** | ${LANGUAGE} |
| **许可证** | ${LICENSE} |
| **创建时间** | ${created_fmt} |
| **更新时间** | ${updated_fmt} |

## 项目介绍

${DESCRIPTION:-No description provided.}

${readme_excerpt:+. . .}

## 核心特性

- 特性 1（待补充）
- 特性 2（待补充）
- 特性 3（待补充）

## 安装与使用

\`\`\`bash
# 克隆仓库
git clone https://github.com/${OWNER}/${REPO}.git

# 进入目录
cd ${REPO}
\`\`\`

## 相关链接

- [GitHub 仓库](https://github.com/${OWNER}/${REPO})
${HOMEPAGE:+- [官方文档](${HOMEPAGE})}
- [Issue 页面](https://github.com/${OWNER}/${REPO}/issues)

## 元数据

- **归档日期**: ${CURRENT_DATE}
- **归档来源**: [${OWNER}/${REPO}](https://github.com/${OWNER}/${REPO})

---

*由 github-collect 自动收集于 ${CURRENT_DATE}*
EOF

    log_info "Wiki 页面已创建: $wiki_file"
}

# ============================================================
# 更新日志
# ============================================================
update_log() {
    log_step "更新日志..."

    local log_file="$WIKI_DIR/log.md"
    if [[ ! -f "$log_file" ]]; then
        log_warn "日志文件不存在，跳过"
        return
    fi

    local mode_text="创建"
    if [[ "$UPDATE_MODE" == "true" ]]; then
        mode_text="更新"
    fi

    # 追加日志
    cat >> "$log_file" << EOF

## [${CURRENT_DATE}] GitHub 仓库收集（github-collect）

- ${mode_text}了 [[resources/github-repos/${OWNER}-${REPO}]]
  - Stars: ${STARS}
  - Language: ${LANGUAGE}
  - License: ${LICENSE}
  - 来源: [${OWNER}/${REPO}](https://github.com/${OWNER}/${REPO})
EOF

    log_info "日志已更新"
}

# ============================================================
# 清理临时文件
# ============================================================
cleanup() {
    # 清理临时 README 文件（已保存在归档目录）
    local temp_readme="$ARCHIVE_JSON_DIR/${OWNER}-${REPO}-README-${CURRENT_DATE}.md"
    if [[ -f "$temp_readme" && -s "$temp_readme" ]]; then
        # README 已归档，可以删除临时文件
        rm -f "$temp_readme" 2>/dev/null || true
    fi
}

# ============================================================
# 主流程
# ============================================================
main() {
    echo "=============================================="
    echo "  GitHub 资源收集器 (完整实现版)"
    echo "=============================================="
    echo

    if [[ $# -eq 0 ]]; then
        log_error "请提供 GitHub URL"
        echo "用法: $0 <github-url>"
        echo "示例: $0 https://github.com/openai/symphony"
        exit 1
    fi

    local url="$1"

    # 1. 检查依赖
    check_dependencies

    # 2. 验证 URL
    url=$(validate_url "$url")

    # 3. 提取 owner/repo
    extract_owner_repo "$url"

    # 4. 去重检查
    duplicate_check

    # 5. 获取元数据
    fetch_metadata

    # 6. 获取 README
    fetch_readme

    # 7. 创建 Wiki 页面
    create_wiki_page

    # 8. 更新日志
    update_log

    # 9. 清理
    cleanup

    echo
    echo "=============================================="
    log_info "收集完成！"
    echo "=============================================="
    echo "  仓库: $OWNER/$REPO"
    echo "  Stars: $STARS"
    echo "  语言: $LANGUAGE"
    echo "  Wiki: wiki/resources/github-repos/${OWNER}-${REPO}.md"
    echo "  归档: archive/resources/github/${OWNER}-${REPO}-${CURRENT_DATE}.json"
    echo "=============================================="
}

main "$@"
