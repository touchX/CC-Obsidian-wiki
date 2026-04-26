---
paths:
  - "**/*.md"
---

# Markdown Docs

## Documentation Standards

- Keep files focused and concise — one topic per file
- Use relative links between docs (e.g., `../archive/best-practice/claude-memory.md`), not absolute GitHub URLs
- Include back-navigation link at top of best-practice and report docs (see existing files for pattern)
- When adding a new concept or report, update the corresponding table in README.md (CONCEPTS or REPORTS)

## Structure Conventions

- Best practice docs go in `best-practice/`
- Implementation docs go in `implementation/`
- Reports go in `reports/`
- Tips go in `tips/`
- Changelog tracking goes in `changelog/<category>/`

## Asset Management

**CRITICAL**: All documentation assets (images, audio, SVGs) MUST be stored in `archive/assets/` for unified management.

| Asset Type | Storage Location | Reference Path |
|------------|------------------|----------------|
| Badges/SVGs | `archive/assets/tags/` | `../!/tags/official.svg` |
| Images | `archive/assets/images/` | `../!/images/<filename>` |
| Audio | `archive/assets/audio/` | `../!/audio/<filename>` |

- The `!/` prefix is an Obsidian vault path alias that maps to `archive/assets/`
- **DO NOT scatter assets** across `best-practice/`, `implementation/`, or other directories
- When archiving source files, migrate any embedded assets to `archive/assets/`
- Update all relative links when assets are moved

## Formatting

- Use tables for structured comparisons (see README CONCEPTS table as reference)
- Use badge images from `!/tags/` for visual consistency when linking best-practice or implementation docs
- Keep headings hierarchical — don't skip levels (e.g., don't jump from `##` to `####`)
