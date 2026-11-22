# Skills cheat sheet

## tolab
| Command     | What it does                                                         | When                 |
| :---------- | :------------------------------------------------------------------- | :------------------- |
| `/quiz-me`  | Quizzes you on code the agent wrote, then explains what you got wrong  | After every feature  |

## Pocock: planning
| Command                    | What it does                                                   | When                      |
| :------------------------- | :------------------------------------------------------------- | :------------------------ |
| `/ask-matt`                | Tells you which skill to use                                    | Unsure where to start     |
| `/grill-me`                | Interviews you, one question at a time                          | Any plan, even non-code   |
| `/grill-with-docs`         | Same + writes `GLOSSARY.md` and ADRs                           | New feature in a repo     |
| `/wayfinder`               | Splits huge work into decision tickets                         | Multi-week work           |
| `/prototype`               | Throwaway code to answer a design question                     | Talking doesn't settle it |
| `/to-spec`                 | Conversation → spec in the tracker                             | After grilling            |
| `/to-tickets`              | Spec → tracer-bullet tickets with dependencies                 | Before building           |
| `/to-questionnaire`        | Decision you can't make alone → questions for the right person   | Need someone else's input |

## Pocock: building
| Command                           | What it does                                       | When              |
| :-------------------------------- | :------------------------------------------------- | :---------------- |
| `/implement`                      | Builds a ticket, TDD at seams, review before commit | One ticket        |
| `/implement-spec`                 | Parallel subagents over all ready tickets          | Whole spec        |
| `/tdd`                            | Red → green → refactor, one slice                  | Testable logic    |
| `/diagnosing-bugs`                | Disciplined hypothesis → evidence loop             | Hard bug / perf   |
| `/research`                       | Background agent, saves a cited markdown file      | Datasheets, crates |
| `/code-review`                    | Reviews diff on standards + spec                   | Before PR         |
| `/pr`                             | PR body with merge-danger notes                    | Opening PR        |
| `/wizard`                         | Bash wizard for steps only you can do                | Manual setup steps |

## Pocock: maintenance + productivity
| Command                          | What it does                                    | When               |
| :------------------------------- | :---------------------------------------------- | :----------------- |
| `/improve-codebase-architecture` | HTML report of deepening ideas, then grills you | Every few days     |
| `/retro`                         | Fixes to the agent's environment, worst first   | End of session     |
| `/handoff`                       | Compacts session into a doc for a fresh agent   | Context too long   |
| `/teach`                         | Teaches a concept over several sessions         | Learning           |
| `/wait-what`                     | Re-explains a message that didn't land          | Confused           |
| `/setup-matt-pocock-skills`      | Per-repo config                                 | Once per repo      |
| `/git-guardrails-claude-code`    | Hooks blocking push, reset --hard, clean...     | Once per repo      |

## Desloppify
| Command                               | What it does                                   |
| :------------------------------------ | :--------------------------------------------- |
| `desloppify scan --path .`            | Full scan, computes score                      |
| `desloppify scan --path . --profile ci --no-badge` | Fast scan, no subjective review (CI) |
| `desloppify status --json`            | Strict + objective scores                      |
| `desloppify next`                     | Next item to fix                               |
| `desloppify backlog`                  | Everything outside the current queue           |
| `desloppify plan`                     | Reorder / cluster issues                       |
| `desloppify exclude <path>`           | Skip a folder                                  |
| `desloppify update-skill claude`      | Install / update the agent workflow skill      |

Score: ~98+ ≈ what a seasoned engineer would call well built. Strict score also counts "won't fix" items against you.

## Ponytail
| Command                                 | What it does                               |
| :-------------------------------------- | :----------------------------------------- |
| `/ponytail [lite \| full \| ultra \| off]` | Set intensity (on by default)           |
| `/ponytail-review`                      | Review (details: `/ponytail-help`)         |
| `/ponytail-audit`                       | Audit (details: `/ponytail-help`)         |
| `/ponytail-debt`                        | Track `shortcut:` comments                |
| `/ponytail-gain`                        | Gain report (details: `/ponytail-help`)      |
| `/ponytail-help`                        | Help                                       |

Default mode without the command: `PONYTAIL_DEFAULT_MODE` env var or `~/.config/ponytail/config.json`.

