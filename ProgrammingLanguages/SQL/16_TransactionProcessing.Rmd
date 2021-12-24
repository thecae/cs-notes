---
title: '***SQL***: Transaction Processing'
author: "Cole Ellis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Understanding Transaction Processing
Transaction processing is used to maintain database integrity by ensuring that batches of SQL operations execute properly or not at all.

Recall that relational databases are designed so that data is stored in multiple tables to facilitate easier data manipulation, management, and reuse.  Without going into the hows and whys of relational database design, take it as a given that well-designed database schemas are relational to some degree.

The *Orders* tables used throughout are a good example of this.  Orders are stored in two tables: *Orders* stores actual orders, and *OrderItems* stores the individual items ordered.  These two tables are related to each other using unique IDs called primary keys.  These tables, in turn, are related to other tables containing customer and product information.

The process of adding an order to the system is as follows:

1. Check if the customer is already in the database.  If not, add him or her.
2. Retrieve the customer's ID.
3. Add a row to the *Orders* table associated it with the customer ID.
4. Retrieve the new order ID assigned in the *Orders*
5. Add one row to the *OrderItems* table for each item ordered, associating it with the *Orders* table by the retrieved ID.

Now imagine that some database failure (for example, out of disk space, security restrictions, table locks) prevents this entire sequence from completing. What would happen to your data?

Well, if the failure occurred after the customer was added and before the *Orders* table was added, there is no real problem. It is perfectly valid to have customers without orders. When you run the sequence again, the inserted customer record will be retrieved and used. You can effectively pick up where you left off.

But what if the failure occurred after the *Orders* row was added but before the *OrderItems* rows were added? Now you’d have an empty order sitting in your database.

Worse, what if the system failed during adding the *OrderItems* rows? Now you’d end up with a partial order in your database, but you wouldn’t know it.

How do you solve this problem? That’s where transaction processing comes in. ***Transaction processing*** is a mechanism used to manage sets of SQL operations that must be executed in batches so as to ensure that databases never contain the results of partial operations. With transaction processing, you can ensure that sets of operations are not aborted mid-processing—they either execute in their entirety or not at all (unless explicitly instructed otherwise). If no error occurs, the entire set of statements is committed (written) to the database tables. If an error does occur, then a rollback (undo) can occur to restore the database to a known and safe state.

So, if we look at the same example, this is how the process would work:

1. Check if the customer is already in the database; if not, add him or her.
2. Commit the customer information.
3. Retrieve the customer’s ID.
4. Add a row to the *Orders* table.
5. If a failure occurs while adding the row to *Orders*, roll back.
6. Retrieve the new order ID assigned in the *Orders* table.
7. Add one row to the *OrderItems* table for each item ordered.
8. If a failure occurs while adding rows to *OrderItems*, roll back all the *OrderItems* rows added and the Orders row.

When you’re working with transactions and transaction processing, a few keywords will keep reappearing. Here are the terms you need to know:

- ***Transaction***: A block of SQL statements
- ***Rollback***: The process of undoing specified SQL statements
- ***Commit***: Writing unsaved SQL statements to the database tables
- ***Savepoint***: A temporary placeholder in a transaction set to which you can issue a rollback (as opposed to rolling back an entire transaction)

## Controlling Transactions
The key to managing transactions involves breaking SQL statements into logical chunks and explicitly stating when data should be rolled back and when it should not.

Some DBMSs require that you explicitly mark the start and end of transaction blocks.  In SQLServer, for example:
```sql
BEGIN TRANSACTION
... -- replace with actual code
END TRANSACTION
```

In this example, any SQL between the `BEGIN TRANSACTION` and `COMMIT TRANSACTION` statements must be executed entirely or not at all.

In MySQL:
```sql
START TRANSACTION
... -- replace with actual code
```

In Oracle:
```sql
SET TRANSACTION
... -- replace with actual code
```

The SQL `ROLLBACK` command is used to roll back (undo) SQL statemnts, as seen in this next statement:
```sql
DELETE FROM Orders;
ROLLBACK;
```
In this example, a `DELETE` operation is performed and then undone using a `ROLLBACK` statement  Although not the most useful example, it does demonstrate that within a transaction block, `DELETE` operations (like `INSERT` and `UPDATE`) are never final.

Usually, SQL statements are executed and written directly to the database tables.  This is known as an ***implicit commit*** - the commit (write or save) operation happens automatically.

Within a transaction block, however, commits might not occur implicitly.  This too is DBMS specific.  Some DBMSs treat a transaction end as an implicit commit; others do not.

To force an explicit commit, use the `COMMIT` statement. The following is an SQLServer example:
```sql
BEGIN TRANSACTION
DELETE OrderItems WHERE order_num = 12345
DELETE Orders WHERE order_num = 12345
COMMIT TRANSACTION
```

In this SQL Server example, order number `12345` is deleted entirely from the system. Because this involves updating two database tables, *Orders* and *OrderItems*, a transaction block is used to ensure that the order is not partially deleted. The final `COMMIT` statement writes the change only if no error occurred. If the first `DELETE` worked, but the second failed, the `DELETE` would not be committed.

```sql
SET TRANSACTION
DELETE OrderItems WHERE order_num = 12345;
DELETE Orders WHERE order_num = 12345;
COMMIT;
```

## Using Savepoints
Simple `ROLLBACK` and `COMMIT` statements enable you to write or undo an entire transaction.  Although this approach works for simple transactions, more complex transactions might require partial commits or rollbacks.

For example, the process of adding an order described previously is a single transaction.  If an error occurs, you only want to rollback to the point before the *Orders* row was added.  You do not want to roll back the addition to the *Customers* table (if any).

To support the rollback of partial transactions, you must be able to put placeholders at strategic locations in the transaction blocks.  Then, if a rollback is required, you can rollback to one of the placeholders.

In MySQL and Oracle, you use the `SAVEPOINT` statement as follows:
```sql
SAVEPOINT delete1;
```

Then, to rollback:
```sql
ROLLBACK TO delete1;
```

You can have as many savepoints as you’d like within your SQL code, and the more the better. Why? Because the more savepoints you have, the more flexibility you have in managing rollbacks exactly as you need them.