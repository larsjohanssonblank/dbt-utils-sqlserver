{% if dbt_utils.pretty_time() is string %}
    {# Return 0 rows for the test to pass #}
    select top 0 0 as errors
{% else %}
    {# Return >0 rows for the test to fail #}
    select 1 as errors
{% endif %}
