# .cursor/scripts/state/validate-store.sh
#!/bin/bash

FILE="$1"

# Check for required patterns
grep -q "interface State {" "$FILE" || echo "Missing State interface"
grep -q "create() {" "$FILE" || echo "Missing Zustand create function"
grep -q "SubscribeForTesting()" "$FILE" || echo "Missing test subscription method"

# Check forbidden patterns
grep -q "document\." "$FILE" && echo "Forbidden DOM reference"
grep -q "className=" "$FILE" && echo "UI logic in store"