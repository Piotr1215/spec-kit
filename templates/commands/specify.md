---
name: specify
description: "Create a focused specification from context"
---

Create a specification based on available context and your description.

## Setup

1. Run to ensure spec directory exists:
```bash
~/dev/spec-kit/scripts/auto-connect-spec.sh
```

2. Check if spec.md already exists:
```bash
BRANCH=$(git branch --show-current | sed 's/[^a-zA-Z0-9._-]/-/g')
if [[ -f ".claude/specs/$BRANCH/spec.md" ]]; then
    echo "❌ ERROR: spec.md already exists!"
    echo "To remove: rm .claude/specs/$BRANCH/spec.md"
    exit 1
fi
# Safe to write to: .claude/specs/$BRANCH/spec.md
```

## Context-Aware Specification

Given your description: `{ARGS}`

1. **Read existing context**:
   - Check for Linear issue output (if available)
   - Look for any provided context or requirements
   - Identify constraints from conversation

2. **Structure the specification**:
   - Focus on WHAT needs to be done
   - Reference specific details from context
   - Keep it concise and actionable

3. **Write specification to `.claude/specs/{branch}/spec.md`**:
   - Clear requirements
   - Success criteria
   - Constraints
   - Questions to resolve

Note: One spec per branch - switching branches switches specs automatically