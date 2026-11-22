# tolab skills

Only original, generic skills go here: ones anyone coding in any repo could use. Third-party skills (Pocock, Desloppify, Ponytail, …) are installed from their own sources and listed in [`third-party/`](../../../third-party/README.md).

One folder per skill, each with a `SKILL.md`:

```
skills/
└── quiz-me/
    └── SKILL.md      # quizzes you on code the agent wrote
```

`SKILL.md` starts with frontmatter:

```markdown
---
name: my-skill
description: One sentence on when the agent should use this skill.
---

Instructions...
```

Slash commands go in `../commands/<name>.md`.
After adding or changing a skill: bump `version` in `../.claude-plugin/plugin.json`, then `claude plugin update tolab@tolab-ai`.
