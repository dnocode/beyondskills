#!/usr/bin/env bash
# PreToolUse (Write|Edit|NotebookEdit): se la sessione è in un worktree chiamato explore-*
# (.claude/worktrees/explore-*), permette di scrivere solo sotto <worktree>/docs/explorations/.
# Altrove non fa nulla.
# ponytail: non copre scritture via Bash (redirect, sed -i); per quelle serve negare Bash o un sandbox.
in=$(cat)
cwd=$(jq -r '.cwd // empty' <<<"$in"); [ -n "$cwd" ] || exit 0
top=$(git -C "$cwd" rev-parse --show-toplevel 2>/dev/null) || exit 0
case "$top" in */.claude/worktrees/explore-*) ;; *) exit 0 ;; esac
f=$(jq -r '.tool_input.file_path // .tool_input.notebook_path // empty' <<<"$in"); [ -n "$f" ] || exit 0
case "$f" in
  "$top"/docs/explorations/*) exit 0 ;;
  *) echo "dev-rail: sessione di esplorazione, scrittura vietata fuori da docs/explorations/ ($f)" >&2; exit 2 ;;
esac
