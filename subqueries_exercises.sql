-- Returning a column

-- Step 1 
-- Write inner query

-- Step 2
-- Write the outer query

-- Step 3
-- Insert inner query




-- PSET---------Start

-- Exercise Goals

-- Use sub queries to find information in the employees database
-- Create a file named subqueries_exercises.sql and craft queries to return the results for the following criteria:

-- Find all the current employees with the same hire date as employee 101010 using a sub-query.
SHOW DATABASES;
USE employees;
Describe employees;
SELECT emp_no, hire_date from employees limit 500;

SELECT emp_no, hire_date from employees where emp_no = 10001 limit 500;

SELECT e.emp_no, e.hire_date from employees e
where e.hire_date = (select ep.hire_date from employees ep where emp_no = 10001 limit 500);



-- Find all the titles ever held by all current employees with the first name Aamod.
SHOW DATABASES;
USE employees;
SHOW TABLES;
Describe employees;
describe titles;
SELECT emp_no, first_name from employees e;
SELECT emp_no, title, to_date from titles t;

SELECT  title from titles t
where emp_no=(select emp_no from employees e
where e.first_name='Aamod')
and now()<= to_date;


select distinct title from
(SELECT  emp_no,title,to_date from titles t where now()<= to_date)sub1
join 
(select emp_no,first_name from employees e where e.first_name= 'Aamod')sub2
using(emp_no)
limit 500;

-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SHOW TABLES;
Describe employees;
describe titles;
describe dept_emp;
describe dept_manager;
select count(emp_no) from
(select emp_no from dept_emp de where de.to_date < now())sub1
join 
(select emp_no from employees e)sub2
using (emp_no);
-- Find all the current department managers that are female. List their names in a comment in your code.
SELECT * FROM
(select emp_no,gender,first_name,last_name from employees e where e.gender= 'F')sub1
join
(select emp_no from dept_manager where now()<=to_date)sub2
using(emp_no);

-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SHOW TABLES;
Describe employees;
describe titles;
describe dept_emp;
describe dept_manager;
describe salaries;


select emp_no from employees 
join
(select emp_no from salaries 
where now()<=to_date and salary > (select avg(salary) from salaries 
))sub1
using (emp_no)
;

select avg(salary) from salaries;
-- How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?




SELECT FORMAT(STD(salCount),2)-- z-score?
FROM (SELECT salary, count(*) salCount
FROM salaries where now()<to_date
GROUP BY salary) t;

SELECT FORMAT(STD(salCount),2)-- z-score?
FROM (SELECT salary, avg(salary) salCount
FROM salaries where now()<to_date
GROUP BY salary) t;




SELECT  format(avg(salary),2) salMean-- POP mean
FROM salaries  where now()<to_date;


SELECT  format(std(salary),2) salSTD-- Pop STD
FROM salaries where now()<to_date;

SELECT  format(max(salary),2) MaxX-- Sample X
FROM salaries where now()<to_date;


 
 



 SELECT emp_no,format((abs(s.salary-sub3.MaxX)/sub2.salSTD),2) zMaxMaybe,format((abs(s.salary-sub1.salMean)/sub2.salSTD),2) zACTUALMaybe
 FROM salaries s
 join
(SELECT  format(avg(salary),2) salMean-- POP mean
FROM salaries sa where now()<to_date)sub1
join 
(SELECT  format(std(salary),2) salSTD-- Pop STD
FROM salaries sb where now()<to_date)sub2
join
(SELECT  format(max(salary),2) MaxX-- Sample X
FROM salaries  sc where now()<to_date)sub3

limit 500;



 SELECT emp_no, salary
 FROM salaries s
 join
(SELECT  format(avg(salary),2) salMean-- POP mean
FROM salaries sa where now()<to_date)sub1
join 
(SELECT  format(std(salary),2) salSTD-- Pop STD
FROM salaries sb where now()<to_date)sub2
join
(SELECT  format(max(salary),2) MaxX-- Sample X
FROM salaries  sc where now()<to_date)sub3
where sub2.salSTD > (select format(abs(s.salary-sub3.MaxX),2) )
;




SELECT emp_no, salary
 FROM salaries s
 join
(SELECT format(avg(salary),2) salMean-- POP mean
FROM salaries sa where now()<to_date)sub1
join 
(SELECT  format(std(salary),2) salSTD-- Pop STD
FROM salaries sb where now()<to_date)sub2
join
(SELECT  format(max(salary),2) MaxX-- Sample X
FROM salaries  sc where now()<to_date)sub3
where sub2.salSTD > (select format(abs(s.salary-sub3.MaxX),2) )
and
now()<to_date;



select count(*) from
( SELECT emp_no, salary
 FROM salaries s
 join
(SELECT  format(avg(salary),2) salMean-- POP mean
FROM salaries sa where now()<to_date)sub1
join 
(SELECT  format(std(salary),2) salSTD-- Pop STD
FROM salaries sb where now()<to_date)sub2
join
(SELECT  format(max(salary),2) MaxX-- Sample X
FROM salaries  sc where now()<to_date)sub3
where sub2.salSTD > (select format(abs(s.salary-sub3.MaxX),2) ))sub4
;



--  SELECT sub4.emp_no,(abs(sub4.zMax-sub4.zACTUAL)) DIFF
--  FROM(
--   SELECT emp_no,format((abs(s.salary-sub3.MaxX)/sub2.salSTD),2) zMax,format((abs(s.salary-sub1.salMean)/sub2.salSTD),2) zACTUAL
--  FROM salaries s
--  join
-- (SELECT  format(avg(salary),2) salMean-- POP mean
-- FROM salaries sa where now()<to_date)sub1
-- join 
-- (SELECT  format(std(salary),2) salSTD-- Pop STD
-- FROM salaries sb where now()<to_date)sub2
-- join
-- (SELECT  format(max(salary),2) MaxX-- Sample X
-- FROM salaries  sc where now()<to_date)sub3
-- group by emp_no,zMax,zACTUAL
-- limit 500) sub4
-- ;

-- Hint You will likely use multiple subqueries in a variety of ways
-- Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries.
-- BONUS

-- Find all the department names that currently have female managers.
-- Find the first and last name of the employee with the highest salary.
-- Find the department name that the employee with the highest salary works in.

