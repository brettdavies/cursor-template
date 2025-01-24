# .cursor/templates/commit-message.tpl
{% if breaking %}BREAKING CHANGE: {% endif %}{{type}}{% if scope %}({{scope}}){% endif %}: {{summary}}
{% if featureId %}<!-- FeatureID: {{featureId}} -->{% endif %}

{% for change in changes %}- {{ change }}
{% endfor %}
{% if breaking %}

Breaking changes:
- {{ breaking }}
{% endif %}
