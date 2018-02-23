-- Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?

SELECT DATE_TRUNC('year', occurred_at) as year,
	SUM(total) total
FROM orders
GROUP BY year
ORDER BY total DESC

-- Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?

SELECT DATE_TRUNC('month', occurred_at) as month,
	SUM(total) total
FROM orders
GROUP BY month
ORDER BY total DESC

-- Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?

SELECT DATE_TRUNC('year', occurred_at) as year,
	SUM(total) / COUNT(*) avg_total
FROM orders
GROUP BY year
ORDER BY avg_total DESC

-- Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?

SELECT DATE_TRUNC('month', occurred_at) as month,
	SUM(total) / COUNT(*) avg_total
FROM orders
GROUP BY month
ORDER BY avg_total DESC

-- In which month of which year did Walmart spend the most on gloss paper in terms of dollars?


SELECT DATE_TRUNC('month', o.occurred_at) as month,
	SUM(o.gloss_amt_usd) total_gloss
FROM orders o
JOIN accounts a
	ON o.account_id = a.id
    AND a.name = 'Walmart'
GROUP BY o.occurred_at
ORDER BY total_gloss DESC
