# ***SQL***: Retrieving Data
In SQL, the `SELECT` statement is used to retrieve data from tables.  It is the command most often and frequently seen in SQL programs.

***NOTE**: This code implies the MySQL version of SQL.*

## Retrieving One Column
To use `SELECT` to retrieve table data, you must, at a minimum, specify two pieces of information — what you want to select and from where you want to select it.
```sql
SELECT prod_name
FROM products;
```
The previous statement uses the `SELECT` statement to retrieve a single column called `prod_name` from the *Products* table. The desired column name is specified right after the `SELECT` keyword, and the `FROM` keyword specifies the name of the table from which to retrieve the data.

*Remember that commands are case-insensitive while variable names are case-sensitive.*

All extra white space within a SQL statement is ignored when that statement is processed. SQL statements can be specified on one long line or broken up over many lines. 


## Retrieving Multiple Columns
To retrieve multiple columns from a table, the same SELECT statement is used. The only difference is that multiple column names must be specified after the SELECT keyword, and each column must be separated by a comma.
```sql
SELECT prod_id, prod_name, prod_price
FROM products;
```
Just as in the prior example, this statement uses the `SELECT` statement to retrieve data from the *Products* table. In this example, three column names are specified, each separated by a comma. 

*SQL Formatting*: SQL statements typically return raw, unformatted data, and different DBMSs and clients may display the data differently (with different alignment or decimal places, for example). Data formatting is a presentation issue, not a retrieval issue. Therefore, presentation is typically specified in the application that displays the data. Actual retrieved data (without application- provided formatting) is rarely used.

## Retrieving All Columns
In addition to being able to specify desired columns (one or more, as seen above), `SELECT` statements can also request all columns without having to list them individually. This is done using the asterisk (`*`) wildcard character in lieu of actual column names.
```sql
SELECT *
FROM products;
```
When a wildcard (`*`) is specified, all the columns in the table are returned. The column order will typically, but not always, be the physical order in which the columns appear in the table definition. However, SQL data is seldom displayed as is. (Usually, it is returned to an application that formats or presents the data as needed). As such, this should not pose a problem.

## Retrieving Distinct Rows
As you have seen, `SELECT` returns all matched rows. But what if you do not want every occurrence of every value? For example, suppose you want the vendor ID of all vendors with products in your *Products* table.  For example, the `SELECT` statement may have returned nine rows (even though there are only three unique vendors in that list) because there were nine products listed in the *Products* table. So how could you retrieve a list of distinct values?

The solution is to use the `DISTINCT` keyword, which, as its name implies, instructs the database to only return distinct values.
```sql
SELECT DISTINCT vend_id
FROM products;
```
`SELECT DISTINCT vend_id` tells the DBMS to only return distinct (unique) `vend_id` rows, and so only three rows are returned, as seen in the following output. If used, the `DISTINCT` keyword must be placed directly in front of the column names.

## Limiting Results
To retrieve only a certain number of entries from the database, use the `LIMIT` clause.
```sql
SELECT prod_name
FROM products LIMIT 5;
```
The previous statement uses the `SELECT` statement to retrieve a single column. `LIMIT 5` instructs the supported DBMSs to return no more than five rows. The output from this statement is shown in the following code.

To get the next set of 5 rows, we can use the `OFFSET` command.
```sql
SELECT prod_name
FROM products LIMIT 5 OFFSET 5;
```
`LIMIT 5 OFFSET 5` instructs supported DBMSs to return five rows starting from row 5. The first number is the number of rows to retrieve, and the second is where to start. 

*Caution: The first row retrieved is row 0, not row 1. As such, `LIMIT 1 OFFSET 1` will retrieve the second row, not the first one.*

MySQL supports a shorthand version of `LIMIT 4 OFFSET 3`, enabling you to combine them as `LIMIT 3,4`. Using this syntax, the value before the `,` is the `OFFSET` and the value after the `,` is the `LIMIT` (yes, they are reversed, so be careful).

## Comments
Comments can be done either with two hyphens (`--`) or a hashtag (`#`).
```sql
# This is a comment
SELECT prod_name
FROM products; -- this is another comment
```

Block comments follow the C++ format of `/*` and `*/` for block comments.
```sql
/* SELECT prod_name, 
vend_id FROM Products; */
SELECT prod_name
FROM Products;
```