---
name: browserbase-skills
description: Browserbase Skills - Claude Agent SDK with web browsing tool
type: source
tags: [github, javascript, claude-sdk, web-browsing, browser-automation]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/browserbase-skills-2026-05-05.json
stars: 2212
language: JavaScript
github_url: https://github.com/browserbase/skills
---

# Browserbase Skills

> [!info] Repository Overview
> **Browserbase Skills** 是一个为 Claude Agent SDK 提供网页浏览能力的插件，集成了 Browserbase 的无头浏览器技术，让 Claude AI 助手能够自动化浏览网页、提取内容、执行测试等操作。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | 2,212 |
| 🍴 Forks | 140 |
| 💻 语言 | JavaScript |
| 🏢 所有者 | Browserbase (Organization) |
| 📄 许可证 | None |
| 🔗 链接 | [github.com/browserbase/skills](https://github.com/browserbase/skills) |
| 📅 创建时间 | 2025-10-12 |
| 📅 更新时间 | 2026-05-05 |

## 🎯 核心功能

Browserbase Skills 提供了一套完整的浏览器自动化工具集，包括 10 个核心技能：

### 1. **browser** - 浏览器自动化核心
- **功能**: 提供完整的浏览器控制能力
- **特性**:
  - 页面导航（前进、后退、刷新）
  - 元素交互（点击、输入、悬停）
  - 截图和快照
  - 标签页管理
  - JavaScript 执行
- **适用场景**: 网页自动化、数据采集、UI 测试

### 2. **browserbase-cli** - CLI 工具集成
- **功能**: Browserbase 命令行工具
- **特性**:
  - 会话管理
  - 配置设置
  - 调试工具
- **适用场景**: 开发调试、快速测试

### 3. **functions** - 功能扩展
- **功能**: 自定义函数和扩展
- **特性**:
  - 可编程扩展点
  - 自定义工作流
- **适用场景**: 高级定制、复杂自动化

### 4. **site-debugger** - 网站调试
- **功能**: 网站问题诊断
- **特性**:
  - 控制台日志捕获
  - 网络请求监控
  - 错误追踪
- **适用场景**: 网站故障排查、性能分析

### 5. **browser-trace** - 浏览器追踪
- **功能**: 浏览器行为追踪
- **特性**:
  - 用户行为记录
  - 操作回放
  - 性能分析
- **适用场景**: 用户研究、行为分析

### 6. **bb-usage** - 使用统计
- **功能**: Browserbase 使用情况统计
- **特性**:
  - 会话统计
  - 资源使用监控
  - 成本分析
- **适用场景**: 资源管理、成本优化

### 7. **cookie-sync** - Cookie 同步
- **功能**: Cookie 管理和同步
- **特性**:
  - Cookie 导入/导出
  - 跨会话同步
  - 隐私保护
- **适用场景**: 登录状态保持、会话管理

### 8. **fetch** - 内容获取
- **功能**: 高级网页内容提取
- **特性**:
  - 智能 DOM 解析
  - 内容净化
  - 多格式支持
- **适用场景**: 内容抓取、数据提取

### 9. **search** - 网页搜索
- **功能**: 网页内搜索功能
- **特性**:
  - 全文搜索
  - 元素定位
  - 模式匹配
- **适用场景**: 信息查找、元素定位

### 10. **ui-test** - UI 测试
- **功能**: 用户界面自动化测试
- **特性**:
  - 视觉回归测试
  - 交互测试
  - 可访问性检查
- **适用场景**: QA 测试、质量保障

## 🚀 安装方式

### 方式 1: Claude Code Marketplace（推荐）

```bash
# 在 Claude Code 中安装
claude plugin install @browserbase/skills
```

### 方式 2: 手动安装

```bash
# 克隆仓库
git clone https://github.com/browserbase/skills.git

# 安装依赖
cd skills
npm install

# 构建插件
npm run build

# 复制到 Claude Code 插件目录
cp -r dist ~/.claude/plugins/browserbase-skills
```

### 方式 3: 从源码运行

```bash
# 克隆仓库
git clone https://github.com/browserbase/skills.git

# 进入项目目录
cd skills

# 安装依赖
npm install

# 运行开发服务器
npm run dev
```

## 📖 使用示例

### 基础网页浏览

```javascript
// 导入 browser skill
import { browser } from '@browserbase/skills';

// 导航到网页
await browser.navigate('https://example.com');

// 截取快照
const snapshot = await browser.snapshot();
console.log(snapshot);

// 点击元素
await browser.click('#submit-button');

// 获取页面标题
const title = await browser.evaluate(() => document.title);
```

### 内容提取

```javascript
// 使用 fetch skill 提取内容
import { fetch } from '@browserbase/skills';

// 提取并净化网页内容
const content = await fetch.extract('https://example.com/article');
console.log(content.cleanedText);
```

### UI 测试

```javascript
// 使用 ui-test skill 进行自动化测试
import { uiTest } from '@browserbase/skills';

// 运行测试套件
await uiTest.runSuite([
  {
    name: 'Login Form Test',
    steps: [
      { action: 'navigate', url: '/login' },
      { action: 'fill', selector: '#username', value: 'test@example.com' },
      { action: 'fill', selector: '#password', value: 'password123' },
      { action: 'click', selector: '#login-button' },
      { action: 'waitFor', selector: '.dashboard' }
    ]
  }
]);
```

### Cookie 管理

```javascript
// 使用 cookie-sync skill 管理 Cookie
import { cookieSync } from '@browserbase/skills';

// 导出当前会话的 Cookies
const cookies = await cookieSync.export('https://example.com');

// 在新会话中导入
await cookieSync.import(cookies);
```

## 🔧 配置选项

### Browserbase API 配置

```javascript
// 在 Claude Code settings.json 中配置
{
  "browserbase": {
    "apiKey": "your-api-key",
    "projectId": "your-project-id",
    "timeout": 30000,
    "headless": true
  }
}
```

### 环境变量配置

```bash
# 设置 Browserbase API 密钥
export BROWSERBASE_API_KEY="your-api-key"
export BROWSERBASE_PROJECT_ID="your-project-id"
```

## 🛠️ 故障排除

### 问题 1: 无法连接到 Browserbase 服务

**症状**: API 调用超时或连接失败

**解决方案**:
```bash
# 检查 API 密钥配置
echo $BROWSERBASE_API_KEY

# 验证网络连接
ping api.browserbase.com

# 检查代理设置
npm config get proxy
npm config get https-proxy
```

### 问题 2: 浏览器启动失败

**症状**: 无法创建浏览器实例

**解决方案**:
```javascript
// 增加超时时间
{
  "browserbase": {
    "timeout": 60000,
    "launchTimeout": 30000
  }
}
```

### 问题 3: 元素定位失败

**症状**: 找不到页面元素

**解决方案**:
```javascript
// 使用更精确的选择器
await browser.click('[data-testid="submit-button"]');

// 等待元素出现
await browser.waitFor('#submit-button', { visible: true });

// 使用 XPath
await browser.click({ type: 'xpath', selector: '//button[@type="submit"]' });
```

## 📚 相关资源

> [!links]+ 相关链接
> - [GitHub 仓库](https://github.com/browserbase/skills)
> - [Browserbase 官网](https://browserbase.com)
> - [Claude Agent SDK 文档](https://code.claude.com/docs/en/agents)
> - [Browserbase API 文档](https://docs.browserbase.com)

## 🏗️ 项目结构

```
skills/
├── claude-plugin/       # Claude Code 插件配置
├── skills/             # 核心 skills 实现
│   ├── browser/        # 浏览器自动化
│   ├── fetch/          # 内容提取
│   ├── search/         # 搜索功能
│   └── ui-test/        # UI 测试
├── agent/              # Agent 配置
├── package.json        # NPM 配置
└── README.md           # 项目文档
```

## 💡 使用场景

### 1. 自动化数据采集
- 定期抓取网站数据
- 监控价格变化
- 收集新闻资讯

### 2. UI 自动化测试
- 回归测试
- 视觉测试
- 跨浏览器测试

### 3. 网站监控
- 可用性监控
- 性能监控
- 内容变化检测

### 4. 自动化工作流
- 表单填写
- 报表生成
- 批量操作

## 🎓 最佳实践

### 1. 错误处理
```javascript
try {
  await browser.navigate('https://example.com');
} catch (error) {
  console.error('Navigation failed:', error);
  // 重试逻辑
  await retry(() => browser.navigate('https://example.com'), 3);
}
```

### 2. 资源清理
```javascript
// 使用完毕后关闭浏览器
await browser.close();
```

### 3. 性能优化
```javascript
// 禁用图片加载加速页面渲染
await browser.navigate('https://example.com', {
  loadImages: false
});
```

## 📈 版本历史

- **v0.1.0** (2025-10-12) - 初始版本发布
- **v0.2.0** - 添加 UI 测试功能
- **v0.3.0** - 性能优化和 Bug 修复
- **Current** (2026-05-05) - 最新更新

## 🤝 贡献指南

欢迎贡献！请查看 [CONTRIBUTING.md](https://github.com/browserbase/skills/blob/main/CONTRIBUTING.md) 了解详情。

## 📄 许可证

本项目当前未指定许可证。请联系项目所有者获取使用权限。

---

*最后更新: 2026-05-05*
*数据来源: GitHub API*
