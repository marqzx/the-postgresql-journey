SELECT current_database();

SELECT version();

CREATE TABLE students (
    student_id INTEGER,
    name VARCHAR(100),
    age INTEGER,
    city TEXT
);

INSERT INTO students (student_id, name, age, city)
VALUES
    (1, 'Rahul', 21, 'Kochi'),
    (2, 'Anu', 22, 'Kozhikode'),
    (3, 'Arun', 20, 'Thrissur');

SELECT * FROM students;


SELECT name, city
FROM students;

