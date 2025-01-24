# .cursor/scripts/bundles/analyze-bundles.sh
#!/bin/bash

REPORT_DIR=".cursor/reports/bundles"
CONFIG=".cursor/config/bundles.yaml"

# Generate size analysis
npx source-map-explorer dist/*.js --html "$REPORT_DIR/report.html" --json "$REPORT_DIR/stats.json"

# Check third-party sizes
jq -r '.results[] | select(.name | test("node_modules"))' "$REPORT_DIR/stats.json" | \
while read -r mod; do
  pkg=$(echo "$mod" | jq -r '.name')
  size=$(echo "$mod" | jq -r '.size')
  
  if [ "$size" -gt $(yq '.sizeLimits.thirdParty.criticalThreshold' "$CONFIG") ]; then
    echo "CRITICAL: $pkg - ${size}KB"
  elif [ "$size" -gt $(yq '.sizeLimits.thirdParty.warningThreshold' "$CONFIG") ]; then
    echo "WARNING: $pkg - ${size}KB"
  fi
done