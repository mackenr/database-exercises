SHOW DATABASES;
USE albums_db;
SHOW TABLES;
DESCRIBE albums;
SELECT DISTINCT artist FROM albums;
SELECT release_date FROM albums;
SELECT MIN(release_date) FROM albums;
SELECT MAX(release_date) FROM albums;
SELECT * FROM albums WHERE artist = 'pink floyd';
SELECT * FROM albums WHERE name LIKE 'S__%';
SELECT * FROM albums WHERE artist LIKE'n__%';
SELECT * FROM albums WHERE release_date BETWEEN 1990 AND 1999;
SELECT * FROM albums WHERE sales < 20;
SELECT * FROM albums WHERE genre = 'rock';
SELECT * FROM albums WHERE genre LIKE '%rock%';















/*

Create a new file called select_exercises.sql. Store your code for this exercise in that file. You should be testing your code in MySQL Workbench as you go.
Use the albums_db database.
Explore the structure of the albums table.
a. How many rows are in the albums table?
There are 6 rows including the key

b. How many unique artist names are in the albums table?
23
c. What is the primary key for the albums table?
The nomeclature is : id

d. What is the oldest release date for any album in the albums table? What is the most recent release date?
Oldest is min value which is 1967, 



Write queries to find the following information:
a. The name of all albums by Pink Floyd
SELECT * FROM albums WHERE artist LIKE'n__%';

b. The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT * FROM albums WHERE name LIKE 'S__%';

c. The genre for the album Nevermind
SELECT * FROM albums WHERE artist = 'pink floyd';

d. Which albums were released in the 1990s
SELECT * FROM albums WHERE release_date BETWEEN 1990 AND 1999;

e. Which albums had less than 20 million certified sales
SELECT * FROM albums WHERE sales < 20;

f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT * FROM albums WHERE genre = 'rock';
It is searching for an exact match, if we want to find rock in any position we use the query below
SELECT * FROM albums WHERE genre LIKE '%rock%';



Be sure to add, commit, and push your work.

*/









