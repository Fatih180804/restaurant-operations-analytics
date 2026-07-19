-- ============================================================================
-- EXECUTIVE RESTAURANT OPERATIONS & BI INSIGHTS
-- ============================================================================

-- METRIC 1: Menu Engineering Matrix (Star Products & Margin Outliers)
-- Identifies items driving gross profit vs those generating heavy cost loads.
SELECT 
    p.product_name,
    p.category,
    SUM(s.quantity) AS total_units_sold,
    ROUND(SUM(s.total_amount), 2) AS gross_revenue,
    ROUND(SUM(s.quantity * p.unit_cost), 2) AS total_cost_load,
    ROUND(SUM(s.total_amount - (s.quantity * p.unit_cost)), 2) AS net_profit_contribution,
    p.gross_margin_pct
FROM fact_sales s
JOIN dim_menu_products p ON s.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category, p.gross_margin_pct
ORDER BY net_profit_contribution DESC;

-- METRIC 2: Hourly Operational Efficiency & Peak Capacity Mapping
-- Diagnoses the 13:00 resource gap vs 10:00, 15:00, 20:00 rush hours to optimize shifts.
SELECT 
    HOUR(order_time) AS operational_hour,
    COUNT(DISTINCT order_id) AS total_orders_handled,
    SUM(quantity) AS total_items_served,
    ROUND(SUM(total_amount), 2) AS dynamic_hourly_revenue
FROM fact_sales
GROUP BY operational_hour
ORDER BY operational_hour ASC;

-- METRIC 3: External Context Analysis (Weather & Holiday Impact on Sales Channels)
-- Correlates external context matrices against transactional volumes.
SELECT 
    c.weather_condition,
    c.is_public_holiday,
    COUNT(DISTINCT s.order_id) AS transactional_volume,
    ROUND(SUM(s.total_amount), 2) AS total_sales,
    ROUND(AVG(s.total_amount), 2) AS average_ticket_value
FROM fact_sales s
JOIN env_daily_context c ON s.order_date = c.context_date
GROUP BY c.weather_condition, c.is_public_holiday
ORDER BY total_sales DESC;
