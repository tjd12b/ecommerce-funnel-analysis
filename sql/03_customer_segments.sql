## Customer segments ##

WITH session_level AS (
  SELECT
    fullVisitorId,
    visitId,

    MAX(totals.newVisits) AS is_new_user,
    MAX(totals.pageviews) AS pageviews,

    MAX(
      IF(hits.eCommerceAction.action_type = '2', 1, 0)
    ) AS viewed_product,

    MAX(
      IF(hits.eCommerceAction.action_type = '3', 1, 0)
    ) AS added_to_cart,

    MAX(
      IF(totals.transactions >= 1, 1, 0)
    ) AS made_purchase,

    MAX(totals.totalTransactionRevenue) / 1000000 AS revenue

  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
    UNNEST(hits) AS hits
  GROUP BY
    fullVisitorId,
    visitId
),

user_level AS (
  SELECT
    fullVisitorId,

    MAX(is_new_user) AS is_new_user,
    COUNT(DISTINCT visitId) AS sessions,
    SUM(pageviews) AS total_pageviews,
    SUM(viewed_product) AS product_views,
    SUM(added_to_cart) AS add_to_carts,
    SUM(made_purchase) AS purchases,
    SUM(revenue) AS total_revenue

  FROM session_level
  GROUP BY fullVisitorId
)

SELECT
  CASE
    WHEN is_new_user = 1 THEN 'New Users'
    ELSE 'Returning Users'
  END AS user_type,

  COUNT(*) AS users,
  SUM(sessions) AS total_sessions,
  SUM(total_pageviews) AS total_pageviews,
  SUM(product_views) AS product_views,
  SUM(add_to_carts) AS add_to_carts,
  SUM(purchases) AS purchases,
  ROUND(SUM(total_revenue), 2) AS total_revenue,

  ROUND(
    SAFE_DIVIDE(
      SUM(purchases),
      COUNT(*)
    ) * 100,
    2
  ) AS purchase_rate_pct

FROM user_level
GROUP BY user_type;