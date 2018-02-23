/*
	For each account, determine the average amount of each type of paper they purchased
	across their orders. Your result should have four columns - one for the account name
	and one for the average quantity purchased for each of the paper types for each account.
*/

SELECT a.id,
	ROUND(AVG(o.standard_qty),2) std_qty_avg,
    ROUND(AVG(o.gloss_qty),2) gloss_avg,
    ROUND(AVG(o.poster_qty),2) poster_avg
FROM accounts a
JOIN orders o
	ON o.account_id = a.id
GROUP BY a.id
ORDER BY a.id

/*
	For each account, determine the average amount spent per order on each paper type.
	Your result should have four columns - one for the account name and one for the
	average amount spent on each paper type.
*/

SELECT a.id,
	ROUND(AVG(o.standard_amt_usd),2) std_qty_avg,
    ROUND(AVG(o.gloss_amt_usd),2) gloss_avg,
    ROUND(AVG(o.poster_amt_usd),2) poster_avg
FROM accounts a
JOIN orders o
	ON o.account_id = a.id
GROUP BY a.id
ORDER BY a.id

/*
	Determine the number of times a particular channel was used in the web_events table
	for each sales rep. Your final table should have three columns - the name of the
	sales rep, the channel, and the number of occurrences. Order your table with the
	highest number of occurrences first.
*/

SELECT we.channel, sr.name,
	COUNT(we.channel) number_of_occurances
FROM web_events we
JOIN accounts a
	ON we.account_id = a.id
JOIN sales_reps sr
	ON a.sales_rep_id = sr.id
GROUP BY we.channel, sr.name
ORDER BY number_of_occurances DESC

/*
	Determine the number of times a particular channel was used in the web_events table
	for each region. Your final table should have three columns - the region name, the
	channel, and the number of occurrences. Order your table with the highest number
	of occurrences first.
*/

SELECT we.channel, r.name as region_name,
	COUNT(we.channel) number_of_occurances
FROM web_events we
JOIN accounts a
	ON we.account_id = a.id
JOIN sales_reps sr
	ON a.sales_rep_id = sr.id
JOIN region r
	ON sr.region_id = r.id
GROUP BY we.channel, r.name
ORDER BY number_of_occurances DESC

/* Use DISTINCT to test if there are accounts w/ multiple regions */

SELECT a.id, COUNT(*) region_count
FROM accounts a
JOIN sales_reps sr
	ON sr.id = a.sales_rep_id
JOIN region r
	ON sr.region_id = r.id
GROUP BY a.id
ORDER BY region_count DESC;

SELECT DISTINCT a.id, a.name
FROM accounts a;

/* find all sales_reps account counts */

SELECT sr.name, COUNT(*) account_count
FROM sales_reps sr
JOIN accounts a
	ON sr.id = a.sales_rep_id
GROUP BY sr.name
ORDER BY account_count DESC
