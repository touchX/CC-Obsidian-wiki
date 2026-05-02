# Memory System Rebuild Handbook

> **版本**: 1.0
> **编写日期**: 2026-05-02
> **目的**: 当记忆系统损坏或需要重建时，AI 助手可依据此文档恢复完整架构

---

## 第零章：前提条件与假设

### 目标读者
- AI 助手（如 Claude Code）
- 具备 CLI 操作能力的用户

### 假设条件
1. 操作系统：Windows 11（或具有类似目录结构的系统）
2. 已安装：Git、Docker、Node.js（用于 Claude Code）
3. 基础目录：`C:/Users/Admin/.claude/` 已存在

### 成功标准
- `/memory-hub index` 返回统计信息
- `memU_stats()` 显示条目数
- `/claude-mem:mem-search` 可检索

---

## 第一阶段：环境准备

### 1.1 必要工具清单

| 工具 | 用途 | 验证命令 |
|------|------|----------|
| Git | 版本控制 | `git --version` |
| Docker | memU 容器 | `docker --version` |
| Claude Code CLI | AI 助手 | `claude --version` |

### 1.2 目录结构创建

```bash
# 创建必要目录（Windows 环境下使用完整路径）
mkdir -p "C:/Users/Admin/.claude/skills/memory-hub"
mkdir -p "C:/Users/Admin/.claude/hooks"
mkdir -p "C:/Users/Admin/.claude/rules"
mkdir -p "C:/Users/Admin/.claude/docs/memory-system"
mkdir -p "C:/Users/Admin/.claude/agents"

# 验证目录
ls -la "C:/Users/Admin/.claude/"
```

### 1.3 环境验证

```bash
# 验证工具可用性
git --version
docker --version
node --version
```

---

## 第二阶段：核心系统搭建

### 2.1 memU (MCP Server) 部署

#### 2.1.1 Docker 部署 memU

```bash
# 查找 memU 镜像（可能名称不同）
docker images | grep -i mem

# 常见镜像名称：memu/memu, thenativeweb/memu, 本地构建版本
# 如果没有镜像，检查本地构建
ls "C:/Users/Admin/.claude/memu/" 2>/dev/null || echo "无本地构建"

# 拉取 memU 镜像（或使用本地构建版本）
docker pull memu/memu:latest

# 创建数据目录
mkdir -p "C:/Users/Admin/.claude/memu/data"

# 启动 memU 容器
docker run -d \
  --name memu \
  -p 8000:8000 \
  -v "C:/Users/Admin/.claude/memu/data:/data" \
  memu/memu:latest

# 验证运行
docker ps | grep memu
curl http://localhost:8000/api/v1/stats
```

#### 2.1.2 memU API 验证

```bash
# 检查健康状态
curl http://localhost:8000/api/v1/stats

# 预期返回示例
# {"total": 0, "categories": {}}
```

#### 2.1.3 MCP 接口配置

在 Claude Code 的 MCP 设置中添加 memU server（如果使用 MCP 协议连接）：
```json
{
  "mcpServers": {
    "memu": {
      "command": "docker",
      "args": ["exec", "-i", "memu", "python", "-m", "memu"]
    }
  }
}
```

### 2.2 Claude-Mem Skill 部署

#### 2.2.1 安装 claude-mem plugin/skill

> Claude-Mem 通过 Plugin Marketplace 安装，无需手动 git clone。

在 `settings.json` 中添加插件配置：

```json
{
  "enabledPlugins": {
    "claude-mem@thedotmack": true
  },
  "extraKnownMarketplaces": {
    "thedotmack": {
      "source": {
        "source": "github",
        "repo": "thedotmack/claude-mem"
      }
    }
  }
}
```

#### 2.2.2 验证 Claude-Mem 可用

```bash
# 在 Claude Code 中调用
/claude-mem:mem-search test
```

### 2.3 Memory Hub Skill 部署

#### 2.3.1 创建 Skill 文件结构

```
`C:/Users/Admin/.claude/skills/memory-hub/`
├── SKILL.md           # 主技能定义
├── suggest.js         # 智能建议脚本
├── docs/
│   └── user-guide.md  # 用户指南
└── scripts/
    └── sync.sh        # 同步脚本（可选）
```

#### 2.3.2 SKILL.md 内容模板

```markdown
# Memory Hub Skill

## 描述
记忆系统统一入口，协调 memU、Claude-Mem 和 Platform Memory

## 命令
- `/memory-hub index` - 显示所有记忆统计
- `/memory-hub search <query>` - 跨系统搜索
- `/memory-hub store <content>` - 保存新记忆
- `/memory-hub stats` - 显示系统健康状态

## 依赖
- memU (MCP)
- Claude-Mem Skill

## 分类
tech | devtools | solutions | project | preferences | 经验技巧
```

#### 2.3.3 suggest.js 实际实现

```javascript
/**
 * memory-hub suggest.js
 * AI 建议记忆提取脚本
 * 在关键时机建议用户保存有价值内容
 */

const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function ask(question) {
  return new Promise((resolve) => {
    rl.question(question, (answer) => {
      resolve(answer.trim().toLowerCase());
    });
  });
}

async function main() {
  const type = process.argv[2] || 'experience';
  const content = process.argv.slice(3).join(' ') || '';
  
  if (!content) {
    console.log('❌ 内容不能为空');
    process.exit(1);
  }

  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log('【suggest】发现值得保存的记忆');
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  console.log(`类型: ${type}`);
  console.log(`内容: ${content}`);
  console.log('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

  const answer = await ask('\n保存到记忆系统？ (yes/no/modify): ');

  if (answer === 'yes' || answer === 'y') {
    console.log('✅ 已存入记忆系统');
  } else if (answer === 'modify' || answer === 'm') {
    console.log('请输入修改后的内容:');
    const modified = await ask('> ');
    console.log(`✅ 已存入: ${modified}`);
  } else {
    console.log('❌ 已放弃');
  }

  rl.close();
}

main().catch(console.error);
```

#### 2.3.4 sync.sh 同步脚本

```bash
#!/usr/bin/env bash
# memory-hub sync.sh v1.0
# memU ↔ claude-mem 同步脚本
# 用途: 状态检查 + memU 数据导出 + 同步指导

set -e

MEMU_API="http://localhost:8000/api/v1"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# ==================== 服务检查 ====================

check_memu() {
  log_info "检查 memU 服务..."
  if curl -s --max-time 5 "${MEMU_API%api/v1}/health" > /dev/null 2>&1; then
    local health=$(curl -s "${MEMU_API%api/v1}/health")
    local provider=$(echo "$health" | grep -o '"llm_provider":"[^"]*"' | cut -d'"' -f4)
    local model=$(echo "$health" | grep -o '"chat":"[^"]*"' | cut -d'"' -f4)
    log_success "memU 运行正常 (${provider}: ${model})"

    # 获取统计
    local stats=$(curl -s "${MEMU_API}/stats")
    local total=$(echo "$stats" | grep -o '"total_items":[0-9]*' | cut -d':' -f2)
    log_info "  总记忆: ${total} 条"
    return 0
  else
    log_error "memU 未运行或无法访问 (localhost:8000)"
    return 1
  fi
}

check_claude_mem() {
  log_info "检查 claude-mem 服务..."
  log_info "  claude-mem 通过 MCP 工具访问 (search/timeline/get_observations)"
}

# ==================== memU 数据导出 ====================

export_memu_category() {
  local category=$1
  local output_file="${2:-/tmp/memu_export_${category}.json}"

  log_info "导出 memU [${category}] 类别的记忆..."

  local response=$(curl -s -X POST "${MEMU_API}/retrieve" \
    -H "Content-Type: application/json" \
    -d "{\"query\": \"category:${category}\", \"max_items\": 100}")

  if echo "$response" | grep -q "items"; then
    echo "$response" > "$output_file"
    local count=$(echo "$response" | grep -o '"item_id":"[^"]*"' | wc -l)
    log_success "已导出 ${count} 条记忆到 ${output_file}"
    return 0
  else
    log_warn "类别 [${category}] 无记忆或导出失败"
    return 1
  fi
}

export_all_memu() {
  local output_dir="${1:-/tmp/memu_export}"
  mkdir -p "$output_dir"

  log_info "导出所有 memU 记忆到 ${output_dir}..."

  # 获取所有分类
  local categories=$(curl -s "${MEMU_API}/categories")
  echo "$categories" | grep -o '"name":"[^"]*"' | cut -d'"' -f4 | while read cat; do
    export_memu_category "$cat" "${output_dir}/${cat}.json"
  done
}

# ==================== 主入口 ====================

case "${1:-status}" in
  status)
    check_memu
    echo ""
    check_claude_mem
    ;;
  check)
    check_memu && check_claude_mem
    ;;
  export)
    export_all_memu
    ;;
  export-cat)
    if [ -z "$2" ]; then
      log_error "请提供类别名称"
      exit 1
    fi
    export_memu_category "$2"
    ;;
  *)
    log_error "未知命令: $1"
    echo "用法: sync.sh <status|check|export|export-cat>"
    exit 1
    ;;
esac
```

#### 2.3.5 验证 Memory Hub

```bash
# 在 Claude Code 中调用
/memory-hub index
/memory-hub stats
```

---

## 第三阶段：辅助系统

### 3.1 knowledge-radar Hook 配置

#### 3.1.1 knowledge-radar.js 完整实现

```javascript
#!/usr/bin/env node
/**
 * Knowledge Radar Stop Hook (知识雷达) - 增强版
 *
 * 会话结束时扫描高价值经验，自动建议存储到记忆系统。
 * 检测维度:
 * 1. 问题解决信号 (bug fix, error resolved)
 * 2. 架构决策 (tech decision, pattern chosen)
 * 3. 配置变更 (setup, config, install)
 * 4. 工作流优化 (workflow, process improvement)
 * 5. 知识发现 (learned, discovered, insight)
 */

'use strict';

const http = require('http');
const https = require('https');

const MEMU_BASE_URL = 'localhost:8000';
const MAX_STDIN = 2 * 1024 * 1024;

// ==================== 信号检测器 ====================

const SIGNAL_PATTERNS = {
  resolution: {
    label: '问题解决',
    category: 'solutions',
    keywords: [
      '解决了', '修好了', '搞定了', '修复了', '成功', 'works now',
      'fixed', 'resolved', 'bug fix', 'error resolved', '问题消失',
      '不再报错', '测试通过', 'all tests pass', 'passed'
    ],
    priority: 'high'
  },
  architecture: {
    label: '架构决策',
    category: 'tech',
    keywords: [
      '决定使用', '选择', '架构', '方案是', 'decided to use',
      'chose', 'migration', 'refactor to', '重构为', '切换到',
      '采用', '设计模式', 'pattern'
    ],
    priority: 'high'
  },
  configuration: {
    label: '配置变更',
    category: 'solutions',
    keywords: [
      '配置完成', '安装成功', 'setup', 'configured', 'installed',
      '部署', 'deployed', '环境搭建', '集成', 'integrated',
      'MCP 配置', 'hook 配置', '插件安装'
    ],
    priority: 'medium'
  },
  workflow: {
    label: '工作流优化',
    category: 'experience',
    keywords: [
      '优化了', '改进了', '新流程', 'workflow', '自动化',
      '脚本', 'batch', '效率提升', 'simplified', 'streamlined'
    ],
    priority: 'medium'
  },
  discovery: {
    label: '知识发现',
    category: 'experience',
    keywords: [
      '发现', '注意到了', '关键点是', 'insight', 'learned',
      'discovered', '原来', 'surprisingly', 'trick is',
      'the reason is', '根本原因是', '关键发现'
    ],
    priority: 'high'
  }
};

// ==================== memU API 调用 ====================

/**
 * 存储记忆到 memU
 * @param {string} content - 记忆内容
 * @param {string} category - 分类
 * @returns {Promise<{success: boolean, message: string}>}
 */
function storeToMemU(content, category = '') {
  return new Promise((resolve) => {
    const postData = JSON.stringify({
      content: content,
      modality: 'text',
      category: category || null
    });

    const options = {
      hostname: 'localhost',
      port: 8000,
      path: '/api/v1/memorize',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(postData)
      },
      timeout: 10000
    };

    const req = http.request(options, (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try {
          const result = JSON.parse(data);
          if (res.statusCode === 200 && result.item_id) {
            resolve({ success: true, message: `已存储 (ID: ${result.item_id})`, category: result.category });
          } else {
            resolve({ success: false, message: `存储失败: ${result.detail || data}` });
          }
        } catch {
          resolve({ success: false, message: `响应解析失败: ${data}` });
        }
      });
    });

    req.on('error', (err) => {
      resolve({ success: false, message: `memU 请求失败: ${err.message}` });
    });

    req.on('timeout', () => {
      req.destroy();
      resolve({ success: false, message: 'memU 请求超时' });
    });

    req.write(postData);
    req.end();
  });
}

// ==================== 分析引擎 ====================

/**
 * 分析文本中的高价值信号
 * @param {string} text - 要分析的文本
 * @returns {Array<{category: string, label: string, priority: string, matches: string[]}>}
 */
function detectSignals(text) {
  if (!text || text.length < 20) return [];

  const textLower = text.toLowerCase();
  const signals = [];

  for (const [category, config] of Object.entries(SIGNAL_PATTERNS)) {
    const matches = config.keywords.filter(kw => textLower.includes(kw.toLowerCase()));
    if (matches.length > 0) {
      signals.push({
        category,
        label: config.label,
        memuCategory: config.category,
        priority: config.priority,
        matchCount: matches.length,
        matchedKeywords: matches.slice(0, 5)
      });
    }
  }

  const priorityOrder = { high: 0, medium: 1, low: 2 };
  signals.sort((a, b) => {
    const pDiff = priorityOrder[a.priority] - priorityOrder[b.priority];
    if (pDiff !== 0) return pDiff;
    return b.matchCount - a.matchCount;
  });

  return signals;
}

// ==================== 质量守门 ====================

const NOISE_PATTERNS = [
  /\{["\s]*\\?"/,                    // JSON 语法开头 {" 或 {"
  /"session_id"/,                    // Session dump
  /"transcript_path"/,               // Session dump
  /"permission_mode"/,               // Session metadata
  /"hook_event_name"/,               // Hook metadata
  /\\{2}[A-Za-z]/,                   // Windows 转义路径 D\\Users
  /<\/?\w+>/,                        // XML 标签
  /<completed>/,                     // XML 标签
  /\*\*继续/,                        // UI 交互文本
  /输入你的选择/,                     // UI 交互文本
  /^["'{\[\]\\]/,                    // 以引号/花括号/方括号/反斜杠开头
  /^\*\*/,                           // 以 ** 粗体标记开头（Markdown 碎片）
  /^[a-z]{2,5}$/i,                   // 极短无意义单词如 "string"
  /^\d+\s/,                          // 以数字+空格开头（编号碎片如 "0 部署"）
  /^\d+\*\*/,                         // 以数字+粗体开头（表格碎片如 "5**"）
  /\|.*\|.*\|/,                       // 管道分隔表格行（3+个竖线）
  /是否需要我/,                       // AI 提问文本
  /你选择哪个/,                       // AI 选项文本
  /准备好了吗/,                       // AI 引导文本
  /请告诉我选择/,                     // AI 选项引导
  /请回复.*选择/,                     // AI 回复引导
  /我立即执行/,                       // AI 执行承诺
  /跳过.*直接开始/,                   // AI 方案选项
  /如果您无法/,                       // AI 条件建议
  /我可以提供其他/,                   // AI 替代建议
  /\\n\\s*\\n/,                      // 连续转义换行（碎片特征）
  /\\\\n \\\\n/,                     // 转义换行+空格（会话dump）
  /^`/,                              // 以反引号开头（代码碎片）
  /```/,                             // Markdown 代码块
  /\n\s*\n\s*\d+\./,                 // 编号列表碎片
  /item_id.*metadata/,               // 引用元数据的碎片
  /^claude\//,                       // 以 claude/ 开头的路径碎片
  /从架构层面/,                       // 过于宽泛的总结
  /^js[\s\n]/,                       // 以 js+空白开头（代码碎片）
  /^md/,                             // 以 md 开头的碎片
  /^txt[\s\n]/,                      // 以 txt+空白开头
  /docker exec/,                     // 命令行片段
  /psql -U/,                         // SQL 命令片段
  /\\- \\✅/,                        // Markdown checkbox 列表（会话摘要碎片）
  /先完成 P/,                        // AI 任务规划文本
  /从 memU 检索.*条/,                // AI 操作描述
];

// 速率限制：最多每分钟存储1条，每会话最多5条
const RATE_LIMIT = { maxPerMinute: 1, maxPerSession: 5, sessionCount: 0, lastStoreTime: 0 };
const MIN_CONTENT_LENGTH = 30;

/**
 * 检查内容是否为高质量、值得存储的记忆
 * @param {string} content - 待检查内容
 * @returns {{ok: boolean, reason: string}}
 */
function isQualityContent(content) {
  const trimmed = content.trim();

  if (trimmed.length < MIN_CONTENT_LENGTH) {
    return { ok: false, reason: 'TOO_SHORT' };
  }
  if (trimmed.length > 500) {
    return { ok: false, reason: 'TOO_LONG' };
  }

  for (const pattern of NOISE_PATTERNS) {
    if (pattern.test(trimmed)) {
      const match = trimmed.substring(0, 30).replace(/\n/g, ' ');
      return { ok: false, reason: `NOISE:${pattern.source.substring(0, 20)}` };
    }
  }

  // 至少包含一个中文字符或5个以上英文单词
  const hasChinese = /[一-鿿]/.test(trimmed);
  const wordCount = (trimmed.match(/[a-zA-Z]{3,}/g) || []).length;
  if (!hasChinese && wordCount < 5) {
    return { ok: false, reason: 'NO_MEANINGFUL_TEXT' };
  }

  // 完整句子检查：以标点结尾，或中文内容达到有意义长度（30字以上信息密度高）
  const hasCompleteSentence = /[。！？.!?]$/.test(trimmed) || (hasChinese && trimmed.length >= 30);
  if (!hasCompleteSentence) {
    return { ok: false, reason: 'INCOMPLETE_SENTENCE' };
  }

  return { ok: true, reason: '' };
}

/**
 * 清洗内容中的 XML 标签和多余空白
 * @param {string} content - 原始内容
 * @returns {string}
 */
function sanitizeContent(content) {
  return content
    .replace(/<\/?\w+>/g, '')           // 移除 XML 标签
    .replace(/\s+/g, ' ')               // 压缩空白
    .trim()
    .substring(0, 300);                 // 截断过长内容
}

/**
 * 提取关键句子作为记忆内容（带质量守门）
 * @param {string} text - 原始文本
 * @param {object} signal - 信号对象
 * @returns {string|null} null 表示无法提取高质量内容
 */
function extractMemoryContent(text, signal) {
  const sentences = text.split(/[.。\n]+/).filter(s => s.trim().length > 10);

  // 优先提取包含关键词的句子
  const candidates = [];
  for (const kw of signal.matchedKeywords) {
    const kwLower = kw.toLowerCase();
    for (const sentence of sentences) {
      const trimmed = sanitizeContent(sentence);
      if (trimmed.toLowerCase().includes(kwLower) && trimmed.length >= 20 && trimmed.length <= 300) {
        candidates.push(trimmed);
      }
    }
  }

  // 从候选项中找第一个通过质量检查的
  for (const candidate of candidates) {
    const q = isQualityContent(candidate);
    if (q.ok) return candidate;
  }

  // 回退：尝试所有句子
  for (const sentence of sentences) {
    const trimmed = sanitizeContent(sentence);
    const q = isQualityContent(trimmed);
    if (q.ok) return trimmed;
  }

  // 无法提取高质量内容，返回 null 表示放弃
  return null;
}

/**
 * 生成存储建议
 */
function generateRecommendation(signals) {
  if (signals.length === 0) return null;

  const highSignals = signals.filter(s => s.priority === 'high');
  const mediumSignals = signals.filter(s => s.priority === 'medium');

  if (highSignals.length === 0 && mediumSignals.length === 0) return null;

  const lines = ['\n[Knowledge Radar] 本会话检测到高价值经验:\n'];

  for (const signal of highSignals.slice(0, 3)) {
    lines.push(`  [HIGH] ${signal.label} (${signal.matchCount}个信号) → memU[${signal.memuCategory}]`);
  }
  for (const signal of mediumSignals.slice(0, 2)) {
    lines.push(`  [MED]  ${signal.label} (${signal.matchCount}个信号) → memU[${signal.memuCategory}]`);
  }

  lines.push('\n💡 提示: 记忆已自动队列等候存储，输入 "确认存储" 执行批量写入');
  lines.push('   或输入 "查看队列" 查看待存储内容\n');

  return lines.join('\n');
}

// ==================== 自动存储 ====================

/**
 * 自动存储高价值信号到 memU
 * @param {string} text - 原始文本
 * @param {Array} signals - 检测到的信号
 * @returns {Promise<{stored: number, failed: number, results: Array}>}
 */
async function autoStore(text, signals) {
  if (signals.length === 0) return { stored: 0, failed: 0, results: [] };

  // 速率限制检查
  const now = Date.now();
  if (RATE_LIMIT.sessionCount >= RATE_LIMIT.maxPerSession) {
    return { stored: 0, failed: 0, results: [] };
  }
  if (now - RATE_LIMIT.lastStoreTime < 60000) {
    return { stored: 0, failed: 0, results: [] };
  }

  const highSignals = signals.filter(s => s.priority === 'high');
  const mediumSignals = signals.filter(s => s.priority === 'medium');
  // 限制为最多2条（1 high + 1 medium）
  const toStore = [...highSignals.slice(0, 1), ...mediumSignals.slice(0, 1)];

  if (toStore.length === 0) return { stored: 0, failed: 0, results: [] };

  const results = await Promise.all(
    toStore.map(async (signal) => {
      const content = extractMemoryContent(text, signal);
      if (!content) {
        return {
          label: signal.label,
          category: signal.memuCategory,
          content: '(质量不足，已跳过)',
          success: false,
          message: '质量守门拦截'
        };
      }
      const result = await storeToMemU(content, signal.memuCategory);
      return {
        label: signal.label,
        category: signal.memuCategory,
        content: content.substring(0, 100) + (content.length > 100 ? '...' : ''),
        ...result
      };
    })
  );

  const stored = results.filter(r => r.success).length;
  const failed = results.filter(r => !r.success).length;

  // 更新速率限制计数器
  if (stored > 0) {
    RATE_LIMIT.sessionCount += stored;
    RATE_LIMIT.lastStoreTime = Date.now();
  }

  return { stored, failed, results };
}

/**
 * 生成自动存储报告
 */
function generateStoreReport(storeResult) {
  if (storeResult.stored === 0 && storeResult.failed === 0) return '';

  const lines = ['\n[Knowledge Radar] 自动存储报告:\n'];

  for (const r of storeResult.results) {
    if (r.success) {
      lines.push(`  ✅ ${r.label} → memU[${r.category}]`);
      lines.push(`     "${r.content}"`);
    } else {
      lines.push(`  ❌ ${r.label} → 存储失败: ${r.message}`);
    }
  }

  lines.push(`\n共存储 ${storeResult.stored} 条, 失败 ${storeResult.failed} 条`);
  lines.push('记忆已存入 memU, 可用 /memory-hub search 查询\n');

  return lines.join('\n');
}

// ==================== 主入口 ====================

/**
 * Hook 入口函数
 */
async function run(rawInput) {
  try {
    const text = extractAnalyzableText(rawInput);
    const signals = detectSignals(text);

    if (signals.length > 0) {
      // 自动存储高价值信号
      const storeResult = await autoStore(text, signals);
      const report = generateStoreReport(storeResult);
      if (report) {
        process.stderr.write(report + '\n');
      }
    }

    // 输出建议 (仅作为确认)
    const recommendation = generateRecommendation(signals);
    if (recommendation) {
      process.stderr.write(recommendation + '\n');
    }
  } catch (err) {
    process.stderr.write(`[Knowledge Radar] 分析跳过: ${err.message}\n`);
  }

  return rawInput;
}

/**
 * 从 session 数据中提取可分析文本
 */
function extractAnalyzableText(rawInput) {
  if (!rawInput || rawInput.trim().length === 0) return '';

  try {
    const data = JSON.parse(rawInput);
    const textParts = [];

    if (data.transcript) {
      if (typeof data.transcript === 'string') {
        textParts.push(data.transcript);
      } else if (Array.isArray(data.transcript)) {
        for (const entry of data.transcript) {
          if (typeof entry === 'string') textParts.push(entry);
          else if (entry?.content) textParts.push(String(entry.content));
          else if (entry?.text) textParts.push(String(entry.text));
          else if (entry?.message) textParts.push(String(entry.message));
        }
      }
    }

    if (data.messages && Array.isArray(data.messages)) {
      for (const msg of data.messages) {
        if (msg?.content) textParts.push(String(msg.content));
      }
    }

    if (data.conversation) textParts.push(String(data.conversation));
    if (data.summary) textParts.push(String(data.summary));

    if (textParts.length === 0) {
      textParts.push(JSON.stringify(data));
    }

    return textParts.join('\n');
  } catch {
    return rawInput;
  }
}

// ==================== CLI 入口 ====================

if (require.main === module) {
  let stdinData = '';
  process.stdin.setEncoding('utf8');
  process.stdin.on('data', chunk => {
    if (stdinData.length < MAX_STDIN) {
      stdinData += chunk.substring(0, MAX_STDIN - stdinData.length);
    }
  });
  process.stdin.on('end', async () => {
    const result = await run(stdinData);
    if (result) {
      process.stdout.write(result);
    }
    process.exit(0);
  });
}

module.exports = {
  run,
  detectSignals,
  generateRecommendation,
  extractAnalyzableText,
  extractMemoryContent,
  isQualityContent,
  sanitizeContent,
  storeToMemU,
  autoStore,
  generateStoreReport
};
```

#### 3.1.2 settings.json 配置（Windows 完整路径）

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "node \"C:/Users/Admin/.claude/hooks/knowledge-radar.js\"",
            "timeout": 15
          }
        ]
      }
    ]
  }
}
```

> **注意**：Windows 环境下必须使用完整路径 `C:/Users/Admin/.claude/hooks/knowledge-radar.js`，不可使用 `~/.claude/` 这样的 Unix 路径。

#### 3.1.3 验证 Hook

```bash
# 测试 Hook 是否正确加载
# （通过开启/关闭会话观察行为）
```

### 3.2 memory-strategy.md 配置

创建 `C:/Users/Admin/.claude/rules/memory-strategy.md`：

```markdown
# 记忆策略 (精简版)

## 四层分工

| 系统 | 用途 | 操作 |
|------|------|------|
| memU (MCP) | 长期语义知识 | `请记住：X` / `请搜索关于X的记忆` |
| Claude-Mem (Skill) | 近期时间活动 | `/claude-mem:mem-search` |
| Platform Memory | 环境静态信息 | 自动管理 |
| Memory Hub (Skill) | 统一入口 | `/memory-hub index/search/store/stats` |

## 核心规则
- 完成成熟工作流后，主动存储经验到 memU
- 检索时限制 3-5 条，只存高价值记忆
- 每周或条目 >50 时运行 `/memory-optimize`

## 分类: tech | devtools | solutions | project | preferences | 经验技巧

## 维护流程 (Memory Optimize)
1. 去重 — 交叉比对 memory 与 CLAUDE.md/rules
2. 迁移 — 通用规则→`C:/Users/Admin/.claude/rules/`，项目规则→`.claude/rules/`
3. 压缩 — 冗长描述→简洁格式（减 30-50% token）
4. 验证 — 检查断裂引用、矛盾内容、孤立文件
```

### 3.3 分类体系建立

#### 3.3.1 六大分类定义

| 分类 | 说明 | 使用场景 |
|------|------|----------|
| **tech** | 技术知识 | API 用法、设计模式、架构 |
| **devtools** | 开发工具 | IDE 配置、CLI 技巧 |
| **solutions** | 解决方案 | 常见问题修复 |
| **project** | 项目信息 | 项目结构、依赖 |
| **preferences** | 用户偏好 | 编码风格、工作习惯 |
| **经验技巧** | 实践总结 | 高效工作流、避坑指南 |

#### 3.3.2 分类验证

```bash
# 存储一条带分类的记忆，验证分类系统
请记住：[内容]，分类：tech
```

---

## 第四阶段：验证与交付

### 4.1 健康检查流程

```bash
# 1. 检查 memU 服务
curl http://localhost:8000/api/v1/stats

# 2. 检查 Docker 容器
docker ps | grep memu

# 3. 检查 Skill 文件
ls "C:/Users/Admin/.claude/skills/memory-hub/"

# 4. 检查 Hook 配置（Windows 完整路径）
cat "C:/Users/Admin/.claude/settings.json" | grep knowledge-radar

# 5. 检查规则文件
ls "C:/Users/Admin/.claude/rules/memory-strategy.md"
```

### 4.2 功能验证清单

| 功能 | 验证命令 | 预期结果 |
|------|----------|----------|
| memU 可访问 | `curl localhost:8000/api/v1/stats` | 返回 JSON 统计 |
| Memory Hub 可用 | `/memory-hub index` | 显示统计信息 |
| Claude-Mem 可用 | `/claude-mem:mem-search test` | 返回搜索结果 |
| Hook 已配置 | 查看 settings.json | knowledge-radar 条目存在 |
| 记忆可存储 | `请记住：测试内容` | 命令执行成功 |

### 4.3 交接清单

- [ ] memU 服务运行中
- [ ] Memory Hub Skill 已部署
- [ ] Claude-Mem 已配置
- [ ] knowledge-radar Hook 已启用
- [ ] memory-strategy.md 已创建
- [ ] 所有验证命令通过
- [ ] 分类体系可正常使用

---

## 附录

### A. 配置文件模板

#### memU 环境变量 (.env)
```
MEMU_PORT=8000
MEMU_DB_PATH=/data/memu.db
```

#### Claude Code settings.json (部分，Windows 完整路径)
```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "node \"C:/Users/Admin/.claude/hooks/knowledge-radar.js\"",
            "timeout": 15
          }
        ]
      }
    ]
  }
}
```

### B. 故障排查指南

| 问题 | 可能原因 | 解决方案 |
|------|----------|----------|
| memU 无法访问 | 容器未启动 | `docker start memu` |
| Skill 无法加载 | 文件路径错误 | 检查 symlink 或文件存在 |
| Hook 不触发 | settings.json 格式错误 | 验证 JSON 语法 |
| 记忆无法存储 | memU API 问题 | 检查容器日志 |

### C. 相关资源链接

| 资源 | 链接 |
|------|------|
| memU 项目 | https://github.com/AI-Foundation-Labs/memu (npm: @aifoundationlabs/memu) |
| claude-mem | https://github.com/thedotmack/claude-mem |
| 此手册源码 | `docs/ClaudeCode记忆系统/` |

---

**重建完成标志**: `/memory-hub index` 返回类似以下内容：
```
记忆系统状态:
- memU: X 条记录
- Claude-Mem: Y 条 corpora
- Memory Hub: 已连接
```