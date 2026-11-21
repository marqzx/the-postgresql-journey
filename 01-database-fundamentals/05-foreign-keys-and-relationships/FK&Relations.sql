
-- Lesson 05: Foreign Keys and Relationships
-- Database: learning_db

-- 1. Create parent table
CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- 2. Create child table with foreign key
CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INTEGER,

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

-- 3. Insert parent records first
INSERT INTO departments
    (department_id, department_name)
VALUES
    (10, 'Engineering'),
    (20, 'Human Resources'),
    (30, 'Finance');

-- 4. Insert child records
INSERT INTO employees
    (employee_id, employee_name, department_id)
VALUES
    (1, 'Rahul', 10),
    (2, 'Anu', 10),
    (3, 'Arun', 20),
    (4, 'Maya', 30);

-- 5. View departments
SELECT *
FROM departments;

-- 6. View employees
SELECT *
FROM employees;

-- 7. View employees with department names
SELECT
    employees.employee_name,
    departments.department_name
FROM employees
INNER JOIN departments
    ON employees.department_id = departments.department_id;

-- 8. Test a foreign key violation
-- This statement is expected to fail because department 999 does not exist.
-- Run it separately so you can observe the error.
-- INSERT INTO employees
--     (employee_id, employee_name, department_id)
-- VALUES
--     (5, 'Invalid Employee', 999);

-- 9. Insert an employee without a department
-- NULL is allowed because department_id is not defined as NOT NULL.
INSERT INTO employees
    (employee_id, employee_name, department_id)
VALUES
    (6, 'Unassigned Employee', NULL);

-- 10. View employees who have no department
SELECT *
FROM employees
WHERE department_id IS NULL;

-- 11. Practice: Add Marketing department
INSERT INTO departments
    (department_id, department_name)
VALUES
    (40, 'Marketing');

-- 12. Practice: Add employees to Marketing
INSERT INTO employees
    (employee_id, employee_name, department_id)
VALUES
    (7, 'Kiran', 40),
    (8, 'Priya', 40);

-- 13. Practice: Retrieve Engineering employees
SELECT
    employees.employee_name,
    departments.department_name
FROM employees
INNER JOIN departments
    ON employees.department_id = departments.department_id
WHERE departments.department_name = 'Engineering';

-- 14. Practice: Test invalid department ID
-- Expected to fail because department 500 does not exist.
-- Uncomment and run separately to test.
-- INSERT INTO employees
--     (employee_id, employee_name, department_id)
-- VALUES
--     (9, 'Test Employee', 500);
