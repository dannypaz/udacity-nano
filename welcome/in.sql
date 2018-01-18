/*
  Use the web_events table to find all information regarding individuals who
  were contacted via organic or adwords and started their account at any point
  in 2016 sorted from newest to oldest.

  BETWEEN is inclusive endpoint, dates start at 00:00:00 which is why we use
  2017-01-01 for the second (right-side) endpoint
*/

SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords') AND occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
ORDER BY occurred_at
LIMIT 10;
