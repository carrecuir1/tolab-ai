## Feedback loops
Run these before every commit. All must pass. These replace any npm commands in skills.
- Test: `cargo test --all-targets`
- Lint: `cargo clippy --all-targets -- -D warnings`
- Format: `cargo fmt --check`

## Workflow
- Follow the mattpocock/skills flow: grill → spec → tickets → implement → review → PR.
- Tickets that need real hardware (flashing, a board, a scope) are HITL. Never mark them AFK.
- Keep logic host-testable: put hardware behind traits so /tdd can run with `cargo test`.

## Domain language
- Terms in GLOSSARY.md are canonical. Never rename them, even during a desloppify pass.
- Decisions in the ADR folder are settled. Propose a new ADR instead of silently changing one.

## Code health
Two levels. Pocock's skills decide how code is written; desloppify checks the result.
- Gate, every ticket (inside `/implement`, after the feedback loops pass, before the commit):
  1. Before starting the ticket: `desloppify scan --path . --profile ci --no-badge`, then note the objective score from `desloppify status --json`.
  2. Before committing: scan the same way again. If the objective score dropped, fix the issues this change introduced and scan again. Never commit a drop.
  3. Fix only issues in code this ticket touched. Everything else waits for the health pass.
- Health pass (full scan with subjective review): only on a `desloppify/*` branch, in its own session, never mid-feature. Target strict score: 95.
- Never game the score with cosmetic changes.
- `.desloppify/` is local state, never commit it.

## Git
- Never push, force, reset --hard or delete branches. I do that.
