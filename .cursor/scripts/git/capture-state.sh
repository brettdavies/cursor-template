# .cursor/scripts/git/capture-state.sh
#!/bin/bash

ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || { echo "ERR_NOT_GIT_REPO"; exit 1; }
cd "$ROOT" || exit 1

DIRS=${1:-.}
VALID_DIRS=$(find . -maxdepth 1 -type d -exec basename {} \; | grep -v '^\.')

if [ "$DIRS" != "." ]; then
  for dir in ${DIRS//,/ }; do
    if [[ ! "$VALID_DIRS" =~ (^|[[:space:]])"$dir"($|[[:space:]]) ]]; then
      echo "ERR_INVALID_DIR: $dir"
      exit 1
    fi
  done
fi

git diff -- "$DIRS" > .idea/_gitdiff.tmp || exit 1
git status --porcelain=v1 -- "$DIRS" >> .idea/_gitdiff.tmp || exit 1