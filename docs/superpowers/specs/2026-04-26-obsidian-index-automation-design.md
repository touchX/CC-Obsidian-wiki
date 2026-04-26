# Obsidian Wiki Index 自动化设计文档

**创建日期**: 2026-04-26
**设计版本**: 1.0
**状态**: 待审核

---

## 1. 设计目标

将手动维护的 `wiki/index.md` 改造为 Dataview 自动索引，实现零维护、零遗漏的 Wiki 导航系统。

### 核心问题
- 当前 `index.md` 需要手动维护，每次新增页面都要记得更新
- 容易遗漏新页面，导致索引不完整
- 维护工作重复且低效

### 预期效果
- 新页面自动出现在索引中（零维护）
- 支持按标签、日期排序和过滤
- 保留现有 266 个双链的兼容性
- 消除手动更新索引的工作负担

---

## 2. 架构设计

### 2.1 核心思路
用 Dataview 查询替代手动表格，保留分类结构，基于 frontmatter 元数据动态生成索引。

### 2.2 架构组件

**组件 1：Dataview 查询块**
- 为每个分类（concepts, entities, sources 等）创建独立的查询块
- 使用 `TABLE` 语法生成格式化表格
- 支持排序、过滤和动态更新

**组件 2：Frontmatter 标准**
- 利用现有字段：`name`, `description`, `type`, `tags`, `updated`
- 新增可选字段：`category`（用于更精确分类）
- 保持向后兼容，不破坏现有页面

**组件 3：双链兼容层**
- Dataview 自动处理 `[[page-slug]]` 和 `[[category/page-slug]]`
- 无需额外配置，无缝兼容

**组件 4：备份索引**
- 创建 `index-manual.md` 作为完全手动控制的备份版本
- 用于应急场景或特殊需求

### 2.3 工作流程

```
用户创建新页面
    ↓
添加 YAML frontmatter
    ↓
Dataview 实时查询（自动触发）
    ↓
按分类/标签/日期排序
    ↓
自动更新 index.md 表格
```

---

## 3. 组件详细设计

### 3.1 Dataview 查询设计

**基础查询模板**：
```dataview
TABLE without id
  link(file.link, title) as "页面"
  , description as "描述"
  , tags as "标签"
  , updated as "更新"
FROM "wiki/concepts"
WHERE type = "concept"
SORT updated DESC
```

**分类查询**：
- Concepts: `FROM "wiki/concepts" WHERE type = "concept"`
- Entities: `FROM "wiki/entities" WHERE type = "entity"`
- Sources: `FROM "wiki/sources" WHERE type = "source"`
- Synthesis: `FROM "wiki/synthesis" WHERE type = "synthesis"`
- Guides: `FROM "wiki/guides" WHERE type = "guide"`
- Tips: `FROM "wiki/tips" WHERE type = "tips"`
- Tutorial: `FROM "wiki/tutorial"`

### 3.2 Frontmatter 扩展

**现有字段（必需）**：
```yaml
---
name: page-slug
description: 一句话描述
type: concept | entity | source | synthesis | guide
tags: [tag1, tag2, tag3]
created: YYYY-MM-DD
updated: YYYY-MM-DD
source: ../archive/...
---
```

**新增字段（可选）**：
```yaml
category: concepts | entities | sources | synthesis | guides | tips | tutorial
```

**优势**：
- 更精确的分类（适用于跨目录页面）
- 支持 Datavouch 高级查询
- 完全向后兼容（可选字段）

### 3.3 文件结构

```
wiki/
├── index.md              # 主索引（Datavouch 自动生成）
├── index-manual.md       # 备用手动索引（应急用）
├── index-auto.md         # 测试/开发用自动索引
└── [categories]/         # 现有分类目录
```

---

## 4. 数据流与错误处理

### 4.1 正常流程

1. **用户创建新页面**
   - 在 `wiki/` 任意子目录创建 `.md` 文件
   - 添加 YAML frontmatter（必需字段：`name`, `description`, `type`, `tags`）

2. **Dataview 自动索引**
   - Obsidian 启动时或文件变更时触发
   - Dataview 扫描 frontmatter
   - 自动更新 `index.md` 中的表格

3. **用户查看索引**
   - 打开 `index.md` → 看到实时更新的表格
   - 点击双链跳转到页面

### 4.2 错误场景处理

| 错误类型 | 检测方法 | 处理策略 |
|---------|---------|---------|
| 缺少 frontmatter | Dataview 查询返回空 | wiki-lint.sh 检测，报错提示 |
| `type` 字段值错误 | 页面不出现在对应分类 | 标准化 `type` 枚举值，在 WIKI.md 中定义 |
| 双链目标不存在 | Dataview 显示红色链接 | 运行 wiki-lint.sh 检测并修复 |
| `updated` 日期格式错误 | Dataview 无法排序 | 在 frontmatter 中使用 YYYY-MM-DD 格式 |
| Dataview 插件未启用 | 查询块不显示 | Obsidian 设置中启用插件 |

---

## 5. 测试策略

### 5.1 阶段 1：查询验证

**目标**：验证 Dataview 查询语法正确

1. 创建测试查询脚本 `wiki/dataview-test.md`：
   ```dataview
   LIST
   FROM "wiki"
   WHERE type
   SORT type, file.link
   ```
   预期：列出所有带 `type` 字段的页面

2. 分类查询测试：为每个分类单独测试查询
   - 测试 `concepts/` 查询
   - 测试 `entities/` 查询
   - 测试 `sources/` 查询

### 5.2 阶段 2：对照验证

**目标**：确保自动索引不遗漏任何页面

1. 运行 Dataview 查询，生成自动索引
2. 与现有手动 `index.md` 逐行对比：
   - 页面数量是否一致
   - 页面是否遗漏
   - 分类是否正确
   - 排序是否合理

### 5.3 阶段 3：边界测试

**目标**：验证异常情况的处理

1. 创建测试页面（没有 frontmatter）→ 确认不出现在索引
2. 创建测试页面（`type: "unknown"`）→ 确认不出现在任何分类
3. 创建测试页面（缺少 `updated` 字段）→ 确认能正常显示但排序有问题
4. 创建测试页面（路径在 `wiki/` 根目录）→ 验证是否被正确分类

### 5.4 阶段 4：回归测试

**目标**：确保不影响现有功能

1. 验证 266 个现有双链仍正常工作
2. 验证 Graph View 显示正常
3. 验证 Obsidian 搜索功能不受影响
4. 验证 Backlinks 面板正常
5. 验证 Outgoing Links 面板正常

---

## 6. 实施计划

### 6.1 步骤 1：准备工作

**任务清单**：
- [ ] 确认 Dataview 插件已安装并启用
- [ ] 配置 Dataview 设置：
  - [ ] 启用 Inline Queries
  - [ ] 设置刷新间隔为"自动"
  - [ ] 启用 Dataview 查询日志（调试用）

**验证标准**：在 Obsidian 设置中能看到 Dataview 插件配置选项

### 6.2 步骤 2：创建 Dataview 查询

**任务清单**：
- [ ] 创建 `wiki/index-auto.md` - 新的自动索引页面
- [ ] 为 7 个分类分别编写查询块：
  - [ ] Concepts (概念)
  - [ ] Entities (实体)
  - [ ] Sources (来源)
  - [ ] Synthesis (综合)
  - [ ] Guides (指南)
  - [ ] Tips (技巧)
  - [ ] Tutorial (教程)
- [ ] 添加页面标题和说明文字
- [ ] 测试每个查询块的输出

**验证标准**：每个分类都能正确显示对应页面列表

### 6.3 步骤 3：迁移现有索引

**任务清单**：
- [ ] 将现有 `index.md` 重命名为 `index-manual.md`（备份）
- [ ] 用 Dataview 版本替换 `index.md` 内容
- [ ] 验证双链兼容性：
  - [ ] 测试 `[[concepts/xxx]]` 跳转
  - [ ] 测试 `[[entities/yyy]]` 跳转
  - [ ] 测试 `[[sources/zzz]]` 跳转
- [ ] 检查所有页面是否正确出现在索引中

**验证标准**：点击双链能正常跳转，索引页面完整

### 6.4 步骤 4：验证与调整

**任务清单**：
- [ ] 对比手动版和自动版：
  - [ ] 页面数量一致
  - [ ] 分类一致
  - [ ] 排序合理
- [ ] 调整查询字段（如需要）
- [ ] 优化表格列宽度和显示
- [ ] 添加过滤/排序说明（如需要）

**验证标准**：自动索引效果优于或等于手动索引

### 6.5 步骤 5：文档更新

**任务清单**：
- [ ] 更新 `wiki/WIKI.md`：
  - [ ] 添加 Dataview 使用说明
  - [ ] 更新索引维护章节
  - [ ] 记录 frontmatter 字段定义
- [ ] 更新 `wiki/log.md` 记录迁移
- [ ] 创建 Obsidian 配置文档（如需要）

**验证标准**：文档准确反映新的工作流程

---

## 7. 风险与缓解措施

### 7.1 风险识别

| 风险 | 影响 | 概率 | 缓解措施 |
|------|------|------|----------|
| Dataview 查询语法错误 | 索引无法显示 | 中 | 创建测试页面验证语法 |
| Frontmatter 不规范 | 页面遗漏 | 高 | wiki-lint.sh 检测并提示 |
| 双链兼容性问题 | 现有链接失效 | 低 | 保留手动版备份，渐进迁移 |
| 性能问题（大量页面） | 索引加载慢 | 低 | Dataview 有缓存机制 |
| 用户习惯改变 | 需要学习新工具 | 中 | 提供详细文档和示例 |

### 7.2 回滚计划

如果出现严重问题：
1. 立即恢复 `index-manual.md` 为 `index.md`
2. 禁用 Dataview 自动索引
3. 记录问题到 `wiki/log.md`
4. 分析问题并修正方案

---

## 8. 后续优化方向

### 8.1 短期（1-2 周）
- 为常用标签创建过滤视图
- 添加"最近更新"查询块
- 创建"未分类页面"检测查询

### 8.2 中期（1-2 月）
- 使用 Dataview JS 创建高级查询
- 添加页面统计信息（总页面数、分类分布）
- 创建标签云视图

### 8.3 长期（3-6 月）
- 探索 Obsidian Canvas 可视化架构
- 集成 Excalidraw 创建流程图
- 建立自动化标签建议系统

---

## 9. 成功标准

### 9.1 功能标准
- ✅ 新页面自动出现在索引中
- ✅ 所有 58 个现有页面都能正确显示
- ✅ 266 个双链保持可用
- ✅ 支持按标签、日期排序

### 9.2 性能标准
- ✅ index.md 加载时间 < 2 秒
- ✅ Dataview 查询响应时间 < 1 秒
- ✅ 不影响 Obsidian 整体性能

### 9.3 用户体验标准
- ✅ 界面直观，无需学习成本
- ✅ 移除手动维护负担
- ✅ 提升导航效率

---

## 10. 附录

### 10.1 参考文档
- Obsidian Dataview 官方文档
- Wiki/WIKI.md - 本项目 Wiki 规范
- Wiki/log.md - 操作历史记录

### 10.2 相关工具
- `scripts/wiki-lint.sh` - Wiki 健康检查工具
- Obsidian 插件：Dataview, Graph View, Backlinks

### 10.3 术语表
- **双链**: Obsidian 的 `[[...]]` 链接语法
- **Frontmatter**: YAML 元数据块
- **Dataview**: Obsidian 数据查询插件
- **Wiki**: 本项目的知识库系统

---

**设计版本历史**：
- v1.0 (2026-04-26): 初始设计
