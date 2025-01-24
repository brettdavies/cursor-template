# .cursor/scripts/supabase/gen-rls.sh
#!/bin/bash

FEATURE=$1
TABLE=${2:-$FEATURE}

ANALYSIS=$(cursor --analyze "src/features/$FEATURE/services/*.ts")
POLICIES=$(echo "$ANALYSIS" | cursor --template .cursor/templates/policies/base-policy.sql)

echo "$POLICIES" | tee "supabase/migrations/$(date +%Y%m%d)_rls_$FEATURE.sql"