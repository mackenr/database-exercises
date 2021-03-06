
-- Add the LIMIT clause to our existing queries
-- Create a new SQL script named limit_exercises.sql.

-- MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:


-- SELECT DISTINCT title FROM titles;
-- List the first 10 distinct last name sorted in descending order.



-- PSET:
-- List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;

-- Find all previous or current employees hired in the 90s and born on Christmas. 
SELECT * FROM employees 
WHERE hire_date like '199_%'
AND birth_date like '%-12-25';
-- Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.
SELECT first_name,last_name FROM employees 
WHERE hire_date like '199_%'
AND birth_date like '%-12-25'
ORDER BY hire_date
LIMIT 5;
-- 'Alselm','Cappello'
-- 'Utz','Mandell'
-- 'Bouchung','Schreiter'
-- 'Baocai','Kushner'
-- 'Petter','Stroustrup'



-- Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.
SELECT first_name,last_name FROM employees 
WHERE hire_date like '199_%'
AND birth_date like '%-12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;
-- LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?
-- OFFSET WOULD BE THE STARTING POINT (LINE NUMBER), LIMIT WOULD BE the number on each page so if you divide the number by the limit and add one you will have the page number.


