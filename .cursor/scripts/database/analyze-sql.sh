# .cursor/scripts/database/analyze-sql.sh
#!/bin/bash

SQL_FILE="$1"
CONFIG=".cursor/config/database.yaml"

# Run query analysis
EXPLAIN_OUTPUT=$(psql -c "EXPLAIN ANALYZE $(cat "$SQL_FILE")")

# Check index coverage
if ! grep -q "Index Scan" <<< "$EXPLAIN_OUTPUT"; then
  echo "MISSING_INDEX: Consider adding index for $(basename "$SQL_FILE")"
fi

# Cost validation
MAX_COST=$(yq '.queryRules.explainAnalysis.maxCost' "$CONFIG")
ACTUAL_COST=$(grep -oP 'cost=\K\d+\.\d+' <<< "$EXPLAIN_OUTPUT")

if (( $(echo "$ACTUAL_COST > $MAX_COST" | bc -l) )); then
  echo "HIGH_COST: Query exceeds maximum allowed cost ($MAX_COST)"
fi