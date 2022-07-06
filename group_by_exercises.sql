/* NOTES
Grouping is a way to combine data
 Group by an introduction to aggregation
  



NOTES END */
USE chipotle;
SHOW TABLES;
DESCRIBE orders;
	-- string types in fields
    
SELECT 
DISTINCT item_name,quantity
FROM orders;

SELECT item_name FROM orders GROUP BY item_name;

-- GROUP BY with two columns:

SELECT item_name, quantity
FROM orders
GROUP BY item_name, quantity;

-- first use case of aggregative functions
-- in conjuction with group by


-- Flexiblility 
-- We can use different field names it will consistently gi you the number of instance the crouped field coints it count all instances
SELECT item_name,
COUNT(*)
FROM orders
GROUP BY item_name;

-- adding complexity (using where)

SELECT item_name,
COUNT(item_name) AS num_orders
FROM orders
WHERE item_name LIKE '%burr%'
GROUP BY item_name;

SELECT item_name,
COUNT(item_name) AS num_orders
FROM orders
WHERE item_name LIKE '%burr%'
GROUP BY item_name
HAVING num_orders > 6
ORDER BY num_orders DESC
LIMIT 1;

-- SELECT the thing (fields)
SELECT item_name, 
-- if we are not grouping by 2ndry field what do we do
MAX(quantity)
-- from what table are pulling from?
FROM orders
-- for all grouped fields, specify order 
-- do we nee a where to narro schope with a clause?
GROUP BY item_name, item_price;
-- do we want to narrow down our aggregated function value






-- CODE UP 
SHOW DATABASES;
USE employees;
SHOW TABLES;

SELECT DISTINCT first_name
FROM employees;

SELECT first_name
FROM employees
GROUP BY first_name;

SELECT first_name
FROM employees
GROUP BY first_name 
ORDER BY first_name DESC;

SELECT last_name, first_name
FROM employees
GROUP BY last_name, first_name;

SELECT COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%';

SELECT COUNT(*) FROM employees;

SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name;

SELECT hire_date, COUNT(*)
FROM employees
GROUP BY hire_date
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT last_name, count(*) AS n_same_last_name
FROM employees
GROUP BY last_name
HAVING n_same_last_name < 150;

SELECT concat(first_name, " ", last_name) AS full_name, count(*) AS n_same_full_name
FROM employees
GROUP BY full_name
HAVING n_same_full_name >= 5;



















-- Exercises

-- Exercise Goals

-- Use the GROUP BY clause to create more complex queries
-- Create a new file named group_by_exercises.sql
-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
SHOW DATABASES;
USE employees;
SHOW TABLES;
SELECT DISTINCT title FROM titles;

-- Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name FROM employees as name
GROUP BY last_name 
HAVING last_name like 'e%e'
LIMIT 15;
-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT last_name,first_name FROM employees 
GROUP BY last_name, first_name
HAVING last_name like 'e%e'
LIMIT 15;
-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name FROM employees 
GROUP BY last_name
HAVING last_name like '%q%'
AND NOT last_name like '%qu%'
LIMIT 15;
-- Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT last_name, COUNT(last_name)
FROM employees 
GROUP BY last_name
HAVING last_name like '%q%'
AND NOT last_name like '%qu%'
LIMIT 15;
-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT COUNT(*),first_name,gender 
FROM employees 
GROUP BY gender, first_name
HAVING first_name in ('Irena', 'Vidya','Maya')
ORDER BY COUNT(*)
LIMIT 15;
-- Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)),LOWER(SUBSTR(last_name, 1, 4)),'_',SUBSTR(birth_date,6,2),SUBSTR(birth_date,3,2) ) as username, COUNT(*)  FROM employees
GROUP BY username
ORDER BY COUNT(username);
-- 285872
-- Yes there are duplicates
-- We can see the bonus below

SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)),LOWER(SUBSTR(last_name, 1, 4)),'_',SUBSTR(birth_date,6,2),SUBSTR(birth_date,3,2) ) as username, COUNT(*)  FROM employees
GROUP BY username
HAVING COUNT(username) > 1
ORDER BY COUNT(username) DESC;
-- 13251

-- Double counting not right but left for an example not to do going forward
SELECT COUNT(CONCAT(LOWER(SUBSTR(first_name, 1, 1)),LOWER(SUBSTR(last_name, 1, 4)),'_',SUBSTR(birth_date,6,2),SUBSTR(birth_date,3,2) ))  
- COUNT(DISTINCT(CONCAT(LOWER(SUBSTR(first_name, 1, 1)),LOWER(SUBSTR(last_name, 1, 4)),'_',SUBSTR(birth_date,6,2),SUBSTR(birth_date,3,2) ) 
) )
 FROM employees;
-- 14152
-- Bonus: More practice with aggregate functions:

-- Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.


 SELECT 
    emp_no, 
    AVG(salary) 'Average Salary'
FROM
    salaries
GROUP BY emp_no DESC;




 DESCRIBE dept_emp;

-- Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.
SELECT FORMAT(COUNT(emp_no),0) 'No of Employees',dept_no 'Depart No'
FROM dept_emp
GROUP BY dept_no;

-- Determine how many different salaries each employee has had. This includes both historic and current.
-- Find the maximum salary for each employee.
-- Find the minimum salary for each employee.
-- Find the standard deviation of salaries for each employee.
SELECT 
emp_no, FORMAT(STD(salary),2)
FROM
salaries
GROUP BY emp_no;
-- Now find the max salary for each employee where that max salary is greater than $150,000.
-- Find the average salary for each employee where that average salary is between $80k and $90k.
