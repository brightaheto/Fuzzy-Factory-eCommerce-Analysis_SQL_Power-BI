/* This project builds a complete analytics foundation for an e‑commerce business by transforming raw transactional 
and web‑behavior data into a structured, insight‑driven model. Using six core datasets—orders, order items, refunds, 
products, website sessions, and pageviews—the project designs a tailored star schema and develops clean fact and 
dimension tables that unify the customer journey from first website visit to purchase and potential refund. A full SQL 
analytics roadmap guides the creation of revenue, product, marketing, funnel, and customer‑behaviour analyses. 
The project also delivers reusable SQL views to support dashboards and ongoing KPI monitoring, enabling clear visibility 
into traffic quality, conversion performance, product profitability, and refund impact. The result is a scalable, end‑to‑end 
analytics layer that supports decision‑making across marketing, product, finance, and operations. */

#VIEWS
CREATE VIEW fact_orders AS
SELECT
    orders.order_id,
    orders.created_at AS order_datetime,
    CAST(orders.created_at AS DATE) AS order_date,
    orders.website_session_id,
    orders.user_id,
    orders.primary_product_id,
    orders.items_purchased,
    orders.price_usd AS gross_revenue,
    orders.cogs_usd AS cogs
FROM orders;

CREATE VIEW fact_order_items AS
SELECT
    order_items.order_item_id,
    order_items.order_id,
    order_items.created_at AS item_datetime,
    order_items.product_id,
    order_items.is_primary_item,
    order_items.price_usd,
    order_items.cogs_usd,
    (order_items.price_usd - order_items.cogs_usd) AS margin
FROM order_items;

CREATE VIEW fact_refunds AS
SELECT
    order_item_refunds.order_item_refund_id,
    order_item_refunds.order_item_id,
    order_item_refunds.order_id,
    order_item_refunds.created_at AS refund_datetime,
    CAST(order_item_refunds.created_at AS DATE) AS refund_date,
    order_item_refunds.refund_amount_usd
FROM order_item_refunds;

CREATE VIEW fact_sessions AS
SELECT
    website_sessions.website_session_id,
    website_sessions.created_at AS session_start,
    CAST(website_sessions.created_at AS DATE) AS session_date,
    website_sessions.user_id,
    website_sessions.is_repeat_session,
    website_sessions.utm_source,
    website_sessions.utm_campaign,
    website_sessions.utm_content,
    website_sessions.device_type,
    website_sessions.http_referer
FROM website_sessions;

CREATE VIEW fact_pageviews AS
SELECT
    website_pageviews.website_pageview_id,
    website_pageviews.website_session_id,
    website_pageviews.created_at AS pageview_datetime,
    CAST(website_pageviews.created_at AS DATE) AS pageview_date,
    website_pageviews.pageview_url
FROM website_pageviews;

CREATE VIEW dim_product AS
SELECT
    products.product_id,
    products.product_name,
    products.created_at AS product_launch_date
FROM products;


/* 1. Average Order Value*/
SELECT
	COUNT (*) AS total_orders,
	ROUND(AVG(gross_revenue), 0) AS average_order_value,
	ROUND(SUM(gross_revenue), 2) AS total_revenue
FROM 
	fact_orders;

/* 2. Bounce rate */

WITH pageview_counts AS (
    SELECT
        COUNT(website_session_id) AS pageviews
    FROM fact_pageviews
    GROUP BY website_session_id
)
SELECT
    CAST(SUM(CASE WHEN pageviews = 1 THEN 1 ELSE 0 END) AS DECIMAL(10,4)) * 100
    / COUNT(*) AS percentage_bounce_rate
FROM pageview_counts;

/* A bounce rate of 44.76% means that approximately 45 out of every 100 visitors 
left the website after viewing only one page without any further interaction. 
This indicates a moderate level of engagement, suggesting that while many users are 
exploring the site, a significant portion are not finding enough value to continue browsing.*/


--3. Channel Performance over Time
--Daily sessions, orders, and conversion rate by UTM source
SELECT
    fact_sessions.utm_source,
    CAST(fact_sessions.session_date AS DATE) AS session_date,
    COUNT(DISTINCT fact_sessions.website_session_id) AS sessions,
    COUNT(DISTINCT fact_orders.order_id) AS orders,
    CAST(COUNT(DISTINCT fact_orders.order_id) AS DECIMAL (10,4)) * 100
        / NULLIF(COUNT(DISTINCT fact_sessions.website_session_id), 0) AS percentage_conversion_rate
FROM fact_sessions
LEFT JOIN fact_orders
    ON fact_sessions.website_session_id = fact_orders.website_session_id
GROUP BY fact_sessions.utm_source, CAST(fact_sessions.session_date AS DATE)
ORDER BY sessions DESC;

/* 4. Channel performance summary
Overall conversion rate per utm source */
SELECT
    fact_sessions.utm_source,
    COUNT(*) AS total_sessions,
    CAST(COUNT(DISTINCT fact_orders.order_id) AS DECIMAL (10,2)) * 100 /
    NULLIF(COUNT(DISTINCT fact_sessions.website_session_id), 0) AS avg_conversion_rate
FROM fact_sessions
LEFT JOIN fact_orders
    ON fact_sessions.website_session_id = fact_orders.website_session_id
GROUP BY fact_sessions.utm_source
ORDER BY avg_conversion_rate DESC;

/* Conversion performance varies notably by UTM source between socialbooks and others with direct traffic (NULL) 
showing a meaningful share of conversions, indicating strong brand recognition or repeat users accessing the site 
directly. However, certain tracked channels also deliver marginally lower conversion rates than direct traffic, 
suggesting that targeted marketing efforts outperform passive traffic. Overall, while direct access contributes 
volume, optimized campaigns via bing and google search can drive higher conversion efficiency.*/

/* 6. Gross Profit analysis per product line */

SELECT 
    dim_product.product_name,
    COUNT(fact_order_items.product_id) AS product_count,
    ROUND(SUM(fact_order_items.price_usd), 0) AS total_revenue,
    ROUND(SUM(fact_order_items.cogs_usd), 0) AS total_cogs,
    ROUND(SUM(fact_order_items.price_usd) - SUM(fact_order_items.cogs_usd), 0) AS gross_profit,
    ROUND(SUM(fact_order_items.price_usd) - SUM(fact_order_items.cogs_usd) * 1.0 
        / NULLIF(COUNT(fact_order_items.product_id), 0), 0) AS gross_profit_per_product
FROM fact_order_items
JOIN dim_product 
    ON fact_order_items.product_id = dim_product.product_id
GROUP BY dim_product.product_name
ORDER BY total_revenue DESC;

/* The results indicate that while some products generate high total revenue, profitability varies 
significantly across the portfolio. Products with strong sales volumes tend to drive overall revenue, 
but not all translate into equally high gross profit per product, suggesting differences in cost structures. 
This highlights the importance of focusing not just on top-selling items, but also on those with higher 
profit efficiency to optimise overall business performance.*/

/*7. Revenue and Orders*/
SELECT
    order_date,
    COUNT(*) AS orders,
    ROUND(SUM(gross_revenue), 2) AS revenue
FROM fact_orders
GROUP BY order_date
ORDER BY orders DESC;

/*The highest number of orders were placed on the 28th of November 2014 valued at 27,404*/


-- 8. Refund Impact on Profitability
--Net margin after refunds (order-level)

SELECT
    fact_orders.order_id,
    fact_orders.gross_revenue AS gross_revenue,
    SUM(fact_order_items.price_usd - fact_order_items.cogs_usd) AS gross_margin,
    COALESCE(SUM(fact_refunds.refund_amount_usd), 0) AS total_refunds,
    SUM(fact_order_items.price_usd - fact_order_items.cogs_usd) - COALESCE(SUM(fact_refunds.refund_amount_usd), 0) AS net_margin
FROM fact_orders
JOIN fact_order_items ON fact_orders.order_id = fact_order_items.order_id
LEFT JOIN fact_refunds ON fact_order_items.order_item_id = fact_refunds.order_item_id
GROUP BY 
    fact_orders.order_id,
    gross_revenue        
ORDER BY net_margin ASC;

/* Refunds have a significant negative impact on profitability in this dataset. 
In multiple cases, total refunds equal the gross revenue, completely eroding 
revenue and resulting in negative net margins. Even where revenue is generated, 
high refund values consistently outweigh gross margins, leading to losses per order. 
Only orders with zero refunds remain profitable. Overall, the data highlights that 
refund volume is the primary driver of loss in profitability and requires closer control */

/* 9. Refund rate by product*/

SELECT
    dim_product.product_name,
    COUNT(fact_refunds.order_item_refund_id) AS refunds,
    COUNT(fact_order_items.order_item_id) AS items_sold,
    CAST(COUNT(fact_refunds.order_item_refund_id) AS DECIMAL(10,2)) * 100
    / COUNT(fact_order_items.order_item_id) AS percentage_refund_rate
FROM fact_order_items
JOIN dim_product 
    ON fact_order_items.product_id = dim_product.product_id
LEFT JOIN fact_refunds 
    ON fact_order_items.order_item_id = fact_refunds.order_item_id
GROUP BY 
    dim_product.product_name
ORDER BY 
    percentage_refund_rate DESC;

/* The Birthday Sugar Panda has the highest refund rate (6.04%), indicating potential issues with product 
quality, expectations, or customer satisfaction despite moderate sales volume.The Original Mr. Fuzzy drives 
the highest sales (24,226 units) but also has a relatively high refund rate (5.11%), which could significantly 
impact revenue due to volume.The Forever Love Bear shows a moderate refund rate (2.23%), suggesting better 
product performance and customer satisfaction.The Hudson River Mini Bear has the lowest refund rate (1.28%), 
making it the most reliable product in terms of customer retention and satisfaction.
Key Insight
High-volume products with high refund rates (Mr. Fuzzy) present the biggest financial risk, while low refund 
rate products (Hudson River Mini Bear) indicate strong product-market fit.*/

/* 10. Revenue by product */

SELECT
    dim_product.product_id,
	dim_product.product_name,
    ROUND(SUM(fact_order_items.price_usd), 0) AS revenue
FROM fact_order_items 
JOIN dim_product ON fact_order_items.product_id = dim_product.product_id
GROUP BY 
	dim_product.product_name,
	dim_product.product_id
ORDER BY revenue DESC;

/* The Original Mr. Fuzzy is the product responsible for most of the firm's revenue */

/* 11. Session → Order conversion */

SELECT
    COUNT(DISTINCT fact_sessions.website_session_id) AS sessions,
    COUNT(DISTINCT fact_orders.order_id) AS orders,
    CAST(COUNT(DISTINCT fact_orders.order_id) AS DECIMAL(10,4)) 
    / COUNT(DISTINCT fact_sessions.website_session_id) * 100 AS percentage_conversion_rate
FROM fact_sessions
LEFT JOIN fact_orders
  ON fact_sessions.website_session_id = fact_orders.website_session_id; 
  
 /* Out of 472,871 web sessions, there were 32,313 orders, giving a conversion rate of ~6.83%.
This means roughly 7 out of every 100 visitors completed a purchase.
Overall, this indicates a solid conversion performance, suggesting effective user experience 
and/or strong purchase intent from traffic.*/



