{{config( materialized = 'table')}}


{% if target.type == 'snowflake' %}

    {% set tables = dbt_utils_sqlserver.get_tables_by_prefix((target.schema | upper), 'data_events_') %}
    {{ dbt_utils_sqlserver.union_tables(tables) }}
    
{% else %}

    {% set tables = dbt_utils_sqlserver.get_tables_by_prefix(target.schema, 'data_events_') %}
    {{ dbt_utils_sqlserver.union_tables(tables) }}

{% endif %}
