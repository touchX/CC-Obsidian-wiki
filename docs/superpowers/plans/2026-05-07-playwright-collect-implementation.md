# Playwright-Collect Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 构建 playwright-collect skill，实现防爬网站文章搜集与登录状态持久化

**Architecture:** 基于 playwright-cli 的 state-save/load 实现会话持久化，采用 Site Adapter 模式支持多网站，输出标准 Markdown 兼容 Wiki Ingest 流程

**Tech Stack:** Bash scripts + playwright-cli + YAML 配置

---

## 文件结构

```
~/.claude/skills/playwright-collect/
├── SKILL.md                      # Skill 定义文档
├── scripts/
│   ├── playwright-collect.sh     # 主入口（命令行解析）
│   ├── login.sh                 # Login 命令实现
│   ├── collect.sh               # Collect 命令实现
│   ├── status.sh               # Status 命令实现
│   └── common.sh                # 公共函数库
├── lib/
│   ├── session-manager.sh       # 会话管理（状态加载/保存/过期检测）
│   ├── markdown-formatter.sh    # Markdown + Frontmatter 生成
│   ├── selector-parser.sh       # YAML 选择器解析（CSS/XPath/JS）
│   └── adapter-loader.sh        # 适配器加载器
├── adapters/
│   ├── zhihu.yaml               # 知乎适配器
│   └── wechat.yaml              # 微信公众号适配器（预留）
└── config/
    └── config.yaml              # 默认配置
```

---

## Task 1: 项目基础架构

**Files:**
- Create: `~/.claude/skills/playwright-collect/SKILL.md`
- Create: `~/.claude/skills/playwright-collect/scripts/playwright-collect.sh`
- Create: `~/.claude/skills/playwright-collect/scripts/common.sh`
- Create: `~/.claude/skills/playwright-collect/config/config.yaml`

- [ ] **Step 1: 创建目录结构**

```bash
mkdir -p ~/.claude/skills/playwright-collect/{scripts,lib,adapters,config}
```

- [ ] **Step 2: 创建 config/config.yaml**

```yaml
# 全局配置
base_dir: "~/.playwright-collect"
output_dir: "raw"
default_count: 10
retry_times: 3
retry_interval: 5

# 适配器配置目录
adapter_dir: "~/.claude/skills/playwright-collect/adapters"
```

- [ ] **Step 3: 创建 scripts/common.sh（公共函数库）**

```bash
#!/bin/bash
# common.sh - 公共函数库

set -e

# 读取全局配置
read_config() {
    local config_file="${HOME}/.claude/skills/playwright-collect/config/config.yaml"
    if [[ -f "$config_file" ]]; then
        cat "$config_file"
    else
        echo "base_dir: ${HOME}/.playwright-collect"
        echo "output_dir: raw"
        echo "default_count: 10"
    fi
}

# 获取站点目录
get_site_dir() {
    local site="$1"
    echo "${HOME}/.playwright-collect/${site}"
}

# 获取状态文件路径
get_state_file() {
    local site="$1"
    echo "$(get_site_dir "$site")/state.json"
}

# 获取 meta 文件路径
get_meta_file() {
    local site="$1"
    echo "$(get_site_dir "$site")/meta.json"
}

# 检查状态文件是否存在
check_state_exists() {
    local site="$1"
    [[ -f "$(get_state_file "$site")" ]]
}

# 输出错误信息
error() {
    echo "ERROR: $1" >&2
    exit 1
}

# 输出成功信息
success() {
    echo "SUCCESS: $1"
}

# 输出提示信息
info() {
    echo "INFO: $1"
}

# 生成 slug
generate_slug() {
    local title="$1"
    echo "$title" | iconv -f utf-8 -t ascii//TRANSLIT 2>/dev/null | \
        sed 's/[^a-zA-Z0-9]/-/g' | \
        tr -s '-' | \
        tr 'A-Z' 'a-z' | \
        head -c 100
}

# 获取当前时间（ISO8601）
now_iso() {
    date -u +"%Y-%m-%dT%H:%M:%SZ"
}
```

- [ ] **Step 4: 创建 scripts/playwright-collect.sh（主入口）**

```bash
#!/bin/bash
# playwright-collect.sh - 主入口

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMMON_LIB="${SCRIPT_DIR}/common.sh"

if [[ -f "$COMMON_LIB" ]]; then
    source "$COMMON_LIB"
fi

# 命令帮助
show_help() {
    cat <<EOF
playwright-collect - 防爬网站文章搜集工具

用法：
  playwright-collect login <site>           登录指定网站
  playwright-collect status <site>           检查登录状态
  playwright-collect collect <site> [选项]  收集文章

命令：
  login <site>              有头模式登录并保存状态
  status <site>            检查当前登录状态
  collect <site> [选项]    收集文章

收集选项：
  --url <url>               文章列表页 URL（必填）
  --count <n>              抓取文章数量（默认：10）
  --adapter <path>         自定义适配器配置
  --output <dir>           输出目录（默认：raw/{site}）
  --force                  强制重新登录
  --since <date>           仅抓取指定日期后的文章（增量）

示例：
  playwright-collect login zhihu
  playwright-collect status zhihu
  playwright-collect collect zhihu --url https://www.zhihu.com/people/xxx/articles --count 5
EOF
}

# 主逻辑
main() {
    if [[ $# -eq 0 ]]; then
        show_help
        exit 0
    fi

    local command="$1"
    shift

    case "$command" in
        login)
            "${SCRIPT_DIR}/login.sh" "$@"
            ;;
        status)
            "${SCRIPT_DIR}/status.sh" "$@"
            ;;
        collect)
            "${SCRIPT_DIR}/collect.sh" "$@"
            ;;
        -h|--help|help)
            show_help
            ;;
        *)
            error "未知命令: $command"
            ;;
    esac
}

main "$@"
```

- [ ] **Step 5: 提交**

```bash
git add -A && git commit -m "feat(playwright-collect): P0 基础架构 - SKILL.md、主入口、公共函数库"
```

---

## Task 2: Session Manager（会话管理）

**Files:**
- Create: `~/.claude/skills/playwright-collect/lib/session-manager.sh`
- Modify: `~/.claude/skills/playwright-collect/scripts/common.sh`（添加新函数）

- [ ] **Step 1: 创建 lib/session-manager.sh**

```bash
#!/bin/bash
# session-manager.sh - 会话管理

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../scripts/common.sh"

# 默认过期时间（天）
DEFAULT_EXPIRY_DAYS=7

# 初始化站点目录
init_site_dir() {
    local site="$1"
    local site_dir=$(get_site_dir "$site")
    mkdir -p "$site_dir"
    echo "$site_dir"
}

# 检查会话是否过期
is_session_expired() {
    local site="$1"
    local meta_file=$(get_meta_file "$site")

    if [[ ! -f "$meta_file" ]]; then
        return 1  # 没有 meta 文件，视为过期
    fi

    local expires_at=$(grep '"expires_at"' "$meta_file" | sed 's/.*: *"\([^"]*\)".*/\1/')
    if [[ -z "$expires_at" ]]; then
        return 1
    fi

    local expiry_epoch=$(date -d "$expires_at" +%s 2>/dev/null) || return 1
    local now_epoch=$(date -u +%s)

    [[ $now_epoch -gt $expiry_epoch ]]
}

# 记录登录元数据
save_login_meta() {
    local site="$1"
    local site_dir=$(init_site_dir "$site")
    local meta_file="${site_dir}/meta.json"
    local login_time=$(now_iso)

    # 计算过期时间
    local expiry_days="${DEFAULT_EXPIRY_DAYS}"
    local expires_at=$(date -u -d "+${expiry_days} days" +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || \
        date -u -v+${expiry_days}d +"%Y-%m-%dT%H:%M:%SZ")

    cat > "$meta_file" <<EOF
{
  "login_time": "$login_time",
  "expires_at": "$expires_at",
  "note": "${site} 通常有效期为 ${expiry_days} 天"
}
EOF
    info "登录元数据已保存到 $meta_file"
    info "预计过期时间: $expires_at"
}

# 获取会话状态摘要
get_session_summary() {
    local site="$1"
    local state_file=$(get_state_file "$site")
    local meta_file=$(get_meta_file "$site")

    if [[ ! -f "$state_file" ]]; then
        echo "未登录（无状态文件）"
        return
    fi

    if is_session_expired "$site"; then
        echo "会话已过期"
    else
        echo "会话有效"
    fi

    if [[ -f "$meta_file" ]]; then
        local login_time=$(grep '"login_time"' "$meta_file" | sed 's/.*: *"\([^"]*\)".*/\1/')
        local expires_at=$(grep '"expires_at"' "$meta_file" | sed 's/.*: *"\([^"]*\)".*/\1/')
        echo "登录时间: $login_time"
        echo "过期时间: $expires_at"
    fi
}
```

- [ ] **Step 2: 提交**

```bash
git add -A && git commit -m "feat(playwright-collect): P0 Session Manager - 会话管理、过期检测、元数据存储"
```

---

## Task 3: Login 命令实现

**Files:**
- Create: `~/.claude/skills/playwright-collect/scripts/login.sh`

- [ ] **Step 1: 创建 scripts/login.sh**

```bash
#!/bin/bash
# login.sh - 登录引导命令

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"
source "${SCRIPT_DIR}/../lib/session-manager.sh"

show_help() {
    cat <<EOF
playwright-collect login - 有头模式登录

用法：
  playwright-collect login <site> [--browser chrome|firefox|webkit]

参数：
  <site>              网站标识（如 zhihu, wechat）

选项：
  --browser <name>   使用的浏览器（默认：chrome）

示例：
  playwright-collect login zhihu
  playwright-collect login zhihu --browser firefox
EOF
}

main() {
    local site=""
    local browser="chrome"

    # 解析参数
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                show_help
                exit 0
                ;;
            --browser)
                browser="$2"
                shift 2
                ;;
            *)
                site="$1"
                shift
                ;;
        esac
    done

    # 检查 site 参数
    if [[ -z "$site" ]]; then
        error "缺少 site 参数"
    fi

    # 初始化站点目录
    local site_dir=$(init_site_dir "$site")
    local state_file=$(get_state_file "$site")

    info "正在打开浏览器（${browser}）进行登录..."
    info "请在浏览器中完成登录（可能需要处理验证码）"
    info "登录完成后按 Enter 继续..."

    # 有头模式打开浏览器
    read -p "按 Enter 开始登录..." </dev/tty

    playwright-cli open --persistent --browser="$browser" https://www.zhihu.com || \
        error "无法打开浏览器，请确保 playwright-cli 已安装"

    # 等待用户确认登录完成
    read -p "登录完成后按 Enter 保存状态..." </dev/tty

    # 保存状态
    info "正在保存登录状态..."
    playwright-cli state-save "$state_file" || error "保存状态失败"

    # 保存元数据
    save_login_meta "$site"

    success "登录完成！状态已保存到 $state_file"
    info "后续可使用 'playwright-collect collect $site --url <url>' 进行文章收集"
}

main "$@"
```

- [ ] **Step 2: 提交**

```bash
git add -A && git commit -m "feat(playwright-collect): P0 Login 命令 - 有头模式登录引导"
```

---

## Task 4: Status 命令实现

**Files:**
- Create: `~/.claude/skills/playwright-collect/scripts/status.sh`

- [ ] **Step 1: 创建 scripts/status.sh**

```bash
#!/bin/bash
# status.sh - 状态检查命令

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"
source "${SCRIPT_DIR}/../lib/session-manager.sh"

show_help() {
    cat <<EOF
playwright-collect status - 检查登录状态

用法：
  playwright-collect status <site>

参数：
  <site>              网站标识（如 zhihu, wechat）

示例：
  playwright-collect status zhihu
EOF
}

main() {
    local site=""

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                site="$1"
                shift
                ;;
        esac
    done

    if [[ -z "$site" ]]; then
        error "缺少 site 参数"
    fi

    local state_file=$(get_state_file "$site")

    echo "=== $site 登录状态 ==="
    echo ""

    if [[ ! -f "$state_file" ]]; then
        echo "状态文件不存在: $state_file"
        echo ""
        echo "请先登录: playwright-collect login $site"
        exit 1
    fi

    # 显示会话摘要
    get_session_summary "$site"

    echo ""
    echo "状态文件: $state_file"
    echo "文件大小: $(wc -c < "$state_file") bytes"
    echo "最后修改: $(stat -c %y "$state_file" 2>/dev/null || stat -f %Sm "$state_file" 2>/dev/null)"
}

main "$@"
```

- [ ] **Step 2: 提交**

```bash
git add -A && git commit -m "feat(playwright-collect): P2 Status 命令 - 登录状态检查"
```

---

## Task 5: Selector Parser（选择器解析器）

**Files:**
- Create: `~/.claude/skills/playwright-collect/lib/selector-parser.sh`

- [ ] **Step 1: 创建 lib/selector-parser.sh**

```bash
#!/bin/bash
# selector-parser.sh - YAML 选择器解析器

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../scripts/common.sh"

# 解析选择器类型和值
# 输入：YAML 格式的 selector 配置
# 输出：类型和选择器表达式
parse_selector() {
    local yaml_content="$1"
    local selector_name="$2"

    # 提取选择器配置（支持两种格式：简单值或 type:value 对象）
    local value=$(echo "$yaml_content" | grep -A10 "^${selector_name}:" | \
        sed -n '1d;/^[^ ]/q;p' | \
        grep -E "^\s*value:\s*" | \
        head -1 | \
        sed 's/.*value:\s*\(.*\)/\1/' | \
        tr -d '"' | tr -d "'")

    local type=$(echo "$yaml_content" | grep -A10 "^${selector_name}:" | \
        sed -n '1d;/^[^ ]/q;p' | \
        grep -E "^\s*type:\s*" | \
        head -1 | \
        sed 's/.*type:\s*\([a-z]*\).*/\1/')

    # 默认类型为 css
    type="${type:-css}"

    echo "${type}|${value}"
}

# 解析适配器配置
load_adapter() {
    local site="$1"
    local custom_adapter=""

    # 解析可选的自定义适配器路径
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --adapter)
                custom_adapter="$2"
                shift 2
                ;;
            *)
                shift
                ;;
        esac
    done

    # 适配器查找顺序：
    # 1. 用户自定义 ~/.playwright-collect/{site}/selector.yaml
    # 2. 内置适配器 ~/.claude/skills/playwright-collect/adapters/{site}.yaml

    local built_in_adapter="${HOME}/.claude/skills/playwright-collect/adapters/${site}.yaml"
    local user_selector="${HOME}/.playwright-collect/${site}/selector.yaml"

    if [[ -n "$custom_adapter" && -f "$custom_adapter" ]]; then
        echo "$custom_adapter"
    elif [[ -f "$user_selector" ]]; then
        echo "$user_selector"
    elif [[ -f "$built_in_adapter" ]]; then
        echo "$built_in_adapter"
    else
        error "未找到适配器: $site"
    fi
}

# 获取选择器（合并用户覆盖）
get_selector() {
    local site="$1"
    local selector_name="$2"

    local adapter_file=$(load_adapter "$site")
    local base_content=$(cat "$adapter_file")

    # 优先使用用户覆盖
    local user_selector="${HOME}/.playwright-collect/${site}/selector.yaml"
    if [[ -f "$user_selector" ]]; then
        local user_value=$(grep -A5 "^${selector_name}:" "$user_selector" 2>/dev/null | \
            grep "value:" | head -1 | sed 's/.*value:\s*\(.*\)/\1/' | tr -d '"' | tr -d "'")
        if [[ -n "$user_value" ]]; then
            echo "css|${user_value}"
            return
        fi
    fi

    # 否则使用内置适配器
    parse_selector "$base_content" "$selector_name"
}
```

- [ ] **Step 2: 提交**

```bash
git add -A && git commit -m "feat(playwright-collect): P1 Selector Parser - YAML 选择器解析（CSS/XPath/JS）"
```

---

## Task 6: Markdown Formatter

**Files:**
- Create: `~/.claude/skills/playwright-collect/lib/markdown-formatter.sh`

- [ ] **Step 1: 创建 lib/markdown-formatter.sh**

```bash
#!/bin/bash
# markdown-formatter.sh - Markdown 生成器

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/../scripts/common.sh"

# 生成 Frontmatter
generate_frontmatter() {
    local name="$1"
    local description="$2"
    local author="$3"
    local published="$4"
    local url="$5"
    local site="$6"
    local slug="$7"
    local created="${8:-$(date +%Y-%m-%d)}"
    local updated="${9:-$created}"

    cat <<EOF
---
name: ${name}
description: ${description}
type: source
tags: [${site}, article]
source: ../../archive/${site}/articles/${slug}.md
created: ${created}
updated: ${updated}
author: ${author}
published: ${published}
url: ${url}
---
EOF
}

# 生成 Markdown 文章
generate_article() {
    local title="$1"
    local author="$2"
    local published="$3"
    local stats="$4"
    local content="$5"
    local site="$6"
    local collect_time="${7:-$(date +%Y-%m-%d)}"

    # 生成 frontmatter
    local slug=$(generate_slug "$title")
    local name="${site}-${slug}"
    local description="${title}"

    generate_frontmatter "$name" "$description" "$author" "$published" "" "$site" "$slug" | \
        sed 's|url: |url: PLACEHOLDER_URL|'

    echo ""
    echo "# ${title}"
    echo ""
    echo "> 作者：${author} | 发布时间：${published}"

    if [[ -n "$stats" ]]; then
        echo " | ${stats}"
    fi

    echo ""
    echo "${content}"
    echo ""
    echo "---"
    echo ""
    echo "*来源：${site} | 采集时间：${collect_time}*"
}

# 保存文章
save_article() {
    local site="$1"
    local title="$2"
    local content="$3"
    local output_dir="${4:-raw/${site}}"

    # 确保输出目录存在
    mkdir -p "$output_dir"

    local slug=$(generate_slug "$title")
    local file="${output_dir}/${slug}.md"

    echo "$content" > "$file"
    info "文章已保存: $file"
    echo "$file"
}
```

- [ ] **Step 2: 提交**

```bash
git add -A && git commit -m "feat(playwright-collect): P1 Markdown Formatter - Frontmatter 和文章生成"
```

---

## Task 7: Collect 命令实现

**Files:**
- Create: `~/.claude/skills/playwright-collect/scripts/collect.sh`

- [ ] **Step 1: 创建 scripts/collect.sh**

```bash
#!/bin/bash
# collect.sh - 文章收集命令

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/common.sh"
source "${SCRIPT_DIR}/../lib/session-manager.sh"
source "${SCRIPT_DIR}/../lib/selector-parser.sh"
source "${SCRIPT_DIR}/../lib/markdown-formatter.sh"

show_help() {
    cat <<EOF
playwright-collect collect - 收集文章

用法：
  playwright-collect collect <site> --url <url> [选项]

参数：
  <site>              网站标识（如 zhihu, wechat）
  --url <url>        文章列表页 URL（必填）

选项：
  --count <n>        抓取文章数量（默认：10）
  --adapter <path>   自定义适配器配置
  --output <dir>     输出目录（默认：raw/{site}）
  --force            强制继续（即使会话过期）
  --since <date>     仅抓取指定日期后的文章（增量）

示例：
  playwright-collect collect zhihu --url https://www.zhihu.com/people/xxx/articles --count 5
EOF
}

main() {
    local site=""
    local url=""
    local count=10
    local output_dir=""
    local force=false
    local since=""

    # 解析参数
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                show_help
                exit 0
                ;;
            --url)
                url="$2"
                shift 2
                ;;
            --count)
                count="$2"
                shift 2
                ;;
            --adapter)
                adapter_path="$2"
                shift 2
                ;;
            --output)
                output_dir="$2"
                shift 2
                ;;
            --force)
                force=true
                shift
                ;;
            --since)
                since="$2"
                shift 2
                ;;
            *)
                site="$1"
                shift
                ;;
        esac
    done

    # 检查必填参数
    if [[ -z "$site" ]]; then
        error "缺少 site 参数"
    fi
    if [[ -z "$url" ]]; then
        error "缺少 --url 参数"
    fi

    local state_file=$(get_state_file "$site")
    local site_dir=$(get_site_dir "$site")

    # 检查状态文件
    if [[ ! -f "$state_file" ]]; then
        error "未登录，请先执行: playwright-collect login $site"
    fi

    # 检查会话过期
    if is_session_expired "$site" && [[ "$force" != "true" ]]; then
        error "会话已过期，请重新登录: playwright-collect login $site\n或使用 --force 强制继续"
    fi

    # 设置默认输出目录
    if [[ -z "$output_dir" ]]; then
        output_dir="raw/${site}"
    fi

    # 确保输出目录存在
    mkdir -p "$output_dir"

    info "开始收集文章..."
    info "站点: $site"
    info "URL: $url"
    info "数量: $count"
    info "输出: $output_dir"

    # 加载状态
    info "加载登录状态..."
    playwright-cli state-load "$state_file"

    # 访问目标页面
    info "访问文章列表页..."
    playwright-cli goto "$url"

    # 获取适配器
    local adapter_file=$(load_adapter "$site" "${adapter_path:+--adapter $adapter_path}")
    info "使用适配器: $adapter_file"

    # TODO: 实现文章解析和收集逻辑（Task 8）
    info "文章收集功能开发中..."

    success "收集完成！"
}

main "$@"
```

- [ ] **Step 2: 提交**

```bash
git add -A && git commit -m "feat(playwright-collect): P1 Collect 命令骨架 - 参数解析、状态加载、适配器加载"
```

---

## Task 8: 知乎适配器集成

**Files:**
- Create: `~/.claude/skills/playwright-collect/adapters/zhihu.yaml`

- [ ] **Step 1: 创建 adapters/zhihu.yaml**

```yaml
site: zhihu
name: 知乎

selectors:
  article-list:
    type: css
    value: ".List-item"
  article-link:
    type: css
    value: "a[data-za-attr='title']"
  article-title:
    type: css
    value: "h2.ContentItem-title"
  article-content:
    type: css
    value: ".RichText.Article-content"
  article-author:
    type: css
    value: ".AuthorInfo-name"
  article-date:
    type: css
    value: ".ContentItem-time"
  article-stats:
    type: css
    value: ".ArticleMeta--props"

pagination:
  type: infinite-scroll
  max-articles: 100

output:
  directory: "raw/zhihu"
  filename-template: "{{slug}}"
```

- [ ] **Step 2: 提交**

```bash
git add -A && git commit -m "feat(playwright-collect): P1 Zhihu 适配器 - 知乎选择器和分页配置"
```

---

## Task 9: WeChat 适配器（预留）

**Files:**
- Create: `~/.claude/skills/playwright-collect/adapters/wechat.yaml`

- [ ] **Step 1: 创建 adapters/wechat.yaml**

```yaml
site: wechat
name: 微信公众号

selectors:
  article-list:
    type: css
    value: ".weui-article__list li"
  article-title:
    type: css
    value: ".article-title"
  article-content:
    type: css
    value: "#js_content"
  article-author:
    type: css
    value: ".account_nickname"
  article-date:
    type: css
    value: ".article-time"

pagination:
  type: load-more
  max-articles: 50

output:
  directory: "raw/wechat"
  filename-template: "{{slug}}"
```

- [ ] **Step 2: 提交**

```bash
git add -A && git commit -m "feat(playwright-collect): P3 WeChat 适配器 - 微信公众号配置（预留）"
```

---

## Task 10: 错误处理增强

**Files:**
- Modify: `~/.claude/skills/playwright-collect/scripts/common.sh`
- Modify: `~/.claude/skills/playwright-collect/scripts/collect.sh`

- [ ] **Step 1: 更新 common.sh 添加重试和错误处理函数**

```bash
# 重试机制
retry_with_backoff() {
    local max_attempts="$1"
    local interval="$2"
    local command="$3"
    shift 3

    local attempt=1
    while [[ $attempt -le $max_attempts ]]; do
        if "$command" "$@"; then
            return 0
        fi
        if [[ $attempt -lt $max_attempts ]]; then
            info "尝试 ${attempt}/${max_attempts} 失败，${interval}秒后重试..."
            sleep "$interval"
        fi
        attempt=$((attempt + 1))
    done
    return 1
}

# 页面加载超时检测
check_page_loaded() {
    playwright-cli eval "document.readyState" | grep -q "complete"
}

# 错误日志记录
log_error() {
    local error_log="${HOME}/.playwright-collect/error.log"
    local timestamp=$(now_iso)
    echo "[${timestamp}] $1" >> "$error_log"
}
```

- [ ] **Step 2: 更新 collect.sh 添加完整错误处理**

```bash
# 在 main 函数中添加错误处理

# 页面加载超时 - 重试机制
if ! retry_with_backoff 3 5 check_page_loaded; then
    error "页面加载超时"
fi

# 解析失败处理
parse_article() {
    local article_url="$1"
    playwright-cli goto "$article_url"

    # 获取选择器
    local title_selector=$(get_selector "$site" "article-title")
    # ... 解析逻辑
}
```

- [ ] **Step 3: 提交**

```bash
git add -A && git commit -m "feat(playwright-collect): P2 错误处理 - 重试机制、超时检测、错误日志"
```

---

## Task 11: SKILL.md 完善

**Files:**
- Modify: `~/.claude/skills/playwright-collect/SKILL.md`

- [ ] **Step 1: 创建完整的 SKILL.md**

```markdown
---
name: playwright-collect
description: "防爬网站文章搜集工具。通过 playwright-cli 实现登录状态持久化，支持知乎等强反爬平台的文章自动抓取。当用户提到'搜集文章'、'抓取网页'、'登录保存'、'反爬虫'、'playwright collect'、'文章采集'时触发。"
version: 1.0.0
author: Claude Code Best Practice Project
---

# Playwright-Collect Skill

防爬网站文章搜集工具，通过 playwright-cli 实现登录状态持久化。

## 核心功能

1. **登录引导** - 有头模式引导用户完成网站登录，自动保存会话状态
2. **状态管理** - 多网站会话隔离，自动过期检测
3. **文章收集** - 无头模式加载已保存状态，抓取文章并输出 Markdown
4. **适配器系统** - 支持内置适配器和用户自定义选择器

## 命令

```bash
# 登录
playwright-collect login <site>

# 检查状态
playwright-collect status <site>

# 收集文章
playwright-collect collect <site> --url <url> --count <n>
```

## 工作流程

1. 首次使用执行 `login` 命令（有头模式，引导登录）
2. 后续使用 `collect` 命令抓取文章（无头模式）
3. 状态过期后需重新登录

## 技术要点

- 基于 playwright-cli state-save/load 实现会话持久化
- Site Adapter 模式支持多网站
- 输出标准 Markdown，兼容 Wiki Ingest 流程
```

- [ ] **Step 2: 提交**

```bash
git add -A && git commit -m "docs(playwright-collect): SKILL.md - Skill 定义和使用文档"
```

---

## 实现顺序

| 顺序 | Task | 优先级 | 说明 |
|------|------|--------|------|
| 1 | Task 1 | P0 | 基础架构 |
| 2 | Task 2 | P0 | Session Manager |
| 3 | Task 3 | P0 | Login 命令 |
| 4 | Task 4 | P2 | Status 命令 |
| 5 | Task 5 | P1 | Selector Parser |
| 6 | Task 6 | P1 | Markdown Formatter |
| 7 | Task 7 | P1 | Collect 命令骨架 |
| 8 | Task 8 | P1 | Zhihu 适配器 |
| 9 | Task 9 | P3 | WeChat 适配器（预留） |
| 10 | Task 10 | P2 | 错误处理增强 |
| 11 | Task 11 | P0 | SKILL.md 完善 |
