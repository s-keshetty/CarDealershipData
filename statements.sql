INSERT INTO customers (name, phone) 
VALUES ('John Doe', '123-456-7890');


INSERT INTO cars (make, fuel_id, engine_id, price) 
VALUES ('Toyota Corolla', 1, 2, 22000.00);


UPDATE customers 
SET phone = '987-654-3210' 
WHERE customer_id = 1;


UPDATE cars 
SET price = 25000.00 
WHERE car_id = 3;


DELETE FROM customers 
WHERE customer_id = 5;


SELECT name, phone 
FROM customers 
WHERE customer_id < 5;


SELECT orders.order_id, customers.name, orders.order_date 
FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id;


SELECT cars.make, salespersons.name 
FROM orders 
JOIN cars ON orders.car_id = cars.car_id 
JOIN salespersons ON orders.salesperson_id = salespersons.salesperson_id;


SELECT COUNT(*) AS total_orders 
FROM orders;


SELECT AVG(price) AS avg_price 
FROM cars;


SELECT orders.order_id, customers.name AS customer_name, cars.make AS car_model, salespersons.name AS salesperson_name 
FROM orders 
JOIN customers ON orders.customer_id = customers.customer_id 
JOIN cars ON orders.car_id = cars.car_id 
JOIN salespersons ON orders.salesperson_id = salespersons.salesperson_id;


SELECT make, MAX(price) AS highest_price 
FROM cars;

