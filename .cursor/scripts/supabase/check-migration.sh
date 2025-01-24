# .cursor/scripts/supabase/check-migration.sh
#!/bin/bash

ROOT=$(git rev-parse --show-toplevel 2>/dev/null) || exit 0
cd "$ROOT" || exit 0

if grep -q 'supabase/migrations' .idea/_gitdiff.tmp; then
  LATEST_MIGRATION=$(ls supabase/migrations | sort -r | head -n 1 | cut -d'_' -f1)
  if [ "$LATEST_MIGRATION" != "$(date +%Y%m%d)" ]; then
    echo "ERR_MISSING_MIGRATION: No Supabase migration for today's changes"
    exit 1
  fi
fi