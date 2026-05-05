---
workflow.with.memory
name: guides/workflow-with-memory
description: Multi-agent workflow enhanced with MCP memory server for persistent context
type: guide
tags: [memory, mcp, multi-agent, context, persistence, state]
created: 2026-04-26
updated: 2026-04-26
source: ../../archive/agency-agents/examples/workflow-with-memory.md
---

# Workflow with Memory

Multi-agent workflow pattern using MCP memory server for persistent context across sessions and agent handoffs.

## 🎯 Problem Solved

Traditional multi-agent workflows suffer from:
- **Context loss**: Information lost between agent transitions
- **Memory fragmentation**: Each agent starts with blank slate
- **Redundant work**: Repeated information gathering
- **Inconsistent state**: Conflicting understanding of project

## 💡 Solution: MCP Memory Server

The MCP memory server provides:
- **Persistent storage**: Context survives session boundaries
- **Semantic search**: Find relevant information by meaning
- **Atomic operations**: Consistent multi-agent access
- **Version tracking**: Rollback capability

## 🤖 Memory-Enabled Agents

| Agent | Memory Usage |
|-------|-------------|
| **All agents** | Read project context at start |
| **Planning agents** | Store decisions and rationale |
| **Handoff agents** | Write summaries for next agent |
| **Review agents** | Recall original requirements |

## 📋 Memory Workflow Pattern

### Standard Multi-Agent Flow

```
Agent A                          Agent B
  │                                 │
  ├─▶ remember("project_context")   │
  │                                 │
  │      [do work]                  │
  │                                 │
  │                                 ├─▶ recall("project_context")
  │                                 │   [get context + A's work]
  │                                 │
  │                                 │      [do work]
  │                                 │
  ├─▶ remember("agent_b_output")    │
  │                                 │
```

### With Rollback Protection

```
┌─────────────────────────────────────────┐
│  begin_transaction()                     │
│                                         │
│  remember("decision", "choose Postgres") │
│  remember("rationale", "better scaling")│
│                                         │
│  [implementation]                       │
│                                         │
│  ❌ If issues found:                    │
│     rollback()                          │
│     → Returns to pre-transaction state │
│     → Decision memory preserved         │
│                                         │
│  ✅ If success:                         │
│     commit_transaction()                │
└─────────────────────────────────────────┘
```

## 🔧 Implementation

### Memory Operations

```javascript
// Store important context
await memory.remember({
  key: "user_requirements",
  value: "...",
  ttl: 3600 // seconds
});

// Retrieve when needed
const context = await memory.recall("user_requirements");

// Semantic search
const results = await memory.search("authentication requirements");

// Rollback if needed
await memory.rollback(transactionId);
```

### Agent Handoff Pattern

```
Agent A (Sprint Planning)
├── remember("sprint_goal", "user auth MVP")
├── remember("tech_choice", "JWT tokens")
├── remember("handoff_summary", "backlog organized...")
│
Agent B (Implementation)
├── recall("sprint_goal")  // Gets full context
├── recall("tech_choice")
├── recall("handoff_summary")
```

## 📊 Memory Schema

### Project Context
```json
{
  "type": "project",
  "name": "string",
  "requirements": "string",
  "decisions": [{"choice": "", "rationale": ""}],
  "current_state": "string"
}
```

### Agent Memory
```json
{
  "type": "agent_session",
  "agent_id": "string",
  "session_id": "string",
  "inputs": [],
  "outputs": [],
  "decisions": []
}
```

## 💎 Benefits Demonstrated

| Benefit | Example |
|---------|---------|
| **Continuity** | Agent B knows exactly what Agent A decided |
| **Audit trail** | Every decision stored with rationale |
| **Error recovery** | Rollback to known good state |
| **Semantic search** | Find context by meaning, not keywords |

## 📁 Related Workflows

- [[workflow-startup-mvp]] — Full development workflow
- [[workflow-book-chapter]] — Writing with memory
- [[nexus-spatial-discovery]] — Discovery with shared memory

---
