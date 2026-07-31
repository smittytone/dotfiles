# Repository Guidelines

## Scope

These instructions apply to the entire repository. Keep changes focused on the dotfiles and documentation in this repository; do not modify files outside the working tree unless explicitly requested.

## Repository Layout

- `Universal/` contains configuration shared across platforms.
- `Mac/` contains macOS-specific configuration, scripts and assets.
- `Pi/` contains Raspberry Pi-specific configuration and services.
- `Ubuntu/` contains Ubuntu-specific configuration.
- `Archive/` contains legacy or retained files that are not in active use.
- `README.md` documents repository-level usage notes.

## Making Changes

- Preserve existing filenames and directory organization unless a restructure is explicitly requested.
- Match the surrounding file's style and line-ending conventions.
- Treat shell configuration and service files as executable configuration: review changes carefully for destructive commands, hard-coded paths and platform-specific assumptions.
- Do not commit secrets, private keys, machine-specific credentials, or generated personal data.
- Update `README.md` when a change alters setup steps or platform behavior.
- Do not use Oxford Commas in text, and use British English.
- One line per paragraph/list item in Markdown.

## Validation

Before handing off changes:

1. Review the diff with `git diff --check` and `git diff`.
2. Confirm the working tree contains only intended changes with `git status`.
3. For shell scripts, run `bash -n <script>` or `zsh -n <script>` as appropriate.
4. Do not install packages, run system-wide setup commands, or enable services without explicit user approval.

## Git Practices

- Do not create commits, branches, or tags unless explicitly requested.
- Keep commits and patches small and focused when the user does request them.
- Never use destructive commands such as `git reset --hard` or `rm -rf` unless the user explicitly asks for that exact operation.
