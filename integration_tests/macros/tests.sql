
{% macro test_assert_equal(model, actual, expected) %}

select count(*) as rows from {{ model }} where {{ actual }} <> {{ expected }}

{% endmacro %}


{% macro test_not_empty_string(model, arg) %}

{% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}

select count(*) as rows from {{ model }} where {{ column_name }} = ''

{% endmacro %}
