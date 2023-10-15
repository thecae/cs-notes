---
title: '***SQL***: Stored Procedures'
author: "Cole Ellis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$$set(echo = TRUE)
```

## Understanding Stored Procedures
Most of the SQL statements that we’ve used thus far are simple in that they use a single statement against one or more tables. Not all operations are that simple. Often, multiple statements will be needed to perform a complete operation. For example, consider the following scenario:

- To process an order, checks must be made to ensure that items are in stock.
- If items are in stock, they need to be reserved so that they are not sold to anyone else, and the available quantity must be reduced to reflect the correct amount in stock.
- Any items not in stock need to be ordered; this requires some interaction with the vendor.
- The customer needs to be notified as to which items are in stock (and can be shipped immediately) and which are backordered.

This is obviously not a complete example, and it is even beyond the scope of the example tables that we have been using in this book, but it will suffice to help make a point. Performing this process requires many SQL statements against many tables. In addition, the exact SQL statements that need to be performed and their order are not fixed; they can (and will) vary according to which items are in stock and which are not.

How would you write this code? You could write each of the SQL statements individually and execute other statements conditionally based on the result. You’d have to do this every time this processing was needed (and in every application that needed it).

You could create a stored procedure. Stored procedures are simply collections of one or more SQL statements saved for future use. You can think of them as batch files, although in truth they are more than that.

***Note**: SQLite does not support stored procedures*.

## Why to Use Stored Procedures
Now that you know what stored procedures are, why use them? There are lots of reasons, but here are the primary ones:

- To simplify complex operations (as seen in the previous example) by encapsulating processes into a single easy-to-use unit.
- To ensure data consistency by not requiring that a series of steps be created over and over. If all developers and applications use the same stored procedure, then the same code will be used by all.
- To prevent errors; this is an extension of the preceding reason. The more steps that need to be performed, the more likely it is that errors will be introduced. Preventing errors ensures data consistency.
- To simplify change management. If tables, column names, or business logic (or just about anything) changes, then only the stored procedure code needs to be updated, and no one else will even need to be aware that changes were made.
- To ensure security; this is an extension of the preceding reason. Restricting access to underlying data via stored procedures reduces the chance of data corruption (unintentional or otherwise).
- To do less work to process the command. Because stored procedures are usually stored in a compiled form, the DBMS has to do less work. This results in improved performance.
- To write code that is more powerful and flexible. There are SQL language elements and features that are available only within single requests. Stored procedures can use them for this reason.

In other words, there are three primary benefits: simplicity, security, and performance. Obviously, all are extremely important. Before you run off to turn all your SQL code into stored procedures, here’s the downside:

- Stored procedure syntax varies dramatically from one DBMS to the next. In fact, it is close to impossible to write truly portable stored procedures. Having said that, the stored procedure calls themselves (their names and how data is passed to them) can be kept relatively portable so that if you need to change to another DBMS, at least your client application code may not need changing.
- Stored procedures tend to be more complex to write than basic SQL statements, and writing them requires a greater degree of skill and experience. As a result, many database administrators restrict stored procedure creation rights as a security measure (primarily due to the previous bullet item).

Nonetheless, stored procedures are very useful and should be used. In fact, most DBMSs come with all sorts of stored procedures that are used for database and table management.

## Executing Stored Procedures
Stored procedures are executed far more often than they are written, so we'll start there.  The SQL statement to execute a stored procedure is simply `EXECUTE`.  `EXECUTE` takes the name of the stored procedure and any parameters that need to be passed to it.  Take a look at this example.
```sql
EXECUTE AddNewProduct('JTS01', 'Stuffed Eiffel Tower', 6.49, 'Plush stuffed toy with the text La Tour Eiffel in red white and blue');
```

Here a stored procedure named `AddNewProduct` is executed; it adds a new product to the *Products* table. `AddNewProduct` takes four parameters: the vendor ID (the primary key from the *Vendors* table), product name, price, and description. These four parameters match four expected variables within the stored procedure (defined as part of the stored procedure itself). The stored procedure adds a new row to the *Products* table and assigns these passed attributes to the appropriate columns.

In the *Products* table, you’ll notice that another column needs a value  — the `prod_id` column, which is the table’s primary key. Why was this value not passed as an attribute to the stored procedure? To ensure that IDs are generated properly, it is safer to have that process automated (and not rely on end users). That is why a stored procedure is used in this example. This is what this stored procedure does:

- It validates the passed data, ensuring that all four parameters have values.
- It generates a unique ID to be used as the primary key.
- It inserts the new product into the *Products* table, storing the generated primary key and passed data in the appropriate columns.

This is the basic form of stored procedure execution. Depending on the DBMS used, other execution options include the following:

- Optional parameters, with default values assumed if a parameter is not provided
- Out-of-order parameters, specified in `parameter = value` pairs
- Output parameters, allowing the stored procedure to update a parameter for
use in the executing application
- Data retrieved by a `SELECT` statement
- Return codes, enabling the stored procedure to return a value to the executing application

## Creating STored Procedures
Writing a stored procedure is not trivial.  To give an taste of what is involved, consider a simple example - a stored procedure that counts the number of customers in a mailing list who have email addresses.

Oracle version:
```sql
CREATE PROCEDURE MailingListCount (
  ListCount OUT INTEGER
)
IS v_rows INTEGER;
BEGIN
  SELECT COUNT(*) INTO v_rows
  FROM Customers WHERE NOT cust_email IS NULL;
  ListCount := v_rows;
END
```

This stored procedure takes a single parameter named `ListCount`. Instead of passing a value to the stored procedure, this parameter passes a value back from it. The keyword `OUT` is used to specify this behavior. Oracle supports parameters of types `IN` (those passed to stored procedures), `OUT` (those passed from stored procedures, as we’ve used here), and `INOUT` (those used to pass parameters to and from stored procedures). The stored procedure code itself is enclosed within `BEGIN` and `END` statements, and here a simple `SELECT` is performed to retrieve the customers with email addresses. Then `ListCount` (the output parameter passed) is set with the number of rows that were retrieved.

To invoke the Oracle example:
```sql
var ReturnValue NUMBER
EXEC MailingListCount(:ReturnValue);
SELECT ReturnValue;
```

This code declares a variable to hold whatever the stored procedure returns, executes the stored procedure, and then uses a `SELECT` to display the returned value.

SQLServer example:
```sql
CREATE PROCEDURE MailingListCount AS
DECLARE @cnt INTEGER
SELECT @cnt = COUNT(*)
FROM Customers
WHERE NOT cust_email IS NULL; RETURN @cnt;
```

Invoking the SQLServer example:
```sql
DECLARE @ReturnValue INT
EXECUTE @ReturnValue = MailingListCount;
SELECT @ReturnValue;
```

The following (SQLServer) example inserts a new order in the Orders table.
```sql
CREATE PROCEDURE NewOrder @cust_id CHAR(10) AS
-- Declare variable for order number DECLARE @order_num INTEGER
-- Get current highest order number
SELECT @order_num=MAX(order_num) FROM Orders
-- Determine next order number SELECT @order_num=@order_num+1 -- Insert new order
INSERT INTO Orders(order_num, order_date, cust_id) VALUES(@order_num, GETDATE(), @cust_id)
-- Return order number
RETURN @order_num;
```

This stored procedure creates a new order in the *Orders* table. It takes a single parameter - the ID of the customer placing the order. The other two table columns, the order number and order date, are generated automatically within the stored procedure itself. The code first declares a local variable to store the order number. Next, the current highest order number is retrieved (using a `MAX()` function) and incremented (using a `SELECT` statement). Then the order is inserted with an `INSERT` statement using the newly generated order number, the current system date (retrieved using the `GETDATE()` function), and the passed customer ID. Finally, the order number (which is needed to process order items) is returned as `RETURN @order_num`. Notice that the code is commented; this should always be done when writing stored procedures.

A different version of the same SQLServer code:
```sql
CREATE PROCEDURE NewOrder @cust_id CHAR(10) AS
-- Insert new order
INSERT INTO Orders(cust_id) VALUES(@cust_id)
-- Return order number
SELECT order_num = @@IDENTITY;
```

This stored procedure also creates a new order in the *Orders* table. This time the DBMS itself generates the order number. Most DBMSs support this type of functionality; SQLServer refers to these auto-incrementing columns as Identity fields (other DBMSs use names such as Auto Number or Sequences). Again, a single parameter is passed—the customer ID of the customer placing the order. The order number and order date are not specified at all; the DBMS uses a default value for the date (the `GETDATE()` function), and the order number is generated automatically. How can you find out what the generated ID is? SQLServer makes that available in the global variable `@@IDENTITY`, which is returned to the calling application (this time using a `SELECT` statement).

As you can see, with stored procedures there are often many different ways to accomplish the same task. The method you choose will often be dictated by the features of the DBMS you are using.