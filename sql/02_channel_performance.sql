## Channel performance ##

WITH sessions AS (
  SELECT
    trafficSource.source AS traffic_source,
    fullVisitorId,

    MAX(
      IF(
        hits.eCommerceAction.action_type = '2',
        1,
        0
      )
    ) AS viewed_product,

    MAX(
      IF(
        hits.eCommerceAction.action_type = '3',
        1,
        0
      )
    ) AS added_to_cart,

    MAX(
      IF(
        totals.transactions >= 1,
        1,
        0
      )
    ) AS made_purchase,

    totals.totalTransactionRevenue / 1000000 AS revenue
  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
    UNNEST(hits) AS hits
  GROUP BY
    traffic_source,
    fullVisitorId,
    totals.transactions,
    totals.totalTransactionRevenue
)

SELECT
  traffic_source,
  COUNT(DISTINCT fullVisitorId) AS users,
  SUM(viewed_product) AS product_views,
  SUM(added_to_cart) AS carts,
  SUM(made_purchase) AS purchasers,

  ROUND(SAFE_DIVIDE(SUM(made_purchase), COUNT(DISTINCT fullVisitorId)) * 100, 2) AS conversion_rate_pct,

  ROUND(SUM(revenue), 2) AS total_revenue
FROM sessions
GROUP BY traffic_source
HAVING users > 100
ORDER BY total_revenue DESC;