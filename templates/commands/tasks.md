---
name: tasks  
description: "Generate executable tasks from plan with repo context"
---

Generate executable tasks based on specification, plan, and repository context.

## Context-Aware Task Generation

1. **Load all context**:
   - `.claude/specs/current-spec.md` (from /specify)
   - `.claude/plans/current-plan.md` (from /plan)
   - CLAUDE.md conventions
   - Repository patterns

2. **Generate tasks in `.claude/tasks/current-tasks.md`**:
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