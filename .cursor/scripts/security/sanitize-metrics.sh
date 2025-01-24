# .cursor/scripts/security/sanitize-metrics.sh
#!/bin/bash

RAW_FILE="$1"
SANITIZED_FILE="$2"
CONFIG=".cursor/config/security.yaml"

# Remove sensitive fields
jq 'del('"$(yq '.dataHandling.metricSanitization.excludeFields' "$CONFIG" | jq -R 'split(",")')"')' \
  "$RAW_FILE" > "$SANITIZED_FILE"

# Hash specified fields
while read -r field; do
  jq ".[\"$field\"] = (.[\"$field\"] | sha256)" "$SANITIZED_FILE" > tmp.json
  mv tmp.json "$SANITIZED_FILE"
done < <(yq '.dataHandling.metricSanitization.hashFields[]' "$CONFIG")