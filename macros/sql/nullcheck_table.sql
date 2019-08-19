{% macro nullcheck_table(relation) %}

  {%- do dbt_utils_sqlserver._is_relation(relation, 'nullcheck_table') -%}
  {% set cols = adapter.get_columns_in_relation(relation) %}

  select {{ dbt_utils_sqlserver.nullcheck(cols) }}
  from {{relation}}
  
{% endmacro %}
