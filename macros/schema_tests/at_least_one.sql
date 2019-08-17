{% macro test_at_least_one(model) %}

{% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}

select count(*) as errors
from (
    select

      count({{ column_name }}) as column_name

    from {{ model }}

    having count({{ column_name }}) = 0

) validation_errors

{% endmacro %}
