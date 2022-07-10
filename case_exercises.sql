show databases;


USE employees;

SELECT
    dept_name,
    CASE dept_name
        WHEN 'research' THEN 'Development'
        WHEN 'marketing' THEN 'Sales'
        ELSE dept_name
    END AS dept_group
FROM departments;


USE employees;

SELECT
    dept_name,
    CASE dept_name
        WHEN 'research' THEN 'Development'
        WHEN 'marketing' THEN 'Sales'
        ELSE dept_name
    END AS dept_group
FROM departments;

SELECT
    dept_name,
    CASE
        WHEN dept_name IN ('Marketing', 'Sales') THEN 'Money Makers'
        WHEN dept_name LIKE '%research%' OR dept_name LIKE '%resources%' THEN 'People People'
        ELSE 'Others'
    END AS department_categories
FROM departments;




-- Here, I'm building up my columns and values before I group by departments and use an aggregate function to get a count of values in each column.
SELECT
    dept_name,
    CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END AS 'Senior Engineer',
    CASE WHEN title = 'Staff' THEN title ELSE NULL END AS 'Staff',
    CASE WHEN title = 'Engineer' THEN title ELSE NULL END AS 'Engineer',
    CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END AS 'Senior Staff',
    CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END AS 'Assistant Engineer',
    CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END AS 'Technique Leader',
    CASE WHEN title = 'Manager' THEN title ELSE NULL END AS 'Manager'
FROM departments
JOIN dept_emp USING(dept_no)
JOIN titles USING(emp_no);

-- Next, I add my GROUP BY clause and COUNT function to get a count of all employees who have historically ever held a title by department. (I'm not filtering for current employees or current titles.)
SELECT
    dept_name,
    COUNT(CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END) AS 'Senior Engineer',
    COUNT(CASE WHEN title = 'Staff' THEN title ELSE NULL END) AS 'Staff',
    COUNT(CASE WHEN title = 'Engineer' THEN title ELSE NULL END) AS 'Engineer',
    COUNT(CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END) AS 'Senior Staff',
    COUNT(CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END) AS 'Assistant Engineer',
    COUNT(CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END) AS 'Technique Leader',
    COUNT(CASE WHEN title = 'Manager' THEN title ELSE NULL END) AS 'Manager'
FROM departments
JOIN dept_emp USING(dept_no)
JOIN titles USING(emp_no)
GROUP BY dept_name
ORDER BY dept_name;




show tables;
describe departments;
select dept_name from departments;
-- In this query, I filter in my JOINs for current employees who currently hold each title.
SELECT
    dept_name,
    COUNT(CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END) AS 'Senior Engineer',
    COUNT(CASE WHEN title = 'Staff' THEN title ELSE NULL END) AS 'Staff',
    COUNT(CASE WHEN title = 'Engineer' THEN title ELSE NULL END) AS 'Engineer',
    COUNT(CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END) AS 'Senior Staff',
    COUNT(CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END) AS 'Assistant Engineer',
    COUNT(CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END) AS 'Technique Leader',
    COUNT(CASE WHEN title = 'Manager' THEN title ELSE NULL END) AS 'Manager'
FROM departments
JOIN dept_emp
    ON departments.dept_no = dept_emp.dept_no AND dept_emp.to_date > CURDATE()
JOIN titles
    ON dept_emp.emp_no = titles.emp_no AND titles.to_date > CURDATE()
GROUP BY dept_name
ORDER BY dept_name;

select curdate();
select now();




-- Exercises

-- Exercise Goals


-- Exercises

-- Exercise Goals

-- Use CASE statements or IF() function to explore information in the employees database
-- Create a file named case_exercises.sql and craft queries to return the results for the following criteria:

-- 1.
-- Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
describe employees;
show tables;
describe salaries;
describe dept_emp;
select emp_no, dept_no, to_date,employees.hire_date,  IF(to_date > now(), True, False) AS is_current_employee 
from dept_emp 
join employees using(emp_no);




-- 2.
-- Write a query that returns all employee names (previous and current),
-- and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' 
--  depending on the first letter of their last name.
select concat(last_name,', ',first_name),
case 
when ascii(substring(e.last_name,1,1)) BETWEEN 65 and 72 then 'A-H' -- note ascii is case sensitive so here the first letter was always capital if you wanted to be agnostic to case then you would have to and another case
when ascii(substring(e.last_name,1,1)) BETWEEN 73 AND 81 then 'I-Q' 
when ascii(substring(e.last_name,1,1)) BETWEEN 82 AND 90 then 'R-Z' 
else NULL 
END as 'alpha_group'
from employees e
order by last_name;


-- 3.
-- How many employees (current or previous) were born in each decade?
select birth_date from employees order by birth_date desc;
select birth_date from employees order by birth_date ;
-- we observe there are only two decades 1950-60's
select 
format(count(case when substring(e.birth_date,3,4)BETWEEN 50 and 59 then '50''s' else NULL end),0) as  '50''s',
format(count(case when substring(e.birth_date,3,4)BETWEEN 60 AND 81 then '60''s' else NULL end ),0) as '60''s'
from employees e;

-- 4.
-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
SHOW TABLES;
describe departments;
select dept_name from departments order by dept_name ;


SELECT
dept_no,
    CASE
        WHEN dept_name LIKE 'r%' OR dept_name LIKE 'd%' THEN 'R&D'
		WHEN dept_name LIKE 's%' OR dept_name LIKE 'm%' THEN 'Sales & Marketing'
        WHEN dept_name LIKE 'p%' OR dept_name LIKE 'q%' THEN 'Prod & QM'
		WHEN dept_name LIKE 'f%' OR dept_name LIKE 'h%' THEN 'Finance & HR'
        WHEN dept_name LIKE 'c%' OR dept_name LIKE 'h%' THEN 'Customer Service'
        ELSE 'Others'
    END AS department_categories
FROM departments;
show tables;
select * from salaries limit 500;
select * from dept_emp limit 500;

select concat('$ ',format(avg(salary),2)) Average_Salary,department_categories 
from
(SELECT
s.salary,
    CASE
        WHEN dept_name LIKE 'r%' OR dept_name LIKE 'd%' THEN 'R&D'
		WHEN dept_name LIKE 's%' OR dept_name LIKE 'm%' THEN 'Sales & Marketing'
        WHEN dept_name LIKE 'p%' OR dept_name LIKE 'q%' THEN 'Prod & QM'
		WHEN dept_name LIKE 'f%' OR dept_name LIKE 'h%' THEN 'Finance & HR'
        WHEN dept_name LIKE 'c%' OR dept_name LIKE 'h%' THEN 'Customer Service'
        ELSE 'Others'
    END AS department_categories 
FROM departments d
join dept_emp de on d.dept_no=de.dept_no and  now()<de.to_date
join salaries s on de.emp_no=s.emp_no and  now()<s.to_date)sub1
group by department_categories order by Average_Salary desc;
