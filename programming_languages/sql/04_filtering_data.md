# ***SQL***: Filtering Data
Database tables usually contain large amounts of data, and you seldom need to retrieve all the rows in a table. More often than not you’ll want to extract a subset of the table’s data as needed for specific operations or reports. Retrieving just the data you want involves specifying *search criteria*, also known as a *filter condition*.

## The `WHERE` Clause
Within a `SELECT` statement, data is filtered by specifying search criteria in the `WHERE` clause. The `WHERE` clause is specified right after the table name (the `FROM` clause).
```sql
SELECT prod_name, prod_price
FROM products WHERE prod_price = 3.49;
```
This statement retrieves two columns from the products table, but instead of returning all rows, only rows with a `prod_price` value of 3.49 are returned.

The first `WHERE` clause we looked at tests for equality—determining if a column contains a specific value. SQL supports a whole range of conditional operators.

| Operator | Description |
|----------|-------------|
| = | Equality|
| <> | Non-equality |
| != | Non-equality |
| < | Less than |
| <= | Less than or equal to |
| !< | Not less than |
| > | Greater than |
| >= | Greater than or equal to |
| !> | Not greater than |
| `BETWEEN` | Between two values |
| `IS NULL` | Is a NULL value |

## Checking Against a Single Value
We have already seen an example of testing for equality. Here are some more.
```sql
SELECT prod_price, prod_name
FROM products WHERE prod_price < 10;

SELECT vend_id, prod_name
FROM products WHERE vend_id <> 'DLL01';
```

## Checking For a Range of Values
To check for a range of values, you can use the `BETWEEN` operator. Its syntax is a little different from other `WHERE` clause operators because it requires two values: the beginning and end of the range. The `BETWEEN` operator can be used, for example, to check for all products that cost between $5 and $10 or for all dates that fall between specified start and end dates.
```sql
SELECT prod_price, prod_name
FROM products WHERE prod_price BETWEEN 5 AND 10;
```
As seen in this example, when `BETWEEN` is used, two values must be specified— the low end and high end of the desired range. The two values must also be separated by the `AND` keyword. `BETWEEN` matches all the values in the range, including the specified start and end values.

## Checking for No Value
When a table is created, the table designer can specify whether or not individual columns can contain no value. When a column contains no value, it is said to contain a NULL value.
```sql
SELECT prod_name
FROM products WHERE prod_price IS NULL;
```
*Caution: You might expect that when you filter to select all rows that do not have a particular value, rows with a NULL will be returned. But they will not. NULL is strange this way, and rows with NULL in the filter column are not returned when filtering for matches or when filtering for nonmatches.*

## Combining `WHERE` Clauses
For a greater degree of filter control, SQL lets you specify multiple `WHERE` clauses. These clauses may be used in two ways: as `AND` clauses or as `OR` clauses.

To filter by more than one column, you use the `AND` operator to append conditions
to your `WHERE` clause.
```sql
SELECT prod_id, prod_price, prod_name
FROM products WHERE vend_id = 'DLL01' AND prod_price <= 4;
```
The above SQL statement retrieves the product name and price for all products made by vendor DLL01 as long as the price is $4 or less. The `WHERE` clause in this `SELECT` statement is made up of two conditions, and the keyword `AND` is used to join them. `AND` instructs the database management system software to return only rows that meet all the conditions specified. If a product is made by vendor DLL01, but it costs more than $4, it is not retrieved. Similarly, products that cost less than $4 that are made by a vendor other than the one specified are not to be retrieved.

The `OR` operator is exactly the opposite of `AND`. The `OR` operator instructs the database management system software to retrieve rows that match either condition. In fact, most of the better DBMSs will not even evaluate the second condition in an `OR WHERE` clause if the first condition has already been met. (If the first condition was met, the row would be retrieved regardless of the second condition.)
```sql
SELECT prod_id, prod_price, prod_name
FROM products WHERE vend_id = 'DLL01' OR vend_id = 'BRS01';
```
The above SQL statement retrieves the product name and price for any products made by either of the two specified vendors. The `OR` operator tells the DBMS to match either condition, not both. If an `AND` operator were used here, no data would be returned (as it would create a `WHERE` clause that would match no rows). 

`WHERE` clauses can contain any number of `AND` and `OR` operators. Combining the two enables you to perform sophisticated and complex filtering. But combining `AND` and `OR` operators presents an interesting problem. To demonstrate this, look at an example. You need a list of all products costing $10 or more made by vendors DLL01 and BRS01. The following `SELECT` statement uses a combination of `AND` and `OR` operators to build a `WHERE` clause:
```sql
SELECT prod_name, prod_price
FROM products WHERE vend_id = 'DLL01' OR vend_id = 'BRS01' AND prod_price >= 10;
```
Rather, for simplicity and readability, we can use parentheses to group the statements.
```sql
SELECT prod_name, prod_price
FROM products WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01') AND prod_price >= 10;
```

## Using the `IN` Operator
The `IN` operator is used to specify a range of conditions, any of which can be matched. `IN` takes a comma-delimited list of valid values, all enclosed within parentheses. 
```sql
SELECT prod_name, prod_price
FROM products WHERE vend_id IN ('DLL01','BRS01')
ORDER BY prod_name;
```
The `SELECT` statement retrieves all products made by vendor DLL01 and vendor BRS01. The `IN` operator is followed by a comma-delimited list of valid values, and the entire list must be enclosed within parentheses.
- When you are working with long lists of valid options, the `IN` operator syntax is far cleaner and easier to read.
- The order of evaluation is easier to manage when `IN` is used in conjunction with other `AND` and `OR` operators.
- `IN` operators almost always execute more quickly than lists of `OR` operators (although you’ll not see any performance difference with very short lists like the ones we’re using here).
- The biggest advantage of `IN` is that the `IN` operator can contain another `SELECT` statement, enabling you to build highly dynamic `WHERE` clauses.

## Using the `NOT` Operator
The `WHERE` clause’s `NOT` operator has one function and one function only: `NOT` negates whatever condition comes next. Because `NOT` is never used by itself (it is always used in conjunction with some other operator), its syntax is a little different from all other operators. Unlike other operators, the `NOT` keyword can be used before the column to filter on, not just after it.
```sql
SELECT prod_name FROM products
WHERE NOT vend_id = 'DLL01'
ORDER BY prod_name;
```
The `NOT` here negates the condition that follows it; so instead of matching `vend_id` to DLL01, the DBMS matches vend_id to anything that is not DLL01.

## Using the `LIKE` Operator
All the previous operators we studied filter against known values. Be it matching one or more values, testing for greater-than or less-than known values, or checking a range of values, the common denominator is that the values used in the filtering are known. But filtering data that way does not always work. For example, how could you search for all products that contained the text *bean bag* within the product name? That cannot be done with simple comparison operators; that’s a job for **wildcard searching**. Using wildcards, you can create search patterns that can be compared against your data. In this example, if you want to find all products that contain the words *bean bag*, you can construct a wildcard search pattern enabling you to find that *bean bag* text anywhere within a product name.

To use wildcards in search clauses, you must use the `LIKE` operator. `LIKE` instructs the DBMS that the following search pattern is to be compared using a wildcard match rather than a straight equality match. (*Wildcard searching can only be used with text fields (strings); you can’t use wildcards to search fields of nontext datatypes.*)

The most frequently used wildcard is the percent sign (`%`). Within a search string, `%` means match any number of occurrences of any character. For example, to find all products that start with the word *Fish*, you can issue the following `SELECT` statement:
```sql
SELECT prod_id, prod_name
FROM products WHERE prod_name LIKE 'Fish%';
```
This example uses a search pattern of *'Fish%'*. When this clause is evaluated, any value that starts with Fish will be retrieved. The `%` tells the DBMS to accept any characters after the word *Fish*, regardless of how many characters there are.  The `%` can be used on both sides, too:
```sql
SELECT prod_id, prod_name
FROM products WHERE prod_name LIKE '%bean bag%';
```
The search pattern *'%bean bag%'* means match any value that contains the text bean bag anywhere within it, regardless of any characters before or after that text.
     
Wildcards can also be used in the middle of a search pattern, although that is rarely useful. The following example finds all products that begin with an *F* and end with a *y*.
```sql
SELECT prod_name
FROM products WHERE prod_name LIKE 'F%y';
```
Another useful wildcard is the underscore (`_`). The underscore is used just like `%`, but instead of matching multiple characters, the underscore matches just a single character.
```sql
SELECT prod_id, prod_name
FROM Products WHERE prod_name LIKE '__ inch teddy bear'; -- two underscores
```
The search pattern used in this `WHERE` clause specified two wildcards followed by literal text. The results shown are the only rows that match the search pattern: the underscore matches 12 in the first row and 18 in the second row. The 8 inch teddy bear product did not match because the search pattern required two wildcard matches, not one.

The brackets (`[]`) wildcard is used to specify a set of characters, any one of which must match a character in the specified position (the location of the wildcard).
```sql
SELECT cust_contact
FROM Customers WHERE cust_contact LIKE '[JM]%'
ORDER BY cust_contact;
```
The `WHERE` clause in this statement is *'[JM]%'*. This search pattern uses two different wildcards. The *[JM]* matches any contact name that begins with either of the letters within the brackets, and it also matches only a single character. Therefore, any names longer than one character will not match. The `%` wildcard after the *[JM]* matches any number of characters after the first character, returning the desired results.

This wildcard can be negated by prefixing the characters with `^` (the caret character). For example, the following matches any contact name that does not begin with the letter J or the letter M (the opposite of the previous example):
```sql
SELECT cust_contact
FROM Customers WHERE cust_contact LIKE '[^JM]%'
ORDER BY cust_contact;
```

Here are some rules to keep in mind when using wildcards:
    
- Don’t overuse wildcards. If another search operator will do, use it instead.
- When you do use wildcards, try not to use them at the beginning of the search pattern unless absolutely necessary. Search patterns that begin with wildcards are the slowest to process.
- Pay careful attention to the placement of the wildcard symbols. If they are misplaced, you might not return the data you intended.

Having said that, wildcards are an important and useful search tool, and one that you will use frequently.