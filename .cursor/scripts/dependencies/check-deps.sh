# .cursor/scripts/dependencies/check-deps.sh
#!/bin/bash

CONFIG=".cursor/config/dependencies.yaml"
REPORT=".cursor/reports/dependency-analysis.md"

# Analyze dependency tree
npx depcheck | jq -r '
  .dependencies[] | 
  "High impact: \(.) (\(.size)), 
  Consider \(.alternatives), 
  Install: \(.installCmd)"' > "$REPORT"