
1) SELECT title FROM film 
INNER JOIN film_category AS fc ON film.film_id=fc.film_id 
INNER JOIN category as c ON c.category_id = fc.category_id 
WHERE c.name='Comedy' AND film.rating='PG-13';




2) SELECT title AS Top_Three_Demanded_Horror_Films FROM film 
INNER JOIN inventory ON film.film_id=inventory.film_id 
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id 
INNER JOIN film_category ON film.film_id=film_category.film_id 
INNER JOIN category ON category.category_id = film_category.category_id 
WHERE category.name='Horror'
GROUP BY film.film_id 
ORDER BY COUNT(rental.rental_id) DESC 
LIMIT 3;




3) SELECT concat(cu.first_name," ",cu.last_name) AS CustomerName FROM customer cu
inner join address a on cu.address_id=a.address_id
inner join city ci on a.city_id=ci.city_id
inner join country co on ci.country_id=co.country_id
WHERE cu.customer_id IN (SELECT customer.customer_id FROM customer,rental,inventory,film,film_category,category 
WHERE customer.customer_id=rental.customer_id 
AND rental.inventory_id = inventory.inventory_id 
AND inventory.film_id=film.film_id 
AND film.film_id=film_category.film_id 
AND film_category.category_id=category.category_id 
AND category.name ='Sports') 
AND co.country='India';




4) SELECT distinct concat(cu.first_name," ",cu.last_name) AS NickWahlBergRentals  FROM customer cu
inner join address a on cu.address_id=a.address_id
inner join city ci on a.city_id=ci.city_id
inner join country co on ci.country_id=co.country_id
inner join rental ON rental.customer_id = cu.customer_id
inner join inventory ON rental.inventory_id = inventory.inventory_id 
inner join film ON film.film_id=inventory.film_id
inner join film_actor On film.film_id=film_actor.film_id
inner join actor ON actor.actor_id=film_actor.actor_id
AND concat(actor.first_name,' ',actor.last_name) ='NICK WAHLBERG'
AND co.country='Canada';



5) SELECT count(*) AS CountOfSeanWilliamMovies FROM film 
INNER JOIN film_actor ON film.film_id=film_actor.film_id
INNER JOIN actor ON film_actor.actor_id=actor.actor_id
WHERE concat(actor.first_name,' ',actor.last_name) ='SEAN WILLIAMS';




