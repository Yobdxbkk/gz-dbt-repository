WITH subquery2 AS(
SELECT *
FROM {{ ref('stg_raw__ship') }}
JOIN {{ ref('int_sales_margin') }}
USING(orders_id)
)

SELECT
orders_id,
date_date,
ROUND((margin+shipping_fee)-(logcost+ship_cost), 2) AS operational_margin
FROM subquery2