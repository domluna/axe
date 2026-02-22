# Verification & Testing Guide

## Triggering Tests
Goal: Ensure the skill loads only when appropriate.
- **Positive Test:** "Help me set up a new project." (Should trigger Project skill).
- **Negative Test:** "What is the weather in London?" (Should NOT trigger Project skill).
- **Paraphrase Test:** "Initialize a workspace for my new app." (Should trigger Project skill).

## Functional Tests
Goal: Verify the skill produces the correct output.
- **Valid Output:** Does it generate the expected file/result?
- **Tool Integrity:** Are tool calls made with correct parameters?
- **Error Handling:** Does it react correctly when an API fails?

## Performance Comparison
Compare the "With Skill" vs. "Without Skill" experience:

| Metric | Without Skill | With Skill |
| :--- | :--- | :--- |
| **User Effort** | Multiple prompts/explanations | Single trigger phrase |
| **Interaction Cycles** | 10-15 back-and-forth | 1-3 targeted clarifications |
| **Success Rate** | Variable (depends on prompt) | High (embedded best practices) |
| **Token Efficiency** | Higher (repeated instructions) | Lower (progressive disclosure) |
