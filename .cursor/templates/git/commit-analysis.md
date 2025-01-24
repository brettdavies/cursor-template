# .cursor/templates/commit-analysis.md

Analyze the git changes and generate a commit message following these guidelines:

## Commit Types

1. **feat**: New feature
2. **fix**: Bug fix
3. **docs**: Documentation changes
4. **style**: Code style/formatting (non-functional)
5. **refactor**: Code restructuring
6. **test**: Test-related changes
7. **chore**: Maintenance tasks

## Rules

- Use multiple scopes when applicable: `feat(auth,ui): message`
- Group related changes by feature
- Detect breaking changes (prefix with `BREAKING CHANGE:`)
- Reference Supabase migrations if present
- Follow Conventional Commits specification
