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

Create `/tmp/opencode-reports` if it does not already exist.

### Explicit Report Path Takes Precedence

If the task prompt explicitly specifies a completion-report path, use that exact path.

When an explicit report path is supplied:

- write the report only to that requested path
- overwrite the existing file at that path if one exists
- do not additionally create the automatic `<project-slug>-last.md` report
- do not derive another report filename from the repository, Git remote, package name, or directory
- the explicitly requested path completely overrides automatic report naming

Example:

If the task specifies:

`/tmp/opencode-reports/langlife-api-foundation-last.md`

write only:

`/tmp/opencode-reports/langlife-api-foundation-last.md`

Do not also create:

`/tmp/opencode-reports/langlife-api-last.md`

or any origin-derived or repository-derived report.

### Automatic Report Path

If the task prompt does not explicitly specify a report path, store the report at:

`/tmp/opencode-reports/<project-slug>-last.md`

### Project Slug

Determine `<project-slug>` from the Git repository's filesystem location.

Never derive the project slug from:

- the Git `origin` remote
- any other Git remote
- a GitHub repository name
- a package/composer/npm name
- historical repository names
- deployment names

Resolve the repository root with:

`git rev-parse --show-toplevel`

Then derive the project slug using the following rules.

#### Nested Application Repositories

If the Git repository root directory basename is one of:

- `api`
- `ui`
- `android`

combine the parent directory basename with the repository root basename.

Examples:

- `~/code/langlife/api` -> `langlife-api`
- `~/code/langlife/ui` -> `langlife-ui`
- `~/code/langlife/android` -> `langlife-android`

This filesystem-derived name is authoritative even if the Git remote still uses an old or historical repository name such as `ocr-capture-server`.

#### Ordinary Repositories

For other repositories, use the Git repository root directory basename.

Examples:

- `~/code/castcue` -> `castcue`
- `~/code/jvequipment` -> `jvequipment`
- `~/code/poopy-pickup` -> `poopy-pickup`

Normalize the resulting slug by:

- converting to lowercase
- replacing spaces with hyphens
- replacing runs of unsupported punctuation or separators with a single hyphen
- trimming leading or trailing hyphens

Do not inspect Git remotes merely to determine the report slug.

### Report Behavior

- Overwrite the existing report at the selected path after each substantive task.
- Do not create timestamped reports unless explicitly requested.
- Write the report after implementation and verification so it reflects the final state.
- If a task is blocked, stopped by a research gate, or intentionally not implemented, still write the report and clearly explain the result.
- The report should match the substance of the normal final response.
- Use Markdown.
- Completion reports live outside the repository and must never be added to Git.
- Do not create duplicate completion reports for the same task.

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
