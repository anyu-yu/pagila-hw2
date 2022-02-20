/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
SELECT DISTINCT actor.first_name || ' ' || actor.last_name AS "Actor Name"
FROM actor
JOIN film_actor USING (actor_id)
JOIN (
    SELECT film_id, unnest(special_features) AS features
    FROM film
) f0 USING(film_id)
WHERE NOT (film_id IS NULL)
    AND f0.features = 'Behind the Scenes';
