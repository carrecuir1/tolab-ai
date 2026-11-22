# Third-party skills and tools

Skill sets written by other people that this setup uses. **None of their files live in this repo.** Each one installs from its upstream source so it keeps getting updates. This page records what is used and how it's installed.

Original skills are in [`plugins/tolab/skills/`](../plugins/tolab/skills/).

| Skill set | Source | What it's for | Scope | Installed by |
|---|---|---|---|---|
| Matt Pocock's skills | [mattpocock/skills](https://github.com/mattpocock/skills) | The per-change process: grill → spec → tickets → implement → review → PR | Per repo | `scripts/init-repo.ps1` (`npx skills@latest add mattpocock/skills`) |
| Desloppify | [peteromallet/desloppify](https://github.com/peteromallet/desloppify) | Codebase health score and fix loop | Machine CLI + per-repo skill | `install.ps1` (pip), then `init-repo.ps1` (`desloppify update-skill claude`) |
| Ponytail | [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) | Always-on "write less code" mindset | Machine plugin | `install.ps1` (`ponytail@ponytail`) |

## Rules

- **Never copy a third-party skill into `plugins/tolab/`.** To change one, write a new skill under a new name and note here which one it replaces.
- Install each one **once**, by one method. Two methods means duplicate skills.
- Only install from the official sources listed above.
- Adding one: add a row here, add the install step to `install.ps1` or `init-repo.ps1` (or mark it manual), and add it to the README table.
