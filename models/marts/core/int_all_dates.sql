{{
    dbt_utils.date_spine(
        start_date='CAST("2023-01-01" AS DATE)',
        end_date='CAST("2023-12-31" AS DATE)',
        datepart='day'
    )
}}