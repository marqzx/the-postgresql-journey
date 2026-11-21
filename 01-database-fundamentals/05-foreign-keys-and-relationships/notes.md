
# Lesson 05 — Foreign Keys and Relationships

## 1. Introduction

In a relational database, information is usually divided into multiple tables.

For example, a company may store departments in one table and employees in another table.

A relationship connects records in different tables.

This lesson covers:

- Foreign keys
- Parent and child tables
- Referential integrity
- One-to-many relationships
- NULL values in foreign keys
- Basic INNER JOIN usage

## 2. Why Do We Need Relationships?

Imagine storing employee and department information in one table:

| employee_id | employee_name | department_name |
|---|---|---|
| 1 | Rahul | Engineering |
| 2 | Anu | Engineering |
| 3 | Arun | Finance |

The department name is repeated for every employee in that department.

This creates data redundancy.

Problems caused by redundancy include:

- The same information is stored multiple times.
- Updating department information may require changing many rows.
- Inconsistent values may accidentally be stored.
- Maintaining data becomes more difficult.

A better design separates departments and employees into different tables.

## 3. Parent and Child Tables

A parent table contains the referenced key.

A child table contains the foreign key that references the parent.

In this lesson:

- `departments` is the parent table.
- `employees` is the child table.

The `departments` table stores department information.

The `employees` table stores employee information and the department to which each employee belongs.

## 4. What Is a Foreign Key?

A FOREIGN KEY is a constraint that establishes a relationship between tables.

A foreign key references a PRIMARY KEY or UNIQUE key in another table.

It helps maintain referential integrity.

Referential integrity means that relationships between records remain valid.

For example, an employee cannot reference department ID 999 if department 999 does not exist.

## 5. Creating the Parent Table

```sql
CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
```

Explanation:

- `department_id` uniquely identifies each department.
- `PRIMARY KEY` prevents duplicate department IDs and NULL values.
- `department_name` stores the department name.
- `NOT NULL` requires a department name.

## 6. Creating the Child Table

```sql
CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INTEGER,

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
```

Explanation:

- `employee_id` uniquely identifies each employee.
- `employee_name` stores the employee's name.
- `department_id` identifies the employee's department.
- The FOREIGN KEY references `departments.department_id`.

The referenced column must be a primary key or unique key.

## 7. One-to-Many Relationship

The relationship between departments and employees is one-to-many.

One department can have many employees.

Each employee can be assigned to one department using this table design.

Example:

Engineering:
- Rahul
- Anu

Finance:
- Maya

The department ID is stored in the employees table.

## 8. Inserting Related Data

Insert parent records before inserting child records.

First insert departments:

```sql
INSERT INTO departments
    (department_id, department_name)
VALUES
    (10, 'Engineering'),
    (20, 'Human Resources'),
    (30, 'Finance');
```

Then insert employees:

```sql
INSERT INTO employees
    (employee_id, employee_name, department_id)
VALUES
    (1, 'Rahul', 10),
    (2, 'Anu', 10),
    (3, 'Arun', 20),
    (4, 'Maya', 30);
```

The department IDs used by employees must exist in the departments table.

## 9. Foreign Key Error

This statement should fail:

```sql
INSERT INTO employees
    (employee_id, employee_name, department_id)
VALUES
    (5, 'Invalid Employee', 999);
```

Department ID 999 does not exist.

PostgreSQL rejects the insertion because it would violate the foreign key constraint.

This protects the database from invalid relationships.

## 10. NULL in a Foreign Key

A foreign key column can contain NULL unless it is also defined as NOT NULL.

For example:

```sql
INSERT INTO employees
    (employee_id, employee_name, department_id)
VALUES
    (6, 'Unassigned Employee', NULL);
```

This is allowed because NULL means the employee currently has no department assigned.

If every employee must belong to a department, define the foreign key column as NOT NULL.

## 11. INNER JOIN

A JOIN combines related data from multiple tables.

Example:

```sql
SELECT
    employees.employee_name,
    departments.department_name
FROM employees
INNER JOIN departments
    ON employees.department_id = departments.department_id;
```

Explanation:

- `SELECT` chooses the columns to display.
- `FROM employees` starts with the employees table.
- `INNER JOIN departments` joins the departments table.
- `ON` specifies how the rows are matched.
- Matching department IDs connect employees to departments.

An INNER JOIN returns rows where the join condition matches.

## 12. Important Rules

1. A foreign key references a primary key or unique key.
2. The referenced table is commonly called the parent table.
3. The table containing the foreign key is commonly called the child table.
4. Insert parent records before child records when the referenced rows do not yet exist.
5. A foreign key prevents references to nonexistent parent records.
6. A foreign key can contain NULL unless NOT NULL is specified.
7. A foreign key does not automatically make its column unique.
8. One-to-many relationships commonly store the foreign key on the many side.

## 13. Practice Tasks

1. Insert a department named Marketing with department ID 40.
2. Insert two employees into Marketing.
3. Retrieve all employees who belong to Engineering.
4. Try inserting an employee with department ID 500.
5. Explain why PostgreSQL rejects the invalid department ID.
6. Explain the difference between a primary key and a foreign key.

## Lesson Summary

A foreign key creates a relationship between tables and maintains referential integrity.

In a one-to-many relationship, the foreign key is commonly stored in the child table.

The departments and employees example demonstrates how relational databases connect records without repeatedly storing the same department information.

