# .cursor/scripts/output/handler.sh
#!/bin/bash

DRY_RUN=${1:-false}

if [ "$DRY_RUN" = "--dry-run" ]; then
  cat -
else
  tee .idea/git_changes.tmp >/dev/null
fi