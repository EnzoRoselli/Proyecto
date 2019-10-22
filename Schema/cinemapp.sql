
CREATE DATABASE CINEMAPP;
USE CINEMAPP;

CREATE TABLE cinemas(
id int AUTO_INCREMENT,
cinema_name varchar(50),
address varchar(50),
capacity int,
ticket_value float,
active boolean,
CONSTRAINT pk_cinemas PRIMARY KEY (id));

CREATE TABLE movies(
id int,
title varchar(50),
duration int(3), /* VER SI SE USA ASI O UN TIPO DE DATO DE TIEMPO */
original_language varchar(15),
overview varchar(450),
release_date varchar(10),
adult boolean,
poster_path varchar(50),

constraint pk_movies PRIMARY KEY (id));

CREATE TABLE genres(
id int,
genre_name varchar(50),
constraint pk_genres PRIMARY KEY (id),
CONSTRAINT unq_genres UNIQUE (genre_name));


CREATE TABLE genres_by_movies (
id_movie int,
id_genre int, 
constraint pk_genres_by_movies_id_movie_id_genre PRIMARY KEY (id_movie, id_genre),
constraint fk_genres_by_movies_id_movie FOREIGN KEY (id_movie) REFERENCES movies(id) ON DELETE CASCADE,
constraint fk_genres_by_movies_id_genre FOREIGN KEY (id_genre) REFERENCES genres(id) ON DELETE CASCADE);



CREATE TABLE users(
id int AUTO_INCREMENT,
username varchar(20),
password varchar(12),
constraint pk_users PRIMARY KEY (id),
CONSTRAINT unq_users UNIQUE (username));

CREATE TABLE showtimes(
id int AUTO_INCREMENT,
id_movie int,
id_cinema int,
view_date date,
hour time,
subtitles boolean,
CONSTRAINT pk_showtimes PRIMARY KEY (id, id_cinema),
constraint fk_id_language_showtimes FOREIGN KEY (id_language) REFERENCES languajes(id),
CONSTRAINT fk_id_movie_showtimes FOREIGN KEY (id_movie) REFERENCES movies(id) ON DELETE CASCADE,
CONSTRAINT fk_id_cinema_showtimes FOREIGN KEY (id_cinema) REFERENCES cinemas(id) ON DELETE CASCADE);

CREATE TABLE languages(
id int AUTO_INCREMENT,
name_language varchar(18) 
CONSTRAINT pk_language PRIMARY KEY(id),
CONSTRAINT unq_name_language UNIQUE(name_language));
)



CREATE TABLE tickets(
id int AUTO_INCREMENT,
qr int,
id_showtime int,
username varchar(20),
CONSTRAINT pk_ticket PRIMARY KEY (id),
CONSTRAINT fk_id_showtimes_tickets FOREIGN KEY (id_showtime) REFERENCES showtimes(id) ON DELETE RESTRICT,
CONSTRAINT fk_username_tickets FOREIGN KEY (username) REFERENCES users(username) ON DELETE RESTRICT);

CREATE TABLE credit_cards(
cc_number varchar(16),
owner_name varchar(50),
cc_company varchar(50),
CONSTRAINT pk_credit_cards PRIMARY KEY (cc_number));






