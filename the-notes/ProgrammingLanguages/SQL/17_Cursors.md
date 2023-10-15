---
title: '***SQL***: Cursors'
author: "Cole Ellis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$$set(echo = TRUE)
```

## Understanding Cursors
SQL retrieval operations work with sets of rows known as result sets.  The rows returned are all the rows that match a SQL statement - zero or more of them.  When you use simple `SELECT` statements, there is no way to get the first row, the next row, or the previous $$10$$ rows.  Thsi is an integral part of how a relational DBMS works.

Sometimes you need to step through rows forward or backward and one or more at a time. This is what cursors are used for. A cursor is a database query stored on the DBMS server - not a `SELECT` statement, but the result set retrieved by that statement. Once the cursor is stored, applications can scroll or browse up and down through the data as needed.

Different DBMSs support different cursor options and features.  Some of the more common ones are:

- The capability to flag a cursor as read-only so that data can be read but not updated or deleted
- The capability to control the directional operations that can be performed (forward, backward, first, last, absolute position, relative position, and so on)
- The capability to flag some columns as editable and others as not editable
- Scope specification so as to be able to make the cursor accessible to the specific request that created it (a stored procedure, for example) or to all requests
- Instructing the DBMS to make a copy of the retrieved data (as opposed to pointing to the live data in the table) so that data does not change between the time the cursor is opened and the time it is accessed

Cursors are used primarily by interactive applications in which users need to scroll up and down through screens of data, browsing or making changes.

## Working with Cursors
Using cursors involves several distinct steps:

- Before a cursor can be used, it must be declared (defined). This process does not actually retrieve any data, it merely defines the SELECT statement to be used and any cursor options.
- Once it is declared, the cursor must be opened for use. This process actually retrieves the data using the previously defined SELECT statement.
- With the cursor populated with data, individual rows can be fetched (retrieved) as needed.
- When it is done, the cursor must be closed and possibly deallocated (depending on the DBMS).

Once a cursor is declared, it may be opened and closed as often as needed. Once it is open, fetch operations can be performed as often as needed.

## Creating Cursors
Cursors are created using the `DECLARE` statement, which differs from one DBMS to another.  `DECLARE` names the cursor and takes a select statement, complete with `WHERE` and other operators as needed.  To demonstrate this, we’ll create a cursor that retrieves all customers without email addresses, as part of an application enabling an operator to provide missing email addresses.
```sql
DECLARE CustCursor CURSOR FOR
SELECT * FROM Customers WHERE cust_email IS NULL;
```

The `DECLARE` statement is used to define and name the cursor—in this case, `CustCursor.` The `SELECT` statement defines a cursor containing all customers with no email address (a `NULL` value).

Now that the cursor is defined, it is ready to be opened.

## Using Cursors
Cursors are opened using the `OPEN CURSOR` statement, which is so simple a statement that most DBMSs support the same syntax:
```sql
OPEN CURSOR CustCursor;
```

When the `OPEN CURSOR` statement is processed, the query is executed, and the retrieved data is stored for subsequent browsing and scrolling.
Now the cursor data can be accessed using the `FETCH` statement. `FETCH` specifies the rows to be retrieved, where they are to be retrieved from, and where they are to be stored (variable names, for example). The first example uses Oracle syntax to retrieve a single row from the cursor (the first row):
```sql
DECLARE TYPE CustCursor IS REF CURSOR
RETURN Customers % ROWTYPE;
DECLARE CustRecord Customers % ROWTYPE
BEGIN
  OPEN CustCursor;
  FETCH CustCursor INTO CustRecord;
  CLOSE CustCursor;
END;
```
In this example, `FETCH` is used to retrieve the current row (it’ll start at the first row automatically) into a declared variable named `CustRecord.` Nothing is done with the retrieved data.

In the following (Oracle), the retrieved data is looped through from the first low to the last:
```sql
DECLARE TYPE CustCursor IS REF CURSOR
RETURN Customers % ROWTYPE;
DECLARE CustRecord Customers % ROWTYPE 
BEGIN
  OPEN CustCursor;
  LOOP
    FETCH CustCursor INTO CustRecord; 
    EXIT WHEN CustCursor % NOTFOUND;
    ... 
  END LOOP;
  CLOSE CustCursor;
END;
```

Like the previous example, this example uses `FETCH` to retrieve the current row into a declared variable named `CustRecord.` Unlike the previous example, the `FETCH` here is within a `LOOP` so that it is repeated over and over. The code `EXIT WHEN CustCursor % NOTFOUND` causes processing to be terminated (exiting the loop) when there are no more rows to be fetched. This example also does no actual processing; in real-world code you’d replace the `...` placeholder with your own code.

## Closing Cursors
In some DBMSs (such as SQLServer), it is required that the resources used by the cursor must be explicitly deallocated.  Oracle syntax:
```sql
CLOSE CustCursor;
```

The `CLOSE` statement is used to close cursors; once a cursor is closed, it cannot be reused without being opened again. However, a cursor does not need to be declared again to be used; an `OPEN` statement is sufficient.