# .cursor/templates/security/rls-policy.sql
/* Requires security team review - {{reviewer}} */
create policy "{{policyName}}"
on {{tableName}} for {{operation}}
using ({{condition}});
