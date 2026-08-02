use sakila;


## Mostrar nombre y apellido de todos los clientes
	SELECT * FROM customer; 
	SELECT customer_id, first_name, last_name FROM customer

## Mostrar nombre y apellido de todos los clientes
	ORDER BY last_name ASC;

##Cantidad pagada y fecha del pago con nombre y apellido del cliente (JOIN entre Payment - Customer)
	SELECT customer.first_name, customer.last_name, payment.amount, payment.payment_date FROM customer
	JOIN payment ON customer.customer_id = payment.customer_id;

## Nombre y apellido de clientes sin pagos (LEFT JOIN entre Payment - Customer pero usando WHERE)
	SELECT customer.first_name, customer.last_name FROM customer
	LEFT JOIN payment ON customer.customer_id = payment.customer_id
	WHERE payment.payment_date IS NULL;

## Películas con duración mayor a 120 minutos
	SELECT * FROM film
	Where length > 120

##Top 5 películas más largas --> TIP: Use la palabra LIMIT
	ORDER BY length desc
	LIMIT 5;

##Películas alquiladas (JOIN entre Rental - Inventory - Film)
	SELECT film.title FROM rental
	JOIN inventory ON rental.inventory_id = inventory.inventory_id
	JOIN film ON inventory.film_id = film.film_id;

##Listar los nombres de las peliculas y su duracion de aquellos titulos que no tienen actores
	SELECT film_list.title, film_list.length FROM film_list
	WHERE length IS NULL;
    
## Insertar actor temporal
	INSERT INTO actor (first_name, last_name)
	VALUES ('ALEXANDRE','PEREZ');

## Actualizar actor
	UPDATE actor
	SET 
	first_name = 'ALEXANDER',
	last_name = 'MERCHAN'
	WHERE actor_id = '201';

## Eliminar actor
	DELETE FROM actor
	WHERE actor_id = 201;

## Top 5 clientes con mayor cantidad de dinero pagado al servicio de rentas
	SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(payment.amount) FROM customer
	JOIN payment ON customer.customer_id = payment.customer_id
	GROUP BY customer.customer_id, customer.first_name, customer.last_name
	ORDER BY SUM(payment.amount) DESC
	LIMIT 5;
     
## Top 5 Películas más alquiladas (JOIN entre Rental - Inventory - Film) --> Agrupar los datos con conteo y tomar las mejores 5
	
    SELECT film.title, COUNT(rental.rental_date) FROM rental
	JOIN inventory ON rental.inventory_id = inventory.inventory_id
    JOIN film ON inventory.film_id = film.film_id
    GROUP BY film.title
    ORDER BY COUNT(rental.rental_date) DESC
	LIMIT 5;
    