<#
.SYNOPSIS
  One-time machine setup for tolab-ai. Safe to re-run.
.DESCRIPTION
  Installs Claude Code (if missing), Desloppify, Ponytail, this repo's tolab plugin,
  and links the global CLAUDE.md. Pocock's skills are installed per repo by
  scripts\init-repo.ps1, not here.
#>
$ErrorActionPreference = 'Stop'
$Repo = $PSScriptRoot

function Test-Cmd($name) { [bool](Get-Command $name -ErrorAction SilentlyContinue) }
function Step($msg) { Write-Host "`n== $msg" -ForegroundColor Cyan }

Step 'Checking requirements'
if (-not (Test-Cmd git))  { throw 'git not found. Install Git for Windows.' }
if (-not (Test-Cmd node)) { throw 'node not found. Install Node.js LTS.' }
$Py = if (Test-Cmd py) { 'py' } elseif (Test-Cmd python) { 'python' } else { throw 'Python not found. Install Python 3.11+.' }
if ((& $Py -c 'import sys; print(sys.version_info >= (3, 11))') -ne 'True') { throw 'Python 3.11+ required.' }

if (-not (Test-Cmd claude)) {
    Step 'Installing Claude Code'
    npm install -g @anthropic-ai/claude-code
}

Step 'Desloppify'
& $Py -m pip install --upgrade 'desloppify[full]'

Step 'Ponytail (official source only: DietrichGebert/ponytail)'
claude plugin marketplace add DietrichGebert/ponytail
claude plugin install ponytail@ponytail

Step 'tolab skills (this repo as a local marketplace)'
claude plugin marketplace add $Repo
claude plugin install tolab@tolab-ai

Step 'Global CLAUDE.md'
$Src  = Join-Path $Repo 'claude\CLAUDE.md'
$Dest = Join-Path $HOME '.claude\CLAUDE.md'
New-Item -ItemType Directory -Force (Split-Path $Dest) | Out-Null
$Item = Get-Item $Dest -ErrorAction SilentlyContinue
if ($Item -and -not $Item.LinkType) { Copy-Item $Dest "$Dest.bak" -Force; Write-Host "Backed up existing CLAUDE.md to $Dest.bak" }
try {
    New-Item -ItemType SymbolicLink -Path $Dest -Target $Src -Force | Out-Null
    Write-Host "Linked $Dest -> $Src"
} catch {
    Copy-Item $Src $Dest -Force
    Write-Warning 'Symlink needs Developer Mode or admin; copied instead. Re-run after editing claude\CLAUDE.md.'
}

Write-Host "`nDone. In each project: scripts\init-repo.ps1 -Stack <rust|typescript|godot-gdext>" -ForegroundColor Green
