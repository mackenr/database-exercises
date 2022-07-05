SHOW DATABASES;




-- Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT first_name,last_name 
FROM employees
WHERE first_name 
IN 
('Irena', 'Vidya','Maya')
ORDER BY first_name DESC
LIMIT 1;
-- A'Irena','Reutenauer'
-- 'Vidya','Awdeh'




-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT first_name,last_name 
FROM employees
WHERE first_name 
IN 
('Irena', 'Vidya','Maya')
ORDER BY first_name DESC,last_name;
-- Irena Acton (first listed) and Vidya Akiyama (last listed)


-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT first_name,last_name 
FROM employees
WHERE first_name 
IN 
('Irena', 'Vidya','Maya')
ORDER BY last_name DESC,first_name;
-- Irena Acton (first listed) and Maya Zyda (last listed)

-- Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
SELECT * FROM employees 
WHERE last_name like 'E%'
AND last_name like '%E'
ORDER BY emp_no DESC;
-- 899 records
-- 10021 Ramzi Erde (first record) and 499648 Tadahiro Erde (last record)


-- Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
SELECT * FROM employees 
WHERE last_name like 'e%e'
ORDER BY hire_date desc
LIMIT 1;
-- 7330 records 
-- Phillip Eppinger (newest employee **)
-- Cristinel Erdi (oldest employee **)
-- ** under Where conditions

-- Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. 
-- Enter a comment with the number of employees returned, 
-- the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.

SELECT * FROM employees 
WHERE birth_date like '%-12-25'
and hire_date like '199_%'
ORDER BY birth_date DESC, hire_date
LIMIT 1;
-- 362 records
-- Khun Bernini
-- Douadi Pettis