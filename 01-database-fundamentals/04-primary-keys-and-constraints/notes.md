# Lesson 4: Primary Keys and Constraints

## 1. What is a constraint?

A constraint is a rule applied to a table or column. Constraints help protect data quality by rejecting values that violate the rule.

## 2. PRIMARY KEY

A primary key uniquely identifies each row in a table.

Primary key rules:
- Values must be unique.
- A primary key cannot contain `NULL`.
- A table can have one primary key constraint, which may consist of one or more columns.

Example:

```sql
CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
```

Here, `employee_id` uniquely identifies each employee.

## 3. NOT NULL

`NOT NULL` prevents a column from having a missing (`NULL`) value.

```sql
name VARCHAR(100) NOT NULL
```

An insert that omits a required name will fail unless a default value is provided.

## 4. UNIQUE

`UNIQUE` prevents duplicate values in a column or combination of columns.

```sql
email VARCHAR(150) UNIQUE
```

This is useful for values such as email addresses that should not be repeated.

## 5. CHECK

`CHECK` requires a Boolean condition to be true for inserted or updated values.

```sql
age INTEGER CHECK (age >= 18)
```

This constraint rejects ages below 18. Note that a `CHECK` condition that evaluates to `NULL` does not by itself reject the row; combine it with `NOT NULL` when a value is required.

## 6. DEFAULT

`DEFAULT` supplies a value when an insert does not specify that column.

```sql
is_active BOOLEAN DEFAULT TRUE
```

If `is_active` is omitted, PostgreSQL uses `TRUE`.

## 7. FOREIGN KEY

A foreign key enforces a relationship between tables by requiring values to match a referenced key (or be `NULL`, if allowed).

We will study foreign keys and relationships in a later lesson.

## 8. Add a primary key to an existing table

If a table already contains data, you can add a primary key:

```sql
ALTER TABLE students
ADD PRIMARY KEY (student_id);
```

This succeeds only if `student_id` has no duplicate values and no `NULL` values.

## What I learned

- Constraints protect data integrity.
- Primary keys uniquely identify rows.
- `NOT NULL` requires a value.
- `UNIQUE` prevents duplicates.
- `CHECK` enforces a condition.
- `DEFAULT` supplies an omitted value.
