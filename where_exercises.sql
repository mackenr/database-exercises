-- Clauses 
-- Clauses are how we get specificall what we want from a single or combination of fields

-- WHERE:
-- ORDER BY: Sort my results specifically to my needs
-- LIMIT: ONly give me some of the resulrts back

SHOW DATABASES;
-- use the schema chipotle
 USE chipotle;
 
 -- skipped SHOW TABLES
 -- tell me what fields I have inside the orders table
 
 DESCRIBE orders;
 
 -- a good way to get a preview on our table:
 -- LIMIT
 
 SELECT * FROM orders LIMIT 5;
 -- HEAD in python will be simular
 
 -- WHERE comes at the eend of a select staement, and it can be chained
 
-- A few different wasys ot use this so far:
-- We need to specify what we want to narrow down 
-- establish equicvalency: =
-- LIKE, compare string values
-- BETWEEN, inclusive ranges
-- inequality operators: <,>,<=,>=

-- GIVE me everything in orders
-- specifically, everything that has tomato in the item name

SELECT DISTINCT item_name FROM orders WHERE item_name LIKE '%tomato%';

-- aggregation and grouping concepts to come


-- STRUCTURE:
-- SELECT - Do the thing, pull the info
-- WHAT - e
-- FROM
-- Stipulations


-- Use a numerical comparison:
-- Give me every choice_description
-- but only f  there were more than 3 seelcted

SELECT choice_description AS choice
FROM orders WHERE quantity >3
AND choice_description <> 'nan';

-- Nested example

SELECT * FROM orders
WHERE quantity > 2
AND (
item_name LIKE '%tomato%'
OR choice_description LIKE '%rice%');


-- ORDER BY: How we sort our results



-- select everything (all fields)
SELECT * FROM orders
WHERE quantity > 2
AND (
item_name LIKE '%tomato%'
OR choice_description LIKE '%rice%')
ORDER BY quantity DESC

LIMIT 4; 
-- ASC is default 


-- looking at item_price

-- this will not give me the desired results because we are not using the correct data type



 
 
 




USE employees;
SELECT * FROM employees WHERE hire_date = '1985-01-01';
SELECT first_name
FROM employees
WHERE first_name LIKE '%sus%';
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no BETWEEN 10026 AND 10082;

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('Herber', 'Dredge', 'Lipner', 'Baek');

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name = 'Baek';

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 10026;

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no <= 10026;

SELECT emp_no, title
FROM titles
WHERE to_date IS NOT NULL;


SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
  AND last_name IN ('Herber','Baek')
   OR first_name = 'Shridhar';





-- START of PSET
USE employees;
SHOW TABLES;


/*
1.)
Create a file named where_exercises.sql. Make sure to use the employees database.

Saved file name
*/




/*

FROM employees
WHERE first_name = ('Irena' OR 'Vidya' OR 'Maya');

WRONG SYNTAX

*/

SELECT  * 
FROM employees
WHERE first_name 
IN ('Irena', 'Vidya','Maya');
/*
2.)
Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.

-- 709 rows returned
*/
SELECT  first_name 
FROM employees
WHERE first_name = 'Irena'
OR first_name= 'Vidya'
OR first_name='Maya';

/*
3.)
Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?


*/

SELECT first_name
FROM employees
WHERE gender = 'M'
AND  first_name IN 
('Irena', 'Vidya','Maya');


/*
4.)
Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.

441 records
*/


SELECT  last_name FROM employees
WHERE last_name like 'E%';

/*
5.)
Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
7330 records
*/


SELECT last_name FROM employees 
WHERE last_name like 'E%' 
OR last_name like'%E';

SELECT  DISTINCT * FROM employees
WHERE last_name like '%E' 
AND  NOT 
last_name like 'E%';


/*
6.)
Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
30723 records
23393 records
*/







SELECT last_name FROM employees
WHERE last_name like '%E%';

/*
7.)
Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
*/


SELECT * FROM employees
WHERE hire_date like "199_%";
/*
8.)
Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
*/





SELECT * FROM employees
WHERE birth_date like "%-12-25";

/*

9.)
Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
842 records
*/



SELECT * FROM employees
WHERE hire_date like "199_%"
and birth_date like "%-12-25";


/*
10.)
Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
362 records
*/


SELECT * FROM employees
WHERE last_name like "%q%";
-- 
/*
11.)
Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
1873 records
*/


SELECT * FROM employees
WHERE last_name like "%q%"
AND NOT
last_name like "%qu%";
/*
12.)
Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
547 records

*/


-- END OF PSET




