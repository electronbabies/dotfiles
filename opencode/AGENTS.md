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

## Completion Reports

For every substantive completed task in every project, write a Markdown completion report in addition to the normal final response.

Completion reports live outside project repositories and must never be added to Git.

Use the shared reports directory:

`~/code/reports/`

Every project must have its own project-specific subdirectory under this shared reports directory.

Examples:

- `~/code/reports/langlife-api/`
- `~/code/reports/langlife-ui/`
- `~/code/reports/langlife-android/`
- `~/code/reports/castcue/`
- `~/code/reports/cooking-app/`
- `~/code/reports/jvequipment/`

Create the shared reports directory and the required project-specific subdirectory if they do not already exist.

Never place project completion reports directly in:

`~/code/reports/`

Do not use generic filenames such as:

- `latest.md`
- `last.md`
- `report.md`
- `status.md`
- `completion.md`

Multiple projects and workflows may be running concurrently. Every automatic report filename must therefore identify the task or workflow clearly within its project-specific directory.

### Explicit Report Path Takes Precedence

If the task prompt explicitly specifies a completion-report path, use that exact path.

When an explicit report path is supplied:

- write the report only to that requested path
- create its parent directory if necessary
- overwrite the existing file at that path if one exists
- do not additionally create an automatic report
- do not derive another report filename from the repository, Git remote, package name, task name, or date
- the explicitly requested path completely overrides automatic report naming

Example:

If the task specifies:

`~/code/reports/langlife-ui/local-alpha-readiness-2026-10-05.md`

write only:

`~/code/reports/langlife-ui/local-alpha-readiness-2026-10-05.md`

Do not also create another automatic report.

### Automatic Report Path

If the task prompt does not explicitly specify a completion-report path, write the report to:

`~/code/reports/<project-slug>/<task-slug>-<YYYY-MM-DD>.md`

Examples:

`~/code/reports/langlife-ui/local-alpha-readiness-2026-10-05.md`

`~/code/reports/cooking-app/private-alpha-2026-10-10.md`

This is a project-separated shared reporting structure.

Do not create project reports directly in `~/code/reports/`.

Do not create per-project `latest.md` files.

### Project Slug

Determine `<project-slug>` from the project's filesystem location.

Never derive the project slug from:

- the Git `origin` remote
- any other Git remote
- a GitHub repository name
- a package/composer/npm name
- historical repository names
- deployment names

When working inside a Git repository, resolve the repository root with:

`git rev-parse --show-toplevel`

Then derive the project slug using the following rules.

#### Nested Application Repositories

If the Git repository root directory basename is one of:

- `api`
- `ui`
- `web`
- `android`

combine the parent directory basename with the repository root basename when that repository represents an independently tracked application.

Examples:

- `~/code/langlife/api` -> `langlife-api`
- `~/code/langlife/ui` -> `langlife-ui`
- `~/code/langlife/android` -> `langlife-android`

This filesystem-derived name is authoritative even if the Git remote still uses an old or historical repository name such as `ocr-capture-server`.

#### Shared Multi-Application Workspaces

If the task is being performed from a shared project root containing multiple sibling applications and the task spans that project as a whole, use the shared project directory basename rather than arbitrarily selecting one nested repository.

Examples:

- `~/code/cooking-app/` containing `api/` and `web/` -> `cooking-app`
- `~/code/langlife/` when a workflow intentionally spans multiple LangLife applications -> `langlife`

This applies even if the shared project root itself is not a Git repository.

A cross-application task must not be named after whichever nested Git repository happens to be discovered first.

#### Ordinary Repositories

For other repositories, use the Git repository root directory basename.

Examples:

- `~/code/castcue` -> `castcue`
- `~/code/jvequipment` -> `jvequipment`
- `~/code/poopy-pickup` -> `poopy-pickup`
- `~/code/langlife/marketing-sol` -> `marketing-sol`

#### Non-Git Project Directories

If the current task clearly operates on a project directory that is not itself a Git repository and no more specific repository identity applies, use that project directory's basename.

Example:

- `~/code/cooking-app` -> `cooking-app`

Do not fail report creation merely because the project root is not a Git repository.

Normalize the resulting slug by:

- converting to lowercase
- replacing spaces with hyphens
- replacing runs of unsupported punctuation or separators with a single hyphen
- trimming leading or trailing hyphens

Do not inspect Git remotes merely to determine the report slug.

### Task Slug

Determine `<task-slug>` from the actual task being performed.

The task slug should be short but specific enough to distinguish the report from other concurrent or historical workflows in the same project.

Good examples:

- `local-alpha-runtime`
- `local-alpha-readiness`
- `private-alpha`
- `session-expiry-fix`
- `capture-integration`
- `remote-spot-ux`
- `staging-deployment`
- `api-contract-audit`
- `android-device-readiness`

Avoid vague task slugs such as:

- `update`
- `work`
- `changes`
- `task`
- `fixes`
- `status`
- `latest`

Prefer terminology from the task prompt when it contains a clear workflow or milestone name.

Normalize the task slug using the same rules as the project slug:

- lowercase
- spaces become hyphens
- unsupported punctuation/separators collapse to one hyphen
- trim leading and trailing hyphens

### Report Date

Use the local calendar date on which the task is completed in:

`YYYY-MM-DD`

format.

Example:

`2026-10-05`

The date is part of the filename for identification and history. Do not add timestamps unless the task explicitly requests them.

### Filename Examples

Examples of correct automatic report paths:

- `~/code/reports/langlife-api/local-alpha-runtime-2026-10-05.md`
- `~/code/reports/langlife-ui/local-alpha-readiness-2026-10-05.md`
- `~/code/reports/langlife-android/device-readiness-2026-10-05.md`
- `~/code/reports/castcue/remote-spot-ux-2026-10-05.md`
- `~/code/reports/marketing-sol/browser-verification-2026-10-05.md`
- `~/code/reports/cooking-app/private-alpha-2026-10-10.md`

The filename must make sense when viewed inside its project directory.

A reviewer should be able to identify both the project and workflow from the directory path and filename without opening the report.

### Parallel and Repeated Tasks

Assume multiple OpenCode sessions may be operating concurrently.

Therefore:

- never use a shared `latest.md` or `<project>-last.md` file
- never overwrite another workflow's report
- different tasks in the same project must use different task slugs
- reports from different projects must always live in different project directories
- do not write one project's report into another project's report directory

If the same project/task workflow is intentionally rerun on the same calendar date, do not silently overwrite an existing automatic report unless it is clearly the continuation or replacement of that exact workflow.

When a same-day filename collision represents a genuinely separate run, append a short distinguishing suffix derived from the task, such as:

- `-verification`
- `-rerun`
- `-followup`
- `-post-fix`

Examples:

- `~/code/reports/cooking-app/private-alpha-2026-10-10-followup.md`
- `~/code/reports/langlife-api/staging-deployment-2026-10-05-post-fix.md`

Do not use meaningless numeric suffixes unless no meaningful distinction exists.

### Report Behavior

- Write the report after implementation and verification so it reflects the final state.
- If a task is blocked, stopped by a research gate, or intentionally not implemented, still write the report and clearly explain the result.
- The report should match the substance of the normal final response.
- Use Markdown.
- Completion reports live outside the repository and must never be added to Git.
- Do not create duplicate completion reports for the same task.
- Do not create a second temporary completion report in `/tmp` when the normal report has been written under `~/code/reports/<project-slug>/`.
- Use `/tmp` only for disposable logs, diffs, scratch artifacts, temporary test configuration, isolated indexes, and other ephemeral task files unless the task explicitly requests otherwise.
- When reporting completion to the user, include the exact completion-report path.

### Report Contents

Include the following sections when applicable:

- Repository/project identity and filesystem path
- Task/workflow name
- Summary of work performed
- Starting state when relevant
- Files changed
- Important implementation decisions
- Database/schema/data changes
- Runtime/process verification
- Tests/checks run and their actual results
- Unresolved issues or caveats
- Manual testing instructions
- Physical-device testing instructions
- Deliberately deferred follow-up work
- Final Git working-tree state
- Full Git diff or concise diff summary when relevant

For repository identity, include the actual filesystem repository or workspace path when useful.

Examples:

`Repository: /home/electronbabies/code/langlife/ui`

`Workspace: /home/electronbabies/code/cooking-app`

Keep reports useful for reviewing the task later. Include important implementation details and verification results, but do not fill them with internal reasoning or unnecessary narration.
