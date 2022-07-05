SHOW DATABASES;
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

USE employees;
SHOW TABLES;




SELECT first_name 
FROM employees
WHERE first_name 
IN ('Irena', 'Vidya','Maya');

SELECT first_name 
FROM employees
WHERE first_name = 'Irena'
OR 
first_name ='Vidya'
OR
first_name='Maya';

SELECT first_name
FROM employees
WHERE gender = 'M'
AND  first_name IN 
('Irena', 'Vidya','Maya');


SELECT DISTINCT last_name FROM employees
WHERE last_name like 'E%';

SELECT DISTINCT last_name FROM employees
WHERE last_name like '%E' AND  !'E%';










/*
1.)
Create a file named where_exercises.sql. Make sure to use the employees database.

SELECT first_name 
FROM employees
WHERE first_name 
IN ('Irena', 'Vidya','Maya');
-- 709 rows returned



2.)
Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
SELECT first_name 
FROM employees
WHERE first_name = 'Irena'
OR 
first_name ='Vidya'
OR
first_name='Maya';
-- 709 rows returned

3.)
Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?

4.)
Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.


5.)
Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
SELECT last_name FROM employees
WHERE last_name like 'E%';
6.)
Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?

7.)
Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?

8.)
Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

9.)
Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.

10.)
Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

11.)
Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.

12.)
Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?

Copied to clipboard


*/





