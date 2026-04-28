#!/bin/bash

# GitHub 资源收集器
# 用法: ./scripts/github-collector.sh <github-url>

set -e

# 配置
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WIKI_DIR="$PROJECT_ROOT/wiki"
ARCHIVE_DIR="$PROJECT_ROOT/archive"
TEMPLATE_FILE="$PROJECT_ROOT/scripts/templates/github-repo-template.md"
CURRENT_DATE=$(date +%Y-%m-%d)

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# 检查参数
if [ $# -eq 0 ]; then
    log_error "请提供 GitHub URL"
    echo "用法: $0 <github-url>"
    exit 1
fi

GITHUB_URL="$1"

# 验证 URL 格式
if [[ ! "$GITHUB_URL" =~ ^https?://github\.com/[^/]+/[^/]+$ ]]; then
    log_error "无效的 GitHub URL 格式"
    echo "示例: https://github.com/owner/repo"
    exit 1
fi

# 提取 owner 和 repo
OWNER=$(echo "$GITHUB_URL" | sed -n 's|https://github\.com/\([^/]*\)/\([^/]*\)$|\1|p')
REPO=$(echo "$GITHUB_URL" | sed -n 's|https://github\.com/\([^/]*\)/\([^/]*\)$|\2|p')

log_info "正在收集仓库: $OWNER/$REPO"

# 使用 GitHub MCP 获取数据（需要 AI 助手配合）
# 这里创建临时文件存储请求信息
REQUEST_FILE="/tmp/github-collect-request.json"
cat > "$REQUEST_FILE" << REQ_EOF
{
  "owner": "$OWNER",
  "repo": "$REPO",
  "url": "$GITHUB_URL",
  "date": "$CURRENT_DATE",
  "wiki_dir": "$WIKI_DIR",
  "archive_dir": "$ARCHIVE_DIR",
  "template_file": "$TEMPLATE_FILE"
}
REQ_EOF

log_info "请求信息已保存到: $REQUEST_FILE"
log_info "请让 AI 助手处理此请求以完成收集"

echo "$REQUEST_FILE"
