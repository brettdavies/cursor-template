# .cursor/scripts/a11y/check.sh
#!/bin/bash

FILE="$1"
SEVERITY=$(jq -r '.failureSeverity' .cursor/config/a11y.json)

npx a11y-checker "$FILE" --standard WCAG2AA --error-level "$SEVERITY"