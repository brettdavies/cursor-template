# .cursor/scripts/types/migrate.sh
#!/bin/bash

TYPE=$1
FROM=$2
TO=$3
FORCE=${4:-false}

# Safety checks
if [ "$FORCE" = "--force" ]; then
  cursor --replace-imports "$FROM/$TYPE" "$TO/$TYPE"
  mv "$FROM/$TYPE.ts" "$TO/$TYPE.ts"
else
  cursor --verify "type $TYPE exists at $FROM" && \
  cursor --confirm "Migrate $TYPE from $FROM to $TO?" && \
  cursor --replace-imports "$FROM/$TYPE" "$TO/$TYPE"
  mv "$FROM/$TYPE.ts" "$TO/$TYPE.ts"
fi

tsc --noEmit