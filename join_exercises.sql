-- Primary key vs index
-- Foreign key

-- What is the scope of Uniquness i.e. what is the universe it lives in?

-- unique v distinct

-- inter join is default
-- inter join is the intersection?

-- We specify order
-- performance with large data sets?

USE join_example_db;
SHOW tables;
DESCRIBE roles;
DESCRIBE users;

SELECT * from users;

-- Inner Join:
SELECT * from users -- Left side
JOIN roles -- Right side
-- how do we want to make that connecction?
ON users.role_id=roles.id;


-- If we want  to select specific fields, we need to use db.feild_name
-- We can also alias 

SELECT *
FROM users u
JOIN roles r
ON r.id = u.role_id;

-- LEFT JOIN
SELECT *
FROM users u
LEFT JOIN roles r
ON r.id = u.role_id;

-- RIGHT JOIN
SELECT *
FROM users u
RIGHT JOIN roles r
ON r.id = u.role_id;

-- Let's explore a deiffenr schema:
USE world;
SHOW Tables;

DESCRIBE city;



-- P-SET
-- Exercises

-- Exercise Goals

-- Use join, left join, and right join statements on our Join Example DB
-- Integrate aggregate functions and clauses into our queries with JOIN statements
-- Create a file named join_exercises.sql to do your work in.

-- Join Example Database

-- Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;

SELECT * FROM
users u,roles r;


Describe users;



-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
-- JOIN
SELECT *
FROM users u
JOIN roles r
ON r.id = u.role_id;

-- LEFT JOIN
SELECT *
FROM users u
LEFT JOIN roles r
ON r.id = u.role_id;
-- 

-- RIGHT JOIN
SELECT *
FROM users u
RIGHT JOIN roles r
ON r.id = u.role_id;



-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
-- Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
-- Hint: You will also need to use group by in the query.

SELECT role_id,COUNT(*)
FROM users u
INNER JOIN roles r
ON r.id = u.role_id
GROUP BY u.role_id;












-- Employees Database

-- Use the employees database.
USE employees;
-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SHOW TABLES;
SELECT * FROM dept_manager limit 15;-- must be current use first 
-- now() >= to_date  -- use case statement where tc 
SELECT * FROM departments limit 15; -- 
SELECT * FROM employees limit 15; --
SELECT * FROM titles;


SELECT 
dpt.dept_name 'Department Name ',CONCAT(first_name,' ',last_name) 'Department Manager'
FROM dept_manager dm 
LEFT JOIN employees e
ON e.emp_no = dm.emp_no
LEFT JOIN departments dpt
ON dpt.dept_no = dm.dept_no
WHERE now() <= dm.to_date
ORDER BY dpt.dept_name 
;


--   Department Name    | Department Manager
--  --------------------+--------------------
--   Customer Service   | Yuchang Weedman
--   Development        | Leon DasSarma
--   Finance            | Isamu Legleitner
--   Human Resources    | Karsten Sigstam
--   Marketing          | Vishwani Minakawa
--   Production         | Oscar Ghazalie
--   Quality Management | Dung Pesch
--   Research           | Hilary Kambil
--   Sales              | Hauke Zhang





-- Find the name of all departments currently managed by women.
SELECT 
dpt.dept_name 'Department Name ',CONCAT(first_name,' ',last_name) 'Department Manager'
FROM dept_manager dm 
LEFT JOIN employees e
ON e.emp_no = dm.emp_no
LEFT JOIN departments dpt
ON dpt.dept_no = dm.dept_no
WHERE now() <= dm.to_date
AND e.gender= 'f'
;


-- Department Name | Manager Name
-- ----------------+-----------------
-- Development     | Leon DasSarma
-- Finance         | Isamu Legleitner
-- Human Resources | Karsetn Sigstam
-- Research        | Hilary Kambil


-- Find the current titles of employees currently working in the Customer Service department.
SELECT title 'Titles', COUNT(*) 'COUNT'
FROM titles t
LEFT JOIN employees e
USING (emp_no)
LEFT JOIN dept_emp de
USING (emp_no)
WHERE now() <= t.to_date
AND now() <= de.to_date
AND dept_no = 'd009'
 GROUP BY title
 ORDER BY title 
;


-- Title              | Count
-- -------------------+------
-- Assistant Engineer |    68
-- Engineer           |   627
-- Manager            |     1
-- Senior Engineer    |  1790
-- Senior Staff       | 11268
-- Staff              |  3574
-- Technique Leader   |   241


-- Find the current salary of all current managers.



SELECT 
dept_name 'Department Name ',CONCAT(first_name,' ',last_name) 'Name ', salary 'Salary'
FROM dept_manager dm 
LEFT JOIN employees e
USING(emp_no)
LEFT JOIN departments dpt
USING(dept_no)
LEFT JOIN salaries s
USING(emp_no)
WHERE now() <= dm.to_date
AND now() <= s.to_date
ORDER BY dept_name;


-- Department Name    | Name              | Salary
-- -------------------+-------------------+-------
-- Customer Service   | Yuchang Weedman   |  58745
-- Development        | Leon DasSarma     |  74510
-- Finance            | Isamu Legleitner  |  83457
-- Human Resources    | Karsten Sigstam   |  65400
-- Marketing          | Vishwani Minakawa | 106491
-- Production         | Oscar Ghazalie    |  56654
-- Quality Management | Dung Pesch        |  72876
-- Research           | Hilary Kambil     |  79393
-- Sales              | Hauke Zhang       | 101987



-- Find the number of current employees in each department.


SELECT dept_no,dept_name, COUNT(*) 'num_employees'
FROM dept_emp de
LEFT JOIN employees e
USING (emp_no)
LEFT JOIN departments d
USING (dept_no)
WHERE de.to_date>=now()

 GROUP BY dept_no,dept_name
 ORDER BY dept_no,dept_name,COUNT(*) 
;

-- +---------+--------------------+---------------+
-- | dept_no | dept_name          | num_employees |
-- +---------+--------------------+---------------+
-- | d001    | Marketing          | 14842         |
-- | d002    | Finance            | 12437         |
-- | d003    | Human Resources    | 12898         |
-- | d004    | Production         | 53304         |
-- | d005    | Development        | 61386         |
-- | d006    | Quality Management | 14546         |
-- | d007    | Sales              | 37701         |
-- | d008    | Research           | 15441         |
-- | d009    | Customer Service   | 17569         |
-- +---------+--------------------+---------------+
-- Which department has the highest average salary? Hint: Use current not historic information.



SELECT sub.d dept_name, CONCAT('$',FORMAT(MAX(sub.a),2)) average_salary
FROM
(SELECT dept_name d, AVG(salary) a, dept_no
FROM dept_emp de
LEFT JOIN employees e
USING (emp_no)
LEFT JOIN departments d
USING (dept_no)
LEFT JOIN salaries s
USING (emp_no)
WHERE s.to_date>=now()

 GROUP BY dept_name, dept_no) sub
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;






-- +-----------+----------------+
-- | dept_name | average_salary |
-- +-----------+----------------+
-- | Sales     | 88852.9695     |
-- +-----------+----------------+


-- Who is the highest paid employee in the Marketing department?

SELECT first_name, last_name, salary
FROM employees e 
JOIN dept_emp de
USING (emp_no)
JOIN salaries s
USING (emp_no)
-- USING ( first_name, last_name)
WHERE dept_no ='d001'
GROUP BY first_name, last_name, salary
ORDER BY salary DESC
LIMIT 1;




-- +------------+-----------+
-- | first_name | last_name |
-- +------------+-----------+
-- | Akemi      | Warwick   |
-- +------------+-----------+
-- Which current department manager has the highest salary?

SELECT 
first_name, last_name, salary,dept_name
FROM dept_manager dm 
JOIN employees e
USING(emp_no)
LEFT JOIN departments dpt
USING(dept_no)
LEFT JOIN salaries s
USING(emp_no)
WHERE now() <= dm.to_date
AND now() <= s.to_date
AND dept_no ='d001'
ORDER BY salary DESC;






-- +------------+-----------+--------+-----------+
-- | first_name | last_name | salary | dept_name |
-- +------------+-----------+--------+-----------+
-- | Vishwani   | Minakawa  | 106491 | Marketing |
-- +------------+-----------+--------+-----------+
-- Determine the average salary for each department. Use all salary information and round your results.

SHOW TABLES;
SELECT * FROM dept_manager limit 15;-- must be current use first 
SELECT * FROM departments limit 15; -- 
SELECT * FROM employees limit 15;
SELECT * FROM dept_emp limit 15; --
SELECT * FROM titles limit 15; --
SELECT * FROM salaries limit 15; --




SELECT dept_name, CONCAT('$',FORMAT(AVG(salary),0) )average_salary
FROM departments d
JOIN dept_emp de
USING (dept_no)
JOIN salaries s
USING (emp_no)
-- USING ( first_name, last_name)
group by dept_name
order by average_salary DESC;


-- +--------------------+----------------+
-- | dept_name          | average_salary | 
-- +--------------------+----------------+
-- | Sales              | 80668          | 
-- +--------------------+----------------+
-- | Marketing          | 71913          |
-- +--------------------+----------------+
-- | Finance            | 70489          |
-- +--------------------+----------------+
-- | Research           | 59665          |
-- +--------------------+----------------+
-- | Production         | 59605          |
-- +--------------------+----------------+
-- | Development        | 59479          |
-- +--------------------+----------------+
-- | Customer Service   | 58770          |
-- +--------------------+----------------+
-- | Quality Management | 57251          |
-- +--------------------+----------------+
-- | Human Resources    | 55575          |
-- +--------------------+----------------+
-- Bonus Find the names of all current employees, their department name, and their current manager's name.



SELECT 
CONCAT(sub2.first_name,' ',sub2.last_name) 'Employee name',sub2.dept_name 'Department Name',CONCAT(sub1.first_name,' ',sub1.last_name) 'Manager Name'

FROM 
(SELECT 
e.first_name, e.last_name, dm.emp_no ,dpt.dept_no,dpt.dept_name

FROM dept_manager dm 
LEFT JOIN employees e
ON e.emp_no = dm.emp_no
LEFT JOIN departments dpt
ON dpt.dept_no = dm.dept_no
LEFT JOIN dept_emp de
ON dpt.dept_no = de.dept_no
AND
dm.emp_no = de.emp_no
WHERE now() <= de.to_date
and
now() <= dm.to_date
) sub1
LEFT JOIN 
(SELECT dept_no,emp_no,first_name,last_name,dept_name
FROM
employees b
LEFT JOIN  dept_emp de
using(emp_no)
LEFT JOIN  departments dt
using(dept_no)
WHERE to_date>=now()) sub2
ON sub2.dept_name=sub1.dept_name
ORDER BY sub2.dept_name,CONCAT(sub2.first_name,' ',sub2.last_name);



-- 240,124 Rows

-- Employee Name | Department Name  |  Manager Name
-- --------------|------------------|-----------------
--  Huan Lortz   | Customer Service | Yuchang Weedman

--  .....
-- Bonus Who is the highest paid employee within each department.







SELECT dept_name "Department: ", concat(last_name,',  ',first_name) "Name: ",concat('$',format(salary,2)) "Max Salary: " 
 FROM(SELECT dept_no,MAX(salary) max_sal,dept_name
FROM employees e
Join dept_emp de
using(emp_no)
Join salaries s
using(emp_no)
Join departments d
using(dept_no)
where now()<=de.to_date
and now()<=s.to_date
group by dept_no
order by dept_no 
limit 14)sub1
JOIN (SELECT dept_no,salary,dept_name,first_name,last_name
FROM employees e
Join dept_emp de
using(emp_no)
Join salaries s
using(emp_no)
Join departments d
using(dept_no)
where now()<=de.to_date
and now()<=s.to_date

)sub2
USING(dept_no,dept_name)
WHERE sub1.max_sal=sub2.salary
ORDER BY salary desc;
