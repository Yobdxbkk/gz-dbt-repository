SELECT
EXTRACT(MONTH FROM date_date) AS the_month,
ROUND(SUM(ads_margin), 2) AS ads_margin,
ROUND(SUM(operational_margin), 2) AS operational_margin,
ROUND(SUM(ads_cost), 2) AS ads_cost,
ROUND(SUM(impression), 2) AS impression,
ROUND(SUM(click), 2) AS click,
ROUND(SUM(quantity), 2) AS quantity,
ROUND(SUM(purchase_cost), 2) AS purchase_cost,
ROUND(SUM(margin), 2) AS margin,
ROUND(SUM(shipping_fee), 2) AS shipping_fee,
ROUND(SUM(logcost), 2) AS logcost,
ROUND(SUM(ship_cost), 2) AS ship_cost
FROM {{ ref('finance_campaigns_day') }}
GROUP BY the_month