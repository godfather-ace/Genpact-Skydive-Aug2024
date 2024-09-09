# DDL Command - CREATE
# Creating a new database
create database loyola_db1;
# Activating the database (using the database)
use loyola_db1;
# Creating a table in our database 
create table students(student_roll_no INT, student_name VARCHAR(20));  

# DDL Command - ALTER
# Adding 1 more column in the table
alter table students add student_marks INT; 
# change marks column to father's name
alter table students change student_marks student_father_name VARCHAR(20); 
# modifying the size of a column 
alter table students modify student_father_name VARCHAR(30); 

# DML Command - Insert
# Inserting rows in our table
insert into students values(1, 'Akhash', 'Arun');  
insert into students values(2, 'Sagar', 'Ajeetha');  
# Printing the table to check if the insertion was done correctly
select * from students;

# DML Command - Update
# Update the entered rows with some other values
update students set student_name = 'Karthik' where student_roll_no = 2;
# Printing the table to check if the updation was done correctly
select * from students;

# Creating an exhaustive DB Table named Grades
create table grades(id INT, 
					firstname VARCHAR(20), 
                    lastname VARCHAR(20), 
                    gender ENUM ('F', 'M'), 
                    quiz INT, 
                    final INT, 
                    passfail VARCHAR(2));

# inserting 10 rows at once - multiple insertion
insert into grades values(1, 'villarruz', 'alfred', 'M', 6, 53, 'f'), 
						 (2, 'valazquez', 'scott', 'M', 10, 54, 'f'),
                         (3, 'galvez', 'jackie', 'F', 10, 64, 'p'),
                         (4, 'osborne', 'ann', 'F', 7, 68, 'p'),
                         (5, 'guadiz', 'valerie', 'F', 7, 68, 'p'),							
                         (6, 'rangifo', 'taniece', 'F', 10, 74, 'p'),                         
                         (7, 'lian', 'jenny', 'F', 7, 66, 'p'),
                         (8, 'tomosawa', 'daniel', 'M', 10, 63, 'p'),
                         (9, 'bakken', 'kreg', 'M', 10, 63, 'p'),
                         (10, 'langford', 'dawn', 'F', 10, 75, 'p');       
                         
# printing the table 
select * from grades;
# selecting id and firstname only
select id, firstname from grades; 
# selecting id, firstname and lastname only
select id, firstname, lastname from grades; 
# select all the rows where firstname is lian
select * from grades where firstname = 'lian';
# selecting id, lastname where firstname is lian
select id, lastname from grades where firstname = 'lian';
# selecting only male students 
select * from grades where gender = 'M'; 
# selecting only female students
select * from grades where gender = 'F'; 
# selecting firstname, lastname, final marks and passfail for female students
select firstname, lastname, final, passfail from grades where gender = 'F'; 
# selecting rows where final marks = 68
select * from grades where final = 68;
# selecting rows where final marks < 70
select * from grades where final < 70; 
# selecting rows where final marks > 70
select * from grades where final > 70; 
# selecting rows where final marks <= 60
select * from grades where final <= 60; 
# selecting rows where final marks >= 60
select * from grades where final >= 60; 
# using AND operator
# selecting rows where firstname is osborne and gender is female
select * from grades where firstname = 'osborne' AND gender = 'F';
# using OR operator
# selecting rows where firstname is either galvez or lian
select * from grades where firstname = 'galvez' OR firstname = 'lian';
# selecting rows where firstname galvez who is passed
select * from grades where firstname = 'galvez' AND passfail = 'p';
# selecting rows where lastname = 'kreg' and he is pass or others are fail
select * from grades where lastname = 'kreg' AND passfail = 'f' OR passfail = 'f'; 
# selecting rows where quiz marks > 7 and student is a male
select * from grades where quiz > 7 AND gender = 'M';
# selecting rows where quiz marks > 7 and student is a female
select * from grades where quiz > 7 AND gender = 'F';
# find out whether we have a student named Amit or Sweety
select * from grades where firstname = 'Amit' OR firstname = 'Sweety';
# find out whether we have a student named lagford or rangifo
select * from grades where firstname = 'lagford' OR firstname = 'rangifo';
# find out records where firstname is either Lian, Tomosawa or Bakken
select * from grades where firstname IN ('lian', 'tomosawa', 'bakken'); 
# find out records where firstname is not Lian, Tomosawa or Bakken
select * from grades where firstname NOT IN ('lian', 'tomosawa', 'bakken'); 
# find out the rows where quiz marks are between 5 and 7
select * from grades where quiz BETWEEN 5 and 7; 
# find out the rows where quiz marks are not between 5 and 7
select * from grades where quiz NOT BETWEEN 5 and 7; 
# find out the rows where final >= 63 and quiz <=7
select * from grades where final >= 63 AND quiz <=7;
# find out the rows where final >= 63 and quiz <=7 and firstname is osborne
select * from grades where final >= 63 AND quiz <= 7 AND firstname = 'osborne'; 
# find out the rows where final >= 63 or quiz <=7 or firstname is osborne
select * from grades where final >= 63 OR quiz <= 7 OR firstname = 'osborne'; 
# find out the rows where final >= 63 and quiz <=7 or firstname is osborne
select * from grades where final >= 63 AND quiz <= 7 OR firstname = 'osborne';
# find out the rows where the lastname starts with 'da'
select * from grades where lastname LIKE ('da%');
# find out the rows where the firstname ends with 'z'
select * from grades where firstname LIKE ('%z');
# find out the rows where the lastname has any 1 character in beginning
# ani in middle and any number of characters at the end
select * from grades where lastname LIKE ('_ani%'); 
# find the rows where lastname has 'ie' in it
select * from grades where lastname LIKE ('%ie%'); 
# find the rows where lastname has 'ie' at last
select * from grades where lastname LIKE ('%ie'); 

# Subqueries in SQL
select * from grades;
# printing all the records where firstname is based on final > 65
select * from grades where firstname IN (select firstname from grades where final > 65);
# printing first and lastname where minimum quiz value is taken
select firstname, lastname from grades where quiz = (select MIN(quiz) from grades);   


# Functions in SQL
# AGGREGATE FUNCTIONS 
# COUNT function returns the number of rows present in the table 
# either based on a condition or without any condition
select COUNT(quiz) from grades; 
# SUM function returns the total of the numerical column that we choose
select SUM(quiz) from grades; 
# AVG function returns the mean value of the numeric column
select AVG(quiz) from grades;
# MIN & MAX return the lowest & the greatest values of a numerical column respectively
select MIN(quiz) from grades;
select MAX(quiz) from grades; 
# SCALER FUNCTIONS
# LCASE & UCASE return the values in lower (small caps) or upper case (large caps)
select LCASE(firstname) from grades;
select UCASE(firstname) from grades;
# LENGTH function returns the total number of characters in a string column
select LENGTH(lastname) from grades; 
select LENGTH('SAGAR'); 
# ROUND Function returns the numeric value based on the decimals specified
select ROUND(284.256, 2);
# NOW function returns the current system date and time
select NOW();

# ORDER BY CLAUSE
select * from grades;
# arrange all rows based on quiz values in ascending order
select * from grades ORDER BY quiz; 
# arrange all rows based on quiz values in descending order
select * from grades ORDER BY quiz DESC; 
# arrange all rows based on passfail values in ascending order
select * from grades ORDER BY passfail; 
# arrange all rows based on firstname value in ascending order
select * from grades ORDER BY firstname; 
# randomly select some records
select * from grades ORDER BY RAND() LIMIT 4; 

# DISTINCT CLAUSE
select DISTINCT quiz from grades; 

# GROUP BY CLAUSE
# selecting unique values for final 
select final from grades GROUP BY final; 
# grouping based on quiz column and then printing unique quiz values 
# alongwith count of firstname
select quiz, COUNT(firstname) from grades GROUP BY quiz; 
# selecting maximum final marks based on gender 
select gender, MAX(final) from grades GROUP BY gender; 
# select minimum quiz marks based on passfail 
select passfail, MIN(quiz) from grades GROUP BY passfail; 

# PRIMARY KEY
# Adding a Primary Key during Table Creation
create table emp_data(ID INT, NAME VARCHAR(20), PRIMARY KEY(ID)); 
# describing the table and checking if Primary Key has been created
describe emp_data;
# Let's check the rules -> Unique and Not Null with regards to P(K)
# The query given below will give an error as ID is a P(K), we cannot leave it blank
insert into emp_data(Name) values('Sagar'); 
# Let's insert a record 
insert into emp_data values (1090, 'Sagar');
# Let's insert duplicate record now, this will give an error as P(K) is unique
insert into emp_data values(1090, 'Jai'); 

# Adding Primary Key using Alter command
select * from grades;
# Let's try adding P(K) to quiz column, it wont work as it is having duplicate values
alter table grades add PRIMARY KEY(quiz);
# we will have to add P(K) to a Non-Null + Unique column
alter table grades add PRIMARY KEY(id); 
describe grades;

# FOREIGN KEY
# adding 1 column named dept_id in emp_data table 
alter table emp_data add column dept_id INT; 
select * from emp_data;
create table dept_data(d_id INT, d_name VARCHAR(20), PRIMARY KEY(d_id));
insert into dept_data values(1, 'Testing'), (2, 'HR'), (3, 'Sales');
select * from dept_data;
# creating a foreign key in emp_data(dept_id) for dept(d_id) P(K)
alter table emp_data add FOREIGN KEY (dept_id) references dept_data(d_id); 
# describing both tables to check
describe dept_data;
describe emp_data;

# checking referential integrity constraints on both emp_data and dept_data tables
select * from emp_data;
update emp_data set dept_id = 2 where ID = 1090; 
# below query will give an error as F(k) can only have values of P(k)
insert into emp_data values(1091, 'Jai', 4);
# below query will add duplicate value in F(k) 
insert into emp_data values(1091, 'Jai', 2);
select * from emp_data; 
# trying to delete d_id value from dept_data which is referenced in dept_id col in emp_data; 
delete from dept_data where d_id = 2; 
select * from dept_data;
# trying to delete F(k) record 
delete from emp_data where ID = 1091;
select * from emp_data;
delete from emp_data where ID = 1090;
# below query will not run as we dont have 5 value in d_id under dept_data table
insert into emp_data values(1080, 'Karthik', 5);
# first we gonna add 5 value in the P(k), then we can add it in F(k)
insert into dept_data values(5, 'Marketing');
insert into emp_data values(1080, 'Karthik', 5);
select * from emp_data;

# VIEWS
# Base Table -> Primary Table using which we will create a View
select * from grades; 
# View -> Secondary Table which will only show the records from Base Table
# based on user's preference
create VIEW alfred AS select * from grades where lastname = 'alfred';
select * from alfred; 
# updating the base table to see if the view gets the updated data
update grades set final = 40 where lastname = 'alfred';
select * from grades;
select * from alfred;
# Altering a view
alter VIEW alfred as select * from grades where final < 60; 
select * from alfred;
# Dropping a view
drop VIEW alfred; 
select * from alfred;

# INDEXES
# creating an index while creating a new table
create table index_eg(c1 INT PRIMARY KEY, c2 INT NOT NULL, INDEX(c2)); 
show INDEXES from index_eg;
# adding an index to a previously created table
create INDEX index_1 ON grades(final); 
show INDEXES from grades;

# PRACTICAL SCENARIO + JOINS
create table mov_name(mov_id INT, mov_name VARCHAR(30)); 
create table mov_type(mov_id INT, genre VARCHAR(20), INDEX(genre)); 
create VIEW view_1 as select * from mov_name where mov_id < 3; 
insert into mov_name values(1, 'The Godfather'), (2, 'Titanic'), 
						   (3, 'Shawshank Redemption'), (4, 'Zodiac');
insert into mov_type values(1, 'DRAMA'), (2, 'ROMANCE'), (3, 'ADVENTURE'); 
select * from mov_name;
select * from mov_type;
select * from view_1; 
show indexes from mov_type; 
insert into mov_type values(5, 'Action');
# Joins
# we are taking 2 tables - mov_name & mov_type
# INNER JOIN
select m.mov_id, m.mov_name, c.genre from mov_name m
					INNER JOIN mov_type c ON c.mov_id = m.mov_id; 
# LEFT JOIN
select m.mov_id, m.mov_name, c.genre from mov_name m 
					LEFT JOIN mov_type c USING(mov_id); 
# RIGHT JOIN
select m.mov_id, m.mov_name, c.genre from mov_name m
					RIGHT JOIN mov_type c ON c.mov_id = m.mov_id;
# CROSS JOIN
select m.mov_id, m.mov_name, c.genre from mov_type c
					CROSS JOIN mov_name m; 

# SUBQUERIES
select * from mov_type;
select * from mov_name;
select * from mov_type where mov_id in (select mov_id from mov_name);                     
select * from mov_type where mov_id in 
				(select mov_id from mov_name where mov_name = 'Titanic');   
update mov_type set genre = 'THRILLER' where mov_id in
				(select mov_id from mov_name where mov_name = 'Shawshank Redemption');
                
                
# TURNING AUTOCOMMIT OFF
set autocommit = 0; 
select * from mov_type; 
delete from mov_type where mov_id = 3;
rollback;  
select * from mov_type;
commit; 
# TURNING AUTOCOMMIT ON
set autocommit = 1;