-- In the accounts table, there is a column holding the website for each company.
-- The last three digits specify what type of web address they are using. A list
-- of extensions (and pricing) is provided here. Pull these extensions and
-- provide how many of each website type exist in the accounts table.

WITH extensions AS (
    SELECT name, website, RIGHT(website, 3) AS extension
    FROM accounts)

SELECT extension, COUNT(*) total
from extensions
GROUP BY extension
ORDER BY total DESC

-- There is much debate about how much the name (or even the first letter of
-- a company name) matters. Use the accounts table to pull the first letter
-- of each company name to see the distribution of company names that
-- begin with each letter (or number).

SELECT LEFT(UPPER(name), 1) AS first_letter, COUNT(*) total
FROM accounts
GROUP BY first_letter
ORDER BY first_letter

-- Use the accounts table and a CASE statement to create two groups: one group of
-- company names that start with a number and a second group of those company
-- names that start with a letter. What proportion of company names start with a letter?

---- same as below only w/ reg expression

-- Consider vowels as a, e, i, o, and u. What proportion of company names start
-- with a vowel, and what percent start with anything else?

WITH letters AS (SELECT LEFT(UPPER(name), 1) AS first_letter, COUNT(*) total
FROM accounts
GROUP BY first_letter)

SELECT SUM(total) as total, CASE WHEN first_letter IN ('A', 'E', 'I', 'O', 'U') THEN 'sure' ELSE 'no' END AS is_numberic
FROM letters
GROUP BY is_numberic
