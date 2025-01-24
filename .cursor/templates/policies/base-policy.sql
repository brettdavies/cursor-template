# .cursor/templates/policies/base-policy.sql
create policy "{{policyName}}"
on {{table}} for {{operation}}
using (
  {{condition}}
);