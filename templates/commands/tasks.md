---
name: tasks  
description: "Generate executable tasks from plan with repo context"
---

Generate executable tasks based on specification, plan, and repository context.

## Setup

```bash
~/dev/spec-kit/scripts/auto-connect-spec.sh
BRANCH=$(git branch --show-current | sed 's/[^a-zA-Z0-9._-]/-/g')

# Check if tasks.md already exists
if [[ -f ".claude/specs/$BRANCH/tasks.md" ]]; then
    echo "❌ ERROR: tasks.md already exists!"
    echo "To remove: rm .claude/specs/$BRANCH/tasks.md"
    exit 1
fi

# Read from: .claude/specs/$BRANCH/spec.md and plan.md
# Write to: .claude/specs/$BRANCH/tasks.md
```

## Context-Aware Task Generation

1. **Load all context**:
   - `.claude/specs/$BRANCH/spec.md`
   - `.claude/specs/$BRANCH/plan.md`
   - CLAUDE.md conventions
   - Repository patterns

2. **Write tasks to `.claude/specs/$BRANCH/tasks.md`**:
   - Tasks reference specific files/patterns in THIS repo
   - Test commands from CLAUDE.md
   - Validation per repo standards
   - [P] marks for parallel execution
   
3. **Task structure**:
   - Setup/Research tasks
   - Implementation tasks (following repo patterns)
   - Testing tasks (per CLAUDE.md)
   - Documentation tasks

Key: Tasks are contextual to THIS repo, not generic.