-- /* Q1: Who is the senior most employee based on job title? */

SELECT 
    *
FROM
    employee
ORDER BY levels DESC
LIMIT 1;

-- Who is the Junior most employee based on job title?

SELECT 
    *
FROM
    employee
ORDER BY levels ASC
LIMIT 1;

-- /* Q2: Which countries have the most Invoices? */

SELECT 
    COUNT(*), billing_country AS country
FROM
    invoice
GROUP BY billing_country
ORDER BY country DESC
LIMIT 1;

-- /* Q3: What are top 3 values of total invoice? */

SELECT 
    total
FROM
    invoice
ORDER BY total DESC
LIMIT 3;

-- /* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. 
-- Return both the city name & sum of all invoice totals */

SELECT 
    SUM(total) AS b, billing_city
FROM
    invoice
GROUP BY billing_city
ORDER BY b DESC
LIMIT 1
   
-- /* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money.*/
   
SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    SUM(invoice.total) AS totals
FROM
    customer
        JOIN
    invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id , customer.first_name , customer.last_name
ORDER BY totals DESC
LIMIT 1

-- /* Question Set 2 - Moderate */

-- /* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A. */

-- /*Method 1 */

SELECT 
    email, first_name, last_name
FROM
    customer
        JOIN
    invoice ON customer.customer_id = invoice.invoice_id
        JOIN
    invoice_line ON invoice_line.invoice_id = invoice.invoice_id
        JOIN
    track ON track.track_id = invoice_line.track_id
        JOIN
    genre ON genre.genre_id = track.genre_id
WHERE
    genre.name = 'rock'
ORDER BY email
