# Installation and First Database

## PostgreSQL Installation

PostgreSQL is installed locally on my Windows computer.

Tools used:
- PostgreSQL Server
- pgAdmin 4
- SQL Shell (psql)

## PostgreSQL Connection Details

- Host: localhost
- Port: 5432
- Default user: postgres

## First Database

Database name: `learning_db`

Created using:

```sql
CREATE DATABASE learning_db;
```

## Verification

```sql
SELECT current_database();
```

This query returns the name of the database currently connected to.

## Important Commands

| Command | Purpose |
|---|---|
| `\l` | List databases |
| `\c learning_db` | Connect to database |
| `\dt` | List tables |
| `\q` | Exit psql |

## What I Learned

- PostgreSQL server and client
- pgAdmin
- SQL Shell (psql)
- Database creation
- Connecting to a database
- Verifying the current database