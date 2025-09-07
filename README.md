# 🌱 Streamlined Spec-Kit

**Structured thinking for real-world development tasks** - without the enterprise ceremony.

## What Is This?

A simplified fork of [GitHub's spec-kit](https://github.com/github/spec-kit) that:
- Keeps the good parts (structured thinking, context awareness)
- Removes the overhead (heavy phases, branch management, complex templates)
- Focuses on 1-week-or-less projects typical in DevOps/development

## Quick Start

```bash
# Install commands (one time)
cd /home/decoder/dev/spec-kit
./install.sh

# In your project, initialize spec tracking
~/.claude/spec-kit/init.sh

# Use the workflow
/specify   # Structure requirements from context
/plan      # Plan with repo conventions (CLAUDE.md)
/tasks     # Generate executable tasks
```

## How It Works

### 1. Context-Aware, Not Generic

The commands read and incorporate:
- Linear issue context (if available)
- `CLAUDE.md` conventions in your repo
- Existing code patterns
- Not generic templates, but specific to YOUR project

### 2. Simple Three-Step Flow

```bash
# After creating branch with your tool (e.g., bfi)
/specify what you want to build
/plan how to approach it  
/tasks to get executable steps
```

### 3. Numbered Spec Tracking

Each spec gets a numbered directory:
```
.claude/
├── specs/
│   ├── 001-feature-branch/
│   │   ├── spec.md
│   │   ├── plan.md
│   │   └── tasks.md
│   ├── 002-bugfix-branch/
│   └── 003-docs-update/
└── current-*.md (symlinks to active spec)
```

## Key Differences from Original

| Original | Streamlined |
|----------|-------------|
| 3 phases with heavy ceremony | Direct, focused prompts |
| Creates and manages branches | You manage branches |
| 1000+ line templates | ~20 line commands |
| Generic templates | Context-aware (reads CLAUDE.md) |
| Months-long projects | Week-or-less tasks |

## The Philosophy

The templates are **sophisticated prompts** that make AI think better by:
- Forcing complete problem understanding
- Incorporating all available context  
- Breaking down into executable steps
- Documenting decisions

It's not about generating boilerplate - it's about **structured thinking with context**.

## Directory Structure

```
spec-kit/
├── templates/commands/   # The three streamlined commands
│   ├── specify.md       # Structure requirements
│   ├── plan.md          # Plan with context
│   └── tasks.md         # Generate tasks
├── scripts/
│   └── init.sh          # Initialize .claude/ in projects
└── install.sh           # Install commands to ~/.claude/
```

## Installation

1. Clone this repo
2. Run `./install.sh` to copy commands to `~/.claude/commands/`
3. In each project, run `~/.claude/spec-kit/init.sh` to create `.claude/` directory
4. The `.claude/` directory is automatically added to `.gitignore`

## Usage Example

```bash
# 1. Create branch (your existing workflow)
bfi  # or git checkout -b feature/xyz

# 2. Get context (if using Linear)
/ops-linear

# 3. Structure the requirements
/specify add troubleshooting section to vcluster docs

# 4. Plan the approach
/plan follow existing doc patterns, add interactive examples

# 5. Get tasks
/tasks

# Now you have executable tasks in .claude/current-tasks.md
```

## Why This Fork?

The original spec-kit is excellent for large software projects but overkill for typical development work:
- "Fix this CI pipeline"
- "Update these docs"  
- "Write a deployment script"
- "Add monitoring to this service"

This fork keeps the valuable structured thinking while removing unnecessary overhead.

## Contributing

Feel free to simplify further! The goal is maximum value with minimum ceremony.

## License

MIT - Forked from [github/spec-kit](https://github.com/github/spec-kit)