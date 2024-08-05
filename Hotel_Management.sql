-- Create the database
CREATE DATABASE hotel;

-- Use the created database
USE hotel;

-- Create the customer_information table
CREATE TABLE customer_information (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(20) NOT NULL,
    customer_email VARCHAR(50) NOT NULL UNIQUE
);

-- Create the room_information table
CREATE TABLE room_information (
    room_number INT PRIMARY KEY,
    room_type VARCHAR(20) NOT NULL,
    room_status VARCHAR(20) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Create the reservation_information table
CREATE TABLE reservation_information (
    reservation_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    room_number INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    reservation_date DATETIME NOT NULL,
    reservation_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer_information (customer_id),
    FOREIGN KEY (room_number) REFERENCES room_information (room_number)
);

-- Create the payments table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    transaction_id VARCHAR(50) NOT NULL UNIQUE,
    payment_date DATETIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer_information (customer_id)
);

-- Insert sample data into customer_information table
INSERT INTO customer_information VALUES (1, 'John Smith', '123-456-7890', 'john@example.com');
INSERT INTO customer_information VALUES (2, 'Jane Doe', '555-555-5555', 'jane@example.com');
INSERT INTO customer_information VALUES (3, 'Sarah Johnson', '555-123-4567', 'sarah@example.com');
INSERT INTO customer_information VALUES (4, 'Mike Brown', '555-987-6543', 'mike@example.com');

-- Insert sample data into room_information table
INSERT INTO room_information VALUES (101, 'Standard', 'available', 100.00);
INSERT INTO room_information VALUES (102, 'Standard', 'available', 100.00);
INSERT INTO room_information VALUES (103, 'Deluxe', 'available', 150.00);
INSERT INTO room_information VALUES (104, 'Deluxe', 'occupied', 150.00);
INSERT INTO room_information VALUES (105, 'Standard', 'available', 100.00);
INSERT INTO room_information VALUES (106, 'Deluxe', 'available', 150.00);

-- Insert sample data into reservation_information table
INSERT INTO reservation_information VALUES (1, 1, 101, '2023-05-01', '2023-05-05', '2023-04-28 10:00:00', 'pending');
INSERT INTO reservation_information VALUES (2, 2, 102, '2023-06-01', '2023-06-05', '2023-05-28 10:00:00', 'confirmed');
INSERT INTO reservation_information VALUES (3, 1, 103, '2023-05-01', '2023-05-05', '2023-04-28 10:00:00', 'cancelled');
INSERT INTO reservation_information VALUES (4, 3, 105, '2023-05-15', '2023-05-20', '2023-05-10 12:00:00', 'confirmed');
INSERT INTO reservation_information VALUES (5, 4, 106, '2023-06-10', '2023-06-15', '2023-05-30 15:00:00', 'pending');

-- Insert sample data into payments table
INSERT INTO payments VALUES (1, 1, 100.00, 'txn_123456', '2023-05-03 14:00:00');
INSERT INTO payments VALUES (2, 2, 150.00, 'txn_789012', '2023-05-29 16:00:00');
INSERT INTO payments VALUES (3, 3, 100.00, 'txn_345678', '2023-05-12 11:00:00');
INSERT INTO payments VALUES (4, 4, 150.00, 'txn_901234', '2023-06-01 09:00:00');

-- Query to retrieve available rooms for a given date range
SELECT room_number, room_type, price 
FROM room_information
WHERE room_status = 'available' 
  AND room_number NOT IN (
    SELECT room_number 
    FROM reservation_information
    WHERE check_in_date <= '2023-06-01' -- Replace with your check-out date
      AND check_out_date >= '2023-05-01' -- Replace with your check-in date
  );
  
SET @check_in_date = '2023-05-01';
SET @check_out_date = '2023-06-01';

SELECT room_number, room_type, price 
FROM room_information
WHERE room_status = 'available' 
  AND room_number NOT IN (
    SELECT room_number 
    FROM reservation_information
    WHERE check_in_date <= @check_out_date 
      AND check_out_date >= @check_in_date
  );

-- Query to retrieve reservation information with associated customer and room information
SELECT 
  r.reservation_id, 
  c.customer_name, 
  c.customer_phone, 
  c.customer_email, 
  ri.room_number, 
  ri.room_type, 
  ri.price, 
  r.check_in_date, 
  r.check_out_date, 
  r.reservation_date, 
  r.reservation_status
FROM reservation_information r
INNER JOIN customer_information c ON r.customer_id = c.customer_id
INNER JOIN room_information ri ON r.room_number = ri.room_number;