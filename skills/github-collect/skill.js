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
  const templatePath = 'scripts/templates/github-repo-template.md';
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
