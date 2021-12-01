# ***SQL***: Summarizing Data
It is often necessary to summarize data without actually retrieving it all, and SQL provides special functions for this purpose. Using these functions, SQL queries are often used to retrieve data for analysis and reporting purposes. Examples of this type of retrieval are
- Determining the number of rows in a table (or the number of rows that meet some condition or contain a specific value)
- Obtaining the sum of a set of rows in a table
- Finding the highest, lowest, and average values in a table column (either for all rows or for specific rows)

In each of these examples, you want a summary of the data in a table, not the actual data itself. Therefore, returning the actual table data would be a waste of time and processing resources (not to mention bandwidth). To repeat, all you really want is the summary information.

Here are SQL's five aggregate functions:

| Function | Description |
|----------|-------------|
| `AVG()` | Returns Column's Average Value |
| `COUNT()` | Returns Number of Elements in Column |
| `MAX()` | Returns Columns Highest Value |
| `MIN()` | Returns Columns Lowest Value |
| `SUM()` | Returns Sum of Column |

## The `AVG()` Function
`AVG()` is used to return the average value of a specific column by counting both the number of rows in the table and the sum of their values. `AVG()` can be used to return the average value of all columns or of specific columns or rows.
```sql
SELECT AVG(prod_price) AS avg_price
FROM products;
```
`AVG()` can also be used to determine the average value of specific columns or rows using the `WHERE` clause. 
```sql
SELECT AVG(prod_price) AS avg_price
FROM products WHERE vend_id = 'DLL01';
```
*Caution: `AVG()` may only be used to determine the average of a specific numeric column, and that column name must be specified as the function parameter. To obtain the average value of multiple columns, you must use multiple `AVG()` functions. The exception to this is when returning a single value that is calculated from multiple columns, as will be explained later in this lesson.*

## The `COUNT()` Function
`COUNT()` does just that—it counts. Using `COUNT()`, you can determine the number of
rows in a table or the number of rows that match a specific criterion. `COUNT()` can be used two ways:
- Use `COUNT(*)` to count the number of rows in a table, whether columns contain values or NULL values.
- Use `COUNT(column)` to count the number of rows that have values in a specific column, ignoring NULL values.

The below statement returns the total number of customers in the *Customers* table:
```sql
SELECT COUNT(*) AS num_cust
FROM Customers;
```

The below statement counts the number of users with a registered email address:
```sql
SELECT COUNT(cust_email) AS num_cust
FROM Customers;
```

Column rows with NULL values in them are ignored by the `COUNT()` function if a column name is specified, but not if the asterisk (`*`) is used.

## The `MAX()` Function
`MAX()` returns the highest value in a specified column. `MAX()` requires that the
column name be specified.
```sql
SELECT MAX(prod_price) AS max_price
FROM products;
```
Although `MAX()` is usually used to find the highest numeric or date values, many (but not all) DBMSs allow it to be used to return the highest value in any columns including textual columns. When used with textual data, `MAX()` returns the row that would be the last if the data were sorted by that column.

## The `MIN()` Function
`MIN()` does the exact opposite of `MAX()` — it returns the lowest value in a specified column. Like `MAX()`, `MIN()` requires that the column name be specified.
```sql
SELECT MIN(prod_price) AS min_price
FROM products;
```
Although `MIN()` is usually used to find the lowest numeric or date values, many (but not all) DBMSs allow it to be used to return the lowest value in any columns including textual columns. When used with textual data, `MIN()` will return the row that would be first if the data were sorted by that column.

## The `SUM()` Function
`SUM()` is used to return the sum (total) of the values in a specific column.
Here is an example to demonstrate this. The *OrderItems* table contains the actual items in an order, and each item has an associated quantity. The total number of items ordered (the sum of all the quantity values) can be retrieved as follows:
```sql
SELECT SUM(quantity) AS items_ordered
FROM OrderItems WHERE order_num = 20005;
```
`SUM()` can also be used to total calculated values. In this next example the total
order amount is retrieved by totaling `item_price*quantity` for each item.
```sql
SELECT SUM(item_price*quantity) AS total_price
FROM OrderItems WHERE order_num = 20005;
```

## Aggregates on Distinct Values
The five aggregate functions can all be used in two ways:
- To perform calculations on all rows, specify the `ALL` argument or specify no argument at all (because `ALL` is the default behavior).
- To include only unique values, specify the `DISTINCT` argument.

```sql
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM products WHERE vend_id = 'DLL01';
```
*Caution: `DISTINCT` may only be used with `COUNT()` if a column name is specified. `DISTINCT` may not be used with `COUNT(*)`. Similarly, `DISTINCT` must be used with a column name and not with a calculation or expression.*

`SELECT` statements can contain as few or as many aggregate functions as needed.
```sql
SELECT COUNT(*) AS num_items,
       MIN(prod_price) AS price_min,
       MAX(prod_price) AS price_max,
       AVG(prod_price) AS price_avg
FROM Products;
```
Here a single `SELECT` statement performs four aggregate calculations in one step and returns four values (the number of items in the Products table and the highest, lowest, and average product prices).

*When specifying alias names to contain the results of an aggregate function, try to not use the name of an actual column in the table. Although there is nothing actually illegal about doing so, many SQL implementations do not support this and will generate obscure error messages if you do so.*

## Data Grouping
All the calculations thus far were performed on all the data in a table or on data that matched a specific `WHERE` clause. The following statement returns the number of products offered by vendor DLL01:
```sql
SELECT COUNT(*) AS num_prods
FROM products WHERE vend_id = 'DDL01';
```
But what if you wanted to return the number of products offered by each vendor? Or products offered by vendors who offer a single product, or only those who offer more than 10 products? This is where groups come into play. Grouping lets you divide data into logical
sets so that you can perform aggregate calculations on each group.

## Creating Groups
Groups are created using the `GROUP BY` clause in your `SELECT` statement.
```sql
SELECT vend_id, COUNT(*) AS num_prods FROM products GROUP BY vend_id;
```
Output:
```blank
vend_id num_prods
------- ---------
BRS01   3
DLL01   4
FNG01   2
```
The above `SELECT` statement specifies two columns, `vend_id`, which contains the ID of a product’s vendor, and `num_prods`, which is a calculated field (created using the `COUNT(*)` function). The `GROUP BY` clause instructs the DBMS to sort the data and group it by `vend_id`. This causes `num_prods` to be calculated once per vend_id rather than once for the entire table. As you can see in the output, vendor BRS01 has 3 products listed, vendor DLL01 has 4 products listed, and vendor FNG01 has 2 products listed.

Because you used `GROUP BY`, you did not have to specify each group to be evaluated and calculated. That was done automatically. The `GROUP BY` clause instructs the DBMS to group the data and then perform the aggregate on each group rather than on the entire result set.
     
Before you use `GROUP BY`, here are some important rules about its use that you need to know:
`GROUP BY` clauses can contain as many columns as you want. This enables you to nest groups, providing you with more granular control over how data is grouped.
- If you have nested groups in your `GROUP BY` clause, data is summarized at the last specified group. In other words, all the columns specified are evaluated together when grouping is established (so you won’t get data back for each individual column level).
- Every column listed in `GROUP BY` must be a retrieved column or a valid expression (but not an aggregate function). If an expression is used in the `SELECT`, that same expression must be specified in `GROUP BY`. Aliases cannot be used.
- Most SQL implementations do not allow `GROUP BY` columns with variable- length datatypes (such as text or memo fields).
- Aside from the aggregate calculation statements, every column in your `SELECT` statement must be present in the `GROUP BY` clause.
- If the grouping column contains a row with a NULL value, NULL will be returned as a group. If there are multiple rows with NULL values, they’ll all be grouped together.
- The `GROUP BY` clause must come after any `WHERE` clause and before any `ORDER BY` clause.

## Filtering Groups
In addition to being able to group data using `GROUP BY`, SQL also allows you to filter which groups to include and which to exclude. For example, you might want a list of all customers who have made at least two orders. To obtain this data, you must filter based on the complete group, not on individual rows.

`WHERE` does not work here because `WHERE` filters specific rows, not groups. As a matter of fact, `WHERE` has no idea what a group is.  So what do you use instead of `WHERE`? SQL provides yet another clause for this purpose: the `HAVING` clause. `HAVING` is very similar to `WHERE`. In fact, all types of `WHERE` clauses you’ve learned about thus far can also be used with `HAVING`. The only difference is that `WHERE` filters rows and `HAVING` filters groups.
```sql
SELECT cust_id, COUNT(*) AS orders
FROM Orders
GROUP BY cust_id HAVING COUNT(*) >= 2;
```
The first three lines of this `SELECT` statement are similar to the statements seen above. The final line adds a `HAVING` clause that filters on those groups with a `COUNT(*) >= 2` — two or more orders.

So is there ever a need to use both `WHERE` and `HAVING` clauses in one statement? Actually, yes, there is. Suppose you want to further filter the above statement so that it returns any customers who placed two or more orders in the past 12 months. To do that, you can add a `WHERE` clause that filters out just the orders placed in the past 12 months. You then add a `HAVING` clause to filter just the groups with two or more rows in them.
```sql
SELECT vend_id, COUNT(*) AS num_prods
FROM Products WHERE prod_price >= 4
GROUP BY vend_id HAVING COUNT(*) >= 2;
```
This statement warrants an explanation. The first line is a basic `SELECT` using an aggregate function—much like the examples thus far. The `WHERE` clause filters all rows with a `prod_price` of at least 4. Data is then grouped by `vend_id`, and then a `HAVING` clause filters just those groups with a count of 2 or more. Without the `WHERE` clause, an extra row would have been retrieved (vendor DLL01 who sells four products all priced under 4).

## Grouping and Sorting
It is important to understand that `GROUP BY` and `ORDER BY` are very different, even though they often accomplish the same thing. Table 10.1 summarizes the differences between them.

| `GROUP BY` | `ORDER BY` |
|------------|------------|
| Sorts generated output | Groups Rows |
| Any columns can be used | Only selected columns or expressions columns may be used |
| Never required | Required if using columns with aggregate functions |

To demonstrate the use of both `GROUP BY` and `ORDER BY`, let’s look at an example. The following `SELECT` statement is similar to the ones seen previously. It retrieves the order number and number of items ordered for all orders containing three or more items:
```sql
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num HAVING COUNT(*) >= 3;
```
To sort the output by number of items ordered, all you need to do is add an `ORDER BY` clause, as follows:
```sql
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num HAVING COUNT(*) >= 3
ORDER BY items, order_num;
```

## `SELECT` Clause Ordering
Below are the discussed clauses thus far and the order they belong:

| Clause | Definition | Required? |
|--------|------------|-----------|
| `SELECT` | Columns to be returned | Yes |
| `FROM` | Table to retrieve from | Only if retrieving from Table |
| `WHERE` | Row-level filtering | No |
| `GROUP BY` | Group Specification | Only if calculating aggregates group |
| `HAVING` | Group-level filtering | No |
| `ORDER BY` | Output sort order | No |
