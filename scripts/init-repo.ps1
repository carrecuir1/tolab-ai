<#
.SYNOPSIS
  Per-repo setup: Pocock skills, Desloppify skill, .gitignore, CLAUDE.md block.
.EXAMPLE
  ..\tolab-ai\scripts\init-repo.ps1 -Stack rust
#>
param(
    [Parameter(Mandatory)][ValidateSet('rust', 'typescript', 'godot-gdext')][string]$Stack,
    [string]$Path = (Get-Location).Path
)
$ErrorActionPreference = 'Stop'
$Repo = Split-Path $PSScriptRoot -Parent
function Step($msg) { Write-Host "`n== $msg" -ForegroundColor Cyan }

Push-Location $Path
try {
    if (-not (Test-Path .git)) { throw "$Path is not a git repo root." }

    Step "Pocock skills (select setup-matt-pocock-skills and the git guardrails skill when prompted)"
    npx skills@latest add mattpocock/skills

    Step 'Desloppify workflow skill'
    desloppify update-skill claude

    Step '.gitignore'
    if (-not ((Test-Path .gitignore) -and (Select-String -Path .gitignore -SimpleMatch '.desloppify/' -Quiet))) {
        Add-Content .gitignore '.desloppify/'
        Write-Host 'Added .desloppify/'
    } else { Write-Host 'Already ignored' }

    Step "CLAUDE.md ($Stack)"
    $Tpl = Get-Content (Join-Path $Repo "templates\claude-md\$Stack.md") -Raw
    if (-not (Test-Path CLAUDE.md)) {
        Set-Content CLAUDE.md $Tpl
        Write-Host 'Created CLAUDE.md'
    } elseif (-not (Select-String -Path CLAUDE.md -SimpleMatch '## Feedback loops' -Quiet)) {
        Add-Content CLAUDE.md "`n$Tpl"
        Write-Host 'Appended block to CLAUDE.md'
    } else { Write-Host 'CLAUDE.md already has a Feedback loops block, left as is' }

    Write-Host @"

Next:
  1. claude
  2. /setup-matt-pocock-skills   (issue tracker: GitHub, keep the default triage labels)
  3. /git-guardrails-claude-code
  4. Check the commands in CLAUDE.md match this repo
  5. desloppify exclude <build-dir>   then   desloppify scan --path .
"@ -ForegroundColor Green
} finally { Pop-Location }
