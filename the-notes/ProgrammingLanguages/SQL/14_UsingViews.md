---
title: '***SQL***: Using Views'
author: "Cole Ellis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$$set(echo = TRUE)
```

## Understanding Views
Views are virtual tables.  Unlike tables that contain data, views simply contain queries that dynamically retrieve data when used.

Recall the following `SELECT` statement to retrieve data from three tables:
```sql
SELECT cust_name, cust_contact
FROM Customers, Orders, OrderItems WHERE Customers.cust_id = Orders.cust_id
                                   AND OrderItems.order_num = Orders.order_num
                                   AND prod_id = 'RGAN01';
```

This query was used to retrieve the customers who had ordered a specific product.  Anyone needing this data would have to understand the table structure as well as how to how to create the query and join the tables.  To retrieve the same data for another product, you would have to modify the last `WHERE` clause.

Imagine that the entire query could be wrapped into a virtual table called `ProductCustomers`.  Then, the same data could be retrieved as:
```sql
SELECT cust_name, cust_contact
FROM ProductCustomers WHERE prod_id = 'RGAN01';
```

This is where views come into play. *ProductCustomers* is a view, and as a view, it does not contain any columns or data.  Instead, it contains a query - the same query used above to join tables properly.

## Why Use Views
Here are some other common uses of views:

- To reuse SQL statements.
- To simplify complex SQL operations.  After the query is written, it can be reused easily, without having to know the details of the underlying query itself.
- To expose parts of a table instead of complete tables.
- To secure data.  Users can be given access to specific subsets of tables instead of to entire tables.
- To change data formatting and representation.  Views can return data formatted and presented differently from their underlying tables.

For the most part, after views are created, they can be used in the same way as tables.  You can perform `SELECT` operations, filter and sort data, join views to other views or tables, and possibl even add and update data.

The most important thing to remember is views are just that - views into data stored elsewhere.  Views contain no data themselves, so the data they return is retrieved from other tables.  When data is added or changed in those tables, the views will return that changed data.

***Caution**: Because views contain no data, any retrieval needed to execute a query must be processed every time the view is used. If you create complex views with multiple joins and filters, or if you nest views, you may find that performance is dramatically degraded. Be sure you test execution before deploying applications that use views extensively.*

## View Rules and Restrictions
Before you create views yourself, you should be aware of some restrictions. Unfortunately, the restrictions tend to be very DBMS specific, so check your own DBMS documentation before proceeding.
Here are some of the most common rules and restrictions governing view creation and usage:

- Like tables, views must be uniquely named. (They cannot be named with the name of any other table or view.)
- There is no limit to the number of views that can be created.
- To create views, you must have security access. This level of access is usually granted by the database administrator.
- Views can be nested; that is, a view may be built using a query that retrieves data from another view. The exact number of nested levels allowed varies from DBMS to DBMS. (Nesting views may seriously degrade query performance, so test this thoroughly before using it in production environments.)
- Many DBMSs prohibit the use of the `ORDER BY` clause in view queries.
- Some DBMSs require that every column returned be named; this will require the use of aliases if columns are calculated fields. 
- Views cannot be indexed, nor can they have triggers or default values associated with them.
- Some DBMSs, like SQLite, treat views as read-only queries, meaning you can retrieve data from views but not write data back to the underlying tables. Refer to your DBMS documentation for details.
- Some DBMSs allow you to create views that do not allow rows to be inserted or updated if that insertion or update will cause that row to no longer be part of the view. For example, if you have a view that retrieves only customers with email addresses, updating a customer to remove his email address would make that customer fall out of the view. This is the default behavior and is allowed, but depending on your DBMS, you might be able to prevent this from occurring.

## Creating Views
So now that you know what views are, let's look at view creation.  Views are created using the `CREATE VIEW` statement.  Like `CREATE TABLE`, `CREATE VIEW` can only be used to create a view that does not exist.

One of the most common uses of views is to hide complex SQL, and this often involves joins.
```sql
CREATE VIEW Product Customers AS
SELECT cust_name, cust_contact, prod_id
FROM Customers, Orders, OrderItems WHERE Customers.cust_id = Orders.cust_id
                                   AND OrderItems.order_num = Orders.order_num
```

This statement creates a view named *ProductCustomers*, which joins three tables to return a list of all customers who have ordered any product. If you were to use `SELECT * FROM ProductCustomers`, you’d list every customer who ordered anything.
   
To retrieve a list of customers who ordered product `RGAN01`, you can do the following:
```sql
SELECT cust_name, cust_contact
FROM ProductCustomers WHERE prod_id = 'RGAN01';
```

This statement retrieves specific data from the view by issuing a `WHERE` clause. When the DBMS processes the request, it adds the specified `WHERE` clause to any existing `WHERE` clauses in the view query so that the data is filtered correctly.

As you can see, views can greatly simplify the use of complex SQL statements. Using views, you can write the underlying SQL once and then reuse it as needed.

Another common use of views is for reformatting retrieved data.  The following (SQLSever) `SELECT` statement returns vendor name and location in a single combined calculated column:
```sql
SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')' AS vend_title
FROM Vendors
ORDER BY vend_name
```

Rather than performing this concatenation each time it's needed, create a view and use that instead.
```sql
CREATE VIEW VendorLocations AS
SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')' AS vend_title
FROM Vendors;
```
This statement creates a view using the exact same query as the previous `SELECT` statement. To retrieve the data to create all mailing labels:
```sql
SELECT * FROM VendorLocations;
```

## Using Views to Filter Unwanted Data
Views are also useful for applying common `WHERE` clauses.  For example, define a *CustomerEmailList* view so that it filters out customers without email addresses.
```sql
CREATE VIEW CustomerEmailList AS
SELECT cust_id, cust_name, cust_email
FROM Customers WHERE cust_email IS NOT NULL;
```

Obviously, when sending email to a mailing list, you’d want to ignore users who have no email address. The `WHERE` clause here filters out those rows that have `NULL` values in the `cust_email` columns so that they’ll not be retrieved.

## Using Views with Calculated Fields
Views are exceptionally useful for simplifying the use of calculated fields.  Recall the `SELECT` statement to calculate the expanded price for each item:
```sql
SELECT prod_id, quantity, item_price, quantity*item_price AS expanded_price
FROM OrderItems WHERE order_num = 20008;
```

To turn this into a view:
```sql
CREATE VIEW OrderItemsExpanded AS
SELECT prod_id, quantity, item_price, quantity*item_price AS expanded_price
FROM OrderItems;
```

To retrieve the details for order `20008`:
```sql
SELECT *
FROM OrderItemsExpanded
WHERE order_num = 20008;
```