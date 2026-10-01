use ecommerce;

CREATE TABLE customer(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    email VARCHAR (50),
    phone VARCHAR(50)
);


INSERT into customer values(1,'yelleswar','ongole','andhra pradesh','yelleswar@gmail.com','9177395550');
INSERT into customer values(2,'ukesh','harohalli','andhra pradesh','ukesh@gmail.com','91772772550'),
                            (3,'prem','tirupati','andhra pradesh','prem@gmail.com','2738395550'),
                            (4,'koti','hosur','tamil nadu','koti@gmail.com','98395550'),
                            (5,'anish','jakksandra','karnataka','anish@gmail.com','78735550'),
                            (6,'hemanth','kochi','kerala','hemanth@gmail.com','9177395550'),
                            (7,'vishnu','ananthapur','andhra pradesh','vishnu@gmail.com','9177395550'),
                            (8,'challa','tirupati','andhra pradesh','chlla@gmail.com','9177395550'),
                            (9,'nithin','hindupur','karnatakah','nithin@gmail.com','9177395550'),
                            (10,'nandhu','pune','maharastra','nandhu@gmail.com','9177395550'),
                            (11,'jhon','munnar','kerala','@gmail.com','9177395550'),
                            (12,'ram','vizg','andhra pradesh','ram@gmail.com','9177395550'),
                            (13,'sita','chennai','tamil nadu','sita@gmail.com','9177395550'),
                            (14,'ninmisha','rajamumdry','punjab','ninmisha@gmail.com','9177395550'),
                            (15,'mukund','panjim','goa','mukund@gmail.com','9177395550');
                            
                            

select * from customer;

SELECT customer_name
FROM customer;

SELECT customer_name
FROM customer
WHERE city='tirupati';

SELECT *
FROM customer
LIMIT 5;

SELECT customer_name,email,phone
FROM customer
WHERE city in('tirupati','ongole');

SELECT * 
FROM customer
WHERE city='tirupati' AND city='ongole';

SELECT * 
FROM customer
WHERE city='tirupati' OR city='ongole';

SELECT * 
FROM customer
WHERE customer_id BETWEEN 2 AND 11;

SELECT * 
FROM customer
WHERE customer_name LIKE'y%';

SELECT DISTINCT state
FROM customer;

SELECT COUNT(customer_id) AS total_number
FROM customer;

CREATE TABLE product(
    product_id INT PRIMARY KEY,
    product_name VARCHAR (30),
    Category VARCHAR (20),
    price DECIMAL(5,2),
    stock INT
);

ALTER TABLE product
MODIFY price DECIMAL(10,2);

INSERT INTO product VALUES(1, 'Laptop', 'Electronics', 65000.50, 45),
(2, 'Mouse', 'Electronics', 300.50, 250),
(3, 'Running Shoes', 'Fashion', 2500.50, 120),
(4, 'Smartphone', 'Electronics', 18999.00, 80),
(5, 'Bluetooth Speaker', 'Electronics', 2499.50, 150),
(6, 'Headphones', 'Electronics', 3300.50, 85),
(7, 'T-Shirt', 'Fashion', 799.00, 200),
(8, 'Jeans', 'Fashion', 1499.50, 100),
(9, 'Kurti', 'Fashion', 999.00, 75),
(10, 'Office Chair', 'Home & Kitchen', 5499.00, 40),
(11, 'Electric Kettle', 'Home & Kitchen', 1299.50, 90),
(12, 'Water Bottle', 'Home & Kitchen', 499.00, 180),
(13, 'Face Wash', 'Beauty', 299.50, 150),
(14, 'Shampoo', 'Beauty', 450.00, 120),
(15, 'Moisturizer', 'Beauty', 599.00, 95),
(16, 'Cricket Bat', 'Sports', 2499.00, 60),
(17, 'Yoga Mat', 'Sports', 899.50, 110);


SELECT * 
FROM product;

SELECT product_name
FROM product;

SELECT *
FROM product
WHERE price >= 2000;

SELECT product_name
FROM product
WHERE category in ('electronics' , 'sports');

SELECT product_name , category , price
FROM product
ORDER BY price desc;

SELECT MAX(price) AS highest_price
FROM product;

SELECT MIN(price) AS lowest_price
FROM product;

SELECT AVG(price) AS avg_price
FROM product
WHERE Category='electronics';

SELECT SUM(price) as total_sum
FROM product;

SELECT *
FROM product
ORDER BY price desc
LIMIT 5 ;

SELECT * 
FROM product
WHERE category='electronics' ORDER BY price ASC
LIMIT 1;
          
CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT ,
    order_date DATE,
    order_status ENUM('Delivered', 'Cancelled', 'Shipping', 'Processing'),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)

);


INSERT INTO orders VALUES
(1, 1, '2026-09-01', 'Delivered'),
(2, 2, '2026-09-02', 'Processing'),
(3, 3, '2026-09-03', 'Shipping'),
(4, 4, '2026-09-04', 'Delivered'),
(5, 5, '2026-09-05', 'Cancelled'),
(6, 1, '2026-09-06', 'Shipping'),
(7, 7, '2026-09-07', 'Delivered'),
(8, 8, '2026-09-08', 'Processing'),
(9, 9, '2026-09-09', 'Cancelled'),
(10, 1, '2026-09-10', 'Shipping'),
(11, 2, '2026-09-11', 'Delivered');

SELECT * FROM orders;


CREATE TABLE order_items(
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)

);


INSERT INTO order_items VALUES
(1, 1, 3),
(2, 1, 7),
(3, 2, 1),
(4, 2, 5),
(5, 3, 12),
(6, 4, 6),
(7, 4, 10),
(8, 5, 2),
(9, 6, 15),
(10, 7, 8),
(11, 8, 4),
(12, 9, 13),
(13, 10, 16),
(14, 11, 17),
(15, 3, 9);


SELECT * 
FROM order_items;

CREATE table payment(
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(100),
    payment_amount DECIMAL(10,2),
    payment_status VARCHAR(100),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)

);


INSERT INTO payment VALUES
(1, 1, 'UPI', 67500.50, 'Success'),
(2, 2, 'Credit Card', 21999.00, 'Success'),
(3, 3, 'Debit Card', 1299.50, 'Success'),
(4, 4, 'UPI', 3300.50, 'Success'),
(5, 5, 'Cash on Delivery', 799.00, 'Failure'),
(6, 6, 'UPI', 599.00, 'Success'),
(7, 7, 'Credit Card', 1499.50, 'Success'),
(8, 8, 'Debit Card', 2499.00, 'Failure'),
(9, 9, 'UPI', 299.50, 'Refund'),
(10, 10, 'Credit Card', 2499.00, 'Failure'),
(11, 11, 'UPI', 899.50, 'Success');

SELECT * FROM payment;


SELECT *
FROM customer
JOIN orders 
on customer.customer_id=orders.order_id;



