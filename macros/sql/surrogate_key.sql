{%- macro surrogate_key() -%}

{% set fields = [] %}

{%- for field in varargs -%}

    {% set _ = fields.append(
        "coalesce(cast(" ~ field ~ " as " ~ dbt_utils_sqlserver.type_string() ~ "), '')"
    ) %}

    {% if not loop.last %}
        {% set _ = fields.append("'-'") %}
    {% endif %}

{%- endfor -%}

{{dbt_utils_sqlserver.hash(dbt_utils_sqlserver.concat(fields))}}

{%- endmacro -%}
