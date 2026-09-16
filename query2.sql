-- poin 1
SELECT *
FROM movies m
JOIN diractors d 
ON m.diractor_id = d.id_diractor
JOIN genres g
ON m.genre_id = g.id_genre
LIMIT 50;

-- poin 2
SELECT *
FROM movie_actors ma
JOIN movies m
ON ma.movie_id = m.id_movie
JOIN actors a
ON ma.actor_id = a.id_actor;

