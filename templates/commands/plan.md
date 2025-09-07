---
name: plan
description: "Create implementation plan using repo context and CLAUDE.md"
---

Create an implementation plan incorporating repository context and conventions.

## Context-Aware Planning  

Given implementation approach: `{ARGS}`

1. **Load context sources**:
   - Read `.claude/specs/current-spec.md` from /specify
   - Read `CLAUDE.md` from repository root
   - Check for project-specific conventions
   - Scan for existing patterns in codebase

2. **Generate implementation plan in `.claude/plans/current-plan.md`**:
   - Repository conventions from CLAUDE.md
   - Technical approach based on existing patterns
   - Validation strategy per repo standards
   - Research/decisions documented

Key: Plan shows it has READ and INCORPORATED repo-specific context, not generic templates.