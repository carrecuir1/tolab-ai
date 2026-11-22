# Overview

An AI coding setup: **Matt Pocock's skills** for the process, **Desloppify** for codebase health, **Ponytail** to keep the agent from over-building.

## The idea
- Pocock = per change. The agent grills you first, then spec → tickets → TDD → review → PR.
- Desloppify = two levels. A fast gate on every ticket (the score must not drop before a commit) and a full health pass on the whole codebase. Scores health 0–100 and loops fixing until it hits a target.
- Bad codebase = bad agent. Desloppify keeps the codebase clean so the Pocock loop works.
- Ponytail = always on. Pushes the agent toward the smallest change that works. Start at `lite`; if it fights Desloppify or `/tdd`, dial it down.

## The loop
```
/grill-with-docs → /to-spec → /to-tickets          (you in the loop)
        ↓
/implement + /tdd → desloppify gate → /code-review → /pr   (can run AFK)
        ↓
/retro every session
/improve-codebase-architecture every few days
desloppify health pass before a release / when it feels messy
        ↓
back to /grill-with-docs for the next change
```
Context getting long → `/handoff` to a fresh session.

## Notes
- [Install](install.md): one-time machine setup + per-repo setup
- [Workflow](workflow.md): how a feature actually goes, step by step
- [Skills cheat sheet](skills-cheat-sheet.md): every command
- [CLAUDE.md templates](../templates/claude-md/): block to paste in every repo

## Links
[mattpocock/skills](https://github.com/mattpocock/skills)
[peteromallet/desloppify](https://github.com/peteromallet/desloppify)
[DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) (only official source; also `@dietrichgebert/ponytail` on npm)
[Matt Pocock: Full Walkthrough, Workflow for AI Coding](https://ai.engineer/talks/ai-coding-workflow)
[AI Hero](https://www.aihero.dev/)
