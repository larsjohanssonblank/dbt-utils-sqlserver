{% macro current_timestamp() %}
  {{ adapter_macro('dbt_utils_sqlserver.current_timestamp') }}
{% endmacro %}

{% macro default__current_timestamp() %}
    current_timestamp::{{dbt_utils_sqlserver.type_timestamp()}}
{% endmacro %}

{% macro bigquery__current_timestamp() %}
    current_timestamp
{% endmacro %}

{% macro sqlserver__current_timestamp() %}
    getdate()
{% endmacro %}



{% macro current_timestamp_in_utc() %}
  {{ adapter_macro('dbt_utils_sqlserver.current_timestamp_in_utc') }}
{% endmacro %}

{% macro default__current_timestamp_in_utc() %}
    {{dbt_utils_sqlserver.current_timestamp()}}
{% endmacro %}

{% macro snowflake__current_timestamp_in_utc() %}
    convert_timezone('UTC', {{dbt_utils_sqlserver.current_timestamp()}})::{{dbt_utils_sqlserver.type_timestamp()}}
{% endmacro %}

{% macro postgres__current_timestamp_in_utc() %}
    (current_timestamp at time zone 'utc')::{{dbt_utils_sqlserver.type_timestamp()}}
{% endmacro %}

{% macro sqlserver__current_timestamp_in_utc() %}
    getutcdate()
{% endmacro %}
	