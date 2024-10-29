WITH subquery1 AS (
SELECT *,
purchase_price*quantity AS purchase_cost
FROM {{ref("stg_raw__product")}}
JOIN {{ref("stg_raw__sales")}}
USING(products_id)
)

SELECT
orders_id, 
date_date,
ROUND(SUM(revenue), 2) AS revenue,
ROUND(SUM(quantity), 2) AS quantity,
ROUND(SUM(purchase_cost), 2) AS purchase_cost,
ROUND(SUM(revenue)-SUM(purchase_cost), 2) AS margin
FROM subquery1
GROUP BY orders_id, date_date
ORDER BY date_date