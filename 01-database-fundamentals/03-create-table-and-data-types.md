# Creating Tables and Data Types

## What is a Table?

A table stores related data in rows and columns.

## What is a Data Type?

A data type defines what kind of value a column can store.

Examples:
- INTEGER
- VARCHAR
- TEXT
- BOOLEAN
- DATE
- NUMERIC

## Creating a Table

```sql
CREATE TABLE students (
    student_id INTEGER,
    name VARCHAR(100),
    age INTEGER,
    city TEXT
);
```

## Inserting Data

```sql
INSERT INTO students (student_id, name, age, city)
VALUES
    (1, 'Rahul', 21, 'Kochi'),
    (2, 'Anu', 22, 'Kozhikode'),
    (3, 'Arun', 20, 'Thrissur');
```

## Retrieving Data

```sql
SELECT * FROM students;
```

## Selecting Specific Columns

```sql
SELECT name, city
FROM students;
```

## What I Learned

- Tables, rows, and columns
- PostgreSQL data types
- CREATE TABLE
- INSERT INTO
- SELECT
- Selecting specific columns