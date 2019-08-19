
with data as (

    select * from {{ ref('data_surrogate_key') }}

)

select
    {{ dbt_utils_sqlserver.surrogate_key('field_1', 'field_2', 'field_3') }} as actual,
    expected

from data
