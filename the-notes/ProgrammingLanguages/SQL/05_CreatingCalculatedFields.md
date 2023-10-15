---
title: '***SQL***: Creating Calculated Fields'
author: "Cole Ellis"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$$set(echo = TRUE)
```

Data stored within a database’s tables is often not available in the exact format needed by your applications. Here are some examples:

- You need to display a field containing the name of a company along with the company’s location, but that information is stored in separate table columns.
- City, state, and ZIP codes are stored in separate columns (as they should be), but your mailing label printing program needs them retrieved as one correctly formatted field.
- Column data is in mixed upper- and lowercase, and your report needs all data presented in uppercase.
- An `OrderItems` table stores item price and quantity, but not the expanded price (price multiplied by quantity) of each item. To print invoices, you need that expanded price.
- You need total, averages, or other calculations based on table data.

In each of these examples, the data stored in the table is not exactly what your application needs. Rather than retrieve the data as it is and then reformat it within your client application or report, what you really want is to retrieve converted, calculated, or reformatted data directly from the database.

This is where calculated fields come in. Unlike all the columns that we have retrieved in the lessons thus far, calculated fields don’t actually exist in database tables. Rather, a calculated field is created on-the-fly within a SQL `SELECT` statement.

## Concatenating Fields
To demonstrate working with calculated fields, let’s start with a simple example — creating a title that is made up of two columns.  The *Vendors* table contains vendor name and address information. Imagine that you are generating a vendor report and need to list the vendor location as part of the vendor name, in the format *name (location)*.
The report wants a single value, and the data in the table is stored in two columns: `vend_name` and `vend_country`. In addition, you need to surround `vend_country` with parentheses, and those are definitely not stored in the database table. The `SELECT` statement that returns the vendor names and locations is simple enough, but how would you create this combined value?

The solution is to concatenate the two columns. In SQL `SELECT` statements, you can concatenate columns using a special operator.  How to do this depends on what DBMS is being implemented, but here are the three main ways:
```sql
SELECT vend_name + '(' + vend_country + ')'
FROM vendors
ORDER BY vend_name; -- SQL Server

SELECT vend_name || '(' || vend_country || ')'
FROM vendors
ORDER BY vend_name; -- Oracle, SQLite

SELECT Concat(vend_name, ' (', vend_country, ')')
FROM vendors
ORDER BY vend_name; -- MySQL
```
Many databases (although not all) save text values padded to the column width, so your own results may indeed not contain those extraneous spaces. To return the data formatted properly, you must trim those padded spaces. This can be done using the SQL `RTRIM()` function.
```sql
SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')'
FROM vendors
ORDER BY vend_name;
```

## Using Aliases
The `SELECT` statement used to concatenate the address field works well, as seen in the above output. But what is the name of this new calculated column? Well, the truth is, it has no name; it is simply a value. Although this can be fine if you are just looking at the results in a SQL query tool, an unnamed column cannot be used within a client application because there is no way for the client to refer to that column.  To solve this problem, SQL supports column aliases. An alias is just that, an alternate name for a field or value. Aliases are assigned with the `AS` keyword. 
```sql
SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')' AS vend_titl
FROM vendors
ORDER BY vend_name;
```
Output:
```blank
vend_title
----------------------------------------------------------- 
Bear Emporium (USA)
Bears R Us (USA)
Doll House Inc. (USA)
Fun and Games (England)
Furball Inc. (USA)
Jouets et ours (France)
```
The `SELECT` statement itself is the same as the one used in the previous code snippet, except that here the calculated field is followed by the text `AS vend_title`. This instructs SQL to create a calculated field named `vend_title` containing the calculation specified. As you can see in the output, the results are the same as before, but the column is now named `vend_title`, and any client application can refer to this column by name, just as it would to any actual table column.

## Performing Mathematical Computations
Another frequent use for calculated fields is performing mathematical calculations on retrieved data. Let’s take a look at an example. The *Orders* table contains all orders received, and the *OrderItems* table contains the individual items within each order. The following SQL statement retrieves all the items in order number 20008:
```sql
SELECT prod_id, quantity, item_price
FROM OrderItems WHERE order_num = 20008;
```
Output:
```blank
prod_id    quantity     item_price
---------- -----------  -------------
RGAN01     5            4.9900
BR03       5            11.9900
BNBG01     10           3.4900
BNBG02     10           3.4900
BNBG03     10           3.4900
```
The `item_price` column contains the per unit price for each item in an order. To expand the item price (item price multiplied by quantity ordered), you simply do the following:
```sql
SELECT prod_id, quantity, item_price, quantity*item_price AS expanded_price 
FROM OrderItems
WHERE order_num = 20008;
```
Output:
```blank
prod_id    quantity    item_price   expanded_price
---------- ----------- ------------ ----------------- 
RGAN01     5           4.9900       24.9500
BR03       5           11.9900      59.9500
BNBG01     10          3.4900       34.9000
BNBG02     10          3.4900       34.9000
BNBG03     10          3.4900       34.9000
```
The `expanded_price` column shown in the output above is a calculated field; the calculation is simply `quantity*item_price`. The client application can now use this new calculated column just as it would any other column.