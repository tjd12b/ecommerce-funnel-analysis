## Product performance ##

WITH product_performance AS (
  SELECT
    product.v2ProductName AS product_name,

    COUNTIF(hits.eCommerceAction.action_type = '2') AS product_views,

    COUNTIF(hits.eCommerceAction.action_type = '3') AS add_to_carts,

    COUNTIF(hits.eCommerceAction.action_type = '6') AS purchases,

    ROUND(SUM(product.productRevenue) / 1000000, 2) AS total_revenue

  FROM
    `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
    UNNEST(hits) AS hits,
    UNNEST(hits.product) AS product

  GROUP BY product_name
)

SELECT *
FROM product_performance
WHERE product_views > 50
ORDER BY total_revenue DESC;