SELECT 
    {{ dbt_utils.generate_surrogate_key(['customer_id', 'order_date']) }} AS id,
    customer_id,
    order_date,
    COUNT(*) AS order_count

FROM {{ ref('stg_orders') }}
GROUP BY
    customer_id,
    order_date