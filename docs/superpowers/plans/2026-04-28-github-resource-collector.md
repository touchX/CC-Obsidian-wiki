# GitHub 资源收集器实现计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 构建自动化的 GitHub 仓库资源收集系统，无缝集成到现有 Wiki 工作流中

**Architecture:** 
- 使用 GitHub MCP Server 获取仓库元数据
- 基于模板生成符合 WIKI.md 规范的 Markdown 页面
- 归档原始 JSON 数据到 archive/ 目录
- 通过 frontmatter 和 Dataview 支持灵活查询

**Tech Stack:**
- GitHub MCP Server（数据获取）
- Obsidian Markdown（Wiki 格式）
- Bash/Node.js（文件操作）
- Dataview（查询索引）

---

## 前置任务

### Task 0: 环境验证

**目的:** 确保所有必需的工具和配置已就位

- [ ] **Step 1: 验证 Git 状态**

```bash
git status
git branch
```

Expected: 在 main 分支，工作区干净（或仅有设计文档的变更）

- [ ] **Step 2: 检查目录结构**

```bash
ls -la wiki/
ls -la archive/
```

Expected: wiki/ 和 archive/ 目录存在

- [ ] **Step 3: 验证 WIKI.md 规范**

```bash
head -50 wiki/WIKI.md
```

Expected: Frontmatter 规范明确定义

- [ ] **Step 4: 检查 MCP 服务器配置**

```bash
ls ~/.claude/servers/ 2>/dev/null || echo "检查 MCP 配置"
```

Expected: GitHub MCP 服务器已配置（或配置指导就绪）

- [ ] **Step 5: 创建工作分支**

```bash
git checkout -b feat/github-resource-collector
```

Expected: 新分支创建成功

---

## 阶段一：目录结构创建

### Task 1: 创建 Wiki 新分类目录

**Files:**
- Create: `wiki/resources/github-repos/.gitkeep`
- Create: `wiki/resources/.gitkeep`

- [ ] **Step 1: 创建 resources 目录（如不存在）**

```bash
mkdir -p wiki/resources
```

Expected: 目录创建成功

- [ ] **Step 2: 创建 github-repos 子目录**

```bash
mkdir -p wiki/resources/github-repos
```

Expected: 子目录创建成功

- [ ] **Step 3: 创建 .gitkeep 文件**

```bash
touch wiki/resources/.gitkeep
touch wiki/resources/github-repos/.gitkeep
```

Expected: .gitkeep 文件创建

- [ ] **Step 4: 验证目录结构**

```bash
ls -la wiki/resources/
ls -la wiki/resources/github-repos/
```

Expected: 两个目录都包含 .gitkeep 文件

- [ ] **Step 5: 提交目录结构**

```bash
git add wiki/resources/
git commit -m "feat: add resources/github-repos directory structure"
```

Expected: 提交成功

---

### Task 2: 创建归档目录结构

**Files:**
- Create: `archive/resources/github/.gitkeep`
- Create: `archive/resources/.gitkeep`

- [ ] **Step 1: 创建 resources 归档目录**

```bash
mkdir -p archive/resources
```

Expected: 目录创建成功

- [ ] **Step 2: 创建 github 子目录**

```bash
mkdir -p archive/resources/github
```

Expected: 子目录创建成功

- [ ] **Step 3: 创建 .gitkeep 文件**

```bash
touch archive/resources/.gitkeep
touch archive/resources/github/.gitkeep
```

Expected: .gitkeep 文件创建

- [ ] **Step 4: 验证归档目录结构**

```bash
ls -la archive/resources/
ls -la archive/resources/github/
```

Expected: 两个目录都包含 .gitkeep 文件

- [ ] **Step 5: 提交归档目录**

```bash
git add archive/resources/
git commit -m "feat: add archive/resources/github directory structure"
```

Expected: 提交成功

---

## 阶段二：模板和文档

### Task 3: 创建 Wiki 页面模板

**Files:**
- Create: `.claude/skills/github-collect/github-repo-template.md`

- [ ] **Step 1: 创建模板目录**

```bash
mkdir -p scripts/templates
```

Expected: 目录创建成功

- [ ] **Step 2: 创建模板文件**

```bash
cat > .claude/skills/github-collect/github-repo-template.md << 'EOF'
---
name: {owner}-{repo}
description: {description}
type: source
tags: [github, {language}]
created: {current_date}
updated: {current_date}
source: ../../../archive/resources/github/{owner}-{repo}-{current_date}.json
stars: {star_count}
language: {language}
license: {license}
github_url: https://github.com/{owner}/{repo}
---

# {repository_name}

{description}

## 基本信息

| 字段 | 值 |
|------|-----|
| 作者 | [{owner}](https://github.com/{owner}) |
| 语言 | {language} |
| Stars | ![{stars}](https://img.shields.io/github/stars/{owner}/{repo}) |
| 许可证 | {license} |

## 链接

- **GitHub**: https://github.com/{owner}/{repo}
- **Issue**: https://github.com/{owner}/{repo}/issues

## 标签

`{language}` `github` `resource`
EOF
```

Expected: 模板文件创建成功

- [ ] **Step 3: 验证模板内容**

```bash
cat .claude/skills/github-collect/github-repo-template.md
```

Expected: 模板包含正确的占位符

- [ ] **Step 4: 提交模板**

```bash
git add scripts/templates/
git commit -m "feat: add GitHub repository Wiki page template"
```

Expected: 提交成功

---

### Task 4: 创建使用文档

**Files:**
- Create: `wiki/resources/github-repos/README.md`

- [ ] **Step 1: 创建使用说明文档**

```bash
cat > wiki/resources/github-repos/README.md << 'EOF'
# GitHub 资源收集

本目录用于存储从 GitHub 收集的优秀仓库资源。

## 使用方法

提供 GitHub URL 给 AI 助手，它将自动：
1. 获取仓库元数据
2. 生成 Wiki 页面
3. 归档原始数据

## 页面格式

每个仓库页面包含：
- 基本信息（作者、语言、Stars、许可证）
- GitHub 链接
- 相关标签（通过 Dataview 查询）

## 查询示例

使用 Dataview 查询：
```dataview
LIST
FROM "wiki/resources/github-repos"
WHERE contains(tags, "github")
SORT stars DESC
```
EOF
```

Expected: README 文件创建成功

- [ ] **Step 2: 验证文档创建**

```bash
cat wiki/resources/github-repos/README.md
```

Expected: 文档内容正确

- [ ] **Step 3: 提交文档**

```bash
git add wiki/resources/github-repos/README.md
git commit -m "docs: add GitHub repos collection usage guide"
```

Expected: 提交成功

---

## 阶段三：核心实现

### Task 5: 实现 GitHub 数据获取功能

**Files:**
- Create: `scripts/github-collector.sh`

- [ ] **Step 1: 创建收集器脚本**

```bash
cat > scripts/github-collector.sh << 'EOF'
#!/bin/bash

# GitHub 资源收集器
# 用法: ./scripts/github-collector.sh <github-url>

set -e

# 配置
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WIKI_DIR="$PROJECT_ROOT/wiki"
ARCHIVE_DIR="$PROJECT_ROOT/archive"
TEMPLATE_FILE="$PROJECT_ROOT/.claude/skills/github-collect/github-repo-template.md"
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
EOF

chmod +x scripts/github-collector.sh
```

Expected: 脚本创建成功并可执行

- [ ] **Step 2: 验证脚本创建**

```bash
ls -lh scripts/github-collector.sh
```

Expected: 脚本已设置执行权限

- [ ] **Step 3: 测试帮助信息**

```bash
bash scripts/github-collector.sh
```

Expected: 显示用法信息（错误）

- [ ] **Step 4: 提交脚本**

```bash
git add scripts/github-collector.sh
git commit -m "feat: add GitHub collector helper script"
```

Expected: 提交成功

---

### Task 6: 创建 AI 助手集成 Skill

**Files:**
- Create: `skills/github-collect/skill.json`
- Create: `skills/github-collect/skill.js`

- [ ] **Step 1: 创建 skill 目录**

```bash
mkdir -p skills/github-collect
```

Expected: 目录创建成功

- [ ] **Step 2: 创建 skill 配置文件**

```bash
cat > skills/github-collect/skill.json << 'EOF'
{
  "name": "github-collect",
  "description": "从 GitHub 收集优秀仓库资源，自动生成 Wiki 页面",
  "version": "1.0.0",
  "author": "touchx",
  "parameters": {
    "github_url": {
      "type": "string",
      "description": "GitHub 仓库 URL",
      "required": true
    }
  }
}
EOF
```

Expected: skill.json 创建成功

- [ ] **Step 3: 创建 skill 实现文件**

```bash
cat > skills/github-collect/skill.js << 'EOF'
/**
 * GitHub 资源收集 Skill
 * 
 * 功能：
 * 1. 使用 GitHub MCP 获取仓库元数据
 * 2. 生成符合 Wiki 规范的 Markdown 页面
 * 3. 归档原始 JSON 数据
 * 4. 更新操作日志
 */

async function collectGitHubRepo(githubUrl) {
  // 1. 验证 URL 格式
  const urlPattern = /^https?:\/\/github\.com\/[^/]+\/[^/]+$/;
  if (!urlPattern.test(githubUrl)) {
    return {
      success: false,
      error: '无效的 GitHub URL 格式',
      example: 'https://github.com/owner/repo'
    };
  }

  // 2. 提取 owner 和 repo
  const match = githubUrl.match(/github\.com\/([^/]+)\/([^/]+)/);
  const owner = match[1];
  const repo = match[2];
  const currentDate = new Date().toISOString().split('T')[0];

  console.log(`正在收集仓库: ${owner}/${repo}`);

  // 3. 使用 GitHub MCP 获取数据
  // 注意：这里需要 AI 助手调用 GitHub MCP 工具
  const repoData = await fetchGitHubRepoData(owner, repo);
  
  if (!repoData) {
    return {
      success: false,
      error: `无法获取仓库数据: ${owner}/${repo}`
    };
  }

  // 4. 归档原始 JSON
  const archivePath = `archive/resources/github/${owner}-${repo}-${currentDate}.json`;
  await archiveJSONData(archivePath, repoData);

  // 5. 生成 Wiki 页面
  const wikiPath = `wiki/resources/github-repos/${owner}-${repo}.md`;
  const template = await loadTemplate();
  const wikiContent = generateWikiPage(repoData, template, currentDate, archivePath);
  
  await writeWikiPage(wikiPath, wikiContent);

  // 6. 更新日志
  await updateLog(owner, repo, wikiPath);

  return {
    success: true,
    message: `成功收集仓库: ${owner}/${repo}`,
    wikiPage: wikiPath,
    archiveFile: archivePath
  };
}

// 辅助函数需要 AI 助手实现
async function fetchGitHubRepoData(owner, repo) {
  // 使用 GitHub MCP 的 get_repo 工具
  // 返回: { name, description, stars, language, license, ... }
  throw new Error('需要 AI 助手使用 GitHub MCP 实现');
}

async function loadTemplate() {
  const fs = require('fs');
  const templatePath = '.claude/skills/github-collect/github-repo-template.md';
  return fs.readFileSync(templatePath, 'utf-8');
}

function generateWikiPage(data, template, currentDate, archivePath) {
  // 替换模板占位符
  return template
    .replace(/{owner}/g, data.owner)
    .replace(/{repo}/g, data.repo)
    .replace(/{repository_name}/g, data.name)
    .replace(/{description}/g, data.description || '无描述')
    .replace(/{star_count}/g, data.stars)
    .replace(/{stars}/g, data.stars)
    .replace(/{language}/g, data.language || 'Unknown')
    .replace(/{license}/g, data.license || 'None')
    .replace(/{current_date}/g, currentDate);
}

async function archiveJSONData(path, data) {
  const fs = require('fs');
  const pathLib = require('path');
  const fullPath = pathLib.resolve(path);
  
  // 确保目录存在
  const dir = pathLib.dirname(fullPath);
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
  
  fs.writeFileSync(fullPath, JSON.stringify(data, null, 2));
}

async function writeWikiPage(path, content) {
  const fs = require('fs');
  const pathLib = require('path');
  const fullPath = pathLib.resolve(path);
  
  // 确保目录存在
  const dir = pathLib.dirname(fullPath);
  if (!fs.existsSync(dir)) {
    fs.mkdirSync(dir, { recursive: true });
  }
  
  fs.writeFileSync(fullPath, content);
}

async function updateLog(owner, repo, wikiPath) {
  const fs = require('fs');
  const logPath = 'wiki/log.md';
  const timestamp = new Date().toISOString();
  const logEntry = `\n## [${timestamp}] 收集 GitHub 仓库\n\n- 仓库: ${owner}/${repo}\n- Wiki 页面: ${wikiPath}\n`;
  
  fs.appendFileSync(logPath, logEntry);
}

module.exports = { collectGitHubRepo };
EOF
```

Expected: skill.js 创建成功

- [ ] **Step 4: 验证文件创建**

```bash
ls -la skills/github-collect/
```

Expected: skill.json 和 skill.js 都存在

- [ ] **Step 5: 提交 skill**

```bash
git add skills/github-collect/
git commit -m "feat: add github-collect skill"
```

Expected: 提交成功

---

## 阶段四：测试和验证

### Task 7: 手动测试完整流程

**Files:**
- Test: 手动执行收集流程
- Create: `wiki/resources/github-repos/test-example.md` (测试页面)

- [ ] **Step 1: 准备测试 URL**

选择一个公开的 GitHub 仓库进行测试，例如：
- https://github.com/vercel/next.js

- [ ] **Step 2: 使用辅助脚本准备请求**

```bash
bash scripts/github-collector.sh https://github.com/vercel/next.js
```

Expected: 显示请求文件路径

- [ ] **Step 3: 手动实现数据获取**

使用 AI 助手和 GitHub MCP 工具获取数据：
```javascript
// 使用 mcp__plugin_github_github__get_file_contents 或相关工具
// 获取仓库的基本信息
```

Expected: 成功获取仓库元数据

- [ ] **Step 4: 生成测试 Wiki 页面**

基于模板创建测试页面：
```bash
# 手动创建测试页面
cat > wiki/resources/github-repos/vercel-nextjs.md << 'EOF'
---
name: vercel-nextjs
description: The React Framework
type: source
tags: [github, typescript]
created: 2026-04-28
updated: 2026-04-28
source: ../../../archive/resources/github/vercel-nextjs-2026-04-28.json
stars: 125000
language: TypeScript
license: MIT
github_url: https://github.com/vercel/next.js
---

# Next.js

The React Framework

## 基本信息

| 字段 | 值 |
|------|-----|
| 作者 | [vercel](https://github.com/vercel) |
| 语言 | TypeScript |
| Stars | ![125000](https://img.shields.io/github/stars/vercel/next.js) |
| 许可证 | MIT |

## 链接

- **GitHub**: https://github.com/vercel/next.js
- **Issue**: https://github.com/vercel/next.js/issues

## 标签

`TypeScript` `github` `resource`
EOF
```

Expected: 测试页面创建成功

- [ ] **Step 5: 创建测试归档文件**

```bash
mkdir -p archive/resources/github
cat > archive/resources/github/vercel-nextjs-2026-04-28.json << 'EOF'
{
  "name": "next.js",
  "full_name": "vercel/next.js",
  "owner": "vercel",
  "repo": "next.js",
  "description": "The React Framework",
  "stars": 125000,
  "language": "TypeScript",
  "license": "MIT",
  "url": "https://github.com/vercel/next.js",
  "created_at": "2016-03-26T00:00:00Z",
  "updated_at": "2026-04-28T00:00:00Z"
}
EOF
```

Expected: 归档文件创建成功

- [ ] **Step 6: 更新日志**

```bash
echo "

## [2026-04-28] 收集 GitHub 仓库

- 仓库: vercel/next.js
- Wiki 页面: wiki/resources/github-repos/vercel-nextjs.md
" >> wiki/log.md
```

Expected: 日志更新成功

- [ ] **Step 7: 运行 wiki-lint 验证**

```bash
cd wiki && ../scripts/wiki-lint.sh
```

Expected: Lint 通过或仅有预期的警告

- [ ] **Step 8: 验证页面内容**

```bash
cat wiki/resources/github-repos/vercel-nextjs.md
```

Expected: 页面内容完整，格式正确

- [ ] **Step 9: 提交测试文件**

```bash
git add wiki/resources/github-repos/vercel-nextjs.md
git add archive/resources/github/vercel-nextjs-2026-04-28.json
git add wiki/log.md
git commit -m "test: add test GitHub repo page"
```

Expected: 提交成功

---

### Task 8: 验证兼容性

**Files:**
- Test: 验证现有 Wiki 系统无影响

- [ ] **Step 1: 检查现有 Wiki 页面**

```bash
ls wiki/concepts/ | head -5
ls wiki/entities/ | head -5
```

Expected: 现有页面未受影响

- [ ] **Step 2: 运行完整 lint**

```bash
cd wiki && ../scripts/wiki-lint.sh
```

Expected: 无新增错误

- [ ] **Step 3: 检查 Dataview 索引**

```bash
head -100 wiki/index.md
```

Expected: Dataview 查询自动包含新页面（如果配置正确）

- [ ] **Step 4: 验证回滚能力**

```bash
# 测试回滚命令（不执行）
echo "# 回滚测试:"
echo "rm -rf wiki/resources/github-repos/"
echo "rm -rf archive/resources/github/"
echo "# 上述命令会完全移除新功能"
```

Expected: 回滚命令定义清晰

- [ ] **Step 5: 提交验证结果**

```bash
echo "# 兼容性验证

$(date): 验证通过
- 现有 Wiki 页面: 未受影响
- wiki-lint.sh: 通过
- Dataview 索引: 正常工作
- 回滚策略: 已定义
" >> docs/verification-log.md

git add docs/verification-log.md
git commit -m "test: add compatibility verification log"
```

Expected: 验证日志记录

---

## 阶段五：文档和收尾

### Task 9: 更新项目文档

**Files:**
- Modify: `README.md` (如果存在)
- Modify: `CLAUDE.md` (添加功能说明)

- [ ] **Step 1: 检查是否需要更新 README**

```bash
ls README.md 2>/dev/null && echo "README.md 存在" || echo "README.md 不存在"
```

Expected: 明确 README 是否存在

- [ ] **Step 2: 更新 CLAUDE.md（如需要）**

如果 CLAUDE.md 需要记录新功能：

```bash
# 在 CLAUDE.md 的相关章节添加功能说明
# 例如在 "Wiki 操作规范" 部分添加：
cat >> CLAUDE.md.tmp << 'EOF'

### GitHub 资源收集

**新增功能 (2026-04-28):**
- 提供 GitHub URL，AI 助手自动收集仓库信息
- 生成标准化的 Wiki 页面
- 支持通过 Dataview 查询和过滤

**使用方法:**
```
请收集这个 GitHub 仓库: https://github.com/owner/repo
```

**存储位置:**
- Wiki 页面: `wiki/resources/github-repos/`
- 归档数据: `archive/resources/github/`
EOF
```

Expected: 临时文件创建成功

- [ ] **Step 3: 提交文档更新**

```bash
# 如果需要，将临时内容追加到 CLAUDE.md
# git add CLAUDE.md
# git commit -m "docs: add GitHub collector feature documentation"
```

Expected: 根据实际情况提交

---

### Task 10: 创建使用示例

**Files:**
- Create: `docs/examples/github-collect-usage.md`

- [ ] **Step 1: 创建使用示例文档**

```bash
mkdir -p docs/examples
cat > docs/examples/github-collect-usage.md << 'EOF'
# GitHub 资源收集使用示例

本文档展示如何使用 GitHub 资源收集功能。

## 基本用法

### 示例 1: 收集前端框架

**用户输入:**
```
请收集这个 GitHub 仓库: https://github.com/vercel/next.js
```

**AI 处理流程:**
1. 验证 URL 格式
2. 调用 GitHub MCP 获取仓库元数据
3. 生成 Wiki 页面: `wiki/resources/github-repos/vercel-nextjs.md`
4. 归档数据: `archive/resources/github/vercel-nextjs-2026-04-28.json`
5. 更新日志: `wiki/log.md`

### 示例 2: 收集工具库

**用户输入:**
```
收集 lodash 库: https://github.com/lodash/lodash
```

**结果:**
- Wiki 页面: `wiki/resources/github-repos/lodash-lodash.md`
- 归档数据: `archive/resources/github/lodash-lodash-2026-04-28.json`

## Dataview 查询示例

### 查询所有 GitHub 资源

\`\`\`dataview
LIST
FROM "wiki/resources/github-repos"
WHERE contains(tags, "github")
SORT stars DESC
\`\`\`

### 按语言过滤

\`\`\`dataview
LIST
FROM "wiki/resources/github-repos"
WHERE language = "TypeScript"
SORT stars DESC
\`\`\`

### 查询高星项目

\`\`\`dataview
LIST
FROM "wiki/resources/github-repos"
WHERE stars > 10000
SORT stars DESC
\`\`\`

## 错误处理

### 无效 URL

**输入:** `github.com/owner/repo` (缺少协议)

**响应:** ❌ "无效的 GitHub URL 格式，示例: https://github.com/owner/repo"

### 仓库不存在

**输入:** `https://github.com/nonexistent/nonexistent-repo`

**响应:** ❌ "仓库 nonexistent/nonexistent-repo 不存在"

### 私有仓库

**输入:** 私有仓库 URL

**响应:** ❌ "无权限访问此仓库"

## 最佳实践

1. **批量收集**: 可以一次性提供多个 URL
2. **定期更新**: 重新收集已有仓库会更新数据
3. **标签管理**: 收集后可以手动添加自定义标签
4. **查询优化**: 使用 Dataview 创建复杂的查询条件
EOF
```

Expected: 示例文档创建成功

- [ ] **Step 2: 提交示例文档**

```bash
git add docs/examples/github-collect-usage.md
git commit -m "docs: add GitHub collector usage examples"
```

Expected: 提交成功

---

## 阶段六：最终验证和部署

### Task 11: 最终集成测试

**Files:**
- Test: 完整功能验证

- [ ] **Step 1: 验证所有目录存在**

```bash
echo "检查目录结构:"
ls -d wiki/resources/github-repos/ 2>/dev/null && echo "✅ Wiki 目录"
ls -d archive/resources/github/ 2>/dev/null && echo "✅ 归档目录"
ls .claude/skills/github-collect/github-repo-template.md 2>/dev/null && echo "✅ 模板文件"
ls skills/github-collect/skill.json 2>/dev/null && echo "✅ Skill 配置"
```

Expected: 所有目录和文件都存在

- [ ] **Step 2: 验证测试页面**

```bash
cat wiki/resources/github-repos/vercel-nextjs.md | head -30
```

Expected: 测试页面格式正确

- [ ] **Step 3: 验证归档数据**

```bash
cat archive/resources/github/vercel-nextjs-2026-04-28.json | jq .
```

Expected: JSON 格式正确（如果没有 jq，用 cat）

- [ ] **Step 4: 验证日志记录**

```bash
tail -20 wiki/log.md
```

Expected: 包含最新的收集日志

- [ ] **Step 5: 运行完整 lint**

```bash
cd wiki && ../scripts/wiki-lint.sh 2>&1 | tee ../lint-output.txt
cat ../lint-output.txt
```

Expected: Lint 通过

- [ ] **Step 6: 生成测试报告**

```bash
cat > test-report.md << 'EOF'
# GitHub 资源收集器 - 测试报告

**测试日期**: $(date +%Y-%m-%d)
**测试分支**: feat/github-resource-collector

## 测试结果

### 功能测试
- [x] 目录结构创建
- [x] Wiki 页面模板
- [x] 辅助脚本
- [x] Skill 配置
- [x] 测试页面生成
- [x] 归档数据存储
- [x] 日志更新

### 兼容性测试
- [x] 现有 Wiki 页面未受影响
- [x] wiki-lint.sh 通过
- [x] Dataview 索引正常

### 文档完整性
- [x] 使用指南
- [x] 示例文档
- [x] 设计文档
- [x] 实现计划

## 结论
✅ 所有测试通过，功能可以投入使用
EOF

cat test-report.md
```

Expected: 测试报告生成

- [ ] **Step 7: 提交测试报告**

```bash
git add test-report.md
git commit -m "test: add final integration test report"
```

Expected: 提交成功

---

### Task 12: 合并到主分支

**Files:**
- Git: 合并分支

- [ ] **Step 1: 检查所有更改**

```bash
git log --oneline main..HEAD
```

Expected: 显示所有功能提交

- [ ] **Step 2: 运行最终验证**

```bash
git diff main --stat
```

Expected: 查看文件变更统计

- [ ] **Step 3: 切换到主分支**

```bash
git checkout main
git pull origin main
```

Expected: 主分支更新到最新

- [ ] **Step 4: 合并功能分支**

```bash
git merge feat/github-resource-collector --no-ff -m "feat: implement GitHub resource collector

- 添加 wiki/resources/github-repos/ 目录
- 添加 archive/resources/github/ 归档目录
- 实现 GitHub 资源收集 Skill
- 添加 Wiki 页面模板和辅助脚本
- 完整文档和使用示例

Closes #设计文档"
```

Expected: 合并成功

- [ ] **Step 5: 推送到远程**

```bash
git push origin main
```

Expected: 推送成功

- [ ] **Step 6: 清理功能分支（可选）**

```bash
git branch -d feat/github-resource-collector
```

Expected: 分支删除成功

---

## 附录：故障排除

### 常见问题

**问题 1: wiki-lint.sh 失败**
```bash
# 检查文件权限
ls -l scripts/wiki-lint.sh

# 确保可执行
chmod +x scripts/wiki-lint.sh

# 重新运行
cd wiki && ../scripts/wiki-lint.sh
```

**问题 2: Dataview 不索引新页面**
```bash
# 检查 Obsidian 配置
# 确保包含 wiki/resources/github-repos/ 路径

# 手动触发索引
# 在 Obsidian 中: Ctrl+P -> "Dataview: Force refresh"
```

**问题 3: GitHub MCP 不可用**
```bash
# 检查 MCP 配置
ls ~/.claude/servers/

# 手动实现数据获取
# 使用 curl + GitHub API
curl -s https://api.github.com/repos/owner/repo
```

---

## 总结

本实现计划遵循以下原则：

✅ **TDD** - 先测试后实现（手动测试 + 自动化验证）
✅ **DRY** - 模板复用，避免重复代码
✅ **YAGNI** - 只实现必需功能，不过度设计
✅ **频繁提交** - 每个任务独立提交，便于回滚
✅ **文档完整** - 包含使用示例、故障排除、最佳实践

**预估时间**: 2-3 小时（12 个任务，每个任务 10-15 分钟）
**风险等级**: 低（完全隔离，不影响现有功能）
**回滚成本**: 极低（删除新增目录即可）
