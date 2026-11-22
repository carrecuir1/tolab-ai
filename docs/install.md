# Install

## Quick path
```powershell
.\install.ps1                                   # once per machine
<path-to>\tolab-ai\scripts\init-repo.ps1 -Stack rust   # once per repo (rust | typescript | godot-gdext)
```
`install.ps1` does the machine steps below, plus Ponytail, the tolab plugin and the global `CLAUDE.md`.
`init-repo.ps1` does per-repo steps 2–4 and 6. You still run step 5 (setup skills) and step 7 (first scan) yourself.

The manual steps stay here for reference.

## Machine (once)
Requirements: Node.js LTS, Python 3.11+, git.

1 - Install Claude Code ([docs](https://docs.claude.com/en/docs/claude-code/overview))
```powershell
npm install -g @anthropic-ai/claude-code
```
2 - Install Desloppify
```powershell
pip install --upgrade "desloppify[full]"
desloppify --help
```
3 - Install Ponytail (Claude Code plugin, user-wide)
```powershell
claude plugin marketplace add DietrichGebert/ponytail
claude plugin install ponytail@ponytail
```
4 - Install the tolab plugin from this repo
```powershell
claude plugin marketplace add <path-to>\tolab-ai
claude plugin install tolab@tolab-ai
```

> [!NOTE]
> **Copilot instead of Claude Code**
> Both skill sets also support GitHub Copilot CLI. Use `desloppify update-skill copilot` and pick Copilot in the `npx skills` installer.

## Per repo
1 - Open a terminal at the repo root

2 - Install Pocock's skills as editable files (pick the skills + the agent when prompted)
```powershell
npx skills@latest add mattpocock/skills
```
Make sure to select `setup-matt-pocock-skills` and `git-guardrails-claude-code`.

> [!WARNING]
> **One install method only**
> Don't also install the Claude Code plugin (`/plugin install mattpocock-skills`). You get every skill twice.

3 - Install the Desloppify workflow skill for the agent
```powershell
desloppify update-skill claude
```
4 - Ignore Desloppify's local state
```powershell
Add-Content .gitignore ".desloppify/"
```
5 - Start the agent and run the setup skills
```powershell
claude
```
```
/setup-matt-pocock-skills
/git-guardrails-claude-code
```
Setup asks: issue tracker (use **local markdown** for personal repos), triage labels, where docs go.

6 - Paste the matching block from [CLAUDE.md templates](../templates/claude-md/) into the repo's `CLAUDE.md` and check the commands

7 - First health scan, to get a baseline score
```powershell
desloppify scan --path .
desloppify status --json
```
Exclude build output / generated code / vendored stuff:
```powershell
desloppify exclude target
```

## Update
```powershell
npx skills@latest update
pip install --upgrade "desloppify[full]"
desloppify update-skill claude
claude plugin update ponytail@ponytail
claude plugin update tolab@tolab-ai
```

## Work machines
> [!CAUTION]
> **Check your employer's policy first**
> Confirm what's allowed for Claude Code, third-party skills and pip/npm tools on corporate repos and machines before installing anything.
