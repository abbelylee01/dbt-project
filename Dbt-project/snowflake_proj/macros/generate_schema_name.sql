{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}
        {# this overides the default behaviour such when you set a schema in the config then that is the schema it will use #}
        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}