WITH payments AS (

    SELECT * FROM {{ ref('stg_payments') }}

),

orders AS (

    SELECT * FROM {{ ref('stg_orders') }}

),

order_payments AS (

    SELECT
        order_id,
        SUM(CASE WHEN payments.status = 'success' THEN payments.amount END) AS amount

    FROM payments
    GROUP BY order_id

),

final AS (

    SELECT
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        COALESCE(order_payments.amount, 0) AS amount

    FROM orders

    LEFT JOIN order_payments USING (order_id)

)

SELECT * FROM final