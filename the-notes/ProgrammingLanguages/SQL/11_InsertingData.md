---
title: '***SQL***: Inserting Data'
author: "Cole Ellis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$$set(echo = TRUE)
```

`SELECT` is undoubtedly the most frequently used SQL statement.  But there are three other frequently used SQL statements to learn.  The first is `INSERT`.

As its name suggests, `INSERT` is used to add rows to a database table.  Insert can be used in several ways:

- Inserting a single complete row
- Inserting a single partial row
- Inserting the results of a query

***Note**: Use of the `INSERT` statement might require special security privileges in client/server DBMSs. Before you attempt to use `INSERT`, make sure you have adequate security privileges to do so.*

## Inserting Complete Rows
The simplest way to insert data into a table is to use the basic `INSERT` syntax, which requires that you specify the table name and the values to be inserted into the new row.
```sql
INSERT INTO Customers
VALUES (1000000006, 'Toy Land', '123 Any Street', 'New York', 'NY', '11111', 'USA', NULL, NULL);
```
The above example inserts a new customer into the `Customers` table. The data to be stored in each table column is specified in the `VALUES` clause, and a value must be provided for every column. If a column has no value (for example, the `cust_contact` and `cust_email` columns above), the NULL value should be used (assuming the table allows no value to be specified for that column). The columns must be populated in the order in which they appear in the table definition.

Although this syntax is indeed simple, it is not at all safe and should generally be avoided at all costs. The above SQL statement is highly dependent on the order in which the columns are defined in the table. It also depends on information about that order being readily available. Even if it is available, there is no guarantee that the columns will be in the exact same order the next time the table is reconstructed. Therefore, writing SQL statements that depend on specific column ordering is very unsafe. If you do so, something will inevitably break at some point.

The safer (and unfortunately more cumbersome) way to write the `INSERT` statement is as follows:
```sql
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES(1000000006, 'Toy Land', '123 Any Street', 'New York', 'NY', '11111', 'USA', NULL, NULL);
```

This example does the exact same thing as the previous `INSERT` statement, but this time the column names are explicitly stated in parentheses after the table name. When the row is inserted, the DBMS will match each item in the columns list with the appropriate value in the `VALUES` list. The first entry in `VALUES` corresponds to the first specified column name. The second value corresponds to the second column name, and so on.

Because column names are provided, the `VALUES` must match the specified column names in the order in which they are specified, and not necessarily in the order that the columns appear in the actual table. The advantage of this is that, even if the table layout changes, the `INSERT` statement will still work correctly.

When done this way, the order no longer matters.  Changing the order of the columns will not affect the insertion.

## Inserting Partial Rows
The recommended way to use `INSERT` is to explicitly specify table column names. Using this syntax, you can also omit columns. This means you provide values for only some columns, but not for others.
```sql
INSERT INTO Customers(cust_id, cust_name,
cust_address, cust_city, cust_state, cust_zip, cust_country)
VALUES(1000000006, 'Toy Land', '123 Any Street', 'New York', 'NY', '11111', 'USA');
```

Calues were not provided for two of the columns, `cust_contact` and `cust_email.` This means there is no reason to include those columns in the `INSERT` statement. This `INSERT` statement, therefore, omits the two columns and the two corresponding values.

You may omit columns from an `INSERT` operation if the table definition so
allows. One of the following conditions must exist:

- The column is defined as allowing `NULL` values (no value at all).
- A default value is specified in the table definition. This means the default value will be used if no value is specified.

## Inserting Retrieved Data
`INSERT` is usually used to add a row to a table using specified values. There is another form of `INSERT` that can be used to insert the result of a `SELECT` statement into a table. This is known as `INSERT SELECT`, and, as its name suggests, it is made up of an `INSERT` statement and a `SELECT` statement.

Suppose you want to merge a list of customers from another table into your *Customers* table. Instead of reading one row at a time and inserting it with `INSERT`, you can do the following:
```sql
INSERT INTO Customers(cust_id, cust_contact, cust_email, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country)
SELECT cust_id, cust_contact, cust_email, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country
FROM CustNew;
```

This example uses `INSERT SELECT` to import all the data from *CustNew* into *Customers*. Instead of listing the `VALUES` to be inserted, the `SELECT` statement retrieves them from *CustNew*. Each column in the `SELECT` corresponds to a column in the specified columns list. How many rows will this statement insert? That depends on how many rows are in the *CustNew* table. If the table is empty, no rows will be inserted (and no error will be generated because the operation is still valid). If the table does, in fact, contain data, all that data will be inserted into *Customers*.

## Copying from One Table to Another
There is another form of data insertion that does not use the `INSERT` statement at all.  To copy the contents of a table into a brand new table, you can use the `CREATE SELECT` statement.
```sql
CREATE TABLE CustCopy AS SELECT * FROM Customers;
```

This `SELECT` statement creates a new table named *CustCopy* and copies the entire contents of the *Customers* table into it. Because `SELECT *` was used, every column in the *Customers* table will be created (and populated) in the *CustCopy* table. To copy only a subset of the available columns, you can specify explicit column names instead of the `*` wildcard character.
Here are some things to consider when using `SELECT INTO`:

- Any `SELECT` options and clauses may be used, including `WHERE` and `GROUP BY`.
- Joins may be used to insert data from multiple tables.
- Data may only be inserted into a single table regardless of how many tables the data was retrieved from.