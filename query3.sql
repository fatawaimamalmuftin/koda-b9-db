-- poin 1
SELECT
d.id_diractor, d.first_name,d.last_name, 
COUNT(DISTINCT m.genre_id) AS "jumlah direct"
FROM diractors d
JOIN movies m
ON d.id_diractor = m.diractor_id
GROUP BY
d.id_diractor, d.first_name,d.last_name;

-- poin 2
SELECT
a.id_actor, a.first_name, a.last_name,
COUNT(ma.role) AS "jumlah_role"
FROM actors a
JOIN movie_actors ma
ON a.id_actor = ma.actor_id
GROUP BY
a.id_actor, a.first_name, a.last_name
HAVING COUNT(ma.role) > 5;

-- poin 3
SELECT
d.id_diractor, d.first_name, d.last_name,
COUNT(m.id_movie) AS Jumlah_Movie
FROM diractors d
JOIN movies m
ON d.id_diractor = m.diractor_id
GROUP BY
d.id_diractor, d.first_name, d.last_name
ORDER BY COUNT(m.id_movie) DESC
LIMIT 1;

-- poin 4
SELECT
EXTRACT(YEAR FROM release_date) AS TAHUN,
COUNT(*) AS JUMLAH_TAHUN
FROM movies
GROUP BY EXTRACT(YEAR FROM release_date)
ORDER BY COUNT(*) DESC
LIMIT 1;

-- poin 5
SELECT
m.id_movie, m.title,
STRING_AGG(
    a.first_name || ' ' || a.last_name, ', '
) AS Actors
FROM movies m
JOIN movie_actors ma
ON m.id_movie = ma.movie_id
JOIN actors a
ON ma.actor_id = a.id_actor
GROUP BY
m.id_movie, m.title;

-- Exercise
SELECT 
p1.product_name AS Product,
p1.price AS Price
FROM products_pagi p1
WHERE p1.price > (
    SELECT AVG(p2.price)
    FROM products_pagi p2
);

SELECT
ts.customer_id AS ID_CUS,
ts.amount AS Jumlah
FROM transactions ts
WHERE ts.amount > (
    SELECT AVG(ts2.amount)
    FROM transactions ts2
    WHERE ts.customer_id = ts2.customer_id
);

-- Exercise 1
WITH total_pembelian AS(
    SELECT 
    customer_id,
    product,
    SUM(quantity * price_per_unit) AS Total
    FROM sales_pagi 
    WHERE product = 'Keyboard'
    GROUP BY customer_id, product
)
SELECT
customer_id AS ID_CUS,
product AS Product,
Total AS Total
FROM total_pembelian
WHERE Total > 30;

-- Exercise 2
WITH ter_jual_1kali AS(
    SELECT
    product
    FROM sales_pagi
    GROUP BY product
    HAVING COUNT(*) = 1
)
SELECT
s.customer_id AS ID_CUS,
s.product AS Product,
s.quantity AS Qty
FROM sales_pagi s
JOIN ter_jual_1kali t
ON s.product = t.product;

-- Test
WITH tblTTL AS(
    SELECT
    p.name AS Name,
    p.price AS Price,
    SUM(s.quantity) AS Qty,
    SUM(p.price * s.quantity) AS Total
    FROM products p
    JOIN sales s
    ON p.id = s.product_id
    GROUP BY
    p.name, p.price
)
SELECT
name, price, total
FROM tblTTL
WHERE qty >= 7;