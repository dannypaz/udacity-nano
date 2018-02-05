/*
  The following queries were used for the sql section of the data analyst JOIN questions
 */
SELECT we.channel, we.occurred_at,
	a.primary_poc, a.name as name
FROM web_events we
JOIN accounts a
ON we.account_id = a.id

SELECT a.name account_name, r.name region_name, sr.name rep_name
FROM sales_reps sr
JOIN region r
ON sr.region_id = r.id
JOIN accounts a
ON sr.id = a.sales_rep_id
ORDER BY a.name

SELECT r.name region_name, a.name account_name, standard_qty/(total+0.01) unit_price
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps sr
ON sr.id = a.sales_rep_id
JOIN region r
ON sr.region_id = r.id
