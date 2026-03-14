# Contributing

## Adding a new skill

Each skill lives in its own directory under `skills/`. The minimum structure is:

```
skills/
└── your-skill-name/
    ├── SKILL.md       ← instructions for the AI
    └── README.md      ← explanation for humans
```

Optional: add a `references/` subdirectory for supporting files (examples, templates, domain guides).

---

### SKILL.md

Must start with YAML frontmatter:

```markdown
---
name: your-skill-name
description: >
  One or two sentences describing when and why to activate this skill.
  This is what the AI reads to decide whether the skill is relevant.
---

# Skill Title

... skill content ...
```

The `description` field is the most important part. It should clearly state:
- What the skill does
- When to activate it (trigger conditions)

---

### README.md

Plain-language documentation for the human reading the repo. Include:

- **What it does** — the problem it solves
- **When to activate it** — specific trigger situations
- **How to use it** — step by step (always: copy SKILL.md, paste into Claude)
- **Example** — a before/after showing the difference the skill makes
- **Reference files** — list any files in `references/` with a short description

---

## Naming conventions

- Directory names: lowercase, hyphenated (`lateral-thinking`, `code-review`)
- Reference files: lowercase, hyphenated, in English
- One skill per directory
