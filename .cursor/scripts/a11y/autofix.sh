# .cursor/scripts/a11y/autofix.sh
#!/bin/bash

FILE="$1"
npm run a11y-autofix -- --file "$FILE" --rules color-contrast,aria-required-attr,image-alt