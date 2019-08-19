
-- how can we test this better?
select
    {{ dbt_utils_sqlserver.current_timestamp() }} as actual,
    {{ dbt_utils_sqlserver.current_timestamp() }} as expected

