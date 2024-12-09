Sales Management System

This project demonstrates the implementation of a relational database for a Sales Management System using SQL. It includes the creation of tables, data insertion, and the execution of various queries to retrieve, update, and manipulate data for meaningful insights.

🚀 Project Overview

The database consists of three primary entities:

Salesman
Customer
Orders

The project showcases:

Schema Creation: Tables with appropriate primary and foreign keys.
Data Operations: Inserting, updating, and deleting records.
Complex Queries: Aggregations, joins, and conditions.
Business Use Cases: Queries to address real-world sales scenarios.
🛠️ Features
1. Database and Table Creation
Database: sales
Tables:
Salesman: Contains information about sales representatives.
Customer: Tracks customers and their relationships with salesmen.
Orders: Records details of customer orders.
2. Data Insertion
Sample data for each table is inserted to facilitate testing and demonstration of queries.

3. SQL Queries
The project includes SQL queries for:

Updating and altering records.
Joining tables to extract meaningful relationships.
Aggregate calculations like total and average purchase amounts.
Filtering data with conditions like ranges, patterns, and exclusions.
🗂️ Schema Design
The Entity-Relationship Diagram (ERD) below illustrates the relationships between the tables:

Table	Attributes
Salesman	Salesman_id (PK), Name, City, Commission
Customer	Customer_id (PK), Cust_name, City, Grade, Salesman_id (FK)
Orders	Ord_no (PK), Purch_amt, Ord_date, Customer_id (FK), Salesman_id (FK)
📄 SQL Queries
Below is an overview of the key queries implemented in this project:

Data Manipulation
Update Salesman Data:
Update commission and city values for specific salesmen.

Update Customer Data:
Modify customer grade and city values.

Joins and Filters
Retrieve salespeople and customers in the same or different cities.
Extract details of orders handled by salesmen.
Aggregate Functions
Calculate:
Total purchase amount: SUM()
Average purchase amount: AVG()
Count of unique salespeople and customers: COUNT(DISTINCT)
Pattern Matching
Identify:
Salesmen whose names start with specific characters.
Customers whose names end with specific characters.
