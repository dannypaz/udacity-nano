-- How many of the sales reps have more than 5 accounts that they manage?

SELECT sr.name, COUNT(*) num_of_accounts
FROM sales_reps sr
JOIN accounts a
	ON sr.id = a.sales_rep_id
GROUP BY sr.name
HAVING COUNT(*) > 5

-- How many accounts have more than 20 orders?

SELECT a.name, COUNT(*) num_of_orders
FROM accounts a
JOIN orders o
	ON o.account_id = a.id
GROUP BY a.name
HAVING COUNT(*) > 20

-- Which account has the most orders?

SELECT a.name, COUNT(*) num_of_orders
FROM accounts a
JOIN orders o
	ON o.account_id = a.id
GROUP BY a.name
HAVING COUNT(*) > 20
ORDER BY num_of_orders DESC

-- How many accounts spent more than 30,000 usd total across all orders?

SELECT a.name, SUM(o.total)
FROM accounts a
JOIN orders o
	ON o.account_id = a.id
GROUP BY a.name
HAVING SUM(o.total) > 30000

-- How many accounts spent less than 1,000 usd total across all orders?

SELECT a.name, SUM(o.total)
FROM accounts a
JOIN orders o
	ON o.account_id = a.id
GROUP BY a.name
HAVING SUM(o.total) < 1000

-- Which account has spent the most with us?

SELECT a.name, SUM(o.total_amt_usd) total
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY a.name
ORDER BY total DESC
LIMIT 1

-- Which account has spent the least with us?

SELECT a.name, SUM(o.total_amt_usd) total
FROM accounts a
JOIN orders o
	ON a.id = o.account_id
GROUP BY a.name
ORDER BY total
LIMIT 1

-- Which accounts used facebook as a channel to contact customers more than 6 times?

SELECT a.name, COUNT(*) channel_total
FROM accounts a
JOIN web_events we
	ON a.id = we.account_id
    AND we.channel = 'facebook'
GROUP BY a.name
HAVING COUNT(*) > 6

-- Which account used facebook most as a channel?

SELECT a.name, COUNT(*) channel_total
FROM accounts a
JOIN web_events we
	ON a.id = we.account_id
    AND we.channel = 'facebook'
GROUP BY a.name
ORDER BY channel_total DESC

-- Which channel was most frequently used by most accounts?

SELECT we.channel, COUNT(we.channel) total
FROM web_events we
JOIN accounts a
	ON a.id = we.account_id
GROUP BY we.channel
ORDER BY total DESC
