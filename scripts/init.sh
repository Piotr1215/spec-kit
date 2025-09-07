#!/usr/bin/env bash
set -euo pipefail

# Initialize .claude directory for spec-kit workflow with numbered specs

CLAUDE_DIR=".claude"

# Create base structure if needed
if [[ ! -d "$CLAUDE_DIR" ]]; then
    mkdir -p "$CLAUDE_DIR"
    
    # Add to .gitignore
    if [[ -f .gitignore ]] && ! grep -q "^\.claude/" .gitignore; then
        echo -e "\n# Claude spec-kit artifacts\n.claude/" >> .gitignore
    fi
fi

# Find next spec number
NEXT_NUM=1
if [[ -d "$CLAUDE_DIR/specs" ]]; then
    # Find highest numbered directory
    LAST_SPEC=$(find "$CLAUDE_DIR/specs" -maxdepth 1 -type d -name "[0-9][0-9][0-9]-*" 2>/dev/null | sort -n | tail -1)
    if [[ -n "$LAST_SPEC" ]]; then
        # Extract number and increment
        LAST_NUM=$(basename "$LAST_SPEC" | cut -d'-' -f1)
        NEXT_NUM=$((10#$LAST_NUM + 1))
    fi
fi

# Format with leading zeros
SPEC_NUM=$(printf "%03d" $NEXT_NUM)

# Get current branch name for directory
BRANCH=$(git branch --show-current | sed 's/[^a-zA-Z0-9-]/_/g')
if [[ -z "$BRANCH" ]]; then
    BRANCH="detached"
fi

# Create numbered spec directory
SPEC_DIR="$CLAUDE_DIR/specs/${SPEC_NUM}-${BRANCH}"
mkdir -p "$SPEC_DIR"

# Create symlinks for current spec/plan/tasks
ln -sfn "specs/${SPEC_NUM}-${BRANCH}/spec.md" "$CLAUDE_DIR/current-spec.md"
ln -sfn "specs/${SPEC_NUM}-${BRANCH}/plan.md" "$CLAUDE_DIR/current-plan.md"
ln -sfn "specs/${SPEC_NUM}-${BRANCH}/tasks.md" "$CLAUDE_DIR/current-tasks.md"

echo "✓ Created spec directory: $SPEC_DIR"
echo "✓ Symlinked current-* files for easy access"
echo ""
echo "Structure:"
echo "  .claude/"
echo "  ├── specs/"
echo "  │   ├── 001-feature-branch/"
echo "  │   ├── 002-another-branch/"
echo "  │   └── ${SPEC_NUM}-${BRANCH}/ (current)"
echo "  ├── current-spec.md → specs/${SPEC_NUM}-${BRANCH}/spec.md"
echo "  ├── current-plan.md → specs/${SPEC_NUM}-${BRANCH}/plan.md"
echo "  └── current-tasks.md → specs/${SPEC_NUM}-${BRANCH}/tasks.md"
echo ""
echo "Ready for:"
echo "  /specify - Create specification"
echo "  /plan    - Create implementation plan"  
echo "  /tasks   - Generate executable tasks"