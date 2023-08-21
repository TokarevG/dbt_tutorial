{%- set payment_methods = ['credit_card', 'bank_transfer', 'coupon', 'gift_card'] -%}

WITH payments AS (

    SELECT * FROM {{ ref('stg_payments') }}

),

pivoted AS (

    SELECT 
        order_id,
        {% for payment_method in payment_methods -%}
            SUM(CASE WHEN payment_method = '{{ payment_method }}' THEN amount ELSE 0 END) AS {{ payment_method }}_amount
            {%- if not loop.last -%}
                ,
            {%- endif %}
        {% endfor %}

    FROM payments
    WHERE status = 'success'
    GROUP BY order_id

)

SELECT * FROM pivoted