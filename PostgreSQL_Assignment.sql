-- Active: 1729674052464@@127.0.0.1@5432@university_db
--creating a database:

CREATE DATABASE university_db
--Table creation:

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT,
    email VARCHAR(100),
    frontend_mark INT,
    backend_mark INT,
    "status" VARCHAR(50) NULL
)

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INT
)

CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES "students" (student_id),
    course_id INTEGER REFERENCES "courses" (course_id)
)

INSERT INTO
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        'Sameer',
        21,
        'sameer@example.com',
        48,
        60,
        NULL
    ),
    (
        'Zoya',
        23,
        'zoya@example.com',
        52,
        58,
        NULL
    ),
    (
        'Nabil',
        22,
        'nabil@example.com',
        37,
        46,
        NULL
    ),
    (
        'Rafi',
        24,
        'rafi@example.com',
        41,
        40,
        NULL
    ),
    (
        'Sophia',
        22,
        'sophia@example.com',
        50,
        39,
        NULL
    ),
    (
        'Hasan',
        23,
        'hasan@gmail.com',
        43,
        39,
        NULL
    );

INSERT INTO
    courses (course_name, credits)
VALUES ('Next.js', 3),
    ('React.js', 4),
    ('Databases', 3),
    ('Prisma', 3)

INSERT INTO
    enrollment (student_id, course_id)
VALUES (1, 1),
    (1, 2),
    (2, 1),
    (3, 2)
    -- Query 1:Insert a new student record with the following details:
    --- inserting a new student data

INSERT INTO
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        'Akil Injamam',
        29,
        'akilinjamam@gmail.com',
        80,
        90,
        NULL
    )
    --Query 2: Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
    --- at first i have joined tables using JOIN statement then i have filtered using WHERE clause to find which rows are matched with Next.js.
SELECT student_name
FROM
    enrollment
    JOIN students ON enrollment.student_id = students.student_id
    JOIN courses ON enrollment.course_id = courses.course_id
WHERE
    course_name = 'Next.js'
    --Query 3: Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
    --- at first i have to calculate highest marks total gained in both frontend and backend using ORDER BY. then i have arranged rows into descending order flow and used LIMIT operator for specified row. then updated that specified row with Awarded value.

UPDATE students
SET
    status = 'Awarded'
WHERE
    student_id = (
        SELECT student_id
        FROM students
        ORDER BY (frontend_mark + backend_mark) DESC
        LIMIT 1
    );

-- Query 4 : Delete all courses that have no student enrolled
---at first i have specified thows rows in course table using NOT IN(helps to find out those rows of course attributes which is not available in enrollment table). used DISTINT to make unique for avoiding same attributes in rows. then deleted those rows from courses table which is not available in enrollment table.

DELETE FROM courses
WHERE
    course_id NOT IN (
        SELECT DISTINCT
            course_id
        FROM enrollment
    );

--Query 5: Retrieve the names of students using a limit of 2, starting from the 3rd student.
--LIMIT specified rows and OFFSET skipped first tow rows from students table.

SELECT student_name
from students
limit 2
OFFSET
    2
    --Query 6: Retrieve the course names and the number of students enrolled in each course.
    --at first i have joined table using JOIN clause, then i have grouped same attributes according to course_name. than i have count using COUNT, how many students enrolled in each course.

SELECT
    course_name,
    count(*) AS students_enrolled
FROM
    enrollment
    JOIN students ON enrollment.student_id = students.student_id
    JOIN courses ON enrollment.course_id = courses.course_id
GROUP BY
    courses.course_name
    --Query 7:Calculate and display the average age of all students.
    --i have calculated single value as average age of course students using avg().

SELECT ROUND(AVG(age), 2)
from students
    --Query 8:Retrieve the names of students whose email addresses contain 'example.com'.
    --i have filterd those rows which email attribute is example.com at last using LIKE clause
SELECT student_name
FROM students
WHERE
    email LIKE '%example.com'
-- all tables for retrieving.
SELECT *
from students
SELECT *
from courses
SELECT *
from enrollment