---
name: jqlang-jq
description: jq — 轻量级灵活的命令行 JSON 处理器，JSON 数据的 sed/awk/grep
type: source
tags: [github, c, json, cli, data-processing, command-line, parser, query-language]
created: 2026-05-05
updated: 2026-05-05
source: ../../../archive/resources/github/jqlang-jq-2026-05-05.json
stars: High (industry standard)
language: C
license: MIT
github_url: https://github.com/jqlang/jq
---

# jq

> [!info] Repository Overview
> **jq** 是一个轻量级且灵活的命令行 JSON 处理器，类似于 sed、awk、grep 等工具处理文本数据，但专门用于 JSON 数据。它用可移植的 C 语言编写，零运行时依赖，可以轻松地对结构化数据进行切片、过滤、映射和转换。

## 📊 仓库统计

| 指标 | 数值 |
|------|------|
| ⭐ Stars | High（行业标准工具） |
| 🍴 Forks | 活跃社区 |
| 💻 语言 | C（可移植 C） |
| 📄 许可证 | MIT |
| 🔗 链接 | [github.com/jqlang/jq](https://github.com/jqlang/jq) |
| 🌐 主页 | [jqlang.org](https://jqlang.org) |
| 🎮 在线体验 | [play.jqlang.org](https://play.jqlang.org) |
| 🐳 Docker | [ghcr.io/jqlang/jq](https://github.com/jqlang/jq/pkgs/container/jq) |
| 📅 类型 | 命令行工具 |
| 📊 状态 | 活跃开发 |

## 🎯 核心特性

### 设计理念

- **轻量级** — 小巧的体积，快速的执行
- **灵活** — 强大的查询和转换能力
- **可移植** — 用标准 C 编写，零运行时依赖
- **类 Unix 工具** — JSON 数据的 sed/awk/grep

### 核心能力

| 功能 | 说明 |
|------|------|
| **切片** | 提取 JSON 数据的特定部分 |
| **过滤** | 根据条件筛选数据 |
| **映射** | 转换和重塑数据结构 |
| **转换** | 在不同格式间转换数据 |

## 🚀 安装方法

### 1. 预编译二进制文件

从 [GitHub Releases](https://github.com/jqlang/jq/releases) 下载最新版本。

**适用场景**：
- 快速部署
- 生产环境
- 不想编译的用户

### 2. Docker 镜像

拉取官方 Docker 镜像快速启动：

```bash
# 示例 1：从 package.json 提取版本号
docker run --rm -i ghcr.io/jqlang/jq:latest < package.json '.version'

# 示例 2：使用挂载卷
docker run --rm -i -v "$PWD:$PWD" -w "$PWD" ghcr.io/jqlang/jq:latest '.version' package.json
```

**适用场景**：
- 容器化环境
- CI/CD 流水线
- 隔离运行环境

### 3. 从源码构建

#### 依赖要求

- libtool
- make
- automake
- autoconf

#### 构建步骤

```bash
# 如果从 git 构建，获取子模块
git submodule update --init

# 如果从 git 构建，生成配置脚本
autoreconf -i

# 配置（使用内置 oniguruma）
./configure --with-oniguruma=builtin

# 清理（如果从源码升级）
make clean

# 编译（8 并行）
make -j8

# 运行测试
make check

# 安装
sudo make install
```

#### 静态链接构建

```bash
make LDFLAGS=-all-static
```

**适用场景**：
- 自定义配置
- 嵌入式系统
- 跨平台部署

#### 交叉编译

详见：
- [GitHub Actions 文件](https://github.com/jqlang/jq/wiki/Cross-compilation)
- [.github/workflows/ci.yml](https://github.com/jqlang/jq/blob/main/.github/workflows/ci.yml)

## 💡 使用示例

### 基础用法

```bash
# 美化 JSON 输出
echo '{"name":"jq","language":"C"}' | jq '.'

# 提取特定字段
echo '{"name":"jq","version":"1.6"}' | jq '.name'

# 数组操作
echo '[1,2,3,4,5]' | jq '.[]'
```

### 高级用法

```bash
# 过滤数据
echo '[{"name":"a","val":1},{"name":"b","val":2}]' | jq '.[] | select(.val > 1)'

# 数据转换
echo '{"a":1,"b":2}' | jq '{new_a: .a, new_b: .b * 2}'

# 流式处理
echo '{"data":[1,2,3]}' | jq '.data | map(. * 2)'
```

## 📚 文档资源

### 官方文档

- **主文档**: [jqlang.org](https://jqlang.org)
- **在线演练场**: [play.jqlang.org](https://play.jqlang.org)
- **GitHub Wiki**: [github.com/jqlang/jq/wiki](https://github.com/jqlang/jq/wiki)

### 文档许可

- **jq 代码**: MIT License
- **jq 文档**: Creative Commons CC BY 3.0
- **decNumber 库**: ICU License

## 🤝 社区与支持

### 获取帮助

| 资源 | 链接 | 用途 |
|------|------|------|
| **Stack Overflow** | [jq 标签](https://stackoverflow.com/questions/tagged/jq) | 问答和问题解决 |
| **Discord** | [加入服务器](https://discord.gg/yg6yjNmgAC) | 实时聊天和社区交流 |
| **GitHub Wiki** | [探索 Wiki](https://github.com/jqlang/jq/wiki) | 高级主题和深入指南 |

### 参与贡献

- 报告 Bug：[GitHub Issues](https://github.com/jqlang/jq/issues)
- 提交 PR：[Pull Requests](https://github.com/jqlang/jq/pulls)
- 讨论功能：[Discussions](https://github.com/jqlang/jq/discussions)

## 🔧 技术细节

### 架构特点

- **语言**: 可移植 C（C99 标准）
- **依赖**: 零运行时依赖
- **解析器**: 自定义 JSON 解析器
- **查询语言**: 类似于 JavaScript 的表达式语法

### 性能特性

- **轻量级**: 小巧的二进制文件
- **快速**: 高效的 C 实现
- **流式**: 支持流式 JSON 处理
- **内存**: 低内存占用

## 🎯 核心优势

| 特性 | jq | 其他工具 |
|------|-----|----------|
| **依赖** | 零运行时依赖 | 可能需要运行时 |
| **体积** | 小巧二进制 | 可能较大 |
| **性能** | 原生 C 速度 | 解释型语言较慢 |
| **可移植性** | 跨平台编译 | 可能受限 |
| **学习曲线** | 类 JS 语法 | 可能更复杂 |

## 📖 典型应用场景

### 1. API 响应处理

```bash
# 从 API 提取数据
curl -s https://api.github.com/repos/jqlang/jq | jq '.stargazers_count'
```

### 2. 配置文件操作

```bash
# 读取并修改配置
cat config.json | jq '.database.host = "localhost"'
```

### 3. 日志分析

```bash
# 过滤和分析 JSON 日志
cat app.log | jq 'select(.level == "ERROR")'
```

### 4. 数据转换

```bash
# JSON 转 CSV
echo '[{"a":1,"b":2},{"a":3,"b":4}]' | jq '.[] | [.a, .b] | @csv'
```

## 🌟 生态系统

### 相关工具

- **jaq** — jq 的 Rust 实现
- **jp** — JSON 处理器的 Python 实现
- **grpc** — 通用数据查询语言

### 集成工具

- **curl** — API 调用 + jq 处理
- **docker** — 容器化部署
- **CI/CD** — 自动化流程中的数据处理

## 🔮 核心价值

jq 的核心价值在于：

1. **行业标准** — 广泛使用的 JSON 处理工具
2. **简单强大** — 直观的语法，强大的功能
3. **零依赖** — 无需额外运行时库
4. **高性能** — 原生 C 实现的速度
5. **可移植** — 跨平台编译和部署
6. **活跃社区** — 持续维护和更新
7. **丰富文档** — 完善的官方文档和社区资源

## 🚀 快速上手建议

### 新手推荐

1. **在线体验** — 访问 [play.jqlang.org](https://play.jqlang.org)
2. **阅读教程** — 官方文档的入门指南
3. **尝试示例** — 从简单的查询开始
4. **实践应用** — 在实际项目中使用
5. **加入社区** — Discord 或 Stack Overflow 寻求帮助

### 进阶用户

1. **深入学习** — 研究高级查询语法
2. **性能优化** — 学习流式处理和内存优化
3. **自定义构建** — 针对特定平台优化
4. **贡献代码** — 参与开源开发
5. **编写插件** — 扩展 jq 功能

## 🌟 总结

jq 是一个**革命性的命令行 JSON 处理工具**，具有以下特点：

1. **行业标准** — 广泛使用的事实标准工具
2. **轻量灵活** — 小巧体积，强大功能
3. **零依赖** — 无需运行时库
4. **高性能** — 原生 C 实现
5. **易用性** — 类 JavaScript 语法
6. **跨平台** — 可移植 C 编写
7. **活跃社区** — 持续维护和更新
8. **丰富生态** — Docker、文档、在线演练场

**特别适合**：
- 处理 JSON 格式的 API 响应
- 操作 JSON 配置文件
- 分析 JSON 日志
- 数据转换和处理
- 命令行工作流集成

这是一个**改变游戏规则的工具**，让 JSON 数据处理变得简单、高效、优雅！🚀

---

*最后更新: 2026-05-05*
*数据来源: GitHub README + 官方文档*
*JSON 数据的 sed/awk/grep*
