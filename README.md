# Spec-Kit (Simplified)

One spec per branch.

## Install

```bash
./install.sh  # Copies commands to ~/.claude/commands/
```

## Usage

```bash
/specify   # Create specification (WHAT to build)
/plan      # Create implementation plan (HOW to build)  
/tasks     # Generate executable tasks (STEPS to take)
```

## How It Works

Each git branch gets its own spec directory:
```
.claude/specs/
├── master/
│   ├── spec.md
│   ├── plan.md
│   └── tasks.md
└── feature-xyz/
    └── spec.md
```

Switch branch = switch spec. Automatic.

## Commands Read Context

- Github or Linear issues (if provided)
- CLAUDE.md (repo conventions)
- Existing code patterns

## Cleanup

```bash
# Remove old spec
rm -rf .claude/specs/old-branch
```

## The Flow

1. Switch to branch
2. Run `/specify` → creates/updates `.claude/specs/{branch}/spec.md`
3. Run `/plan` → creates/updates `.claude/specs/{branch}/plan.md`
4. Run `/tasks` → creates/updates `.claude/specs/{branch}/tasks.md`

If artifacts already exist for a given branch, this will error out with exit code 1.

## Files

```
spec-kit/
├── templates/commands/   # The 3 commands
├── scripts/
│   └── auto-connect-spec.sh  # Creates branch directory
└── install.sh               # Copies commands
```
