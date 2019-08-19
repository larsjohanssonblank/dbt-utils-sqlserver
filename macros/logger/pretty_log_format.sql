{% macro pretty_log_format(message) %}

    {{ return( dbt_utils_sqlserver.pretty_time() ~ ' + ' ~ message) }}

{% endmacro %}
