-- 1. List the number of films per category.
SELECT CATEGORY_ID, COUNT(FILM_ID)
FROM SAKILA.FILM_CATEGORY
GROUP BY CATEGORY_ID;

-- 2. Display the first and the last names, as well as the address, of each staff member.
SELECT Staff.FIRST_NAME, Staff.LAST_NAME, Adress.ADDRESS
FROM SAKILA.STAFF Staff
LEFT JOIN SAKILA.ADDRESS Adress  
ON Staff.ADDRESS_ID = Adress.ADDRESS_ID;

-- 3. Display the total amount rung up by each staff member in August 2005.
SELECT STAFF_ID, SUM(AMOUNT)
FROM SAKILA.PAYMENT
WHERE MONTH(PAYMENT_DATE) = 8 AND YEAR(PAYMENT_DATE) = 2005
GROUP BY STAFF_ID;

-- 4. List all films and the number of actors who are listed for each film.
SELECT Films.FILM_ID, COUNT(Actor.ACTOR_ID)
FROM SAKILA.FILM Films
INNER JOIN SAKILA.FILM_ACTOR Actor
ON Films.FILM_ID = Actor.FILM_ID
GROUP BY Films.FILM_ID;

-- 5. Using the payment and the customer tables as well as the JOIN command, 
-- list the total amount paid by each customer. List the customers alphabetically by their last names.
SELECT Customer.LAST_NAME, SUM(Payment.AMOUNT)
FROM SAKILA.CUSTOMER Customer
LEFT JOIN SAKILA.PAYMENT Payment
ON Customer.CUSTOMER_ID = Payment.CUSTOMER_ID
GROUP BY Customer.CUSTOMER_ID
ORDER BY Customer.LAST_NAME;