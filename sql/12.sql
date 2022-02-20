/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT f2.title
FROM (
SELECT DISTINCT f0.title
FROM (
    SELECT film.title, unnest(special_features) AS features
    FROM film
) f0
WHERE f0.features = 'Behind the Scenes'
) f2
INNER JOIN (
    SELECT DISTINCT f1.title
FROM (
    SELECT film.title, unnest(special_features) AS features
    FROM film
) f1
WHERE f1.features = 'Trailers'
) f3 USING (title)
ORDER BY f2.title;
