
with data as (

    select * from {{ ref('data_safe_cast') }}

)

select
    {{ dbt_utils_sqlserver.safe_cast('field', dbt_utils_sqlserver.type_string()) }} as actual,
    output as expected

from data
