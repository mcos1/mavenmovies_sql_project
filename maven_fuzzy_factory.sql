USE mavenfuzzyfactory;

-- TRAFFIC ANALYSIS

-- SELECT website_sessions.utm_content,
-- 	COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
--     COUNT(DISTINCT orders.order_id) AS orders,
--     COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) AS session_to_order_conv_rt
-- FROM website_sessions
-- 	LEFT JOIN orders
-- 		ON orders.website_session_id = website_sessions.website_session_id
-- WHERE website_sessions.website_session_id BETWEEN 1000 AND 2000
-- GROUP BY 1
-- ORDER BY sessions DESC;

-- SELECT utm_source,
-- 	utm_campaign,
-- 	http_referer,
-- 	COUNT(DISTINCT website_session_id) AS sessions
-- FROM website_sessions
-- WHERE created_at < '2012-04-12'
-- GROUP BY utm_source,
-- 	utm_campaign,
--     http_referer
-- ORDER BY sessions DESC;

-- SELECT COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
-- 	COUNT(DISTINCT orders.order_id) AS orders,
--     COUNT(DISTINCT orders.order_id)/COUNT(DISTINCT website_sessions.website_session_id) AS session_to_order_conv_rate
-- FROM website_sessions
-- LEFT JOIN orders
-- 	ON orders.website_session_id = website_sessions.website_session_id
-- WHERE website_sessions.created_at < '2012-04-14'
-- 	AND utm_source = 'gsearch'
--     AND utm_campaign = 'nonbrand';

-- SELECT 
--     YEAR(created_at),
--     WEEK(created_at),
--     MIN(DATE(created_at)) AS week_start,
--     COUNT(DISTINCT website_session_id) AS sessions
-- FROM website_sessions
-- WHERE website_session_id BETWEEN 100000 AND 115000
-- GROUP BY 1, 2;

-- SELECT 
-- 	primary_product_id,
--     COUNT(DISTINCT CASE WHEN items_purchased = 1 THEN order_id ELSE NULL END) AS count_single_item_orders,
--     COUNT(CASE WHEN items_purchased = 2 THEN order_id ELSE NULL END) AS count_two_item_orders
-- FROM orders
-- WHERE order_id BETWEEN 31000 AND 32000
-- GROUP BY 1;

-- SELECT MIN(DATE(created_at)) AS week_start_date,
-- 	COUNT(DISTINCT website_session_id) AS sessions
-- FROM website_sessions
-- WHERE
-- 	created_at < '2012-05-12' AND 
--     utm_source = 'gsearch' AND 
--     utm_campaign = 'nonbrand'
-- GROUP BY YEAR(created_at),
-- 	WEEK(created_at);

-- Bid Optimization for paid traffic

-- SELECT device_type,
-- 	COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
--     COUNT(DISTINCT order_id) AS orders,
--     COUNT(DISTINCT order_id)/COUNT(DISTINCT website_sessions.website_session_id) AS session_to_order_conv_rate
-- FROM website_sessions
-- LEFT JOIN orders
-- ON website_sessions.website_session_id = orders.website_session_id
-- WHERE website_sessions.created_at < '2012-05-11' AND
-- 	utm_source = 'gsearch' AND
--     utm_campaign = 'nonbrand'
-- GROUP BY device_type
-- ORDER BY sessions;

-- TRENDING WITH GRANULAR SEGMENTS

-- SELECT MIN(DATE(created_at)) AS week_start_date,
-- 	COUNT(CASE WHEN device_type = 'desktop' THEN website_session_id ELSE NULL END) AS dtop_sessions,
--     COUNT(CASE WHEN device_type = 'mobile' THEN website_session_id ELSE NULL END) AS mob_sessions
-- FROM website_sessions
-- WHERE created_at BETWEEN '2012-04-15' AND '2012-06-09' AND
-- 	utm_source = 'gsearch' AND
--     utm_campaign = 'nonbrand'
-- GROUP BY YEAR(created_at),
-- 	WEEK(created_at);



