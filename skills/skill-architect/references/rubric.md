# Skill Quality Rubric

Use this checklist to audit a skill. Score each section from 1-5.

## 1. Structure & Naming
- [ ] Folder name is `kebab-case`.
- [ ] `SKILL.md` is named exactly (case-sensitive).
- [ ] No `README.md` inside the skill folder (use `references/` instead).
- [ ] Follows the Three-Level structure (Progressive Disclosure).

## 2. YAML Frontmatter (The Signal)
- [ ] Description follows: `[What it does] + [When to use it] + [Capabilities]`.
- [ ] No XML tags (`< >`) used.
- [ ] Description is under 1024 characters.
- [ ] Includes specific trigger phrases users actually say.
- [ ] (Advanced) Includes `author`, `version`, `category`, and `tags`.

## 3. Instructional Design (The Engine)
- [ ] Steps are numbered and actionable.
- [ ] Critical instructions are at the top (not buried).
- [ ] Explicit "Validation Gates" exist before tool calls.
- [ ] Includes "Combat Laziness" prompts for high-stakes steps.
- [ ] Uses a recognized Pattern (Sequential, Iterative, etc.).

## 4. Error Handling & Reliability
- [ ] Contains a "Common Issues" or "Troubleshooting" section.
- [ ] Provides clear recovery paths for tool/API failures.
- [ ] Includes "Negative Triggers" to prevent over-triggering.

## 5. Token Efficiency
- [ ] `SKILL.md` is focused on core logic, not static docs.
- [ ] Detailed references are linked/referenced but not inlined.
- [ ] No redundant "chitchat" or conversational filler in instructions.
