WITH orders AS (

    SELECT
        id AS order_id,
        user_id AS customer_id,
        order_date,
        status

    FROM {{ source('jaffle_shop', 'orders') }}

)

SELECT * FROM orders
{{ limit_data_in_dev(datetime_column_name='order_date', last_days=3000) }}
