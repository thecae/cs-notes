---
title: '***SQL***: Combining Queries'
author: "Cole Ellis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

Most SQL queries contain a single `SELECT` statement that returns data from one or more tables. SQL also enables you to perform multiple queries (multiple `SELECT` statements) and return the results as a single query result set. These combined queries are usually known as unions or compound queries.

There are basically two scenarios in which you’d use combined queries:

- To return similarly structured data from different tables in a single query
- To perform multiple queries against a single table returning the data as one query

## Creating Combined Queries
SQL queries are combined using the `UNION` operator.  Using `UNION`, you can specify multiply `SELECT` statements, and their results will be combined into a single result set.  `UNION` accomplishes nearly the exact same goal as multiple `WHERE` statements.

Using `UNION` is simple enough.  All you have to do is specify each `SELECT` statement and place the keyword `UNION` between each.


Consider the `SELECT` statements:
```sql
SELECT cust_name, cust_contact, cust_email
FROM Customers WHERE cust_state IN ('IL', 'IN', 'MI');

SELECT cust_name, cust_contact, cust_email
FROM Customers WHERE cust_name = 'Fun4All';
```

To combine, do the following:
```sql
SELECT cust_name, cust_contact, cust_email
FROM Customers WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers WHERE cust_name = 'Fun4All';
```

The preceding statements are made up of both of the previous `SELECT` statements separated by the `UNION` keyword. `UNION` instructs the DBMS to execute both `SELECT` statements and combine the output into a single query result set.

`UNION` is very easy to use, but there are a few rules governing what can be combined:

- A `UNION` must be composed of two or more `SELECT` statements, each separated by the word `UNION` (meaning if there are four `SELECT` statements, there must be three `UNION` keywords).
- Each query in a `UNION` must be the same columns, expressions, or aggregate functions.
- Column datatypes must be compatible.  They need not be the same name or the exact same type, but they must be of a type that the DBMS can implicitly convert.


If `SELECT` statements that are combined with a UNION have different column names, what name is actually returned? For example, if one statement contained `SELECT prod_name` and the next used `SELECT productname`, what would be the name of the combined returned column?

The answer is that the first name is used, so in our example the combined column would be named `prod_name`, even though the second `SELECT` used a different name. This also means that you can use an alias on the first name to set the returned column name as needed.
This behavior has another interesting side effect. Because the first set of column names are used, only those names can be specified when sorting.

## Inclusing or Eliminating Duplicate Rows
Note that in the previous row, if there was a row that satisfied both conditions, the `UNION` statement would only print that row once.  If you want all occurrences to return, `UNION ALL` works instead of `UNION`.
```sql
SELECT cust_name, cust_contact, cust_email
FROM Customers WHERE cust_state IN ('IL', 'IN', 'MI')
UNION ALL
SELECT cust_name, cust_contact, cust_email
FROM Customers WHERE cust_name = 'Fun4All';
```

Earlier it was mentioned that `UNION` almost always accomplishes the same goal as multiple `WHERE` conditions.  However, `UNION ALL` is the form of `UNION` that accomplishes what cannot be done with `WHERE` clauses.

## Sorting Combined Query Results
`SELECT` statement output is sorted using the `ORDER BY` clause. When combining queries with a `UNION`, you may use only one `ORDER BY` clause, and it must occur after the final `SELECT` statement. There is very little point in sorting part of a result set one way and part another way, and so multiple `ORDER BY` clauses are not allowed.
```sql
SELECT cust_name, cust_contact, cust_email
FROM Customers WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers WHERE cust_name = 'Fun4All'
ORDER BY cust_name, cust_contact;
```

This `UNION` takes a single `ORDER BY` clause after the final `SELECT` statement. Even though the `ORDER BY` appears to be a part of only that last `SELECT` statement, the DBMS will in fact use it to sort all the results returned by all the `SELECT` statements.