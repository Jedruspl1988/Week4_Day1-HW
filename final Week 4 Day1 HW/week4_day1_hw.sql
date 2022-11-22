-- How many actors are there with the last name ‘Wahlberg’? 
SELECT *
FROM actor;

SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';


-- How many payments were made between $3.99 and $5.99?
SELECT *
FROM payment

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;


-- What film does the store have the most of? (search in inventory table)
SELECT *
FROM inventory

SELECT film_id, COUNT(film_id) AS value_occurances 
FROM inventory
GROUP BY film_id
HAVING COUNT(film_id) >= 8
ORDER BY value_occurances DESC;

SELECT film_id, COUNT(*)
FROM inventory
GROUP BY 1
HAVING COUNT(*) >= 8
ORDER BY COUNT(*);


-- How many customers have the last name ‘William’?
SELECT *
FROM customer

SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';


-- What store employee (get the id) sold the most rentals?
SELECT *
FROM rental

SELECT staff_id, COUNT(rental_id) AS value_occurances
FROM rental
GROUP BY(staff_id)
ORDER BY value_occurances
LIMIT 1;


-- How many different distinct names are there?
SELECT *
FROM actor;

SELECT COUNT(DISTINCT first_name)
FROM actor;

SELECT COUNT(DISTINCT first_name)
FROM staff;

SELECT COUNT(DISTINCT first_name)
FROM customer;


-- What film has the most actors in it? (use film_actor table and get film_id)

SELECT *
FROM film_actor;

SELECT film_id, COUNT(actor_id) AS value_occurances
FROM film_actor
GROUP BY(film_id)
ORDER BY value_occurances DESC
LIMIT 1;


-- From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT *
FROM customer;

SELECT store_id = 1, COUNT(last_name) AS value_occurances
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id;

SELECT COUNT(last_name) AS value_occurances
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;

SELECT last_name AS value_occurances
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1
GROUP BY last_name;


-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)

SELECT *
FROM payment;

SELECT amount, COUNT(rental_id) AS value_occurances
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;


-- Within the film table, how many rating categories are there? And what rating has the most movies total?

SELECT *
FROM film;

SELECT rating, COUNT(*)
FROM film
GROUP BY 1
ORDER BY Count(*) DESC;

