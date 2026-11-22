# Global instructions

Applies to every repo. Repo-specific commands and rules live in each repo's own `CLAUDE.md`.

## Working
- Plan in files, not in chat. Specs, tickets, `GLOSSARY.md` and ADRs live in the repo.
- Thin vertical slices. Every change is testable and reviewable alone.
- Run the repo's feedback loops (test, lint, format) before every commit. All must pass.
- If context gets long, suggest `/handoff` to a fresh session instead of pushing on.

## Domain language
- Terms in `GLOSSARY.md` are canonical. Never rename them.
- Decisions in ADRs are settled. Propose a new ADR instead of silently changing one.

## Git
- Never push, force-push, `reset --hard` or delete branches. I do that.
- Never commit secrets, `.env` files or `.desloppify/`.
