SELECT 
date_date,
ROUND(operational_margin-ads_cost, 2) AS ads_margin,
ROUND(revenue/nb_transaction, 2) AS average_basket,
ROUND(operational_margin, 2) AS operational_margin,
ROUND(ads_cost, 2) AS ads_cost,
ROUND(impression, 2) AS impression,
ROUND(click, 2) AS click,
ROUND(quantity, 2) AS quantity,
ROUND(purchase_cost, 2) AS purchase_cost,
ROUND(margin, 2) AS margin,
ROUND(shipping_fee, 2) AS shipping_fee,
ROUND(logcost, 2) AS logcost,
ROUND(ship_cost, 2) AS ship_cost
FROM {{ ref('int_campaigns_day') }}
JOIN {{ ref('finance_days') }}
USING(date_date)
ORDER BY date_date DESC