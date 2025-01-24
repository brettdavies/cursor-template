# .cursor/scripts/performance/collect-metrics.sh
#!/bin/bash

METRICS_DIR=".cursor/performance/history"
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Collect core metrics
bundleSize=$(du -sk dist/ | cut -f1)
lcp=$(curl -s https://api.speedtracker.com/v1/metrics | jq '.lcp')
dbQueryTime=$(pg_stat_activity | awk '{print $3}')

# Store with retention levels
jq -n \
  --argjson bundle "$bundleSize" \
  --argjson lcp "$lcp" \
  --argjson db "$dbQueryTime" \
  '{bundleSize: $bundle, lcp: $lcp, dbQueryTime: $db}' > "$METRICS_DIR/L1D/$TIMESTAMP.json"