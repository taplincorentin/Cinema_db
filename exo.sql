--a--
--get info from movie with id 1
    SELECT title, DATE_FORMAT(f_release_date, '%Y') AS release_year, person_name AS director, TIME_FORMAT(SEC_TO_TIME(movie_length*60),'%H:%i')
    FROM director d
    INNER JOIN movie m ON m.id_director = d.id_director
    INNER JOIN person p ON d.id_person = p.id_person
    WHERE id_movie = 1

--b--
    SELECT title
    FROM movie
    WHERE movie_length > 135
    ORDER BY movie_length DESC

--c--
    SELECT title, f_release_date
    FROM director d
    INNER JOIN movie m ON d.id_director = m.id_director
    INNER JOIN person p ON d.id_person = p.id_person
    WHERE person_name = 'BURTON'

--d--
    SELECT genre_name, COUNT(id_movie) AS nb_movies
    FROM movie_genre mg
    INNER JOIN genre g ON mg.id_genre=g.id_genre
    GROUP by genre_name
    ORDER BY nb_movies DESC

--e--
    SELECT person_name, COUNT(id_movie) AS nb_movies
    FROM director d
    INNER JOIN movie m ON d.id_director=m.id_director
    INNER JOIN person p ON d.id_person = p.id_person
    GROUP by person_name
    ORDER BY nb_movies DESC

--f--
--get casting from movie with id 1
    SELECT person_name, person_first_name, sex
    FROM actor a
    INNER JOIN person p ON a.id_person = p.id_person
    INNER JOIN casting c ON a.id_actor = c.id_actor
    WHERE id_movie = 1

--g--
    SELECT title, role_name, DATE_FORMAT(f_release_date, '%Y') AS release_year
    FROM casting c
    INNER JOIN movie m ON c.id_movie = m.id_movie
    INNER JOIN actor a ON c.id_actor = a.id_actor
    INNER JOIN role r ON c.id_role = r.id_role
    WHERE c.id_actor = 1
    ORDER BY release_year DESC

--h--
    SELECT person_name
    FROM person
    WHERE id_person IN (SELECT id_person FROM actor)
    AND id_person IN (SELECT id_person FROM director)

--i--
    SELECT title
    FROM movie
    WHERE DATEDIFF(NOW(),f_release_date) < 5*365.25
    ORDER BY f_release_date DESC

--j--
    SELECT sex, COUNT(id_person) AS nb_people
    FROM person
    WHERE id_person IN(SELECT id_person FROM actor)
    GROUP BY sex

--k--
    SELECT person_name
    FROM person
    WHERE DATEDIFF(NOW(), date_of_birth) > 49*365.25
    AND id_person IN(SELECT id_person FROM actor)

--l--
    SELECT person_name, COUNT(id_movie) AS nb_movies
    FROM actor a
    INNER JOIN person p ON p.id_person = a.id_person
    INNER JOIN casting c ON c.id_actor = a.id_actor
    GROUP BY person_name
    HAVING nb_movies > 2