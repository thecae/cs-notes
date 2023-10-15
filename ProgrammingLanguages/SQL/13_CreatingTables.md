---
title: '***SQL***: Creating Tables'
author: "Cole Ellis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Creating Tables
SQL is not used just for table data manipulation.  Rather, SQL can be used to perform all database and table operations, including the creation and manipulation of tables themselves.

There are generally two ways to create database tables:

- Most DBMSs come with an administration tool that you can use to create and manage database tables interactively.
- Tables may also be manipulated directly with SQL statements.

To create tables programmatically, you can use the `CREATE TABLE` SQL statement.  It is with noting that when you use interactive management tools, you are actually using SQL statements.  Instead of your writing these statements, however, the interface generates and executes the SQL seamlessly for you.

To create a table using `CREATE TABLE`, you must specify the following information:

- The name of the table specified after the keywords `CREATE TABLE`.
- The name and definition of the table columns separated by commas.
- Some DBMSs require that you also specify the table location (as in which specific database it is to be created).

The following SQL statement creates the *Products* table used throughout the notes:
```sql
CREATE TABLE Products
(
  prod_id       CHAR(10)        NOT NULL,
  vend_id       CHAR(10)        NOT NULL,
  prod_name     CHAR(254)       NOT NULL,
  prod_price    DECIMAL(8,2)    NOT NULL,
  prod_desc     VARCHAR(1000)   NULL
);
```

The table name is specified immediately after the `CREATE TABLE` keywords.  The actual table definition is enclosed within parentheses.  The columns themselves are separated by commas.  This particular table is made up of five columns.  Each column definition states with the column name, followed by the columns' datatype.  The entire statement is terminated with a semicolon after the closing parentheses.

## Working with `NULL` Values
Recall that `NULL` values are no values or the lack of a value.  A column that allows `NULL` values also allows rows to be inserted with no value at all in that column.  A column that does not allow `NULL` values does not accept rows with no value; in other words, that column will always be required when rows are inserted or updated.

Every table column s either a `NULL` column or a `NOT NULL` column, and that state is specified in that table definition at creation time.
```sql
CREATE TABLE Vendors (
vend_id         CHAR(10)    NOT NULL,
vend_name       CHAR(50)    NOT NULL,
vend_address    CHAR(50),
vend_city       CHAR(50),
vend_state      CHAR(5),
vend_zip        CHAR(10),
vend_country    CHAR(50)
);
```

This statement creates the *Vendors* table used throughout this book. The vendor ID and vendor name columns are both required and are, therefore, specified as `NOT NULL.` The five remaining columns all allow `NULL` values, and so `NOT NULL` is not specified. `NULL` is the default setting, so if `NOT NULL` is not specified, `NULL` is assumed.

## Specifying Default Values
SQL enables you to specify default values to be used if no value is specified when a row is inserted.  Default values are specified using the `DEFAULT` keyword in the column defintions in the `CREATE TABLE` statement.
```sql
CREATE TABLE OrderItems
(
  order_num     INTEGER         NOT NULL,
  order_item    INTEGER         NOT NULL,
  prod_id       CHAR(10)        NOT NULL,
  quantity      INTEGER         NOT NULL    DEFAULT 1,
  item_price    DECIMAL(8,2)    NOT NULL
);
```

This statement creates the *OrderItems* table that contains the individual items that make up an order. (The order itself is stored in the Orders table.) The quantity column contains the quantity for each item in an order. In this example, adding the text `DEFAULT 1` to the column description instructs the DBMS to use a quantity of $1$ if no quantity is specified.
Default values are often used to store values in date or time stamp columns. For example, the system date can be used as a default date by specifying the function or variable used to refer to the system date. For example, MySQL users may specify `DEFAULT CURRENT_DATE()`, while Oracle users may specify `DEFAULT SYSDATE`, and SQL Server users may specify `DEFAULT GETDATE()`. Unfortunately, the command used to obtain the system date is different in just about every DBMS.

## Updating Tables
To update table definitions, you use the `ALTER TABLE` statement. Although all DBMSs support `ALTER TABLE`, what they allow you to alter varies dramatically from one to another. Here are some points to consider when using `ALTER TABLE`:

- Ideally, tables should never be altered after they contain data. You should spend sufficient time anticipating future needs during the table design process so that extensive changes are not required later on.
- All DBMSs allow you to add columns to existing tables, although some restrict the datatypes that may be added (as well as NULL and DEFAULT usage).
- Many DBMSs do not allow you to remove or change columns in a table.
- Most DBMSs allow you to rename columns.
- Many DBMSs restrict the kinds of changes you can make on columns that are populated and enforce fewer restrictions on unpopulated columns.

As you can see, making changes to existing tables is neither simple nor consistent. Be sure to refer to your own DBMS documentation to determine exactly what you can alter.

- To change a table using `ALTER TABLE`, you must specify the following information: The name of the table to be altered after the keywords `ALTER TABLE`. (The table must exist; otherwise, an error will be generated.)
- The list of changes to be made.

Adding a column:
```sql
ALTER TABLE Vendors
ADD vend_phone CHAR(20);
```

Dropping a column:
```sql
ALTER TABLE Vendors
DROP COLUMN vend_phone;
```

Complex table structure changes usually require a manual move process involving these steps:

1. Create a new table with the new column layout.
2. Use the `INSERT SELECT` statement to copy the data from the old table to the new table. Use conversion functions and calculated fields, if needed.
3. Verify that the new table contains the desired data.
4. Rename the old table (or delete it, if you are really brave).
5. Rename the new table with the name previously used by the old table.
6. Re-create any triggers, stored procedures, indexes, and foreign keys as needed.

## Deleting Tables
Deleting tables can be done with the `DROP TABLE` statement.
```sql
DROP TABLE CustCopy;
```
This statement deletes the `CustCopy` table.  There is no confirmation, nor is there an undo.  Executing the statement will permanently remove the table.

## Renaming Tbales
Table renaming is supported differently by each DBMS.  MySQL and Oracle uses the `RENAME` statement; SQLServer uses the `sp_rename` stored procedure; SQLite supports the use of `ALTER TABLE` to rename the table.