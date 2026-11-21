-- Lesson 4: Primary Keys and Constraints


DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    age INTEGER NOT NULL CHECK (age >= 18),
    is_active BOOLEAN DEFAULT TRUE
);

INSERT INTO employees (employee_id, name, email, age)
VALUES
    (1, 'Rahul', 'rahul@example.com', 25),
    (2, 'Anu', 'anu@example.com', 22);

-- is_active uses its DEFAULT value TRUE.
SELECT * FROM employees;


