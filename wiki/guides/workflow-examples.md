---
workflow.examples
name: guides/workflow-examples
description: Collection of multi-agent workflow patterns for common use cases
type: guide
tags: [workflows, examples, patterns, multi-agent, best-practices]
created: 2026-04-26
updated: 2026-04-26
source: ../../archive/agency-agents/examples/README.md
---

# Workflow Examples

Collection of multi-agent workflow patterns demonstrating various use cases and team compositions.

## 📚 Available Workflows

### Discovery & Research
| Workflow | Description | Duration |
|----------|-------------|---------|
| [[nexus-spatial-discovery]] | 8-agent parallel product discovery | 1 hour |

### Content & Creative
| Workflow | Description | Duration |
|----------|-------------|---------|
| [[workflow-book-chapter]] | Transform notes to book chapters | Variable |
| [[workflow-landing-page]] | Rapid landing page creation | 1 day |

### Product Development
| Workflow | Description | Duration |
|----------|-------------|---------|
| [[workflow-startup-mvp]] | Full MVP development cycle | 4 weeks |

### Infrastructure
| Workflow | Description | Duration |
|----------|-------------|---------|
| [[workflow-with-memory]] | Memory-enabled workflows | Any |

## 🎯 Workflow Selection Guide

### Quick Decision Tree

```
What do you need?
│
├─▶ Content Creation
│   ├─▶ Single piece (book chapter) → [[workflow-book-chapter]]
│   └─▶ Marketing page → [[workflow-landing-page]]
│
├─▶ Product Development
│   ├─▶ Full product → [[workflow-startup-mvp]]
│   └─▶ Just discovery → [[nexus-spatial-discovery]]
│
└─▶ Complex/Multi-session
    └─▶ Need context persistence → [[workflow-with-memory]]
```

## 📊 Comparison Matrix

| Workflow | Agents | Complexity | Duration | Best For |
|----------|--------|------------|----------|----------|
| [[nexus-spatial-discovery]] | 8 | High | 1hr | Brainstorming |
| [[workflow-book-chapter]] | 1 | Low | Variable | Writing |
| [[workflow-landing-page]] | 4 | Medium | 1 day | Marketing |
| [[workflow-startup-mvp]] | 6 | High | 4 weeks | Products |
| [[workflow-with-memory]] | Any | Medium | Any | Long projects |

## 🔧 Common Patterns

### Parallel Execution
Multiple agents working simultaneously on different aspects:
```
Agent A → [Task 1]
Agent B → [Task 2]
Agent C → [Task 3]
     ↓
  Synthesis
```

### Sequential Handoff
Agents pass work to next agent in chain:
```
Agent A → Agent B → Agent C → Output
```

### Master-Worker
One agent orchestrates others:
```
     Master
    /  |  \
   A   B   C
```

## 💡 Getting Started

1. **Identify your goal** — What output do you need?
2. **Assess complexity** — How many agents needed?
3. **Check duration** — Single session or multi-week?
4. **Choose workflow** — Match to your needs
5. **Customize** — Adapt patterns to your use case

## 📝 Creating New Workflows

Build your own workflow by combining patterns:

1. Define the goal
2. Identify required expertise
3. Choose execution model (parallel/sequential/hybrid)
4. Plan handoffs between agents
5. Consider memory needs for multi-session work

## 🔗 Related

- [[agent-teams]] — Multi-agent coordination
- [[skills]] — Skill-based agent configuration
- [[subagents]] — Agent definitions

---
