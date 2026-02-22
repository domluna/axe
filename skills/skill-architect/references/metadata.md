# Advanced Skill Metadata

Professional skills should utilize these optional YAML fields in the frontmatter for better discoverability and management.

## Field Reference

| Field | Purpose | Example |
| :--- | :--- | :--- |
| `author` | Identify the creator or team. | `author: Engineering Ops` |
| `version` | Track iterations. | `version: 1.2.0` |
| `license` | Define usage rights (MIT, Apache-2.0). | `license: MIT` |
| `category` | Group for organization. | `category: productivity` |
| `tags` | Searchable keywords. | `tags: [git, code-review, automation]` |
| `compatibility` | Define required environment/tools. | `compatibility: "Requires Node.js v20+"` |
| `allowed-tools` | Explicitly list required MCP tools. | `allowed-tools: ["github:*", "slack:*"]` |
| `documentation` | Link to external deep-dive docs. | `documentation: https://docs.example.com` |

## Example Professional Frontmatter

```yaml
---
name: security-auditor
description: Audits codebase for vulnerabilities. Use when checking PRs or before a release. Capabilities include dependency scanning and static analysis.
author: Security Team
version: 2.1.0
license: MIT
category: security
tags: [audit, vuln-scan, security]
allowed-tools: ["shell:run", "github:comment"]
---
```
