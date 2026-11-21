
-- 1. INNER JOIN
-- Returns employees who have a matching department.

SELECT
    e.employee_name,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;


-- 2. LEFT JOIN
-- Returns all employees, including employees without a department.

SELECT
    e.employee_name,
    d.department_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;


-- 3. RIGHT JOIN
-- Returns all departments, including departments without employees.

SELECT
    e.employee_name,
    d.department_name
FROM employees AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id;


-- 4. FULL OUTER JOIN
-- Returns all employees and all departments.

SELECT
    e.employee_name,
    d.department_name
FROM employees AS e
FULL OUTER JOIN departments AS d
    ON e.department_id = d.department_id;


-- 5. CROSS JOIN
-- Returns every possible employee-department combination.

SELECT
    e.employee_name,
    d.department_name
FROM employees AS e
CROSS JOIN departments AS d;


-- 6. Find employees without a matching department.

SELECT
    e.employee_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;


-- 7. Find departments without employees.

SELECT
    d.department_name
FROM departments AS d
LEFT JOIN employees AS e
    ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;


-- 8. SELF JOIN example
-- Create a temporary employee hierarchy table.
-- Temporary tables exist only for the current database session.

CREATE TEMP TABLE employee_hierarchy (
    employee_id INTEGER PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    manager_id INTEGER REFERENCES employee_hierarchy(employee_id)
);


-- Insert sample hierarchy data.

INSERT INTO employee_hierarchy
    (employee_id, employee_name, manager_id)
VALUES
    (1, 'Manager Rahul', NULL),
    (2, 'Developer Anu', 1),
    (3, 'Developer Arun', 1),
    (4, 'Junior Maya', 2);


-- SELF JOIN: Show each employee and their manager.

SELECT
    employee.employee_name,
    manager.employee_name AS manager_name
FROM employee_hierarchy AS employee
LEFT JOIN employee_hierarchy AS manager
    ON employee.manager_id = manager.employee_id;


-- 9. Practice query:
-- Display employees in Engineering.

SELECT
    e.employee_name,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering';


-- 10. Practice query:
-- Count employees in each department.
-- LEFT JOIN includes departments with zero employees.

SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments AS d
LEFT JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
ORDER BY
    d.department_id;