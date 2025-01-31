# SUBQUERIES-AND-VIEWS

## Overview

This repository contains SQL scripts to create and manipulate Country, Persons, and Customer tables. It includes subqueries, user-defined functions, and views to perform various operations in a database environment.

## Features

Country and Persons Table Operations

* Create Tables: Define Country and Persons tables with appropriate relationships.

* Data Insertion: Populate the tables with sample data.

* Subqueries:

1. Find the number of persons in each country.

2. Sort countries by the number of persons from highest to lowest.

3. Calculate the average rating of persons in each country (filtered for averages above 3.0).

4. Retrieve countries with the same rating as the USA using a subquery.

5. Select all countries whose population is greater than the average population.

** Database & Table Creation:

Create a Product database.

Define the Customer table with fields such as Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, and Country.

a) Views Creation:

customer_info: Displays customers' full name and email.

b) US_Customers: Displays only customers located in the USA.

c) Customer_details: Combines first_name and last_name along with email, phone_no, and state.

** Data Manipulation & Queries:

d) Update phone numbers for customers residing in California.

e) Count the number of customers per state and filter states with more than five customers.

f) Retrieve customer count per state from the Customer_details view.

g) Display all customer details sorted by state in ascending order.


## Usage

Run the scripts in a MySQL environment.

Ensure the necessary tables exist before executing dependent queries.

Execute subqueries, functions, and views sequentially to observe transformations and results.


# SQL Scripts

USE INFO;

## -- Create and populate the COUNTRY2 table
CREATE TABLE COUNTRY(
    ID INT PRIMARY KEY,
    COUNTRY_NAME VARCHAR(50),
    POPULATION INT,
    AREA FLOAT
);

INSERT INTO COUNTRY(ID, COUNTRY_NAME, POPULATION, AREA)
VALUES 
(1, 'USA', 331000000, 9834000),
(2, 'India', 1400000000, 3287000),
(3, 'China', 1440000000, 9597000),
(4, 'Brazil', 213000000, 8516000),
(5, 'Russia', 146000000, 17098200),
(6, 'Japan', 126000000, 377975),
(7, 'Germany', 83000000, 357386),
(8, 'UK', 67000000, 242495),
(9, 'France', 67000000, 551695),
(10, 'Australia', 25600000, 7692024);

SELECT * FROM COUNTRY;

![image](https://github.com/user-attachments/assets/629cfa90-4491-4460-a0d7-483c1c1cb5ed)


## -- Create and populate the PERSONS table
CREATE TABLE PERSONS(
    ID INT PRIMARY KEY,
    F_NAME VARCHAR(50),
    L_NAME VARCHAR(50),
    POPULATION INT,
    RATING FLOAT,
    COUNTRY_ID INT,
    COUNTRY_NAME VARCHAR(50),
    FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRY(ID)
);

INSERT INTO PERSONS(ID, F_NAME, L_NAME, POPULATION, RATING, COUNTRY_ID, COUNTRY_NAME)
VALUES
(1, 'John', 'Doe', 5000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 6000, 4.7, 1, 'USA'),
(3, 'Raj', 'Kumar', 7000, 4.9, 2, 'India'),
(4, 'Wei', 'Zhang', 5500, 4.6, 3, 'China'),
(5, 'Ana', 'Silva', 5000, 3.0, 4, 'Brazil'),
(6, 'Olga', 'Ivanova', 3000, 4.3, 5, 'Russia'),
(7, 'Taro', 'Yamamoto', 2000, 2.5, 6, 'Japan'),
(8, 'Hans', 'Müller', 2500, 4.2, 7, 'Germany'),
(9, 'Emma', 'Brown', 4000, 4.5, 8, 'UK'),
(10, 'Jean', 'Dupont', 3000, 4.1, 9, 'France');

SELECT * FROM PERSONS;

![image](https://github.com/user-attachments/assets/5cf8dd1e-75a3-4a9e-8afa-a270dfe6564e)

## 1. Find the number of persons in each country.

SELECT COUNTRY_NAME,COUNT(*) AS "PERSON-COUNT" FROM PERSONS GROUP BY COUNTRY_NAME;

![image](https://github.com/user-attachments/assets/f69a021f-5cd6-41c0-94bc-f650abb00254)

## 2. Find the number of persons in each country sorted from high to low.

INSERT INTO PERSONS(ID, F_NAME, L_NAME, POPULATION, RATING, COUNTRY_ID, COUNTRY_NAME)
VALUES
(11, 'Jolly', 'Ron', 1000, 1.5, 7, 'Germany'),
(12, 'Katty', 'Smith', 2000, 2.7, 7, 'Germany');
select * from persons;

SELECT COUNTRY_NAME,COUNT(*) AS PERSON_COUNT FROM PERSONS GROUP BY COUNTRY_NAME ORDER BY PERSON_COUNT DESC;

![image](https://github.com/user-attachments/assets/5919c227-c945-4010-ba23-e7c398290112)

 ## 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0

 SELECT COUNTRY_NAME, AVG(RATING) AS AVERAGE_RATING FROM PERSONS GROUP BY COUNTRY_NAME HAVING AVG(RATING)>3.0;

 ![image](https://github.com/user-attachments/assets/a2d7b806-6106-461c-bab8-f5fcafb3f3bf)

 ## 4. Find the countries with the same rating as the USA. (Use Subqueries)

 SELECT COUNTRY_ID,COUNTRY_NAME,RATING FROM PERSONS WHERE RATING IN(SELECT RATING FROM PERSONS WHERE COUNTRY_NAME='USA');

 ![image](https://github.com/user-attachments/assets/4668d29a-2ed7-4bca-8921-092ace9e5b0f)

 ## 5. Select all countries whose population is greater than the average population of all nations. 

  SELECT COUNTRY_ID,COUNTRY_NAME,POPULATION FROM PERSONS WHERE POPULATION >(SELECT AVG(POPULATION) FROM PERSONS);

  ![image](https://github.com/user-attachments/assets/b02c9981-961f-4143-a0ad-e6850e0a0e8a)

## Create a database named Product and create a table called Customer with the following fields in the Product database: Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 

 
 CREATE DATABASE PRODUCT;
 USE PRODUCT;
 
 CREATE TABLE CUSTOMER(CUS_ID INT PRIMARY KEY, F_NAME VARCHAR(30),L_NAME VARCHAR(30),EMAIL VARCHAR(50),
 PHONE VARCHAR(30),ADDRESS VARCHAR(100),CITY VARCHAR(30),STATE VARCHAR(30),ZIPCODE INT,COUNTRY VARCHAR(30));
 
 INSERT INTO CUSTOMER VALUES(1,'LEO','GILL','leo.gill@gmail.com','65898978','122,high street','Alabama','Montgomery',35004,'USA'),
 (2,'DAIN','RIVER','dain.river@gmail.com','45896978','452,high street','Delavare','Dover',35074,'USA');
 
 SELECT * FROM CUSTOMER;

![image](https://github.com/user-attachments/assets/fff91a76-6619-402f-a5f2-bfb7cd1fda08)

 ## 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address.Then perform the SELECT operation for the customer_info view.
 
 CREATE VIEW CUSTOMER_INF AS
 SELECT CONCAT(F_NAME," ",L_NAME) AS FULLNAME,EMAIL FROM CUSTOMER;
 
 SELECT * FROM CUSTOMER_INF;

 ![image](https://github.com/user-attachments/assets/33c891ea-4ed6-400b-8893-abdd1c7a432a)

  ## 2. Create a view named US_Customers that displays customers located in the US.
 
  INSERT INTO CUSTOMER VALUES(3,'YEMA','GILL','yema.gill@gmail.com','75898978','123,bourville street','Berlin','Brandenburg',85004,'Germany'),
 (4,'ALEX','PHILIP','alex.phil@gmail.com','95896978','236,bris street','Settlement City','NSW',23574,'Australia');
 
 SELECT * FROM CUSTOMER;

 ![image](https://github.com/user-attachments/assets/3d3b8d7b-f541-4016-baee-88207bd4598c)


 CREATE VIEW US_CUSTOMERS AS 
 SELECT * FROM CUSTOMER WHERE COUNTRY='USA';
 
 SELECT * FROM US_CUSTOMERS;

 ![image](https://github.com/user-attachments/assets/5c3bbeca-e432-45e9-ae4c-ea5aaf863447)

   ## 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
  
  CREATE VIEW CUSTOMER_DETAILS AS 
  SELECT CONCAT(F_NAME," ",L_NAME) AS FULLNAME,EMAIL,PHONE,STATE FROM CUSTOMER;
  
  SELECT * FROM CUSTOMER_DETAILS;

  ![image](https://github.com/user-attachments/assets/3863eb0f-da85-4fcc-99b8-190cb1ab98dc)

  ## 4. Update phone numbers of customers who live in California for Customer_details view.

 INSERT INTO CUSTOMER VALUES(5,'LEONA','THOMAS','leona@gmail.com','75898978','123,Winston Fort','Los Angeles','California',78008,'USA'),
 (7,'ZENITH','DAVE','zen@gmail.com','10296978','528 ,Arthur street','San Fransisco','California',325033,'USA');
 
 select * from customer;

 ![image](https://github.com/user-attachments/assets/c3890e41-9e57-4cbe-ae08-7da75b940c94)

 SET SQL_SAFE_UPDATES=0;
 
 UPDATE CUSTOMER SET PHONE="123-003-333" WHERE STATE="CALIFORNIA";

 SELECT * FROM CUSTOMER_DETAILS;

   ![image](https://github.com/user-attachments/assets/e6d7538c-b731-43b1-9f8b-88c321e90d6e)

      ## 5. Count the number of customers in each state and show only states with more than 5 customers.
   
   INSERT INTO CUSTOMER VALUES(6,'JANE','THOMAS','jane@gmail.com','75825978','123,Winston Fort','Los Angeles','California',78008,'USA'),
 (8,'UVEN','DAVE','uven@gmail.com','10296458','528 ,Arthur street','San Fransisco','California',325033,'USA'),
 (9,'REA','GILL','rea.gill@gmail.com','65898978','122,high street','San Fransisco','California',325033,'USA'),
 (10,'LAKA','RIVER','laka.river@gmail.com','365896978','452,high street','San Fransisco','California',325033,'USA'),
 (11,'Elisa','GATES','elisa@gmail.com','65898978','122,new street','Berlin','Brandenburg',85004,'Germany'),
 (12,'Finny','Phil','finny.@gmail.com','45896978','452,Ampy street','Berlin','Brandenburg',85004,'Germany'),
 (13,'LEO','Blake','leo.b@gmail.com','65898978','122,Rhodes high street','Alabama','Montgomery',35004,'USA'),
 (14,'Steve','RIVER','steve.river@gmail.com','45896978','452,Amster high street','Berlin','Brandenburg',85004,'Germany'),
 (15,'Jess','George','jess.gl@gmail.com','65898977','122,Southern high street','Berlin','Brandenburg',85704,'Germany'),
 (16,'Senita','Ran','Sen.r@gmail.com','45896978','452,high street','Berlin','Brandenburg',85004,'Germany');
 
  INSERT INTO CUSTOMER VALUES(17,'Ross','THOMAS','r@gmail.com','75823978','123,Winston Fort','Los Angeles','California',78008,'USA');
  
  select * from customer;

  ![image](https://github.com/user-attachments/assets/156f80a8-4c55-4585-bb9c-21db7c3029ad)

  select state,count(*) as count_customers from customer group by state having count(*)>5;

  ![image](https://github.com/user-attachments/assets/0a17042e-04f7-4b86-8388-ec8e6362f2c8)
  

   ## 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
 
 select State,count(*) as customer_count from customer_details group by state;

 ![image](https://github.com/user-attachments/assets/3cd32550-8391-4d91-a0e5-4928994b647e)


 ## 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
 
 SELECT * FROM CUSTOMER_DETAILS ORDER BY STATE ASC;

 ![image](https://github.com/user-attachments/assets/c5a79072-42fb-4084-a46a-424da50eb17b)

 # Author

 Developed by Liana Simon




   





 







