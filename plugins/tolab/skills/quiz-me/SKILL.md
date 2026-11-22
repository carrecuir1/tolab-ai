---
name: quiz-me
description: Quiz the user on code the agent just implemented, to check they understand it, then explain whatever they got wrong using the actual code. Use when they ask to be quizzed, tested, or checked on a change, a feature, a diff or a branch.
---

# quiz-me

Goal: the user should understand every change the agent made as well as if they had written it themselves. This is a check on them, not a code review.

## 1. Find the change

- Use what the user names: a branch, commits, a PR, files, or "what you just did".
- Default: the current branch's diff against the main branch (`git diff main...HEAD`).
- Read the whole diff and enough of the surrounding code to know why it was written that way. If there's a spec or ticket for it, read that too.

## 2. Ask questions

Ask **one question at a time**, 5–8 in total, from shallow to deep:

1. **What**: what does this change do, in one or two sentences?
2. **Why**: why this approach instead of `<the obvious alternative>`?
3. **Trace**: walk me through `<key function or path>`. What happens when `<realistic input>` comes in?
4. **Edge case**: what happens on `<edge case the code handles, or fails to handle>`?
5. **Counterfactual**: what breaks if `<specific line, check or call>` is removed?
6. **Risk**: if this has a bug, where would it most likely show up, and how would you notice?
7. **Tests**: what do the tests prove, and what do they not cover?

Make every question about this diff, naming real functions, files and values. Never ask generic language-trivia questions.

## 3. After each answer

- Never hint before they answer. If they say "I don't know", treat it as a wrong answer.
- Give a verdict: **right**, **partly**, or **wrong**.
- Explain the gap using the code itself (`file:line`), in a few sentences. Don't lecture.
- If an answer shows a misunderstanding that a later question depends on, explain that first, then continue.

## 4. Wrap up

End with:

- **Score**: right / partly / wrong counts.
- **Weak spots**: the concepts or code paths they didn't get, each with the files to reread.
- **Next step** (pick one): reread specific files, run `/teach` on a concept, or ask the agent to add a comment or test where the code was hard to follow.

## Language

Questions and explanations go in whatever language the user writes in. Code references stay as they are.
