{% macro limit_data_in_dev(datetime_column_name, last_days=3) -%}
    {%- if target.name == 'dev' -%}
        WHERE {{ datetime_column_name }} >= DATE_ADD(CURRENT_DATE, INTERVAL -{{ last_days }} DAY)
    {%- endif -%}
{%- endmacro %}