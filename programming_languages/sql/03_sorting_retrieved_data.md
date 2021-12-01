# ***SQL***: Sorting Retrieved Data
As you learned in the last lesson, the following SQL statement returns a single column from a database table. But look at the output. The data appears to be displayed in no particular order at all.
```sql
SELECT prod_name FROM products;
```
Output:
```
prod_name 
--------------------
Fish bean bag toy
Bird bean bag toy
Rabbit bean bag toy
8 inch teddy bear
12 inch teddy bear
18 inch teddy bear
Raggedy Ann
King doll
Queen doll
```
Actually, the retrieved data is not displayed in a mere random order. If unsorted, data will typically be displayed in the order in which it appears in the underlying tables. This could be the order in which the data was added to the tables initially. However, if data was subsequently updated or deleted, the order will be affected by how the DBMS reuses reclaimed storage space. The end result is that you cannot (and should not) rely on the sort order if you do not explicitly control it. Relational database design theory states that the sequence of retrieved data cannot be assumed to have significance if ordering was not explicitly specified.

## Sorting Data
To explicitly sort data retrieved using a `SELECT` statement, you use the `ORDER BY` clause. `ORDER BY` takes the name of one or more columns by which to sort the output.
```sql
SELECT prod_name FROM products ORDER BY prod_name;
```
Output:
```
prod_name
--------------------
12 inch teddy bear
18 inch teddy bear
8 inch teddy bear
Bird bean bag toy
Fish bean bag toy
King doll
Queen doll
Rabbit bean bag toy
Raggedy Ann
```
This statement is identical to the earlier statement, except it also specifies an ORDER BY clause instructing the DBMS software to sort the data by the prod_name column.

*Caution: When specifying an `ORDER BY` clause, be sure that it is the last clause in your `SELECT` statement. If it is not the last clause, an error will be generated.*

## Sorting by Multiple Columns
To sort by multiple columns, simply specify the column names separated by commas (just as you do when you are selecting multiple columns).
```sql
SELECT prod_id, prod_price, prod_name FROM products ORDER BY prod_price prod_name;
```
It is important to understand that when you are sorting by multiple columns, the sort sequence is exactly as specified. In other words, using the output in the example above, the products are sorted by the `prod_name` column only when multiple rows have the same `prod_price` value. If all the values in the `prod_price` column had been unique, no data would have been sorted by `prod_name`.

## Sorting by Column Position
In addition to being able to specify sort order using column names, `ORDER BY` also supports ordering specified by relative column position.
```sql
SELECT prod_id, prod_price, prod_name FROM products ORDER BY 2, 3;
```
As you can see, the output is identical to that of the query above. The difference here is in the `ORDER BY` clause. Instead of specifying column names, you specify the relative positions of selected columns in the `SELECT` list. `ORDER BY 2` means sort by the second column in the `SELECT` list, the `prod_price` column. `ORDER BY 2, 3` means sort by `prod_price` and then by `prod_name`.

## Specifying Sort Direction
Data sorting is not limited to ascending sort orders (from A to Z). Although this is the default sort order, the `ORDER BY` clause can also be used to sort in descending order (from Z to A). To sort by descending order, you must specify the keyword `DESC`.  `ASC` is used for ascending order, but since ascending is the default, it is not commonly used.
```sql
SELECT prod_id, prod_price, prod_name FROM products ORDER BY prod_price DESC;
```
But what if you were to sort by multiple columns? The following example sorts the products in descending order (most expensive first), plus product name:
```sql
SELECT prod_id, prod_price, prod_name FROM products ORDER BY prod_price DESC, prod_name;
```
The `DESC` keyword only applies to the column name that directly precedes it. In the example above, `DESC` was specified for the `prod_price` column, but not for the `prod_name` column. Therefore, the `prod_price` column is sorted in descending order, but the `prod_name` column (within each price) is still sorted in standard ascending order.