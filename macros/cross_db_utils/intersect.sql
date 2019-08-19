{% macro intersect() %}
  {{ adapter_macro('dbt_utils_sqlserver.intersect') }}
{% endmacro %}


{% macro default__intersect() %}

    intersect

{% endmacro %}

{% macro bigquery__intersect() %}

    intersect distinct

{% endmacro %}
