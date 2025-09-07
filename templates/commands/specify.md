---
name: specify
description: "Create a focused specification from context"
---

Create a specification based on available context and your description.

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

3. **Generate specification in `.claude/specs/current-spec.md`**:
   - Clear requirements
   - Success criteria
   - Constraints
   - Questions to resolve

Note: Branch should already be created with your preferred tool (e.g., `bfi`)