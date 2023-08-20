WITH payments AS (
    SELECT
        id AS payment_id,
        orderid AS order_id,
        paymentmethod AS payment_method,
        status,
        amount / 100 AS amount,
        created AS purchase_date,
    
    FROM `dbt-tutorial.data_prep.stripe_payments`
)

SELECT * FROM payments