/*
This function has been tested with dateparts of month and quarters. Further
testing is required to validate that it will work on other dateparts.
*/

{% macro last_day(date, datepart) %}
  {{ adapter_macro('dbt_utils_sqlserver.last_day', date, datepart) }}
{% endmacro %}


{%- macro default_last_day(date, datepart) -%}
    cast(
        {{dbt_utils_sqlserver.dateadd('day', '-1',
        dbt_utils_sqlserver.dateadd(datepart, '1', dbt_utils_sqlserver.date_trunc(datepart, date))
        )}}
        as date)
{%- endmacro -%}


{% macro default__last_day(date, datepart) -%}
    {{dbt_utils_sqlserver.default_last_day(date, datepart)}}
{%- endmacro %}


{% macro postgres__last_day(date, datepart) -%}

    {%- if datepart == 'quarter' -%}
    {{ exceptions.raise_compiler_error(
        "dbt_utils_sqlserver.last_day is not supported for datepart 'quarter' on this adapter") }}
    {%- else -%}
    {{dbt_utils_sqlserver.default_last_day(date, datepart)}}
    {%- endif -%}

{%- endmacro %}


{% macro sqlserver__last_day(date, datepart) -%}

    {%- if datepart == 'quarter' -%}
    {{ exceptions.raise_compiler_error(
        "dbt_utils_sqlserver.last_day is not supported for datepart 'quarter' on this adapter") }}
    {%- elif datepart == 'month' -%}
        EOMONTH ( {{ date }})
    {%- elif datepart == 'year' -%}
        cast(cast(year({{ date }}) as varchar(4))  + '-12-31' as date) 
    {%- else -%}
    {{dbt_utils_sqlserver.default_last_day(date, datepart)}}
    {%- endif -%}

{%- endmacro %}