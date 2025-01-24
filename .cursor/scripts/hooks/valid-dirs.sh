# .cursor/scripts/hooks/valid-dirs.sh
#!/bin/bash

find . -maxdepth 1 -type d -exec basename {} \; | grep -v '^\.'