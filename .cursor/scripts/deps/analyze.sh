# .cursor/scripts/deps/analyze.sh
#!/bin/bash

FEATURE=$1
GRAPH_FLAG=${2:-false}

npx madge --circular --json src/features/$FEATURE/**/*.ts* > .cursor/deps.json

if [ "$GRAPH_FLAG" = "--graph" ]; then
  npx madge --image .cursor/deps.svg src/features/$FEATURE
  open .cursor/deps.svg
fi