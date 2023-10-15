---
title: '***SQL***: Subqueries'
author: "Cole Ellis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

`SELECT` statements are SQL queries. All the `SELECT` statements we have seen thus far are simple queries—single statements retrieving data from individual database tables.  SQL also enables you to create subqueries—queries that are embedded into other queries. Why would you want to do this? The best way to understand this concept is to look at a couple of examples.

## Filtering by Subquery
The database tables used in all the notes are relational tables.  Orders are stored in two tables. The *Orders* table stores a single row for each order containing order number, customer ID, and order date. The individual order items are stored in the related *OrderItems* table. The *Orders* table does not store customer information. It only stores a customer ID. The actual customer information is stored in the *Customers* table.

Now suppose you wanted a list of all the customers who ordered item RGAN01. What would you have to do to retrieve this information? Here are the steps:

1. Retrieve the order numbers of all orders containing item RGAN01.
2. Retrieve the customer ID of all the customers who have orders listed in the order numbers returned in the previous step.
3. Retrieve the customer information for all the customer IDs returned in the previous step.

Let's do these one at a time.
```sql
-- STEP 1 --
SELECT order_num
FROM OrderItems WHERE prod_id = 'RGAN01'; # Outputs 20007, 20008

-- STEP 2 --
SELECT cust_id
FROM Orders WHERE order_num IN (20007, 20008); # Outputs 1000000004, 1000000005

-- STEP 3 --
SELECT cust_name, cust_contact
FROM Customers WHERE cust_id IN (1000000004,  1000000005);
```

Rather than having to consider the outputs of each of these before we can move on to the next step, we can use subqueries to do this all at once.
```sql
SELECT cust_name, cust_contact
FROM Customers WHERE cust_id IN (
	SELECT cust_id
	FROM Orders WHERE order_num IN (
		SELECT order_num
		FROM OrderItems WHERE prod_id = 'RGAN01'
		)
	);
												                  
```
Output:
```blank
cust_name                     cust_contact
----------------------------- --------------------
Fun4All                       Denise L. Stephens 
The Toy Store                 Kim Howard
```
To execute the above `SELECT` statement, the DBMS had to actually perform three `SELECT` statements. The innermost subquery returned a list of order numbers that were then used as the `WHERE` clause for the subquery above it. That subquery returned a list of customer IDs that were used as the WHERE clause for the top-level query. The top-level query actually returned the desired data.

As you can see, using subqueries in a `WHERE` clause enables you to write extremely powerful and flexible SQL statements. There is no limit imposed on the number of subqueries that can be nested, although in practice you will find that performance will tell you when you are nesting too deeply.

## Using Subqueries as Calculated Fields
Another way to use subqueries is in creating calculated fields. Suppose you wanted to display the total number of orders placed by every customer in your *Customers* table. Orders are stored in the *Orders* table along with the appropriate customer ID.
To perform this operation, follow these steps:

1. Retrieve the list of customers from the *Customers* table.
2. For each customer retrieved, count the number of associated orders in the Orders table.

As you learned in the previous two lessons, you can use `SELECT COUNT(*)` to count rows in a table, and by providing a `WHERE` clause to filter a specific customer ID, you can count just that customer’s orders.
```sql
SELECT COUNT(*) AS orders
FROM Orders WHERE cust_id = 1000000001;
```

To do that for each customer, use a subquery:
```sql
SELECT cust_name, cust_state, (
	SELECT COUNT(*)
	FROM Orders WHERE Orders.cust_id = Customers.cust_id
) AS orders
FROM Customers
ORDER BY cust_name;
```
Output:
```blank
cust_name.                cust_state orders
------------------------- ---------- ------
Fun4All                   IN         1
Fun4All                   AZ         1
Kids Place                OH         0
The Toy Store             IL         1
Village Toys              MI         2
```
This `SELECT` statement returns three columns for every customer in the Customers table: `cust_name`, `cust_state`, and `orders`. *Orders* is a calculated field that is set by a subquery that is provided in parentheses. That subquery is executed once for every customer retrieved. In the example above, the subquery is executed five times because five customers were retrieved.

The `WHERE` clause in the subquery is a little different from the WHERE clauses used previously because it uses fully qualified column names; instead of just a column
name (`cust_id`), it specifies the table and the column name (as `Orders.cust_id` and `Customers.cust_id`). 

***Caution**: You just saw a very important reason to use fully qualified column names. Without the extra specificity, the wrong results were returned because the DBMS misunderstood what you intended. Sometimes the ambiguity caused by the presence of conflicting column names will actually cause the DBMS to throw an error. For example, this might occur if your `WHERE` or `ORDER BY` clause specified a column name that was present in multiple tables. A good rule is that if you are ever working with more than one table in a `SELECT` statement, then use fully qualified column names to avoid any and all ambiguity.*