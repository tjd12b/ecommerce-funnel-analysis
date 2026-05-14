## Funnel stage counts ##

WITH funnel AS (
  SELECT
    COUNT(DISTINCT fullVisitorId) AS total_visitors,

    COUNT(DISTINCT CASE
      WHEN EXISTS (
        SELECT 1
        FROM UNNEST(hits) h
        WHERE h.eCommerceAction.action_type = '2'
      )
      THEN fullVisitorId
    END) AS product_views,

    COUNT(DISTINCT CASE
      WHEN EXISTS (
        SELECT 1
        FROM UNNEST(hits) h
        WHERE h.eCommerceAction.action_type = '3'
      )
      THEN fullVisitorId
    END) AS add_to_carts,

    COUNT(DISTINCT CASE
      WHEN totals.transactions IS NOT NULL
      THEN fullVisitorId
    END) AS purchasers

  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
)

SELECT
  total_visitors,
  product_views,
  add_to_carts,
  purchasers
FROM funnel;

## Funnel conversion rates ##

WITH funnel AS (
  SELECT
    COUNT(DISTINCT fullVisitorId) AS total_visitors,

    COUNT(DISTINCT CASE
      WHEN EXISTS (
        SELECT 1
        FROM UNNEST(hits) h
        WHERE h.eCommerceAction.action_type = '2'
      )
      THEN fullVisitorId
    END) AS product_views,

    COUNT(DISTINCT CASE
      WHEN EXISTS (
        SELECT 1
        FROM UNNEST(hits) h
        WHERE h.eCommerceAction.action_type = '3'
      )
      THEN fullVisitorId
    END) AS add_to_carts,

    COUNT(DISTINCT CASE
      WHEN totals.transactions IS NOT NULL
      THEN fullVisitorId
    END) AS purchasers

  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
)

SELECT
  total_visitors,
  product_views,
  add_to_carts,
  purchasers,

  ROUND(product_views / total_visitors * 100, 2) AS visit_to_product_view_pct,
  ROUND(add_to_carts / product_views * 100, 2) AS product_to_cart_pct,
  ROUND(purchasers / add_to_carts * 100, 2) AS cart_to_purchase_pct

FROM funnel;