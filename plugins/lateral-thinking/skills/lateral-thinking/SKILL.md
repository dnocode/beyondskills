---
name: lateral-thinking
description: >
  Lateral thinking module that shifts model sampling away from mainstream, high-probability outputs toward valid but less probable patterns of thought. Activate ALWAYS when the user wants to avoid generic, obvious, or "default AI" output — especially in marketing, commercial communication, strategy, analysis, or any writing where mainstream tone would be grotesque or manipulative. Trigger when the user cites people as reference points ("write like X", "avoid the style of Y"), or says things like "not the usual stuff", "avoid classic marketing", "think differently", "not the obvious answer". Use as an injectable module on top of other skills or standalone.
---

# Lateral Thinking — Guided Sampling Skill

## Core Principle

The model tends to converge toward what is **statistically most frequent** in its training — which often coincides with what is most widespread, most mainstream, most about to be superseded. Frequency is not validity.

This skill shifts the sampling point using **human compilers**: real figures whose system of thought is expanded into a philosophical profile and loaded as **pre-reasoning constraints** — before generation begins, not after. The profiles restrict the sampling space upfront. They are not post-hoc verifiers applied to an already-generated output. Generation happens *within* the constrained distribution. The final coherence check (Step 6) is a lightweight sanity check, not the primary mechanism.

### On Objective Verification

In technical domains — code, mathematics, engineering — an external compiler exists. It is indifferent, mechanical, and final. Errors surface immediately.

In non-technical domains — ethics, communication, writing, strategy, human relationships — **no such external compiler exists**. There is no machine that rejects a manipulative sentence the way a compiler rejects a syntax error. Objectivity in these domains does not live in a formal system. It lives in the accumulated humanity of people who have thought carefully, acted with integrity, and left a record of what they believed.

This is why human compilers are not a stylistic preference in these domains. They are **the only verification system available**. The higher the domain's distance from technical measurability, the more mandatory the compilers become.

---

## Progress Display

**At each step of activation, output a visual progress block.** Update it as each step completes. This is mandatory — it makes the constraint-loading process visible to the user.

Format:

```
▸ LATERAL THINKING
  [✓] Step 1 — Domain: [name] (technical|non-technical)
  [✓] Step 2 — Risk: LOW|HIGH — compilers optional|mandatory
  [✓] Step 3 — Compilers: [N] positive, [N] negative
  [✓] Step 4 — Knowledge check: [name ✓/?] ...
  [⋯] Step 5 — Building profiles:
               · [Name] (positive)  [✓|⋯| ]
               · [Name] (negative)  [✓|⋯| ]
  [ ] Sampling constraints loaded — generation active
```

Legend: `[✓]` done · `[⋯]` in progress · `[ ]` pending · `[?]` needs user input

**Output the block at the start of each step, updating status as you go.** When all steps complete, output the final block with all `[✓]` before generating any content. The user should be able to read the block and know exactly what constraints are active.

---

## Mandatory Activation Workflow

### Step 1 — Domain Detection

If the domain is **not already clear from the prompt**, ask:

> "What domain are we working in? (e.g. marketing, client communication, ethics, writing, strategy, analysis, technical writing, code...)"

### Step 2 — Domain Risk Assessment

Classify the domain on this axis:

```
TECHNICAL (low risk)           NON-TECHNICAL (high risk)
──────────────────────────────────────────────────────────
Code / Math / Engineering      Ethics / Communication
Has external compiler          Marketing / Writing
Errors surface immediately     Strategy / Human judgment
Compilers: optional            No external verification exists
                               Errors stay invisible for longer
                               Compilers: MANDATORY
```

**High-risk domains** — where the statistical default is grotesque and human compilers are the only verification system:
- Communication, marketing, copywriting
- Ethical or moral reasoning
- Persuasive or motivational writing
- Any domain where "it sounds right" is the only available check
- Any output that acts on a human being's emotions, decisions, or beliefs

In these domains, before generating, state explicitly:
> "This is a non-technical domain. No external compiler exists here — the human compilers you provide are the only objective verification available. I will apply strict profile coherence checks before delivering output."

### Step 3 — Compiler Collection

Always ask explicitly, even if the domain is clear:

> "Who do you want to use as reference?
> - **Positive compilers**: figures whose way of thinking should guide the responses
> - **Negative compilers**: figures or currents you want explicitly excluded"

These can be real people, authors, characters, archetypes, schools of thought, or communication styles.

### Step 4 — Compiler Knowledge Check

For each compiler named, assess available knowledge:

- **If sufficient material exists** (well-known author, public intellectual, documented thinker): build the profile directly from training knowledge.
- **If material is sparse or uncertain**: ask the user before proceeding:

> "I don't have enough material on [name] to build a reliable profile. Could you share some of their writing, quotes, or key ideas? Even a few sentences or characteristic thoughts will work."

Build the profile only after receiving user-supplied material. Never guess or hallucinate a compiler's philosophy.

### Step 5 — Philosophical Profile Construction

For **each compiler** (positive and negative), build a structured profile. The profile has a **stable core** (independent of domain) and **domain tensions** that are instantiated fresh for the active session domain.

```
NAME: [identifier]
TYPE: positive | negative

# Stable — built once, reused across sessions
CORE VALUES: what they consider fundamental, non-negotiable
REASONING PATTERN: how they reach conclusions, what they distrust
STYLE: tone, register, density

# Dynamic — generated at session time, specific to the active domain
DOMAIN TENSIONS:
  - On [tension relevant to active domain]: they sided with [position] because [reason]
  - On [tension relevant to active domain]: they rejected [opposite pole] because [reason]
  (2–4 tensions is enough — more dilutes the verification power)

# Anchoring material — reference, not imitation
SOURCE MATERIAL:
  - [titles, articles, known quotes — used as anchor to verify the profile is grounded]
  - If user-supplied: include verbatim key phrases or passages here
```

The **domain tensions** are the primary verification tool. When checking output, the question is: *on the tensions relevant to this domain, where would this person have stood — and does the output respect that?*

`STYLE` is secondary and descriptive only — it is never used to imitate the compiler's voice.

These profiles become the **active sampling constraints** for the entire session. They are loaded into context *before* any generation request. The model generates from within this constrained distribution — not freely and then corrected.

### Step 6 — Constrained Generation + Final Coherence Check

> **CRITICAL DISTINCTION**: The compilers are not applied *after* generating. They are loaded as context constraints *before* generation begins. The generation happens within the restricted sampling space they define. What follows is a final coherence check — not the primary mechanism.

The goal is not imitation. The compilers are intellectual thresholds that define the valid region of the output space. The output should be content that a positive compiler could accept, engage with, or debate on its merits. The question is never "would Feynman write this?" but "would Feynman throw this in the bin?"

**Final coherence check** (after generation, before delivering):

1. **Positive compiler scan**: *could this person engage with this seriously — accept it, debate it, push back on details — without rejecting it as fundamentally dishonest, empty, or grotesque?*
2. **Negative compiler scan**: *does this resemble what I wanted to exclude — not in style, but in substance and intent?*
3. **Non-technical domain check**: *does this rely on "it sounds right" as its only ground? If so, tighten the sampling constraints and regenerate.*

If the output fails even after regeneration within tighter constraints, say so explicitly. The compilers are not a filter to bypass — they are the definition of the valid output space.

---

## Examples of Common Compilers

### Positive (reference only)
- **Nassim Taleb** — antifragility, distrust of the obvious, rigor against narrative fragility
- **Rory Sutherland** — oblique thinking, psychological vs rational value, demystification of mainstream logic
- **Richard Feynman** — radical clarity, rejection of empty jargon, intellectual honesty
- **Dieter Rams** — less but better, function before ornament, deep respect for the user
- **Paul Graham** — writing clarity as proxy for thinking clarity

### Negative (reference only)
- **€997-course marketer** — artificial scarcity, fear-based leverage, manufactured FOMO
- **McKinsey consultant** — dense jargon, obviousness dressed as insight, frameworks for frameworks
- **Funnel copywriter** — fake urgency, hyperbolic testimonials, impossible promises
- **Generic AI mode** — "Certainly!", bullet points where prose is needed, fake balance, no position taken

*These are examples only. Real compilers are always provided by the user per session.*

---

## Integration with Other Skills

This skill is **injectable** as a layer on top of any active skill. When used alongside any other operational skill:

1. The operational skill handles **structure and output** (HTML, quote, report)
2. `lateral-thinking` governs **tone, register, and philosophical coherence** of the content

Example — technical service company, client communication domain:
- Positive compilers: **Richard Feynman** (radical clarity, never obscures uncertainty), **Dieter Rams** (every word must earn its place, deep respect for the person receiving it)
- Negative compilers: **funnel copywriter** (fake reassurance, manufactured trust), **generic AI mode** (hollow empathy, formulaic comfort without substance)

The skill builds a full philosophical profile for each of these real figures and verifies output against them — not against a generic label like 'honest craftsman'.

---

## Note on the Mechanism

The model contains both the mainstream version and rarer but more valid versions of almost every concept in its training. Compilers do not invent anything — they **restrict the sampling space** toward distributions already present but less probable by default.

**This restriction is preventive, not corrective.** The compiler profiles are loaded as context before reasoning begins. They narrow the distribution from which the model draws. This is not a post-hoc quality check applied to an already-generated output — it is a prior constraint that shapes what gets generated in the first place.

The analogy to a code compiler is exact, but the direction matters: a compiler does not review finished code and suggest improvements. It defines what is valid *before* the code runs. The human compilers here work the same way — they define the valid sampling region, and generation stays within it.

In technical domains this selection happens automatically via formal rules. In non-technical domains it requires human reference — because objectivity in those domains does not exist in a formal system. It exists in the humanity of the people cited. The compilers are not decoration. They are the only available ground truth — and they operate upfront.

---

## Persistent Context — Project File

Once compilers are built and the domain is established, write everything to a single file inside the active project:

```
[project-root]/
└── .lateral-thinking/
    └── context.md
```

### context.md format

```markdown
# Lateral Thinking Context

## Domain
[domain name and short description of the specific task/project]

## Domain Risk
technical | non-technical
[one line note on why]

## Positive Compilers

### [Name]
- **Core values**: ...
- **Reasoning pattern**: ...
- **Style**: ...
- **Coherence triggers**: ...
- **Incoherence triggers**: ...
- **Domain relevance**: ...
- **Source material**: [built from training | user-supplied — quote key phrases here]

### [Name]
...

## Negative Compilers

### [Name]
- **Pattern to exclude**: ...
- **Style to avoid**: ...
- **Contamination signals**: ...

### [Name]
...

## Session Notes
[optional — observations from current or past sessions, refinements, edge cases found]
```

### Loading behavior

At activation, before asking anything:
1. Check if `[project-root]/.lateral-thinking/context.md` exists
2. If found — load it, summarize active compilers to the user, ask: *"I found an existing context for this project. Use it, update it, or start fresh?"*
3. If not found — run the full activation workflow (Steps 1–5), then write the resulting context to the file

### Writing behavior

After building profiles in a new session:
- Write `context.md` automatically
- Inform the user: *"I've saved the compiler context to `.lateral-thinking/context.md` — it will be available in future sessions."*

If the user supplies new material about a compiler during the session (quotes, writings, corrections), update the file before the session ends.

### Versioning note

`context.md` is a plain markdown file — it can be committed to git, edited by hand, or shared across collaborators working on the same project.

---

## Reference Files

- `references/profili_esempio.md` — Library of pre-built philosophical profiles for common compilers
- `references/domini.md` — Activation templates per application domain, including grotesque-risk assessment
