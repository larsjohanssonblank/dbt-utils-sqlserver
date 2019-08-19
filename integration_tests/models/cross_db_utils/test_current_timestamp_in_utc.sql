
-- how can we test this better?
select
    {{ dbt_utils_sqlserver.current_timestamp_in_utc() }} as actual,
    {{ dbt_utils_sqlserver.current_timestamp_in_utc() }} as expected