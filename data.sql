-- Create Customers Table
CREATE TABLE customers (
 customer_id INT AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 email VARCHAR(255),
 phone_number VARCHAR(20),
 shipping_address VARCHAR(255)
);

-- Create Products Table
CREATE TABLE products (
 product_id INT AUTO_INCREMENT PRIMARY KEY,
 product_name VARCHAR(255),
 description TEXT,
 price DECIMAL(10, 2),
 stock_quantity INT,
 category VARCHAR(100)
);

-- Create Orders Table
CREATE TABLE orders (
 order_id INT AUTO_INCREMENT PRIMARY KEY,
 customer_id INT,
 order_date TIMESTAMP,
 order_status VARCHAR(50),
 total_amount DECIMAL(10, 2),
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Order Items Table
CREATE TABLE order_items (
 order_item_id INT AUTO_INCREMENT PRIMARY KEY,
 order_id INT,
 product_id INT,
 quantity INT,
 subtotal DECIMAL(10, 2),
 FOREIGN KEY (order_id) REFERENCES orders(order_id),
 FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create Payments Table
CREATE TABLE payments (
 payment_id INT AUTO_INCREMENT PRIMARY KEY,
 order_id INT,
 payment_date TIMESTAMP,
 payment_method VARCHAR(50),
 amount_paid DECIMAL(10, 2),
 payment_status VARCHAR(50),
 FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Insert records into Customers Table
INSERT INTO customers (customer_id, first_name, last_name, email, phone_number,
shipping_address) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm Street, Springfield'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak Avenue, Springfield'),
(3, 'Emily', 'Johnson', 'emily.johnson@example.com', '555-8765', '789 Pine Road, Springfield'),
(4, 'Michael', 'Williams', 'michael.williams@example.com', '555-4321', '101 Maple Street,
Springfield'),
(5, 'Sarah', 'Brown', 'sarah.brown@example.com', '555-6789', '202 Cedar Lane, Springfield');

-- Insert records into Products Table
INSERT INTO products (product_id, product_name, description, price, stock_quantity, category)
VALUES
(1, 'Red Mushroom Keychain', 'Handmade red mushroom keychain with a cute face', 12.99, 50,
'Keychains'),
(2, 'Blue Mushroom Keychain', 'Handmade blue mushroom keychain with a cute face', 12.99,
40, 'Keychains'),
(3, 'Green Mushroom Plushie', 'Soft green mushroom plushie with detailed embroidery', 25.99,
30, 'Plushies'),
(4, 'Pink Mushroom Brooch', 'Elegant pink mushroom brooch with a pearl detail', 18.99, 20,
'Accessories'),
(5, 'Purple Mushroom Hat', 'Warm purple mushroom hat with a cozy fit', 22.99, 15, 'Hats');

-- Insert records into Orders Table
INSERT INTO orders (order_id, customer_id, order_date, order_status, total_amount) VALUES
(1, 1, '2024-09-01 10:00:00', 'Processing', 25.98),
(2, 2, '2024-09-02 14:30:00', 'Shipped', 38.98),
(3, 3, '2024-09-03 09:15:00', 'Delivered', 47.98),
(4, 4, '2024-09-04 16:45:00', 'Processing', 37.98),
(5, 5, '2024-09-05 11:00:00', 'Completed', 22.99);

-- Insert records into Order Items Table
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES
(1, 1, 1, 2, 25.98),
(2, 2, 2, 2, 25.98),
(3, 2, 3, 1, 25.99),
(4, 3, 4, 1, 18.99),
(5, 3, 5, 1, 22.99);

-- Insert records into Payments Table
INSERT INTO payments (payment_id, order_id, payment_date, payment_method,
amount_paid, payment_status) VALUES
(1, 1, '2024-09-01 10:05:00', 'Credit Card', 25.98, 'Paid'),
(2, 2, '2024-09-02 14:35:00', 'PayPal', 38.98, 'Paid'),
(3, 3, '2024-09-03 09:20:00', 'Credit Card', 47.98, 'Paid'),
(4, 4, '2024-09-04 16:50:00', 'Gcash', 37.98, 'Pending'),
(5, 5, '2024-09-05 11:05:00', 'PayPal', 22.99, 'Paid');