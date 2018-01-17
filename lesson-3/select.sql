### LIMITS
/*
  WRite a query that limits the response to only the first 15 rows and includes
  data, account_id and channel fields from the web_events table
*/
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;
