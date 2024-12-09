-- Create a database with the name: sales

create database sales;
show databases;
use sales;
set sql_safe_updates=0;
-- Create the Table with the name: Sales1
-- Display all the data in the table

Create table Salesman(
Salesman_id int primary key,
Name varchar(25) Not null,
City varchar(25),
Commission float
);

insert into salesman values
 (5001, 'James Hogg', 'New York', 0.15),
 (5002, 'Nail Knite', 'Paris', 0.13),
 (5005, 'Pit Alex', 'London', 0.11),
 (5006, 'Mc Lyon', 'Paris', 0.14),
 (5007, 'Paul Adam', 'Rome', 0.13),
 (5003, 'Lauson Hen', 'San Jose', 0.12);

select * from salesman;

-- Create the Table with the name: customer
-- Display all the data in the table

create table customer(
Customer_id int primary key,
Cust_name varchar(25) not null,
City varchar(25),
Grade int,
Salesman_id int
);

insert into customer values
(3002, 'Nick Rimando', 'New York', 100, 5001), 
(3007, 'Brad Davis', 'New York', 200, 5001), 
(3005, 'Graham Zusi', 'california', 200, 5002), 
(3008, 'Julian Green', 'London', 300, 5002), 
(3004, 'Fabian Johnson', 'Paris', 300, 5006), 
(3009, 'Geoff Cameron', 'Berlin', 100, 5003), 
(3003, 'Jozy Altidor', 'New York', 200, 5007); 

select * from customer;

-- write a SQL query to change the following data from salesman
-- 1] Change commission of salesman with name of ‘Pit Alex’ to 0.22
-- 2] Change city of salesman with salesman_id of ‘5003’ to Paris
-- 3] Display all the data in the table

Update salesman set Commission = 0.22 where name = 'Pit Alex';
Update salesman set City = 'Paris' where Salesman_id = 5003;
select * from salesman;

-- write a SQL query to alter the following data from customer table
-- 1] Change grade of customer with name of ‘Graham Zusi’ to 300
-- 2] Change city of customer with cust_id of ‘3009’ to London
-- 3] Display all the data in the table

update customer set grade = 300 where cust_name = 'Graham Zusi';
update customer set City = 'London' where Customer_id = 3009;
select * from customer;

-- c] write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. 
-- Return salesman_id, name, city, commission.

select salesman_id, name, city, commission from salesman where city = 'Paris' or city = 'Rome';
--                                     OR
select salesman_id, name, city, commission from salesman where city in ('Paris', 'Rome');

-- d] write a SQL query to find the details of those salespeople who live in cities apart from 'Paris' and 'Rome'.
-- Return salesman_id, name, city, commission.

select salesman_id, name, city, commission from salesman where city != 'Paris' and city != 'Rome';
--                                      OR
select salesman_id, name, city, commission from salesman where city not in ('Paris', 'Rome');

-- e] write a SQL query to find the details of salespeople who get the commission in the range from 0.12 to 0.14 (begin and end values are included). 
-- Return salesman_id, name, city, and commission.

select salesman_id, name, city, commission from salesman where commission between 0.11 and 0.15;
--                                    OR
select salesman_id, name, city, commission from salesman where commission > 0.11 and commission < 0.15;

-- f] write a SQL query to find the details of those salespeople whose name starts with any letter within 'A' and 'L' (not inclusive). 
-- Return salesman_id, name, city, commission.

select salesman_id, name, city, commission from salesman where name between 'a%' and 'l%';

-- g] write a SQL query to find the details of the customers whose name begins with the letter 'B'. 
-- Return customer_id, cust_name, city, grade, salesman_id.

select customer_id, Cust_name, City, Grade, Salesman_id from customer where cust_name like 'b%';

-- h] write a SQL query to find the details of the customers whose names end with the letter 'n'. 
-- Return customer_id, cust_name, city, grade, salesman_id.

select customer_id, Cust_name, City, Grade, Salesman_id from customer where cust_name like '%n';

-- i] write a SQL query to find the details of those salespeople whose name starts with ‘N’ and the fourth character is 'l'. Rests may be any character. 
-- Return salesman_id, name, city, commission.

select * from salesman where name like 'n__l%';

-- j] write a SQL query to find the salesperson and customer who belongs to same city.
-- Return Salesman, cust_name and city.

select salesman.name as salesperson, customer.cust_name, customer.city from salesman 
inner join customer on salesman.city = customer.city;

-- k] write a SQL query to find the salesperson(s) and the customer(s) he handle. 
-- Return Customer Name, city, Salesman, commission

select Customer.cust_name as Customer_Name, Customer.city, salesman.name as salesman, salesman.commission from salesman 
inner join Customer on salesman.salesman_id = Customer.salesman_id;

-- l] write a SQL query to find those salespersons who received more than 12% commission from the company .

select * from salesman left join customer on salesman.salesman_id = customer.salesman_id 
where salesman.commission > 0.12;

-- m] write a SQL query to find those salespersons do not live in the same city where their customers live and received a commission from the company more than 12%. 
-- Return Customer Name, customer city, Salesman, salesman city, commission.

select customer.cust_name as customer_name, customer.city as customer_city, salesman.name as salesman, 
salesman.city as salesman_city, salesman.commission from salesman inner join customer 
on salesman.salesman_id = customer.salesman_id where salesman.city != customer.city and salesman.commission > 0.12;

-- Create the following Table with the name: Orders
-- Display data

create table Orders(
Ord_no int primary key,
Purch_amt float not null,
Ord_date date, 
Customer_id int,
Salesman_id int
);

insert into orders values 
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001);

select * from orders;

-- c] write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.

select sum(purch_amt) as Total_purchase_amount from orders;

-- d] write a SQL query to calculate average purchase amount of all orders. Return average purchase amount

select avg(purch_amt) as Average_purchase_amount from orders;

-- e] write a SQL query to count the number of unique salespeople. Return number of salespeople.

select count(distinct(salesman_id)) as Number_of_salespeople from orders;

-- f] write a SQL query to count the number of customers. Return number of customers.

select count(distinct(customer_id)) as Number_of_customers from orders;



                       

