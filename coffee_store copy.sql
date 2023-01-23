describe customers;
describe products;
describe orders;

-- From the customers table, select the first name and phone number of all the females who have a last name of Bluth
select first_name 'First Name', phone_number 'Phone Number'
from customers
where gender = 'F' and last_name = 'Bluth';

-- From the products table, select the name for all products that have a price greater than 3.00 or a coffee origin of Sri Lanka.
select name 'Product Name'
from products
where price > 3.00 or coffee_origin = 'Sri Lanka';

-- How many male customers donâ€™t have a phone number entered into the customers table?
select count(*) 'Number of Male Customers Having No Phone Number'
from customers
where gender = 'M' and phone_number is Null;

-- From the products table, select the name and price of all products with a coffee origin equal to Colombia or Indonesia. Ordered by name from A-Z.
select name 'Product Name', price 'Price'
from products
where coffee_origin in ('Colombia', 'Indonesia')
order by name;

-- From the orders table, select all the orders from February 2017 for customers with idâ€™s of 2, 4, 6 or 8. 
select *
from orders
where order_time between '2017-01-31 00:00:00' and '2017-02-28 23:59:59' and customer_id in (2, 4, 6, 8);

-- From the customers table, select the first name and phone number of all customers whoâ€™s last name contains the pattern â€˜arâ€™.
select first_name 'First Name', phone_number 'Phone Number'
from customers
where last_name like '%ar%';

-- From the customers table, select distinct last names and order alphabetically from A-Z. 
select distinct last_name 'Last Name'
from customers
order by last_name;

-- From the orders table, select the first 3 orders placed by customer with id 1, in February 2017.
select *
from orders
where customer_id = 1 and order_time > '2017-01-31'
order by order_time
limit 3;

-- From the products table, select the name, price and coffee origin but rename the price to  retail_price in the results set.
select name 'Product Name', price 'retail_price', coffee_origin 'Coffee Origin'
from products;
