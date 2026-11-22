# tolab-ai

A reproducible setup for coding with an AI agent (Claude Code): a process for every change, an automatic code-health check, and a few generic skills. Clone it, run one script per machine and one per repo.

## What's in it

| Tool | What it does | Install |
|---|---|---|
| [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) | The coding agent | `install.ps1` (if missing) |
| [Matt Pocock's skills](https://github.com/mattpocock/skills) | The process for each change: grill → spec → tickets → TDD → review → PR | Per repo, `scripts/init-repo.ps1` (`npx skills`) |
| [Desloppify](https://github.com/peteromallet/desloppify) | Code health at two levels: a gate on every ticket (the score must not drop before a commit) and a full health pass between features | `install.ps1` (CLI) + `init-repo.ps1` (agent skill) |
| [Ponytail](https://github.com/DietrichGebert/ponytail) | Always-on "laziest senior dev" mindset that keeps the agent from over-building | `install.ps1` (plugin) |
| **tolab skills** | Generic skills: `/quiz-me` quizzes you on code the agent wrote | `install.ps1` (plugin served from this repo) |
| **CLAUDE.md** | Global rules (`claude/`) + per-stack blocks with test/lint commands and the Desloppify gate (`templates/`) | `install.ps1` + `init-repo.ps1` |

Third-party tools are never copied in, only referenced with their source: [third-party/](third-party/README.md).

## How they fit together

- **Pocock's skills** decide *how* each change is written: you get grilled first, then spec, tickets, TDD, review.
- **Desloppify** checks *what* came out: a fast scan before every commit, plus a full pass now and then, because a messy codebase makes the agent worse.
- **Ponytail** stays on in the background. Drop it to `lite` if it pulls against Desloppify or `/tdd`.
- **CLAUDE.md** holds the rules every agent session follows.

Details: [overview](docs/overview.md) · [workflow](docs/workflow.md) · [cheat sheet](docs/skills-cheat-sheet.md) · [install](docs/install.md)

## Setup

Requirements: Windows + PowerShell, git, Node.js LTS, Python 3.11+.

```powershell
.\install.ps1                                         # once per machine
<path-to>\tolab-ai\scripts\init-repo.ps1 -Stack rust  # once per project (rust | typescript | godot-gdext)
```

Then in the project: `claude`, then `/setup-matt-pocock-skills`.

## Layout

```
docs/               how the workflow goes
templates/          per-stack CLAUDE.md blocks
claude/CLAUDE.md    global agent instructions
plugins/tolab/      generic skills and commands
third-party/        what's used from other people, and where it comes from
install.ps1         machine setup
scripts/            per-repo setup
```

## Extending it

- **Your own setup on top:** keep project-specific tools, MCP servers and personal config in a separate repo whose install script runs this one first. This repo stays generic.
- **New stack:** add `templates/claude-md/<stack>.md` and the name to `init-repo.ps1`'s `-Stack` list.
- **New skill:** see [plugins/tolab/skills/](plugins/tolab/skills/README.md).

## Rules

No secrets committed, nothing project- or person-specific, each tool installed only once.
