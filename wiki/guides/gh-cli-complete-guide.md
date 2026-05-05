---
name: gh-cli-complete-guide
description: GitHub CLI (gh) 完整使用指南 — 官方命令行工具，涵盖安装、认证、核心命令、常用工作流和最佳实践
type: guide
tags: [github, cli, automation, workflow, devops]
created: 2026-05-05
updated: 2026-05-05
source: ../../archive/skills/gh-cli-skill.md
---

# GitHub CLI (gh) 完整使用指南

> [!tip] 项目亮点
> ⭐ **GitHub 官方工具** | 🔧 **全功能自动化** | 🚀 **提升开发效率**

GitHub CLI (gh) 是 GitHub 的官方命令行工具，让你可以直接在终端中完成大部分 GitHub 操作，无需切换到浏览器或使用 API。

## 📋 目录

- [快速开始](#快速开始)
- [安装](#安装)
- [认证](#认证)
- [核心命令](#核心命令)
- [常用工作流](#常用工作流)
- [最佳实践](#最佳实践)
- [实战案例](#实战案例)

---

## 快速开始

### 最小化工作流

```bash
# 1. 安装 gh
# macOS
brew install gh

# Linux
sudo apt install gh  # Ubuntu/Debian
sudo dnf install gh  # Fedora

# Windows
winget install GitHub.cli

# 2. 认证
gh auth login

# 3. 基本使用
gh repo create my-awesome-project
gh issue list
gh pr create
```

### 验证安装

```bash
gh --version
# GitHub CLI 2.85.0

gh auth status
# GitHub.com: Logged in as username
```

---

## 安装

### macOS

```bash
# Homebrew
brew install gh

# MacPorts
sudo port install gh
```

### Linux

**Ubuntu/Debian:**
```bash
# 方式 1: 官方仓库（推荐）
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# 方式 2: apt（版本可能较旧）
sudo apt install gh
```

**Fedora/CentOS/RHEL:**
```bash
# Fedora
sudo dnf install gh

# CentOS/RHEL
sudo yum install gh
```

**Arch Linux:**
```bash
sudo pacman -S github-cli
```

### Windows

```powershell
# Winget
winget install GitHub.cli

# Scoop
scoop install gh

# Chocolatey
choco install gh
```

### 从源码编译

```bash
git clone https://github.com/cli/cli.git
cd cli
run build  # 需要 Go 1.22+
```

---

## 认证

### GitHub.com 认证

```bash
# 交互式登录（推荐）
gh auth login

# 按提示选择：
# ? What account do you want to log into?
#   GitHub.com        # 公有云
#   GitHub Enterprise Server  # 私有部署

# ? What is your preferred protocol for Git operations?
#   HTTPS            # 推荐
#   SSH

# ? Authenticate Git with your GitHub credentials?
#   Yes              # 推荐，自动配置 Git

# ? How would you like to authenticate GitHub CLI?
#   Login with a web browser    # 最简单
#   Paste an authentication token  # 手动输入 token
```

### 使用 Personal Access Token

```bash
# 创建 token 后
gh auth login --with-token

# 粘贴 token
```

### SSH 认证

```bash
gh auth login
# 选择 SSH 协议
# 需要先配置 SSH 密钥
```

### 检查认证状态

```bash
gh auth status

# 输出示例：
# GitHub.com: Logged in as username
#   - GitHub Enterprise Server: Logged in as username
```

### 多账号管理

```bash
# 为不同的 hostname 配置不同的账号
gh auth login --hostname enterprise.example.com

# 查看所有配置
gh auth status

# 切换账号
gh auth switch --hostname enterprise.example.com
```

### 退出登录

```bash
gh auth logout

# 登出特定 hostname
gh auth logout --hostname enterprise.example.com
```

### 刷新认证

```bash
# Token 过期时
gh auth refresh

# 刷新特定 scopes
gh auth refresh -h github.com -s admin:org
```

---

## 核心命令

### 1. 仓库操作 (gh repo)

```bash
# 创建仓库
gh repo create my-project --public
gh repo create my-project --private --description "My awesome project"
gh repo create my-project --clone  # 创建后立即克隆

# 从模板创建
gh repo create my-project --template username/template-repo

# 查看仓库信息
gh repo view
gh repo view username/repo
gh repo view --json name,description,stargazerCount

# 列出仓库
gh repo list
gh repo list username --limit 100
gh repo list --json name,stargazerCount --jq '.[] | select(.stargazerCount > 100)'

# 克隆仓库
gh repo clone username/repo
gh repo clone username/repo my-directory

# Fork 仓库
gh repo fork username/repo
gh repo fork username/repo --clone

# 删除仓库
gh repo delete username/repo
```

### 2. Issue 操作 (gh issue)

```bash
# 创建 Issue
gh issue create --title "Bug in login" --body "Steps to reproduce..."
gh issue create --title "Feature request" --body "..." --label "enhancement"
gh issue create --title "..." --assignee username

# 列出 Issue
gh issue list
gh issue list --label "bug"
gh issue list --assignee username
gh issue list --state closed

# 查看 Issue
gh issue view 123
gh issue view 123 --json title,body,comments

# 更新 Issue
gh issue edit 123 --body "Updated description"
gh issue close 123
gh issue reopen 123

# 添加评论
gh issue comment 123 --body "This is fixed in version 2.0"

# 搜索 Issue
gh issue list --search "is:open is:issue label:bug"
gh issue list --search "author:username"
```

### 3. Pull Request 操作 (gh pr)

```bash
# 创建 PR
gh pr create --title "Add new feature" --body "Description..."
gh pr create --base main --head feature-branch
gh pr create --draft  # 创建为草稿

# 从 Issue 创建 PR
gh pr create --issue 123

# 列出 PR
gh pr list
gh pr list --state merged
gh pr list --author username

# 查看 PR
gh pr view 456
gh pr view 456 --json title,body,commits,reviews

# 更新 PR
gh pr edit 456 --title "Updated title"
gh pr close 456
gh pr reopen 456

# 合并 PR
gh pr merge 456
gh pr merge 456 --squash  # squash 合并
gh pr merge 456 --rebase  # rebase 合并
gh pr merge 456 --delete-branch  # 合并后删除分支

# 查看 PR diff
gh pr diff 456

# 检查 PR 状态
gh pr checks 456
```

### 4. Release 操作 (gh release)

```bash
# 创建 Release
gh release create v1.0.0 --notes "Release notes here"
gh release create v1.0.0 --notes-file RELEASE_NOTES.md
gh release create v1.0.0 --draft  # 草稿
gh release create v1.0.0 --pre-release  # 预发布版本

# 列出 Release
gh release list

# 查看 Release
gh release view v1.0.0

# 下载 Release 资产
gh release download v1.0.0
gh release download v1.0.0 --pattern "*.zip"

# 删除 Release
gh release delete v1.0.0
```

### 5. Actions 操作 (gh run)

```bash
# 列出 Workflow Runs
gh run list
gh run list --workflow=ci.yml
gh run list --status=failure

# 查看 Run 详情
gh run view 456
gh run view 456 --log
gh run view 456 --log-failed

# 重新运行
gh run rerun 456
gh run rerun 456 --failed  # 仅重跑失败的 job

# 查看 Workflow
gh workflow list
gh workflow view ci.yml

# 触发 Workflow
gh workflow run ci.yml

# 下载 Artifacts
gh run download 456
gh run download 456 --name artifact-name
```

### 6. Git 操作 (gh git)

```bash
# 这些命令需要 Git 2.41+ 和 Git Credential Helper

# 克隆（gh repo clone 的别名）
gh git clone username/repo

# 推送失败时的辅助
# 如果直接 git push 失败，gh 会自动提示认证
```

### 7. Gist 操作 (gh gist)

```bash
# 创建 Gist
gh gist create my-script.sh
gh gist create my-script.sh --desc "My useful script"
gh gist create file1.py file2.js  # 多文件

# 列出 Gist
gh gist list
gh gist list --public

# 查看 Gist
gh gist view abc123

# 编辑 Gist
gh gist edit abc123 --desc "Updated description"

# 删除 Gist
gh gist delete abc123
```

### 8. 配置管理 (gh config)

```bash
# 查看配置
gh config

# 设置配置
gh config set editor vim
gh config set git_protocol https
gh config set prompts_enabled false

# 获取配置
gh config get editor

# 列出所有配置
gh config list
```

---

## 常用工作流

### 工作流 1: PR 创建与合并

```bash
# 1. 创建分支
git checkout -b feature/new-feature

# 2. 开发、提交
git add .
git commit -m "Add new feature"

# 3. 推送（如果配置了 Git Credential Helper，无需手动输入凭据）
git push -u origin feature/new-feature

# 4. 创建 PR
gh pr create --title "Add new feature" --body "## 描述\n\n实现的新功能..."

# 5. 等待 CI 通过
gh pr checks

# 6. 合并 PR
gh pr merge --squash --delete-branch
```

### 工作流 2: 从 Issue 到 PR

```bash
# 1. 创建 Issue
gh issue create --title "Add user authentication" --body "Implement OAuth2..."

# 2. 从 Issue 创建分支
# （假设 Issue #123）
git checkout -b issue/123-add-auth

# 3. 开发、推送
git add .
git commit -m "Implement OAuth2 authentication"
git push -u origin issue/123-add-auth

# 4. 创建 PR 并关联 Issue
gh pr create --issue 123

# 5. PR 标题会自动包含 "Resolves #123"
```

### 工作流 3: 批量操作 Issues

```bash
# 查找所有开放的 bug
gh issue list --search "is:open label:bug" --json number,title

# 批量关闭（使用 jq）
gh issue list --search "is:open label:outdated" --json number | \
  jq -r '.[].number' | \
  xargs -I {} gh issue close {} --comment "Auto-closed: outdated"

# 批量添加标签
gh issue list --search "is:open label:bug" --json number | \
  jq -r '.[].number' | \
  xargs -I {} gh issue edit {} --add-label "priority:high"
```

### 工作流 4: Fork 同步

```bash
# 1. Fork 上游仓库
gh repo fork upstream/repo --clone

# 2. 添加上游 remote
git remote add upstream https://github.com/upstream/repo.git

# 3. 拉取上游更新
git fetch upstream

# 4. 合并上游主分支
git checkout main
git merge upstream/main

# 5. 推送到自己的 fork
git push origin main
```

### 工作流 5: CI/CD 集成

```bash
# 在 CI 脚本中使用 gh

# 注释 PR（例如失败时）
gh pr comment $PR_NUMBER --body "❌ CI failed on commit $SHA"

# 更新 PR 状态
gh pr check $PR_NUMBER

# 下载测试报告
gh run download $RUN_ID --name coverage-report

# 根据结果创建 Issue
if [ $FAILURE_COUNT -gt 0 ]; then
  gh issue create --title "Test failures detected" --body "See CI run #$RUN_ID"
fi
```

---

## 最佳实践

### 1. JSON 处理与 jq

```bash
# 提取特定字段
gh repo view --json owner,name | jq -r '.owner.login + "/" + .name'

# 复杂查询
gh issue list --json number,title,labels | \
  jq '.[] | select(.labels[].name == "bug") | {number, title}'

# 格式化输出
gh pr list --json number,title,author | \
  jq -r '.[] | "#\(.number) - \(.title) (@\(.author.login))"'

# 统计
gh repo list --json stargazerCount | \
  jq '[.[].stargazerCount] | add'
```

### 2. 别名与快捷方式

```bash
# 在 ~/.bashrc 或 ~/.zshrc 中添加

alias prs='gh pr list'
alias issues='gh issue list'
alias prc='gh pr create'
alias prs='gh pr status'
alias prview='gh pr view'

# 复杂别名
alias pr-merge='gh pr merge --squash --delete-branch'
alias my-prs='gh pr list --author "@me"'
```

### 3. 脚本与自动化

```bash
#!/bin/bash
# auto-pr.sh - 自动创建 PR

TITLE=$1
BODY=$2

if [ -z "$TITLE" ]; then
  echo "Usage: $0 <title> [body]"
  exit 1
fi

# 推送当前分支
git push -u origin $(git branch --show-current)

# 创建 PR
gh pr create --title "$TITLE" --body "$BODY"

# 等待 CI
echo "Waiting for CI checks..."
sleep 30

# 显示状态
gh pr checks
```

### 4. 环境变量配置

```bash
# ~/.bashrc 或 ~/.zshrc

# 默认编辑器
export GH_EDITOR=vim

# 默认协议
export GH_PROTOCOL=ssh

# 禁用交互式提示（脚本中使用）
export GH_PROMPT_DISABLED=true

# 自定义 hostname
export GH_HOST=enterprise.example.com
```

### 5. Shell 补全

```bash
# Bash
echo 'eval "$(gh completion -s bash)"' >> ~/.bashrc
source ~/.bashrc

# Zsh
echo 'eval "$(gh completion -s zsh)"' >> ~/.zshrc
source ~/.zshrc

# Fish
gh completion -s fish | source

# PowerShell
gh completion -s powershell | Out-String | Invoke-Expression
```

### 6. 性能优化

```bash
# 使用 --limit 减少返回数量
gh repo list --limit 10

# 使用 --json 只获取需要的字段
gh issue list --json number,title --limit 100

# 缓存 API 响应（在脚本中）
CACHE_FILE=/tmp/gh-cache.json
if [ -f "$CACHE_FILE" ] && [ $(find "$CACHE_FILE" -mmin -5) ]; then
  cat "$CACHE_FILE"
else
  gh issue list --json number,title > "$CACHE_FILE"
  cat "$CACHE_FILE"
fi
```

### 7. 多账号管理

```bash
# 为不同项目使用不同账号

# 方式 1: 环境变量
export GH_TOKEN=$(cat ~/.github/token-personal)
export GH_ENTERPRISE_TOKEN=$(cat ~/.github/token-work)

# 方式 2: Git config（按仓库）
cd ~/work/project
git config --local github.user work-username

# 方式 3: hostname 区分
gh auth login --hostname github.com  # 个人
gh auth login --hostname enterprise.example.com  # 工作

# 使用时指定
gh repo view --hostname enterprise.example.com
```

### 8. 安全实践

```bash
# ❌ 不要在脚本中硬编码 token
export GH_TOKEN="ghp_xxxxxxxxxxxx"

# ✅ 使用 Git Credential Helper
gh auth login

# ✅ 使用环境变量文件
source .env  # .env 在 .gitignore 中
export GH_TOKEN=$GITHUB_TOKEN

# ✅ 限制 token 权限
gh auth login --scopes=repo,read:org

# ✅ 定期审查
gh auth token  # 查看当前 token
gh auth refresh --scopes=read:org  # 刷新并减少权限
```

---

## 实战案例

### 案例 1: 自动化 Release 流程

```bash
#!/bin/bash
# release.sh - 自动创建 GitHub Release

set -e

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

# 1. 创建 git tag
git tag -a "$VERSION" -m "Release $VERSION"
git push origin "$VERSION"

# 2. 构建
npm run build

# 3. 创建 Release
gh release create "$VERSION" \
  --notes "## What's Changed\n\nSee CHANGELOG.md" \
  ./dist/*.zip

echo "Release $VERSION created successfully!"
```

### 案例 2: PR 模板生成器

```bash
#!/bin/bash
# pr-template.sh - 根据分支名生成 PR 描述

BRANCH=$(git branch --show-current)
TYPE=$(echo $BRANCH | cut -d'/' -f1)
ISSUE=$(echo $BRANCH | cut -d'/' -f2)

case $TYPE in
  feature)
    TITLE="Feature: $ISSUE"
    BODY="## 描述\n\n实现的新功能\n\n## 测试\n\n- [ ] 单元测试\n- [ ] 集成测试"
    ;;
  fix)
    TITLE="Fix: $ISSUE"
    BODY="## 问题描述\n\n## 修复方案\n\n## 测试\n\n- [ ] 复现 bug\n- [ ] 验证修复"
    ;;
  *)
    TITLE="$BRANCH"
    BODY="Changes in $BRANCH"
    ;;
esac

gh pr create --title "$TITLE" --body "$BODY"
```

### 案例 3: Issue 统计报告

```bash
#!/bin/bash
# issue-report.sh - 生成 Issue 统计报告

echo "# Issue Report - $(date +%Y-%m-%d)"
echo ""

echo "## Open Issues by Label"
gh issue list --state open --json labels --jq '
  group_by(.labels[]) |
  map({label: .[0].name, count: length}) |
  sort_by(.count) |
  reverse |
  .[] |
  "- \(.label): \(.count)"
'

echo ""
echo "## Stale Issues (>30 days)"
gh issue list --state open --search "updated:<$(date -d '30 days ago' +%Y-%m-%d)" --json number,title --jq '
  .[] | "- #\(.number) \(.title)"
'

echo ""
echo "## Most Commented Issues"
gh issue list --state all --json number,title,comments --jq '
  sort_by(.comments) |
  reverse |
  .[0:10] |
  .[] |
  "- #\(.number) \(.title) (\(.comments) comments)"
'
```

### 案例 4: Fork 同步脚本

```bash
#!/bin/bash
# sync-fork.sh - 同步 fork 与上游

UPSTREAM_REPO="upstream/original-repo"

echo "Fetching upstream..."
git fetch upstream

echo "Merging upstream/main into main..."
git checkout main
git merge upstream/main

if [ $? -eq 0 ]; then
  echo "Pushing to origin..."
  git push origin main
  echo "✅ Fork synced successfully!"
else
  echo "❌ Merge conflict detected. Please resolve manually."
  exit 1
fi
```

### 案例 5: CI 失败自动处理

```bash
#!/bin/bash
# ci-handler.sh - CI 失败时的自动处理

RUN_ID=$1
PR_NUMBER=$2

# 下载失败日志
gh run view "$RUN_ID" --log-failed > ci-fail.log

# 分析常见错误
if grep -q "Module not found" ci-fail.log; then
  COMMENT="❌ CI 失败：缺少依赖\n\n\`\`\`\n$(grep 'Module not found' ci-fail.log | head -5)\n\`\`\`"
elif grep -q "Test failed" ci-fail.log; then
  COMMENT="❌ CI 失败：测试失败\n\n\`\`\`\n$(grep 'Test failed' ci-fail.log | head -5)\n\`\`\`"
else
  COMMENT="❌ CI 失败：未知错误\n\n请查看 [Run #$RUN_ID](https://github.com/xxx/actions/runs/$RUN_ID)"
fi

# 评论 PR
gh pr comment "$PR_NUMBER" --body "$COMMENT"

# 如果是特定错误，自动创建 Issue
if grep -q "flaky test" ci-fail.log; then
  gh issue create \
    --title "Flaky test detected in CI" \
    --body "Run #$RUN_ID failed intermittently.\n\n\`\`\`\n$(grep -A 10 'flaky' ci-fail.log)\n\`\`\`"
fi
```

---

## 高级技巧

### 1. 使用 gh api 直接调用 GitHub API

```bash
# 获取用户信息
gh api /user

# 自定义查询
gh api /repos/owner/repo/issues --jq '.[].title'

# POST 请求
gh api -X POST /repos/owner/repo/issues -f title="New issue" -f body="Description"

# 上传文件
gh api -X PUT /repos/owner/repo/contents/README.md \
  -f message="update readme" \
  -f content="$(echo 'Hello' | base64)"

# GraphQL 查询
gh api graphql -f query='
  query {
    viewer {
      login
      repositories(first: 10) {
        nodes {
          name
          stargazerCount
        }
      }
    }
  }'
```

### 2. 扩展命令 (gh extension)

```bash
# 安装扩展
gh extension install https://github.com/me/gh-extension

# 查看已安装扩展
gh extension list

# 卸载扩展
gh extension remove gh-extension

# 创建自己的扩展
mkdir -p ~/.local/share/gh/extensions/my-extension
cat > ~/.local/share/gh/extensions/my-extension/gh-my-extension.sh << 'EOF'
#!/bin/bash
# 我的自定义 gh 扩展
echo "Custom gh command!"
EOF
chmod +x ~/.local/share/gh/extensions/my-extension/gh-my-extension.sh

# 使用扩展
gh my-extension
```

### 3. 与其他工具集成

```bash
# 与 fzf 结合（交互式选择）
gh pr list | fzf | awk '{print $1}' | xargs gh pr view

# 与 peco 结合
gh issue list --json number,title | jq -r '.[] | "#\(.number) \(.title)"' | peco | awk '{print $1}' | xargs gh issue view

# 与 jq 结合进行复杂数据处理
gh repo list --json name,stargazerCount,primaryLanguage | \
  jq 'sort_by(.stargazerCount) | reverse | .[0:10]'

# 与 gum 结合（美化输出）
gh pr list --json number,title | \
  jq -r '.[] | "\(.number) \(.title)"' | \
  gum choose | \
  awk '{print $1}' | \
  xargs gh pr view
```

---

## 故障排除

### 常见问题

**问题 1: 认证失败**
```bash
# 解决方案：重新认证
gh auth logout
gh auth login

# 或刷新 token
gh auth refresh
```

**问题 2: Git push 仍然要求输入凭据**
```bash
# 解决方案：配置 Git Credential Helper
gh auth setup-git

# 或手动配置
git config --global credential.helper store
```

**问题 3: 命令不存在**
```bash
# 解决方案：更新 gh
# macOS
brew upgrade gh

# Linux
sudo apt update && sudo apt install gh

# Windows
winget upgrade GitHub.cli
```

**问题 4: API 速率限制**
```bash
# 查看剩余配额
gh api /rate_limit

# 解决方案：等待或使用认证
gh auth login
```

**问题 5: JSON 查询失败**
```bash
# 确保 jq 已安装
# macOS
brew install jq

# Linux
sudo apt install jq

# 测试
echo '{"test": "value"}' | jq '.test'
```

---

## 参考资源

- [GitHub CLI 官方文档](https://cli.github.com/manual/)
- [GitHub API 文档](https://docs.github.com/en/rest)
- [gh extensions 仓库](https://github.com/github/gh-extensions)
- [讨论社区](https://github.com/cli/cli/discussions)

---

**文档版本**：v1.0
**最后更新**：2026-05-05
**维护者**：Claude Code Best Practice 项目
**来源**：gh-cli skill (2,188 行完整参考)
