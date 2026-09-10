# Global OpenCode Instructions

## General Working Style

- Inspect the existing project before making substantive changes.
- Preserve existing architecture, conventions, naming, and behavior unless the task explicitly requires changing them.
- Prefer the smallest clean implementation that solves the requested problem.
- Do not introduce unnecessary dependencies, frameworks, abstractions, or architectural layers.
- Do not refactor unrelated code merely because an opportunity appears while working on another task.
- Keep scope tightly aligned with the user's request.
- If a requested implementation conflicts with existing behavior, data contracts, architecture, or technical limitations, explain the conflict before changing behavior.
- When research is required before implementation, complete the research gate first and clearly report the result before editing.
- Do not silently invent assumptions when they materially affect implementation.

## Verification

After making changes, run the tests, build, lint, formatting, type checks, or other verification commands appropriate for the project.

Prefer existing project verification commands and conventions.

When applicable, also run:

`git diff --check`

Do not claim verification succeeded unless the relevant command actually ran successfully.

If verification cannot be completed, clearly state what was not verified and why.

## Git Safety

- Do not commit changes unless explicitly asked.
- Do not push changes unless explicitly asked.
- Do not discard, reset, overwrite, or revert existing user changes unless explicitly asked.
- Treat pre-existing modified and untracked files as user work that must be preserved.
- Do not use destructive Git commands merely to simplify the worktree.
- Clearly distinguish files changed by the current task from pre-existing worktree changes when relevant.

## Task Completion Reports

For every substantive completed task in every project, write a Markdown completion report in addition to the normal final response.

Store the report at:

`/tmp/opencode-reports/<project-slug>-last.md`

Create `/tmp/opencode-reports` if it does not already exist.

### Project Slug

Determine `<project-slug>` from the Git repository's `origin` remote repository name whenever possible.

Do NOT derive the project slug merely from the current directory name.

Examples:

- `git@github.com:electronbabies/CastCue.git` -> `castcue`
- `https://github.com/electronbabies/CastCue.git` -> `castcue`
- `git@github.com:electronbabies/langlife-api.git` -> `langlife-api`
- A checkout located at `~/code/langlife/api` whose origin repository is `langlife-api.git` -> `langlife-api`

Normalize the repository name by:

- removing a trailing `.git`
- converting to lowercase
- replacing non-alphanumeric separators with hyphens where appropriate

If the repository has no `origin` remote, fall back to the Git repository root directory name and normalize it the same way.

### Report Behavior

- Overwrite the project's existing `-last.md` report after each substantive task.
- Do not create timestamped reports unless explicitly requested.
- Write the report after implementation and verification so it reflects the final state.
- If a task is blocked, stopped by a research gate, or intentionally not implemented, still write the report and clearly explain the result.
- The report should match the substance of the normal final response.
- Use Markdown.

### Report Contents

Include the following sections when applicable:

- Summary of work performed
- Files changed
- Important implementation decisions
- Tests/checks run and their results
- Unresolved issues or caveats
- Manual testing instructions
- Physical-device testing instructions
- Deliberately deferred follow-up work

Keep reports useful for reviewing the task later. Include important implementation details and verification results, but do not fill them with internal reasoning or unnecessary narration.
