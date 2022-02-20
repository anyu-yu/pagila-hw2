/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT film.title
FROM film
WHERE film.film_id IN (
    SELECT film_id
    FROM film,
    unnest(special_features) AS features
    WHERE features = 'Trailers'
)
AND film.rating = 'G'
ORDER BY film.title;
