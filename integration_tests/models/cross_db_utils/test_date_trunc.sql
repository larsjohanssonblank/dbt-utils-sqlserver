
with data as (

    select * from {{ ref('data_date_trunc') }}

)

{% if target.type == 'sqlserver' %}
	select
	    {{dbt_utils_sqlserver.date_trunc('day', 'updated_at') }} as actual,
	    day(day) as expected

	from data

	union all

	select
	    {{ dbt_utils_sqlserver.date_trunc('month', 'updated_at') }} as actual,
	    month(month) as expected

	from data

{% else %}
	select
	    cast({{dbt_utils_sqlserver.date_trunc('day', 'updated_at') }} as date) as actual,
	    day as expected

	from data

	union all

	select
	    cast({{ dbt_utils_sqlserver.date_trunc('month', 'updated_at') }} as date) as actual,
	    month as expected

	from data
{% endif %}