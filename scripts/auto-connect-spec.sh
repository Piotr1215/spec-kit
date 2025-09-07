#!/usr/bin/env bash
set -euo pipefail

# Setup spec directory for branch
# Each command will check for overwrites individually

CLAUDE_DIR=".claude"

# Create base structure if needed
if [[ ! -d "$CLAUDE_DIR" ]]; then
    mkdir -p "$CLAUDE_DIR/specs"
    
    # Add to .gitignore if needed
    if [[ -f .gitignore ]] && ! grep -q "^\.claude/" .gitignore; then
        echo -e "\n# Claude spec-kit artifacts\n.claude/" >> .gitignore
    fi
fi

# Get current branch name
BRANCH=$(git branch --show-current 2>/dev/null || echo "detached")

# Sanitize branch name for directory (replace / with -)
SAFE_BRANCH=$(echo "$BRANCH" | sed 's/[^a-zA-Z0-9._-]/-/g')

# Create spec directory for this branch if it doesn't exist
SPEC_DIR="$CLAUDE_DIR/specs/$SAFE_BRANCH"
if [[ ! -d "$SPEC_DIR" ]]; then
    mkdir -p "$SPEC_DIR"
    echo "✓ Created new spec directory for branch: $BRANCH"
else
    echo "✓ Spec directory exists for branch: $BRANCH"
fi

# Show what we have
echo "→ Spec directory: $SPEC_DIR"
if [[ -f "$SPEC_DIR/spec.md" ]]; then
    echo "  Has specification"
fi
if [[ -f "$SPEC_DIR/plan.md" ]]; then
    echo "  Has plan"
fi
if [[ -f "$SPEC_DIR/tasks.md" ]]; then
    COMPLETED=$(grep -c "\- \[x\]" "$SPEC_DIR/tasks.md" 2>/dev/null || echo "0")
    PENDING=$(grep -c "\- \[ \]" "$SPEC_DIR/tasks.md" 2>/dev/null || echo "0")
    echo "  Has tasks ($COMPLETED done, $PENDING pending)"
fi

# Output the branch name for use in commands
echo ""
echo "Branch for spec: $SAFE_BRANCH"