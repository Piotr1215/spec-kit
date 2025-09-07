#!/usr/bin/env bash
set -euo pipefail

# Minimal install - just copy command templates
# Always overwrites to get latest version

echo "Installing Spec-Kit Commands..."

# Create commands directory if needed
mkdir -p ~/.claude/commands

# Copy command templates (always overwrite for updates)
cp -f templates/commands/*.md ~/.claude/commands/

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