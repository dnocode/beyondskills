# Lateral Thinking

A skill that shifts AI output away from mainstream, high-probability patterns toward valid but less expected responses. Use it whenever you want Claude to avoid generic, obvious, or "default AI" output.

## What it does

Most AI responses converge toward what is statistically most frequent in training — which is often the most widespread, the most mainstream, and the least interesting. This skill works by introducing **human compilers**: real thinkers whose intellectual profile is used as an active lens to generate and verify output.

In non-technical domains (communication, marketing, writing, strategy), no external compiler exists — no machine rejects a manipulative sentence the way a compiler rejects broken code. Human compilers become the only rigorous verification system available.

## When to activate it

- You want to avoid generic, obvious, or "default AI" tone
- You reference people as style benchmarks ("write like Feynman", "avoid the tone of X")
- You say things like "not the usual stuff", "think differently", "not the obvious answer"
- You're working in marketing, commercial communication, strategy, ethics, or persuasive writing
- You need output that takes a real position, not artificial balance

## How to use it

1. Copy the contents of [`SKILL.md`](./SKILL.md)
2. Paste it at the start of your conversation with Claude (or as a system prompt)
3. Claude will guide you through compiler selection and domain detection before generating

## Example

**Without the skill:**
> "Our product helps you grow your business faster and smarter. Don't miss this opportunity."

**With the skill (Dieter Rams + negative: Generic AI Mode):**
> "It does one thing. It does it well. That's the pitch."

## Reference files

- [`references/example-profiles.md`](./references/example-profiles.md) — pre-built compiler profiles (Taleb, Sutherland, Feynman, Rams, and negative compilers)
- [`references/domains.md`](./references/domains.md) — domain-specific calibration questions and traps to avoid
