-- poin 1
SELECT 
movies
FROM movies
WHERE release_date >= '2020-01-01' 
AND release_date < '2020-12-31';

-- poin 2
SELECT first_name, last_name
FROM actors
WHERE first_name LIKE '%s';

-- poin 3
SELECT movies
FROM movies
WHERE rating >= 4 AND rating >= 8
AND release_date >= '2004-01-31'
AND release_date <= '2010-01-31';