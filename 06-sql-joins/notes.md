
# Lesson 06 — SQL JOINs

## 1. Introduction

A JOIN combines rows from two or more tables based on a related column or condition.

Relational databases store information in separate tables to reduce redundancy and improve organization.

JOINs allow us to retrieve related information from those tables.

In the previous lesson, we created:

- departments
- employees

The employees table contains department_id, which references department_id in the departments table.

We can use this relationship to retrieve employee names and department names together.

## 2. Table Aliases

A table alias is a temporary name assigned to a table within a query.

Example:

```sql
SELECT
    e.employee_name,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;