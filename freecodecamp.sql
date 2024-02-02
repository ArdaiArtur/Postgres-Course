SELECT p.payment_date ,c.first_name
FROM payment AS p
RIGHT JOIN customer AS c
ON p.customer_id=c.customer_id
WHERE c.active=1 AND p.customer_id=17;



SELECT DISTINCT  customer_id,payment_date,amount 
FROM payment ;

SELECT title,replacement_cost
FROM film
WHERE release_year<2000 OR replacement_cost<10 ;

SELECT first_name,last_name,email
FROM  customer 
WHERE email LIKE '%gmail%';

SELECT payment_id,customer_id,amount
FROM payment 
WHERE amount
BETWEEN 50 AND 100;

SELECT staff_id,SUM(amount) AS sum
FROM payment
GROUP BY staff_id;

SELECT payment_id,amount,payment_date
FROM payment 
WHERE DATE(payment_date) IN ('2007,02,15');



 