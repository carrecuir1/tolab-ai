## Feedback loops
Run these before every commit. All must pass.
- Test: `npm run test`
- Typecheck: `npm run typecheck`
- Lint: `npm run lint`

## Workflow
- Follow the mattpocock/skills flow: grill → spec → tickets → implement → review → PR.

## Code health
Two levels. Pocock's skills decide how code is written; desloppify checks the result.
- Gate, every ticket (inside `/implement`, after the feedback loops pass, before the commit):
  1. Before starting the ticket: `desloppify scan --path . --profile ci --no-badge`, then note the objective score from `desloppify status --json`.
  2. Before committing: scan the same way again. If the objective score dropped, fix the issues this change introduced and scan again. Never commit a drop.
  3. Fix only issues in code this ticket touched. Everything else waits for the health pass.
- Health pass (full scan with subjective review): only on a `desloppify/*` branch, in its own session, never mid-feature. Target strict score: 95.
- Never game the score with cosmetic changes.
- Never rename GLOSSARY.md terms during a desloppify pass.
- `.desloppify/` is local state, never commit it.
