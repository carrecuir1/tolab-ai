# Global instructions

Applies to every repo. Repo-specific commands and rules live in each repo's own `CLAUDE.md`.
Source: `tolab-ai/claude/CLAUDE.md` (`~/.claude/CLAUDE.md` is a symlink to it; edit the source).

## Working
- Plan in files, not in chat. Specs, tickets, `GLOSSARY.md` and ADRs live in the repo.
- When grilling settles a decision, write it to the spec issue or an ADR before the session ends. `/clear` keeps only files.
- Thin vertical slices. Every change is testable and reviewable alone.
- Run the repo's feedback loops (test, lint, format) before every commit. All must pass.
- If context gets long, suggest `/handoff` to a fresh session instead of pushing on.
- User-invoked skills (`/to-spec`, `/to-tickets`, `/handoff`, `/wayfinder`, `/retro`) exist but only Thomas can start them. When one fits, tell him which to type.

## Domain language
- Terms in `GLOSSARY.md` are canonical. Never rename them.
- Decisions in ADRs are settled. Propose a new ADR instead of silently changing one.

## One-way doors
A one-way door is a change a `git revert` can't undo: deleting or rewriting data (destructive migrations, deleting files, records or branches), sending anything (emails, messages, notifications, webhooks), moving money, publishing (releases, public API or file-format changes others depend on), flashing hardware, rotating or revoking secrets. Everything else is a two-way door: reverting fixes it.
- Call it early. While grilling and in `/to-tickets`, mark every ticket that contains a one-way door as HITL (`ready-for-human`), never AFK.
- Make it two-way when you can: expand–contract migrations, a feature flag, a backup or dry run before the destructive step.
- Never walk through a one-way door yourself (send, delete real data, publish, migrate production). Stop and ask.
- Every PR states its door in `/pr`'s **Merge Danger** section. A one-way-door PR starts its title with `[one-way]` and only a human merges it.

## Git
- You may push branches and open PRs. Never force-push, `reset --hard`, delete branches or merge into `main`. I do that.
- Before each commit, run `git status -sb`. Commit only on a branch made for this change; otherwise branch from `origin/main`.
- After every push, run `gh pr checks <n> --watch` and fix a red run before reporting done.
- Never commit secrets, `.env` files or `.desloppify/`.
