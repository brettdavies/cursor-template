# .cursor/hooks/pre-commit.sh
#!/bin/bash

# Run state store validation
find . -name "*.store.ts" -exec .cursor/scripts/state/validate-store.sh {} \;

# Check a11y rules
git diff --name-only --cached | grep '\.tsx$' | xargs -I {} .cursor/scripts/a11y/check.sh {}