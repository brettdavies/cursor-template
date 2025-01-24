# .cursor/scripts/voiceover/run-simulation.sh
#!/bin/bash

TEST_FILE="$1"
npx playwright test "$TEST_FILE" --grep "tab-order|escape-key|arrow-navigation"