#!/usr/bin/env bash
# Verifica minima dell'hook: `bash hooks/test-explore-guard.sh`
h="$(cd "$(dirname "$0")" && pwd)/explore-guard.sh"
t=$(cd -P "$(mktemp -d)" && pwd); trap 'rm -rf "$t"' EXIT
git -C "$t" init -q && git -C "$t" commit -q --allow-empty -m i
wt="$t/.claude/worktrees/explore-x"; mkdir -p "$t/.claude/worktrees"
git -C "$t" worktree add -q --detach "$wt"
run() { jq -nc --arg c "$1" --arg f "$2" '{cwd:$c,tool_input:{file_path:$f}}' | "$h" 2>/dev/null; echo $?; }
[ "$(run "$wt" "$wt/docs/explorations/a.md")" = 0 ] || { echo FAIL dentro; exit 1; }
[ "$(run "$wt" "$wt/src/A.java")" = 2 ]            || { echo FAIL fuori;  exit 1; }
[ "$(run "$wt" "$t/docs/roadmap.md")" = 2 ]        || { echo FAIL principale; exit 1; }
[ "$(run "$t" "$t/src/A.java")" = 0 ]              || { echo FAIL sessione normale; exit 1; }
echo OK
