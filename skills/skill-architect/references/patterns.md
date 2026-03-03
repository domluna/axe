# Implementation Patterns for Gemini Skills

Use these patterns to structure complex workflows.

## 1. Sequential Orchestration
**Goal:** Ensure steps happen in a precise order with dependency management.
**Techniques:**
- Define step-by-step numbering.
- Explicitly state what data from Step N is needed for Step N+1.
- Provide "Rollback" or "Error Recovery" instructions for each step.

## 2. Iterative Refinement
**Goal:** High-quality output through a self-critique loop.
**Structure:**
1. **Drafting:** Generate the initial version.
2. **Critique:** Run a validation script or apply a rubric to identify issues (missing sections, formatting, errors).
3. **Refinement:** Address the identified issues.
4. **Finalization:** Apply final formatting and save.

## 3. Context-aware Selection (The Decision Tree)
**Goal:** Dynamic behavior based on input.
**Example:**
- If file size > 10MB -> Use Cloud Storage.
- If file type is CSV -> Use Data Analysis tool.
- If user intent is "Quick" -> Skip optional validation.

## 4. Multi-MCP Coordination
**Goal:** Seamless integration across disparate tools (e.g., Jira + GitHub + Slack).
**Techniques:**
- Use a "Manifest" to track state across different tools.
- Centralize error handling so a failure in one service provides a meaningful recovery path in the overall workflow.

## 5. Domain-specific Intelligence
**Goal:** Adding value beyond what a tool can do on its own.
**Example:**
- A "Financial Compliance" skill doesn't just call a payment tool; it checks the transaction against a list of blocked jurisdictions and risk levels *before* calling the tool.
