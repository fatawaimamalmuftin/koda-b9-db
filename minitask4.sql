CREATE TABLE actors (
    id_actor INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(250) NOT NULL,
    last_name VARCHAR(250) NOT NULL
);

CREATE TABLE diractors (
    id_diractor INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(250) NOT NULL,
    last_name VARCHAR(250) NOT NULL
);

CREATE TABLE genres (
    id_genre INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name_genre VARCHAR(250) NOT NULL
);

CREATE TABLE movies (
    id_movie INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    release_date DATE TIME not NULL,
    rating FLOAT NOT NULL,
    diractor_id INTEGER,
    genre_id INTEGER,

    FOREIGN KEY (diractor_id) REFERENCES diractors(id_diractor),
    FOREIGN KEY (genre_id) REFERENCES genres(id_genre)
);

CREATE TABLE movie_actors (
    movie_id INTEGER,
    actor_id INTEGER,
    role VARCHAR(250) NOT NULL,

    FOREIGN KEY (movie_id) REFERENCES movies(id_movie),
    FOREIGN KEY (actor_id) REFERENCES actors(id_actor)
);

-- DROP TABLE movies;
-- DROP TABLE movie_actors;
-- DROP TABLE diractors;
-- DROP TABLE genres;
-- DROP TABLE actors;