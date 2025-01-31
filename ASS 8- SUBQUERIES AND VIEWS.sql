-- ASSIGNMENT 8- SUBQUERIES AND VIEWS
USE INFO;

-- Create and populate the COUNTRY2 table
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

-- Create and populate the PERSONS table
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

##1. Find the number of persons in each country. 
SELECT COUNTRY_NAME,COUNT(*) AS "PERSON-COUNT" FROM PERSONS GROUP BY COUNTRY_NAME;

##2. Find the number of persons in each country sorted from high to low.

INSERT INTO PERSONS(ID, F_NAME, L_NAME, POPULATION, RATING, COUNTRY_ID, COUNTRY_NAME)
VALUES
(11, 'Jolly', 'Ron', 1000, 1.5, 7, 'Germany'),
(12, 'Katty', 'Smith', 2000, 2.7, 7, 'Germany');
select * from persons;

SELECT COUNTRY_NAME,COUNT(*) AS PERSON_COUNT FROM PERSONS GROUP BY COUNTRY_NAME ORDER BY PERSON_COUNT DESC;

##3. Find out an average rating for Persons in respective countries if the average is greater than 3.0

SELECT COUNTRY_NAME, AVG(RATING) AS AVERAGE_RATING FROM PERSONS GROUP BY COUNTRY_NAME HAVING AVG(RATING)>3.0;

## 4. Find the countries with the same rating as the USA. (Use Subqueries)

SELECT COUNTRY_ID,COUNTRY_NAME,RATING FROM PERSONS WHERE RATING IN(SELECT RATING FROM PERSONS WHERE COUNTRY_NAME='USA');

 ## 5. Select all countries whose population is greater than the average population of all nations. 
 
 SELECT COUNTRY_ID,COUNTRY_NAME,POPULATION FROM PERSONS WHERE POPULATION >(SELECT AVG(POPULATION) FROM PERSONS);
 
 ## Create a database named Product and create a table called Customer with the following fields in the Product database: 
 ## Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country 
 
 CREATE DATABASE PRODUCT;
 USE PRODUCT;
 
 CREATE TABLE CUSTOMER(CUS_ID INT PRIMARY KEY, F_NAME VARCHAR(30),L_NAME VARCHAR(30),EMAIL VARCHAR(50),
 PHONE VARCHAR(30),ADDRESS VARCHAR(100),CITY VARCHAR(30),STATE VARCHAR(30),ZIPCODE INT,COUNTRY VARCHAR(30));
 
 INSERT INTO CUSTOMER VALUES(1,'LEO','GILL','leo.gill@gmail.com','65898978','122,high street','Alabama','Montgomery',35004,'USA'),
 (2,'DAIN','RIVER','dain.river@gmail.com','45896978','452,high street','Delavare','Dover',35074,'USA');
 
 SELECT * FROM CUSTOMER;
 
 ## 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address.
 ## Then perform the SELECT operation for the customer_info view.
 
 CREATE VIEW CUSTOMER_INF AS
 SELECT CONCAT(F_NAME," ",L_NAME) AS FULLNAME,EMAIL FROM CUSTOMER;
 
 SELECT * FROM CUSTOMER_INF;
 
 ## 2. Create a view named US_Customers that displays customers located in the US.
 
  INSERT INTO CUSTOMER VALUES(3,'YEMA','GILL','yema.gill@gmail.com','75898978','123,bourville street','Berlin','Brandenburg',85004,'Germany'),
 (4,'ALEX','PHILIP','alex.phil@gmail.com','95896978','236,bris street','Settlement City','NSW',23574,'Australia');
 SELECT * FROM CUSTOMER;

 CREATE VIEW US_CUSTOMERS AS 
 SELECT * FROM CUSTOMER WHERE COUNTRY='USA';
 
 SELECT * FROM US_CUSTOMERS;
 
  ## 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
  
  CREATE VIEW CUSTOMER_DETAILS AS 
  SELECT CONCAT(F_NAME," ",L_NAME) AS FULLNAME,EMAIL,PHONE,STATE FROM CUSTOMER;
  
  SELECT * FROM CUSTOMER_DETAILS;


## 4. Update phone numbers of customers who live in California for Customer_details view.

 INSERT INTO CUSTOMER VALUES(5,'LEONA','THOMAS','leona@gmail.com','75898978','123,Winston Fort','Los Angeles','California',78008,'USA'),
 (7,'ZENITH','DAVE','zen@gmail.com','10296978','528 ,Arthur street','San Fransisco','California',325033,'USA');
 
 select * from customer;
 
 SET SQL_SAFE_UPDATES=0;
 
 UPDATE CUSTOMER SET PHONE="123-003-333" WHERE STATE="CALIFORNIA";
 
   SELECT * FROM CUSTOMER_DETAILS;
   
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
 
 select state,count(*) as count_customers from customer group by state having count(*)>5;
 
 ## 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
 
 select State,count(*) as customer_count from customer_details group by state;
 
 ## 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
 
 SELECT * FROM CUSTOMER_DETAILS ORDER BY STATE ASC;
