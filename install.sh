#!/usr/bin/env bash
set -euo pipefail

# Install streamlined spec-kit commands

echo "Installing Streamlined Spec-Kit..."

# Copy commands to Claude directory (overwrites for latest version)
mkdir -p ~/.claude/commands
cp -f templates/commands/*.md ~/.claude/commands/

# Copy init script
mkdir -p ~/.claude/spec-kit
cp scripts/init.sh ~/.claude/spec-kit/
chmod +x ~/.claude/spec-kit/init.sh

echo ""
echo "✅ Installed!"
echo ""
echo "Commands available after Claude refresh:"
echo "  /specify - Create specification from context"
echo "  /plan    - Plan with repo conventions"
echo "  /tasks   - Generate executable tasks"
echo ""
echo "To init a project: ~/.claude/spec-kit/init.sh"