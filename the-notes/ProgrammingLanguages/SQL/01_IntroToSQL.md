---
title: '***SQL***: Intro to SQL'
author: "Cole Ellis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$$set(echo = TRUE)
```

**S**tructured **Q**uery **L**anguage is a programming language dedicated to managing relational databases.  It operates through declarative statements that build the table, update the table, and maintains integrity regardless of size.

Components of a Statement in SQL:

- *Clause*: Clauses perform specific tasks in SQL. By convention, clauses are written in capital letters. Clauses can also be referred to as commands.
- *Name*: Refers to the name of the table that the command is applied to.
- *Parameter*: A parameter is a list of columns, data types, or values that are passed to a clause as an argument. Here, the parameter is a list of column names and the associated data type.

All statements have a semicolon at the end of the statement.  Note that the commands are capitalized below but they do not need to be.

## Retrieving Data
A *relational database* is a database that organizes information into one or more tables. Here, the relational database contains one table.

A *table* is a collection of data organized into rows and columns. Tables are sometimes referred to as relations. The table used in the example code is `celebs`.

A *column* is a set of data values of a particular type. Here, `id`, `name`, and `age` are the columns. 

A row is a single record in a table. The first row in the `celebs` table has:

- An `id` of 1
- A `name` of Justin Bieber
- An `age` of 22

All data stored in a relational database is of a certain data type. Some of the most common data types are:

- `INTEGER`, a positive or negative whole number
- `TEXT`, a text string
- `DATE`, the date formatted as YYYY-MM-DD
- `REAL`, a decimal value

To retrieve an entire table, use the `SELECT` command:
```sql
SELECT *
FROM celebs;
```

The asterisk (`*`) is the wildcard character that returns all columns of a table without restriction.

To retrieve all of one column from a database, change the asterisk (`*`) to the column being retrieved:
```sql
SELECT name
FROM celebs; # all names will be returned
```

## Creating Table
Using the `CREATE` command, we can build a table and establish the table's columns.
```sql
CREATE TABLE celebs (
	id INTEGER,
	name TEXT,
	age INTEGER
);
```

To insert data into a table, use the `INSERT` command.
```sql
INSERT INTO celebs (id, name, age) VALUES (1, 'Justin Bieber', 22);
```

Here, `INSERT INTO` is the clause, `celebs` is the name, `(id, name, age)` is a parameter, `VALUES` is a clause, and `(1, 'Justin Bieber', 22)` is a parameter.

## Manipulating Tables
The `ALTER TABLE` clause is used to add a new **column** to a table.
```sql
ALTER TABLE celebs ADD COLUMN twitter_handle TEXT; # new text column called twitter_handle
```

The default value in a new column is NULL (∅).

The `UPDATE` command updates a **row** in a table.
```sql
UPDATE celebs SET twitter_handle = '@taylorswift13' WHERE id = 4; # sets Taylor Swift's Twitter Handle
```

The `WHERE` clause indicates which row to update.

The `DELETE FROM` command deletes one or more rows from a table. You can use the statement when you want to delete existing records. 
```sql
DELETE FROM celebs WHERE twitter_handle IS NULL;
```

`IS NULL` is a conditional statement that returns true whenever the value is null, false otherwise.

*Constraints* that add information about how a column can be used are invoked after specifying the data type for a column. They can be used to tell the database to reject inserted data that does not adhere to a certain restriction. 

Consider the following code which uses constraints to build a table:
```sql
CREATE TABLE celebs (
   id INTEGER PRIMARY KEY, 
   name TEXT UNIQUE,
   date_of_birth TEXT NOT NULL,
   date_of_death TEXT DEFAULT 'Not Applicable'
);

CREATE TABLE awards (
   id INTEGER PRIMARY KEY,
   recipient TEXT NOT NULL,
   award_name TEXT DEFAULT 'Grammy'
);
```

- `PRIMARY KEY` columns can be used to uniquely identify the row. Attempts to insert a row with an identical value to a row already in the table will result in a constraint violation which will not allow you to insert the new row.
- `UNIQUE` columns have a different value for every row. This is similar to `PRIMARY KEY` except a table can have many different `UNIQUE` columns.
- `NOT NULL` columns must have a value. Attempts to insert a row without a value for a `NOT NULL` column will result in a constraint violation and the new row will not be inserted.
- `DEFAULT` columns take an additional argument that will be the assumed value for an inserted row if the new row does not specify a value for that column.

## Deleting Tables
The `DROP TABLE` command can be used to delete a table from a database.
```sql
DROP TABLE awards;
```

The `TRUNCATE TABLE` command can be used to delete all the data inside a table, but not delete the table.
```sql
TRUNCATE TABLE celebs;
```