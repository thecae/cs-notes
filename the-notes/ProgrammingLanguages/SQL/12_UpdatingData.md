---
title: '***SQL***: Updating Data'
author: "Cole Ellis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$$set(echo = TRUE)
```

## Updating Data
To update (modify) data in a table, you use the `UPDATE` statement.  `UPDATE` can be used in two ways:

- To update specific rows in a table
- To update all rows in a table

The `UPDATE` statement is very easy to use - some would say too easy.  The basic format of an `UPDATE` statement is made of three parts:

- The table to be updated
- The column names and their new values
- The filter condition that determines which rows should be updated

An example is customer `1000000005` who had no email address on file and now has an email address, so this record needs updating.
```sql
UPDATE Customers
SET cust_email = 'kim@thetoystore.com'
WHERE cust_id = '1000000005';
```
The `UPDATE` statement always begins with the name of the table being updated.  In this same, it is the *Customers* table.  The `SET` command is then used to assign the new value to a column.

The `UPDATE` statement finishes with a `WHERE` clause that tells the DBMS which row to update.  Without a `WHERE` clause, the DBMS would update all the rows in the *Customers* table with this new email address.

Updating multiple columns requires a slightly different syntax:
```sql
UPDATE Customers
SET cust_contact = 'Sam Roberts', cust_email = 'sam@toyland.com'
WHERE cust_id = 1000000006;
```
When you are updating multiple columns, you use only a single `SET` command, and each `column = value` pair is separated by a comma.  

To delete a column's value, you can set it to `NULL`.  You can do this as follows:
```sql
UPDATE Customers
SET cust_email = NULL
WHERE cust_id = 1000000005;
```

Here, the `NULL` keyword is used to save no value to the `cust_email` column.  That is very different from saving an empty string.  

## Deleting Data
To delete (remove) ata from a table, you can use the `DELETE` statement.  `DELETE` can be used in two ways:

- To delete specific rows from a table
- To delete all rows from a table

To delete a row from a table:
```sql
DELETE FROM Customers
WHERE cust_id = 1000000006;
```

`DELETE FROM` requires that you specify the name of the table from which the data is to be deleted.  The `WHERE` clause filters which rows are to be deleted.  In this example, only customer `100000006` will be deleted.  If the `WHERE` clause were omitted, this statement would have deleted every customer in the table!

If you want to delete all rows from a table, don't use `DELETE`.  Instead, use the `TRUNCATE TABLE` statement, which accomplishes the same thing but does it much quicker.

## Guidelines for Updating and Deleting Data
The `UPDATE` and `DELETE` statements used in the previous section all have `WHERE` clauses, and there is a very good reason for this. If you omit the `WHERE` clause, the `UPDATE` or `DELETE` will be applied to every row in the table. In other words, if you execute an `UPDATE` without a `WHERE` clause, every row in the table will be updated with the new values. Similarly, if you execute `DELETE` without a `WHERE` clause, all the contents of the table will be deleted.

Here are some important guidelines that many SQL programmers follow:

- Never execute an `UPDATE` or a `DELETE` without a `WHERE` clause unless you really do intend to update and delete every row.
- Make sure every table has a primary key, and use it as the WHERE clause whenever possible. (You may specify individual primary keys, multiple values, or value ranges.)
- Before you use a `WHERE` clause with an `UPDATE` or a `DELETE`, first test it with a `SELECT` to make sure it is filtering the right records; it is far too easy to write incorrect `WHERE` clauses.
- Use database-enforced referential integrity so that the DBMS will not allow the deletion of rows that have data in other tables related to them.
- Some DBMSs allow database administrators to impose restrictions that prevent the execution of `UPDATE` or `DELETE` without a `WHERE` clause. If your DBMS supports this feature, consider using it.

The bottom line is that SQL has no Undo button. Be very careful using `UPDATE` and `DELETE`, or you’ll find yourself updating and deleting the wrong data.