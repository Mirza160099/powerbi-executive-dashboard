-- Executive BI Analytics

-- 1. Revenue / target / variance
SELECT
    ROUND(SUM(revenue_gbp),2) AS revenue_gbp,
    ROUND(SUM(revenue_target_gbp),2) AS target_gbp,
    ROUND(SUM(revenue_gbp)-SUM(revenue_target_gbp),2) AS variance_gbp,
    ROUND(
      100.0 * (SUM(revenue_gbp)-SUM(revenue_target_gbp))
      / NULLIF(SUM(revenue_target_gbp),0), 2
    ) AS variance_pct
FROM fact_sales;

-- 2. Revenue and margin by region
SELECT
    r.region,
    ROUND(SUM(f.revenue_gbp),2) AS revenue_gbp,
    ROUND(SUM(f.gross_profit_gbp),2) AS gross_profit_gbp,
    ROUND(100.0*SUM(f.gross_profit_gbp)/NULLIF(SUM(f.revenue_gbp),0),2) AS gross_margin_pct
FROM fact_sales f
JOIN dim_region r ON f.region_key = r.region_key
GROUP BY r.region
ORDER BY revenue_gbp DESC;

-- 3. Product variance
SELECT
    p.product,
    ROUND(SUM(f.revenue_gbp),2) AS revenue_gbp,
    ROUND(SUM(f.revenue_target_gbp),2) AS target_gbp,
    ROUND(SUM(f.revenue_gbp)-SUM(f.revenue_target_gbp),2) AS variance_gbp
FROM fact_sales f
JOIN dim_product p ON f.product_key = p.product_key
GROUP BY p.product
ORDER BY variance_gbp;

-- 4. Channel profitability
SELECT
    c.channel,
    ROUND(SUM(f.revenue_gbp),2) AS revenue_gbp,
    ROUND(SUM(f.gross_profit_gbp),2) AS gross_profit_gbp,
    ROUND(100.0*SUM(f.discount_gbp)/NULLIF(SUM(f.gross_sales_gbp),0),2) AS discount_rate_pct
FROM fact_sales f
JOIN dim_channel c ON f.channel_key = c.channel_key
GROUP BY c.channel;

-- 5. Segment AOV
SELECT
    s.segment,
    COUNT(DISTINCT f.order_id) AS orders,
    ROUND(SUM(f.revenue_gbp)/NULLIF(COUNT(DISTINCT f.order_id),0),2) AS avg_order_value
FROM fact_sales f
JOIN dim_segment s ON f.segment_key = s.segment_key
GROUP BY s.segment;
