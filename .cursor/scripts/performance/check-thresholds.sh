# .cursor/scripts/performance/check-thresholds.sh
#!/bin/bash

CONFIG=".cursor/config/performance.yaml"

critical_bundle=$(yq '.thresholds.critical.bundleSize' "$CONFIG" | numfmt --from=iec)
warning_bundle=$(yq '.thresholds.warning.bundleSize' "$CONFIG" | numfmt --from=iec)

current_size=$(du -sk dist/ | cut -f1)

if [ "$current_size" -ge "$critical_bundle" ]; then
  echo "CRITICAL: Bundle size exceeded ${critical_bundle}KB"
  exit 2
elif [ "$current_size" -ge "$warning_bundle" ]; then
  echo "WARNING: Bundle size approaching limit"
  exit 1
fi