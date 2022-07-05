SELECT * FROM mysql.user;
SELECT user, host FROM mysql.user;
SELECT * FROM mysql.help_topic;
SELECT help_topic_id, help_category_id, url FROM mysql.help_topic;
-- This is a comment
-- Enter is called a carriage return
-- Comment alot for yourself and to others (postarity)
-- We will talk more about 
-- command + enter
-- we need to have a semi colon at the end ";"
-- We want to see the sections in "the library"

-- describing a schema which is basically a sub data base
-- Syntax for caps is not strict but considered professional and standard

SHOW DATABASES;
-- select everything (*)
-- FROM the database/schema of mysql
-- From the table of user

SELECT * FROM mysql.user;

-- How do i Get into that section, how do i get into a schema?
-- In CLI, we would chnge directories inot our location (cd), we would list contents (ls)
-- We will replicate this process by sayin USE a speific wchema . and SHOWER the contents


-- -----------

-- put my in SQL
USE mysql;

SHOW TABLES;
-- show me all the fields in the table called user

SELECT * FROM user;

-- SQL injection is a malicious attack to be cognizant of.


-- ust eh frutis_db schema
USE fruits_db;
-- I am lost, where am I?

SELECT database();

-- I want to know details about the creation of fruits_db
-- SHOW command
-- THe detailsl of the CREATE command

SHOW CREATE DATABASE fruits_db;















