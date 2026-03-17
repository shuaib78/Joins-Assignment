create database joins_assignment;
use joins_assignment;
create table Customers (
Customer_id int primary key,
Customer_name varchar(50),
City varchar(50)
);
insert into Customers (Customer_id, Customer_name, City)
values 
(1,"John Smith","New York"),
(2,"Mary Johnson","Chicago"),
(3,"Peter Adams","Los Angeles"),
(4,"Nancy Miller","Houston"),
(5,"Robert White","Miami");
select * from Customers;
create table Orders (
Order_id int,
Customer_id int,
Order_date date,
Amount int);
insert into Orders 
values 
(101,1,"2024-10-01",250),
(102,2,"2024-10-05",300),
(103,1,"2024-10-07",150),
(104,3,"2024-10-10",450),
(105,6,"2024-10-12",400);
select * from Orders;
create table Payments (
Payment_id varchar(10),
Customer_id int,
Payment_date date,
Amount int);
insert into Payments 
values 
("P001", 1, "2024-10-02", 250),
("P002", 2, "2024-10-06", 300),
("P003", 3, "2024-10-11", 450),
("P004", 4, "2024-10-15", 200);
create table Employees(
Employee_id int,
Employee_name varchar(50),
Manager_id int null);
insert into Employees
values 
(1, "Alex Green", null),
(2, "Brian Lee", 1),
(3, "Carol Ray", 1),
(4, "David Kim", 2),
(5, "Eva Smith", 2);
SELECT DISTINCT c.*
FROM Customers c
INNER JOIN Orders o
ON c.Customer_id = o.Customer_id;
SELECT c.Customer_id, c.Customer_name, o.Order_id, o.Order_date, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_id = o.Customer_id;
SELECT o.Order_id, o.Order_date, o.Amount, c.Customer_id, c.Customer_name
FROM Orders o
LEFT JOIN Customers c
ON o.Customer_id = c.Customer_id;
SELECT c.Customer_id, c.Customer_name, o.Order_id, o.Order_date, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_id = o.Customer_id
UNION
SELECT c.Customer_id, c.Customer_name, o.Order_id, o.Order_date, o.Amount
FROM Orders o
LEFT JOIN Customers c
ON o.Customer_id = c.Customer_id;
SELECT c.Customer_id, c.Customer_name
FROM Customers c
LEFT JOIN Orders o
ON c.Customer_id = o.Customer_id
WHERE o.Order_id IS NULL;
SELECT DISTINCT p.Customer_id, c.Customer_name
FROM Payments p
JOIN Customers c
  ON p.Customer_id = c.Customer_id
LEFT JOIN Orders o
  ON c.Customer_id = o.Customer_id
WHERE o.Order_id IS NULL;
SELECT c.Customer_id, c.Customer_name, o.Order_id, o.Order_date, o.Amount
FROM Customers c
CROSS JOIN Orders o;
SELECT 
    c.Customer_id,
    c.Customer_name,
    o.Order_id,
    o.Order_date,
    o.Amount AS Order_Amount,
    p.Payment_id,
    p.Amount AS Payment_Amount
FROM Customers c
LEFT JOIN Orders o
    ON c.Customer_id = o.Customer_id
LEFT JOIN Payments p
    ON c.Customer_id = p.Customer_id;
    SELECT DISTINCT c.Customer_id, c.Customer_name
FROM Customers c
INNER JOIN Orders o
    ON c.Customer_id = o.Customer_id
INNER JOIN Payments p
    ON c.Customer_id = p.Customer_id;