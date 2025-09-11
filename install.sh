#!/usr/bin/env bash
set -euo pipefail

# Minimal install - just copy command templates
# Always overwrites to get latest version

echo "Installing Spec-Kit Commands..."

# Create directories if needed
mkdir -p ~/.claude/commands
mkdir -p ~/.claude/spec-kit

# Copy command templates (always overwrite for updates)
cp -f templates/commands/*.md ~/.claude/commands/

# Copy auto-connect-spec.sh to spec-kit directory
cp -f scripts/auto-connect-spec.sh ~/.claude/spec-kit/

# Create init.sh script (branch-based, no numbering)
cat > ~/.claude/spec-kit/init.sh << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

# Initialize .claude directory for spec-kit workflow (branch-based, no numbering)

CLAUDE_DIR=".claude"

# Create base structure if needed
if [[ ! -d "$CLAUDE_DIR" ]]; then
    mkdir -p "$CLAUDE_DIR/specs"
    
    # Add to .gitignore
    if [[ -f .gitignore ]] && ! grep -q "^\.claude/" .gitignore; then
        echo -e "\n# Claude spec-kit artifacts\n.claude/" >> .gitignore
    fi
fi

# Get current branch name for directory
BRANCH=$(git branch --show-current 2>/dev/null || echo "detached")

# Sanitize branch name for directory (replace / and other special chars with -)
SAFE_BRANCH=$(echo "$BRANCH" | sed 's/[^a-zA-Z0-9._-]/-/g')

# Create spec directory for this branch
SPEC_DIR="$CLAUDE_DIR/specs/${SAFE_BRANCH}"
mkdir -p "$SPEC_DIR"

# Create symlinks for current spec/plan/tasks
ln -sfn "specs/${SAFE_BRANCH}/spec.md" "$CLAUDE_DIR/current-spec.md"
ln -sfn "specs/${SAFE_BRANCH}/plan.md" "$CLAUDE_DIR/current-plan.md"
ln -sfn "specs/${SAFE_BRANCH}/tasks.md" "$CLAUDE_DIR/current-tasks.md"

echo "✓ Created spec directory: $SPEC_DIR"
echo "✓ Symlinked current-* files for easy access"
echo ""
echo "Structure:"
echo "  .claude/"
echo "  ├── specs/"
echo "  │   ├── main/"
echo "  │   ├── feature-xyz/"
echo "  │   └── ${SAFE_BRANCH}/ (current)"
echo "  ├── current-spec.md → specs/${SAFE_BRANCH}/spec.md"
echo "  ├── current-plan.md → specs/${SAFE_BRANCH}/plan.md"
echo "  └── current-tasks.md → specs/${SAFE_BRANCH}/tasks.md"
echo ""
echo "Ready for:"
echo "  /specify - Create specification"
echo "  /plan    - Create implementation plan"  
echo "  /tasks   - Generate executable tasks"
EOF

# Make init.sh executable
chmod +x ~/.claude/spec-kit/init.sh

echo "✅ Installed!"
echo ""
echo "Commands available:"
echo "  /specify - Create specification from context"
echo "  /plan    - Create implementation plan"
echo "  /tasks   - Generate executable tasks"
echo ""
echo "Manual tools in spec-kit/scripts/:"
echo "  __list_specs.sh        - List all branch specs"
echo "  auto-connect-spec.sh   - Used by commands (automatic)"