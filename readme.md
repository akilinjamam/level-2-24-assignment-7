## 1. What is PostgreSQL?

PostgreSQL is an advance relational database management system which is open source. we mostly use this database for complex queries with standard compliance and extensibility.

## 2. What is the purpose of a database schema in PostgreSQL?

The purpose of database schema in postgresSQL to provide organized and structured objects like tables, views, indexes and functions besides logical groups, managing access, avoiding conflict and improving data organization.

## 3. Explain the primary key and foreign key concepts in PostgreSQL.

A primary key in postgreSQL is a unique identifier for each row in a table which ensure no duplicate. it can be a single attribute or double which is called composite key.

A Foreign key in postgreSQL in a column or group of column which establishes relationship between two tables. it refer primary key of another table.

## 4. What is the difference between the VARCHAR and CHAR data types?

VARCHAR: it provided maximum length of string. it uses as much space as it requires.

CHAR: its not maximum. it provides fixed length of strings. and if string length is less than fixed, it will create padding with spaces for shorter strings.

## 5. Explain the purpose of the WHERE clause in a SELECT statement.

In SELECT statement WHERE clause is used to filter records according to conditions that must have to met rows. main purpose is to filter data based on one or more conditions

## 6. What are the LIMIT and OFFSET clauses used for?

using LIMIT we can fix the length of the table rows. and using OFFSET we can skip specified row.

## 7. How can you perform data modification using UPDATE statements?

how update statement works, i have given example with following given code:

```

UPDATE students
SET status =  'Awarded'
WHERE student_id = 1;

```

## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

with the help of JOIN operator we can connect multiple tables with one table using foreign key which refer other tables as their primary key.

The significance of JOIN is:
JOIN allows to combine this related data to create comprehansive result.
it maintain data integrity by referencing related data from different tables through foregn key.

Here is example through codes how it workes:

```

SELECT student_name
FROM
    enrollment
    JOIN students ON enrollment.student_id = students.student_id
    JOIN courses ON enrollment.course_id = courses.course_id

```

## 9. Explain the GROUP BY clause and its role in aggregation operations.

The GROUP BY clause in SQL is used to group rows that have the same values in specified columns into aggregated data, allowing you to perform calculations on groups rather than individual rows. It’s often paired with aggregation functions such as COUNT, SUM, AVG, MAX, and MIN to produce summary information from a dataset.

Role of GROUP BY in Aggregation is :
it organizes rows with the same vlues in the specific column into single group.
by grouping you can aggregate functions to summerize and helps to calculate values for each group

here is example:

```

SELECT
    course_name,
    count(*) AS students_enrolled
FROM
    enrollment
    JOIN students ON enrollment.student_id = students.student_id
    JOIN courses ON enrollment.course_id = courses.course_id
GROUP BY
    courses.course_name

```

## 10. How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?

how this works is given below through code example:

COUNT:

```

SELECT COUNT(column_name) FROM table_name;

```

SUM:

```
SELECT SUM(column_name) FROM table_name;

```

AVG:

```
SELECT AVG(column_name) FROM table_name;

```
