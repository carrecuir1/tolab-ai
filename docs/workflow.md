# Workflow

## Rules
- Plan in files, not in chat. Specs, tickets, `GLOSSARY.md`, ADRs live in the repo.
- Thin vertical slices. Every ticket is testable and reviewable alone.
- Tickets are **HITL** (needs a human) or **AFK** (agent can do it alone).
- Tests + lints gate every commit.
- Fresh context > long context. `/handoff` early.
- After a feature: make the AI interview **you** to check you understand what was built.

## A feature, step by step
1 - Not sure where to start → `/ask-matt`

2 - Too big for one session → `/wayfinder` first

3 - Align
```
/grill-with-docs
```
Answer one question at a time. Terms go to `GLOSSARY.md`, decisions to ADRs.
Can't decide by talking → `/prototype` (throwaway branch, never merged).

4 - Spec + tickets
```
/to-spec
/to-tickets
```
Read the tickets. Fix the HITL / AFK tags before building. Any ticket with a one-way door (can't be undone by a revert: data loss, sending, publishing, see `## One-way doors` in CLAUDE.md) is HITL.

5 - Build
```
/implement
```
One ticket at a time, watched at first. Before each commit the agent runs the desloppify gate (fast scan, objective score must not drop; see `## Code health` in the repo CLAUDE.md). Whole spec in parallel later: `/implement-spec`.
Hard bug → `/diagnosing-bugs`.

6 - Review + PR
```
/code-review
/pr
```

7 - Check you understand it
```
/quiz-me
```
Quizzes you on the diff one question at a time and explains what you got wrong (tolab skill). For deeper topics: `/teach`.

8 - End of session
```
/retro
```
Apply the top suggestion.

## Health pass (Desloppify)
The per-ticket gate only stops new mess. This full pass, with subjective review, cleans up what has built up.

When: before a release, every couple of weeks, or when the code feels messy. **Never in the middle of a feature.**

1 - New branch, fresh agent session
```powershell
git checkout -b desloppify/code-health
claude
```
2 - Prompt
```
Run a desloppify health pass on this repo. Scan with `desloppify scan --path .`,
then loop: `desloppify next` → fix properly → resolve → `desloppify next`.
Target strict score: 95. Stop at the target or when only HITL items are left.
Terms in GLOSSARY.md are canonical: never rename them.
Don't game the score. Run the feedback commands from CLAUDE.md before each commit.
```
3 - Check score
```powershell
desloppify status --json
```
4 - Read the commits, then PR with `/pr`

> [!TIP]
> **Two architecture reviewers**
> `/improve-codebase-architecture` = pick ONE deep change and get grilled on it.
> Desloppify = grind through many small issues. Don't run both in the same session.

## Daily health pass (GitHub Action, optional)
The health pass above, run unattended every day on GitHub. It opens a PR to the default branch with one commit per fix and never pushes to it. You review and merge.

1 - Copy [`templates/github/daily-improve.yml`](../templates/github/daily-improve.yml) to `<project>/.github/workflows/daily-improve.yml` and keep the toolchain step your stack needs.

2 - In the project's GitHub settings:
- Secret `CLAUDE_CODE_OAUTH_TOKEN`: run `claude setup-token` locally (uses your Claude Pro/Max subscription, no API key needed) and paste the token. Runs count against your subscription limits. `ANTHROPIC_API_KEY` works instead if you use the API.
- Actions → General → **Allow GitHub Actions to create and approve pull requests**

3 - Try it once from the Actions tab (**Run workflow**) before trusting the schedule.

The logic lives in [`.github/actions/daily-improve`](../.github/actions/daily-improve/action.yml), so improving the prompt here updates every project on its next run.

> [!NOTE]
> PRs opened with `GITHUB_TOKEN` don't trigger the project's other workflows (GitHub's rule). The agent runs the tests itself before each commit; to get CI on the PR too, close and reopen it, or use a GitHub App token.
