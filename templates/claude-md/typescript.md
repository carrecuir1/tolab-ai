## Feedback loops
Run these before every commit. All must pass.
- Test: `npm run test`
- Typecheck: `npm run typecheck`
- Lint: `npm run lint`

## Workflow
- Follow the mattpocock/skills flow: grill → spec → tickets → implement → review → PR.

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

## One-way doors
A one-way door is a change a `git revert` can't undo: deleting or rewriting data (destructive migrations, deleting files, records or branches), sending anything (emails, messages, notifications, webhooks), moving money, publishing (releases, public API or file-format changes others depend on), flashing hardware, rotating or revoking secrets. Everything else is a two-way door: reverting fixes it.
- Call it early. While grilling and in `/to-tickets`, mark every ticket that contains a one-way door as HITL (`ready-for-human`), never AFK.
- Make it two-way when you can: expand–contract migrations, a feature flag, a backup or dry run before the destructive step.
- Never walk through a one-way door yourself (send, delete real data, publish, migrate production). Stop and ask.
- Every PR states its door in `/pr`'s **Merge Danger** section. A one-way-door PR starts its title with `[one-way]` and only a human merges it.

## Git
- Never push, force, reset --hard or delete branches. I do that.
