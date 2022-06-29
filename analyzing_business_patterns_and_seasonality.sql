USE mavenfuzzyfactory;

SELECT 
	website_session_id,
    created_at,
    HOUR(created_at) AS hr,
    WEEKDAY(created_at) AS wkday,-- 0 = Mon 1 = TUES, etc
    CASE
		WHEN WEEKDAY(created_at) = 0 THEN 'Monday'
        WHEN WEEKDAY(created_at) = 3 THEN 'Wednesday'
        ELSE 'other day'
	END AS clean_weekday,
	QUARTER(created_at) AS qtr,
    MONTH(created_at) AS mo,
    DATE(created_at) AS date,
    WEEK(created_at) AS wk
FROM website_sessions
WHERE website_session_id BETWEEN 150000 AND 155000;

-- ANALYZING SEASONALITY

SELECT
	MIN(DATE(website_sessions.created_at)) AS week_start_date,
    COUNT(website_sessions.website_session_id) AS sessions,
    COUNT(orders.order_id) AS orders
FROM website_sessions
	LEFT JOIN orders
		ON website_sessions.website_session_id = orders.website_session_id
WHERE YEAR(website_sessions.created_at) = '2012'
GROUP BY 
	MONTH(website_sessions.created_at),
    WEEK(website_sessions.created_at);
    
-- ANALYZING BUSINESS PATERNS

SELECT
    CASE
		WHEN WEEKDAY(created_at) = 0 THEN 'mon'
        WHEN WEEKDAY(created_at) = 1 THEN 'tue'
        WHEN WEEKDAY(created_at) = 2 THEN 'wed'
        WHEN WEEKDAY(created_at) = 3 THEN 'thu'
        WHEN WEEKDAY(created_at) = 4 THEN 'fri'
        WHEN WEEKDAY(created_at) = 5 THEN 'sat'
        WHEN WEEKDAY(created_at) = 6 THEN 'sun'
	END AS day_of_week
FROM website_sessions
WHERE created_at BETWEEN '2012-09-15' AND '2012-11-15';

SELECT
	hr,
	ROUND(AVG(CASE WHEN wkday = 0 THEN website_sessions ELSE NULL END), 1) AS mon,
	ROUND(AVG(CASE WHEN wkday = 1 THEN website_sessions ELSE NULL END), 1) AS tue,
    ROUND(AVG(CASE WHEN wkday = 2 THEN website_sessions ELSE NULL END), 1) AS wed,
    ROUND(AVG(CASE WHEN wkday = 3 THEN website_sessions ELSE NULL END), 1) AS thu,
    ROUND(AVG(CASE WHEN wkday = 4 THEN website_sessions ELSE NULL END), 1) AS fri,
    ROUND(AVG(CASE WHEN wkday = 5 THEN website_sessions ELSE NULL END), 1) AS sat,
    ROUND(AVG(CASE WHEN wkday = 6 THEN website_sessions ELSE NULL END), 1) AS sun
FROM(
SELECT
	DATE(created_at) AS created_date,
    WEEKDAY(created_at) AS wkday,
    HOUR(created_at) AS hr,
    COUNT(DISTINCT website_session_id) AS website_sessions
FROM website_sessions
WHERE created_at BETWEEN '2012-09-15' AND '2012-11-15'
GROUP BY 1, 2, 3
) daily_hourly_sessions
GROUP BY 1
ORDER BY 1;