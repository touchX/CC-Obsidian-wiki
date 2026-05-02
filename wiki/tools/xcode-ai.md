---
name: tools/xcode-ai
description: Xcode Apple Intelligence 编程助手系统提示词和工具集
type: source
tags: [xcode, apple-intelligence, swiftui, swift-testing, agent, tools, system-prompt]
created: 2026-04-29
updated: 2026-04-29
source: ../../../../archive/system-prompts/Xcode/
---

# Xcode Apple Intelligence 助手

## 概述

Xcode 是 Apple 官方的 AI 编程助手，集成于 Xcode IDE 中，基于 Apple Intelligence 技术。它在 **只读代码库访问模式** 下工作，提供智能代码补全、文档生成、代码解释和 SwiftUI Preview 生成等功能。

## 核心定位

| 维度 | 说明 |
|------|------|
| **基础模型** | Apple Intelligence (本地 + 云端) |
| **模式** | 只读代码库访问 |
| **主要语言** | Swift / SwiftUI |
| **平台** | Apple Platforms (iOS/macOS/watchOS/tvOS/visionOS) |

## 模板系统

### 占位符

Xcode 使用模板驱动的提示系统：

| 占位符 | 说明 |
|--------|------|
| `{{filename}}` | 当前文件路径 |
| `{{filecontent}}` | 当前文件完整内容 |
| `{{selected_code}}` | 用户选中的代码 |

### 上下文规则

- 助手响应时会收到文件内容作为上下文
- 优先使用 **Swift** 而非其他语言
- 优先使用 **Apple 平台 API** 而非跨平台方案
- 对于不熟悉的 API，返回 `##SEARCH: <type>` 指令

## 5 种动作类型

### 1. Document（文档生成）

**触发**：用户请求为代码生成文档注释

**规则**：
- 仅返回单个代码块（包含文档注释）
- 不生成额外的解释文本
- 文档注释格式：`///` 三斜线

```swift
/// Summary of what this function does
/// - Parameter name: Description of the name parameter
/// - Returns: Description of the return value
/// - Throws: Description of possible errors
func processData(name: String) throws -> Data {
    // Implementation
}
```

### 2. Explain（代码解释）

**触发**：用户请求解释选中代码的功能

**规则**：
- 使用 `##SEARCH: <type>` 语法查找类型信息
- 提供清晰的功能描述和参数说明
- 可生成 **SwiftUI #Preview** 宏

**#Preview 生成规则**：

```swift
struct MyView: View {
    var body: some View {
        Text("Hello")
    }
}

#Preview {
    NavigationStack {
        MyView()
    }
}
```

**包装条件**（以下任一条件满足时需包装）：

| 条件 | 包装 |
|------|------|
| 视图有导航相关内容 | `NavigationStack { }` |
| 包含 `.navigationDestination` | `NavigationStack { }` |
| 包含 `.navigationBarItems` | `NavigationStack { }` |
| 包含 `.sheet` modifier | `NavigationStack { }` |
| 视图使用 `@State`/`@Binding` | 视情况 |
| 视图需要 `@PreviewProvider` | 视情况 |
| List 内嵌在 List 中 | 移除内层 List |
| List 在 sheet/alert/navigation 中 | 嵌入 NavigationStack |
| 视图有 `.navigationTitle` | `NavigationStack { }` |
| `NavigationStack` 内嵌 `NavigationStack` | 移除内层 |

### 3. Message（问答）

**触发**：用户提问关于代码或概念的问题

**规则**：
- 仅用纯文本回答
- 收到 **所有上下文** 后才生成代码
- 不在回答中包含代码片段

### 4. Playground（示例生成）

**触发**：用户请求生成示例代码

**规则**：
- 仅返回 **单个代码块**
- 不包含文档注释
- 不包含 `print` 语句
- 不包含 import 语句（除非必要）

### 5. Preview（Preview 生成）

**触发**：用户请求生成 SwiftUI #Preview 宏

**规则**：
- 遵循 10+ 条包装条件
- 处理 `@Binding` 的 5 种 entry 类型
- 处理 List 视图的嵌套问题

## Swift Testing 框架

Xcode 展示了 Swift Testing 框架的用法：

```swift
import Testing

struct MathTests {
    @Test
    func testAddition() {
        #expect(2 + 2 == 4)
    }

    @Test
    func testDivisionByZero() {
        #require(0 != 0)
        let result = 10 / 0
    }
}
```

**关键注解**：

| 注解 | 用途 |
|------|------|
| `@Suite` | 组织测试套件 |
| `@Test` | 标记测试函数 |
| `#expect` | 断言表达式 |
| `#require` | 强制断言（失败时跳过后续） |

## 与其他工具对比

| 维度 | Xcode AI | Claude Code | Windsurf | Trae AI |
|------|----------|-------------|----------|---------|
| 平台 | Apple | 通用 | 通用 | 通用 |
| 模式 | 只读 | 可写 | 可写 | 可写 |
| 动作类型 | 5 种 | 多模式 | AI Flow | AI Flow |
| Preview 生成 | ✅ 内置 | 无 | 无 | 无 |
| Swift Testing | ✅ 内置 | 支持 | 支持 | 支持 |

## 相关资源

- [[augment-code-gpt5]] — Augment Code GPT-5 版本
- [[augment-code-sonnet4]] — Augment Code Sonnet 4 版本
- [[windsurf-ai]] — Windsurf Cascade
- [[trae-ai]] — Trae AI
- [[traycer-ai]] — Traycer.AI
- [[agent-command-skill-comparison]] — 扩展机制对比
