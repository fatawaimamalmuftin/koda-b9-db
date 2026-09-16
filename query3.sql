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