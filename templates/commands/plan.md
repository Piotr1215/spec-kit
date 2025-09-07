---
name: plan
description: "Create implementation plan using repo context and CLAUDE.md"
---

Create an implementation plan incorporating repository context and conventions.

## Setup

```bash
~/dev/spec-kit/scripts/auto-connect-spec.sh
BRANCH=$(git branch --show-current | sed 's/[^a-zA-Z0-9._-]/-/g')

# Check if plan.md already exists
if [[ -f ".claude/specs/$BRANCH/plan.md" ]]; then
    echo "❌ ERROR: plan.md already exists!"
    echo "To remove: rm .claude/specs/$BRANCH/plan.md"
    exit 1
fi

# Read from: .claude/specs/$BRANCH/spec.md
# Write to: .claude/specs/$BRANCH/plan.md
```

## Context-Aware Planning  

Given implementation approach: `{ARGS}`

1. **Load context sources**:
   - Read `.claude/specs/$BRANCH/spec.md`
   - Read `CLAUDE.md` from repository root
   - Check for project-specific conventions
   - Scan for existing patterns in codebase

2. **Write implementation plan to `.claude/specs/$BRANCH/plan.md`**:
   - Repository conventions from CLAUDE.md
   - Technical approach based on existing patterns
   - Validation strategy per repo standards
   - Research/decisions documented

Key: Plan shows it has READ and INCORPORATED repo-specific context, not generic templates.