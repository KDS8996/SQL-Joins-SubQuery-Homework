-- 1. List all customers who live in Texas (use JOINs)

select
	customers.customer_id,
    customers.name,
    customers.email,
    customers.phone_number
FROM
    customers
JOIN
    states ON customers.state_name = states.state_name
WHERE
    states.state_name = 'Texas';

 -- 2. Get all payments above $6.99 with the Customer's Full Name
 SELECT
    customers.customer_id,
    customers.name AS customer_name,
    payments.payment_id,
    payments.amount,
    payments.payment_date
FROM
    customers
JOIN
    payments ON customers.customer_id = payments.customer_id
WHERE
    payments.amount > 6.99;
   
 -- 3. Show all customers names who have made payments over $175(use subqueries)
  SELECT
    name AS customer_name
FROM
    customers
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            payments
        WHERE
            amount > 175.0
 );

-- 4. List all customers that live in Nepal (use the city table)
SELECT
    customers.customer_id,
    customers.name AS customer_name,
    customers.email,
    customers.phone_number
FROM
    customers
JOIN
    address ON customers.address_id = address.address_id
JOIN
    city ON address.city_id = city.city_id
WHERE
    city.country = 'Nepal';
 
 -- 5. Which staff member had the most transactions?
 SELECT
    staff.staff_id,
    staff.first_name,
    staff.last_name,
    COUNT(*) AS transaction_count
FROM
    staff
JOIN
    payments ON staff.staff_id = payments.staff_id
GROUP BY
    staff.staff_id, staff.first_name, staff.last_name
ORDER BY
    transaction_count DESC
LIMIT 1;


-- 6. How many movies of each rating are there?
SELECT
    rating,
    COUNT(*) AS movie_count
FROM
    movies
GROUP BY
    rating;

 -- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
 SELECT
    customers.customer_id,
    customers.name AS customer_name,
    customers.email,
    customers.phone_number
FROM
    customers
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            payments
        WHERE
            amount > 6.99
        GROUP BY
            customer_id
        HAVING
            COUNT(*) = 1
 );

-- 8. How many free rentals did our stores give away
SELECT
    COUNT(*) AS free_rental_count
FROM
    rentals
WHERE
    rental_fee = 0;
