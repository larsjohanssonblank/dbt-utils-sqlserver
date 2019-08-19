{% macro log_info(message) %}

    {{ log(dbt_utils_sqlserver.pretty_log_format(message), info=True) }}

{% endmacro %}
