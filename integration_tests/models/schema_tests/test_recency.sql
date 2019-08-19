
{% if target.type == 'postgres' %}

select
    {{ dbt_utils_sqlserver.date_trunc('day', dbt_utils_sqlserver.current_timestamp()) }} as today

{% elif target.type == 'sqlserver' %}

select
	{{  dbt_utils_sqlserver.current_timestamp() }} as today

{% else %}

select
    cast({{ dbt_utils_sqlserver.date_trunc('day', dbt_utils_sqlserver.current_timestamp()) }} as datetime) as today
    
{% endif %}
