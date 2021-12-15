# ***SQL***: Joining Tables
One of SQL’s most powerful features is the capability to join tables on-the-fly within data retrieval queries. Joins are one of the most important operations that you can perform using SQL `SELECT`, and a good understanding of joins and join syntax is an extremely important part of learning SQL.

Before you can effectively use joins, you must understand relational tables and the basics of relational database design. What follows is by no means complete coverage of the subject, but it should be enough to get you up and running.

The best way to understand relational tables is to look at a real-world example, one based on the data you’ve used in the lessons thus far.

Suppose you had a database table containing a product list, with each product in its own row. The kind of information you would store with each product would include a description and price, along with vendor information about the company that creates the product. Now suppose that you had multiple products created by the same vendor. Where would you store the vendor information (things like vendor name, address, and contact information)? You wouldn’t want to store that data along with the products for several reasons:
- Because the vendor information is the same for each product that vendor produces, repeating the information for each product is a waste of time and storage space.
- If vendor information changes (for example, if the vendor moves or the contact info changes), you would need to update every occurrence of the vendor information.
- When data is repeated (that is, the vendor information is used with each product), there is a high likelihood that the data will not be entered identically each time. Inconsistent data is extremely difficult to use in reporting.

The key here is that having multiple occurrences of the same data is never a good thing, and that principle is the basis for relational database design. Relational tables are designed so that information is split into multiple tables, one for each data type. The tables are related to each other through common values (and thus the *relational* in relational design).

In our example, you can create two tables—one for vendor information and one for product information. The *Vendors* table contains all the vendor information, one table row per vendor, along with a unique identifier for each vendor. This value, called a primary key, can be a vendor ID or any other unique value. The *Products* table stores only product information and no vendor-specific information other than the vendor ID (the *Vendors* table’s primary key). This key relates the *Vendors* table to the *Products* table, and using this vendor ID enables you to use the Vendors table to find the details about the appropriate vendor.

What does this do for you? Well, consider the following:
- Vendor information is never repeated, and so time and space are not wasted.
- If vendor information changes, you can update a single record, the one in the *Vendors* table. Data in related tables does not change.
- Because no data is repeated, the data used is obviously consistent, making data reporting and manipulation much simpler.

The bottom line is that relational data can be stored efficiently and manipulated easily. Because of this, relational databases scale far better than nonrelational databases. Breaking data into multiple tables enables more efficient storage, easier manipulation, and greater scalability. But these benefits come with a price.  If data is stored in multiple tables, how can you retrieve that data with a single `SELECT` statement?

The answer is to use a **join**. Simply put, a join is a mechanism used to associate, or join, tables within a `SELECT` statement (and thus the name join). By using a special syntax, you can join multiple tables so that a single set of output is returned, and the join associates the correct rows in each table on the fly.

## Creating a Join
Creating a join is very simple. You must specify all the tables to be included and how they are related to each other.
```sql
SELECT vend_name, prod_name, prod_price
FROM vendors, products WHERE vendors.vend_id = products.vend_id;
```
Output:
```blank
vend_name            prod_name            prod_price
-------------------- -------------------- ----------
Doll House Inc.      Fish bean bag toy    3.4900
Doll House Inc.      Bird bean bag toy    3.4900
Doll House Inc.      Rabbit bean bag toy  3.4900
Bears R Us           8 inch teddy bear    5.9900
Bears R Us           12 inch teddy bear   8.9900
Bears R Us           18 inch teddy bear   11.9900
Doll House Inc.      Raggedy Ann          4.9900
Fun and Games        King doll            9.4900
Fun and Games        Queen doll           9.4900
```
Let’s take a look at the preceding code. The `SELECT` statement starts in the same way as all the statements you’ve looked at thus far, by specifying the columns to be retrieved. The big difference here is that two of the specified columns (`prod_name` and `prod_price`) are in one table, whereas the other (`vend_name`) is in another table.
Now look at the `FROM` clause. Unlike all the prior `SELECT` statements, this one has two tables listed in the `FROM` clause, Vendors and Products. These are the names of the two tables that are being joined in this SELECT statement. The tables are correctly joined with a `WHERE` clause that instructs the DBMS to match `vend_id` in the *Vendors* table with `vend_id` in the *Products* table.

## Importance of the `WHERE` Clause
It might seem strange to use a `WHERE` clause to set the join relationship, but actually, there is a very good reason for this. Remember, when tables are joined in a `SELECT` statement, that relationship is constructed on the fly. There is nothing in the database table definitions that can instruct the DBMS how to join the tables. You have to do that yourself. When you join two tables, what you are actually doing is pairing every row in the first table with every row in the second table. The `WHERE` clause acts as a filter to only include rows that match the specified filter condition—the join condition, in this case. Without the `WHERE` clause, every row in the first table will be paired with every row in the second table, regardless of whether they logically go together or not.
```sql
SELECT vend_name, prod_name, prod_price
FROM vendors, products;
```
Output (*Cartesian Product*):
```blank
vend_name            prod_name            prod_price
-------------------- -------------------- ----------
Bears R Us           Fish bean bag toy    3.4900
Bears R Us           Bird bean bag toy    3.4900
Bears R Us           Rabbit bean bag toy  3.4900
Bears R Us           8 inch teddy bear    5.9900
Bears R Us           12 inch teddy bear   8.9900
Bears R Us           18 inch teddy bear   11.9900
Bears R Us           Raggedy Ann          4.9900
Bears R Us           King doll            9.4900
Bears R Us           Queen doll           9.4900
Bear Emporium        Fish bean bag toy    3.4900
Bear Emporium        Bird bean bag toy    3.4900
Bear Emporium        Rabbit bean bag toy  3.4900
.                    .                    .
.                    .                    .
.                    .                    .
Jouets et ours       Rabbit bean bag toy  3.4900
```

## Inner Joins
The join you have been using so far is called an *equijoin* — a join based on the testing of equality between two tables. This kind of join is also called an *inner join*. In fact, you may use a slightly different syntax for these joins, specifying the type of join explicitly. 
```sql
SELECT vend_name, prod_name, prod_price
FROM vendors INNER JOIN products ON vendors.vend_id = products.prod_id;
```
The `SELECT` in the statement is the same as the preceding `SELECT` statement, but the `FROM` clause is different. Here the relationship between the two tables is part of the `FROM` clause specified as `INNER JOIN`. In this syntax, the join condition is specified using the special `ON` clause instead of a `WHERE` clause. The actual condition passed to `ON` is the same as would be passed to `WHERE`.

## Joining Multiple Tables
SQL imposes no limit to the number of tables that may be joined in a `SELECT` statement. The basic rules for creating the join remain the same. First, list all the tables, and then define the relationship between each.
```sql
SELECT prod_name, vend_name, prod_price, quantity 
FROM OrderItems, products, vendors WHERE Products.vend_id = Vendors.vend_id
				   AND OrderItems.prod_id = Products.prod_id
				   AND order_num = 20007;
```

Remember this code?
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
Here is this code using table joining:
```sql
SELECT cust_name, cust_contact
FROM Customers, Orders, OrderItems WHERE Customers.cust_id = Orders.cust_id
				   AND OrderItems.order_num = Orders.order_num
				   AND prod_id = 'RGAN01';
```

## Using Table Alises
Recall the use of aliases to name created tables:
```sql
SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')' AS vend_title
FROM Vendors
ORDER BY vend_name;
```
In addition to using aliases for column names and calculated fields, SQL also enables you to alias table names. There are two primary reasons to do this:
- To shorten the SQL syntax
- To enable multiple uses of the same table within a single `SELECT` statement

Take a look at the following `SELECT` statement. It is basically the same statement
as an example used before, but it has been modified to use aliases:
```sql
SELECT cust_name, cust_contact
FROM Customers AS C, Orders AS O, OrderItems AS OI  WHERE C.cust_id = O.cust_id
						    AND OI.order_num = O.order_num
		    			    	    AND prod_id = 'RGAN01';
```
You’ll notice that the three tables in the `FROM` clauses all have aliases. Customers AS *C* establishes *C* as an alias for *Customers*, and so on. This approach enables you to use the abbreviated *C* instead of the full text *Customers*. In this example, the table aliases were used only in the `WHERE` clause, but aliases are not limited to just `WHERE`. You can use aliases in the `SELECT` list, the `ORDER BY` clause, and in any other part of the statement as well.

## Self Joins
As mentioned earlier, one of the primary reasons to use table aliases is to be able to refer to the same table more than once in a single `SELECT` statement. An example
will demonstrate this.

Suppose you wanted to send a mailing to all the customer contacts who work for the same company for which Jim Jones works. This query requires that you first find out which company Jim Jones works for and next which customers work for that company. The following is one way to approach this problem:
```sql
SELECT cust_id, cust_name, cust_contact
FROM Customers WHERE cust_name = (
	SELECT cust_name
	FROM Customers WHERE cust_contact = 'Jim Jones'
);
```
This first solution uses subqueries. The inner `SELECT` statement does a simple retrieval to return the `cust_name` of the company that Jim Jones works for. That name is the one used in the `WHERE` clause of the outer query so that all employees who work for that company are retrieved. Now, use a join:
```sql
SELECT c1.cust_id, c1.cust_name, c1.cust_contact
FROM Customers AS c1, Customers AS c2 WHERE c1.cust_name = c2.cust_name
				      AND c2.cust_contact = 'Jim Jones';
```
The two tables needed in this query are actually the same table, and so the *Customers* table appears in the `FROM` clause twice. Although this is perfectly legal, any references to table *Customers* would be ambiguous because the DBMS does not know which *Customers* table you are referring to.
To resolve this problem, table aliases are used. The first occurrence of *Customers* has an alias of `C1`, and the second has an alias of `C2`. Now those aliases can be used as table names. The `SELECT` statement, for example, uses the `C1` prefix to explicitly state the full name of the desired columns. If it did not, the DBMS would return an error because there are two of each column named `cust_id`, `cust_name`, and `cust_contact`. It cannot know which one you want. (Even though they are the same.) The `WHERE` clause first joins the tables and then filters the data by `cust_contact` in the second table to return only the wanted data.


## Natural Joins
Whenever tables are joined, at least one column will appear in more than one table (the columns being used to create the join). Standard joins (the inner joins that you learned about in the last lesson) return all data, even multiple occurrences of the same column. A natural join simply eliminates those multiple occurrences so that only one of each column is returned.

How does it do this? The answer is it doesn’t — you do it. A natural join is a join in which you select only columns that are unique. This is typically done using a wildcard (`SELECT *`) for one table and explicit subsets of the columns for all other tables. The following is an example:
```sql
SELECT C.*, O.order_num, O.order_date, O.prod_id, OI.quantity, OI.item_price
FROM Customers as C, Orders as O, OrderItems as OI WHERE C.cust_id = O.cust_id
						   AND O.order_num = OI.order_num
						   AND prod_id = 'RGAN01';
```
In this example, a wildcard is used for the first table only. All other columns are
explicitly listed so that no duplicate columns are retrieved.

## Outer Joins
Most joins relate rows in one table with rows in another. But occasionally, you want to include rows that have no related rows. For example, you might use joins to accomplish the following tasks:
- Count how many orders were placed by each customer, including customers that have yet to place an order.
- List all products with order quantities, including products not ordered by anyone.
- Calculate average sale sizes, taking into account customers that have not yet placed an order.

In each of these examples, the join includes table rows that have no associated rows in the related table. This type of join is called an *outer join*.

Recall the following `INNER JOIN` functionality, to retrieve a list of all customers and their orders.
```sql
SELECT Customers.cust_id , Orders.order_num
FROM Customers INNER JOIN Orders ON Customers.cust_id = Orders.cust_id;
```

The `OUTER JOIN` functionality is really similar.  To get a list of all customers, including those that haven't placed an order yet, use `LEFT OUTER JOIN`:
```sql
SELECT Customers.cust_id, Orders.order_num
FROM Customers LEFT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;
```

To get all the order numbers, use `RIGHT OUTER JOIN`:
```sql
SELECT Customers.cust_id, Orders.order_num
FROM Customers RIGHT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;
```

There is one other variant of the outer join, one that tends to be rarely used. The `FULL OUTER JOIN` retrieves all rows from both tables and relates those that can be related. Unlike a left outer join or right outer join, which includes unrelated rows from a single table, the `FULL OUTER JOIN` includes unrelated rows from both tables.
```sql
SELECT Customers.cust_id, Orders.order_num
FROM Customers FULL OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;
```
***Note**: Not applicable for MySQL or SQLite.*

## Using Joins with Aggregate Functions
Aggregate functions are used to summarize data. Although all the examples of aggregate functions thus far only summarized data from a single table, these functions can also be used with joins.
To demonstrate this, let’s look at an example. You want to retrieve a list of all customers and the number of orders that each has placed.
```sql
SELECT Customers.cust_id, COUNT(Orders.order_num) AS num_ord
FROM Customers INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;
```
This `SELECT` statement uses `INNER JOIN` to relate the *Customers* and *Orders* tables to each other. The `GROUP BY` clause groups the data by customer, and so the function call `COUNT(Orders.order_num)` counts the number of orders for each customer and returns it as `num_ord`.

These aggregate functions work just the same with the other types of join functions.

## Using Joins and Join Conditions
Be careful of the following:
- Pay careful attention to the type of join being used. More often than not, you’ll want an inner join, but there are often valid uses for outer joins too.
- Check your DBMS documentation for the exact join syntax it supports. (Most DBMSs use one of the forms of syntax described in these two lessons.)
- Make sure you use the correct join condition (regardless of the syntax being used), or you’ll return incorrect data.
- Make sure you always provide a join condition, or you’ll end up with the Cartesian product.
- You may include multiple tables in a join and even have different join types for each. Although this is legal and often useful, make sure you test each join separately before testing them together. This will make troubleshooting far simpler.