SELECT count(*) FROM film 
JOIN film_category AS fc ON fc.film_id=film.film_id
JOIN category AS cat ON cat.category_id=fc.category_id
WHERE cat.name='Documentary' AND film.special_features LIKE '%Deleted Scenes%';



SELECT count(distinct i.film_id) from rental r
join inventory i on i.inventory_id=r.inventory_id
join film_category fc on i.film_id=fc.film_id
join category c on fc.category_id=c.category_id
join staff s on s.staff_id=r.staff_id
join store st on s.staff_id=st.manager_staff_id and st.store_id=s.store_id and i.store_id=st.store_idwhere st.store_id 
in 
(Select store_id from staff where first_name='Jon' and last_name='Stephens') 
and c.name='Sci-Fi';



SELECT SUM(payment.amount) AS TotalSales FROM category 
JOIN film_category AS fc ON fc.category_id=category.category_id 
JOIN film On film.film_id = fc.film_id
JOIN inventory AS inv ON inv.film_id=film.film_id
JOIN rental ON inv.inventory_id=rental.inventory_id 
JOIN payment ON rental.rental_id=payment.rental_id
WHERE category.name='Animation'



SELECT distinct category.name from category 
JOIN film_category AS fc ON fc.category_id=category.category_id 
JOIN film On film.film_id = fc.film_id
JOIN inventory AS inv ON inv.film_id=film.film_id
JOIN rental ON inv.inventory_id=rental.inventory_id 
JOIN customer AS cu ON cu.customer_id = rental.customer_id
WHERE concat(cu.first_name,' ',cu.last_name) = 'SUSAN WILSON'
GROUP BY category.name
ORDER BY count(rental_id) DESC,category.name ASC
LIMIT 3;
    
    
      
SELECT count(*) AS R_rated_movies_rented_by_SusanWilson from film
JOIN inventory AS inv ON inv.film_id=film.film_id
JOIN rental ON rental.inventory_id = inv.inventory_id
JOIN customer AS cu ON cu.customer_id=rental.customer_id 
WHERE film.rating = 'R' AND concat(cu.first_name,' ',cu.last_name)='SUSAN WILSON';

select * from sales_by_film_category where category='Drama';
