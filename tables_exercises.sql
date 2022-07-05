SHOW DATABASES;
-- 3)
USE employees;
-- 4)
SHOW TABLES;
-- 5)
DESCRIBE employees;
--  6) Which table(s) do you think contain a numeric type column? 
-- emp_no 
--  7) Which table(s) do you think contain a string type column? 
-- first_name,last_name and gender
--	8) Which table(s) do you think contain a date type column? 
-- birth_date and hire_date

USE departments;
SHOW TABLES;
DESCRIBE departments;
-- 9)  At the current scale in this hierarchy, departments is the table which contains employees as a field
USE dept_name;
SHOW TABLES;
USE employees;
SELECT * FROM dept_manager LIMIT 25;
SELECT * FROM employees LIMIT 25;
-- 10)
SHOW CREATE TABLE dept_manager;






--


