# ***SQL***: Data Manipulation Functions
Like almost any other computer language, SQL supports the use of functions to manipulate data. Functions are operations that are usually performed on data, usually to facilitate conversion and manipulation, and they are an important part of your SQL toolbox.  Functions, however, can be highly problematic.

Unlike SQL statements (for example, `SELECT`), which for the most part are supported by all DBMSs equally, functions tend to be very DBMS specific. In fact, very few functions are supported identically by all major DBMSs. Although all types of functionality are usually available in each DBMS, the function names or syntax can differ greatly.

| Function | Syntax |
|----------|--------|
| Substring | Oracle, SQLite: `SUBSTR`; MySQL, SQL Server: `SUBSTRING` |
| Static Cast | Oracle: Depends on Type; SQL Server: `CAST`; MySQL: `CONVERT` |
| Current Date | MySQL: `CURDATE`; Oracle: `SYSDATE`; SQL Server: `GETDATE`; SQLite: `DATE` |

Most SQL implementations support the following types of functions:
- Text functions are used to manipulate strings of text (for example, trimming or padding values and converting values to upper- and lowercase).
- Numeric functions are used to perform mathematical operations on numeric data (for example, returning absolute numbers and performing algebraic calculations).
- Date and time functions are used to manipulate date and time values and to extract specific components from these values (for example, returning differences between dates and checking date validity).
- Formatting functions are used to generate user-friendly outputs (for example, displaying dates in local languages and formats, or currencies with the right symbols and comma placement).
- System functions return information specific to the DBMS being used (for example, returning user login information).

## Text Manipulation Functions
The `RTRIM()` function was used to trim white space from the end of a column value. The `UPPER()` function makes all characters inside the parentheses uppercase.
```sql
SELECT vend_name, UPPER(vend_name) AS vend_name_upcase
FROM vendors
ORDER BY vend_name;
```
Here are some commonly used text functions:

| Function | Description |
|----------|-------------|
| `LEFT()` (or `LENGTH()` or `LEN()` or `DATALENGTH()`) | Returns characters from left of string |
| `LOWER()` | Converts string to lowercase |
| `LTRIM()` | Trims whitespace to left of string |
| `RIGHT()` (or `LENGTH()`) | Returns characters from right of string |
| `RTRIM()` | Trims whitespace to right of string |
| `SUBSTR()` or `SUBSTRING()` | Extract substring of string |
| `SOUNDEX()` | Returns SOUNDEX Value (See below) |
| `UPPER()` | Converts string to uppercase |

`SOUNDEX` is an algorithm that converts any string of text into an alphanumeric pattern describing the phonetic representation of that text. `SOUNDEX` takes into account similar-sounding characters and syllables, enabling strings to be compared by how they sound rather than how they have been typed. Although `SOUNDEX` is not a SQL concept, most DBMSs do offer `SOUNDEX` support.

## Date and Time Manupulation Functions
Date and times are stored in tables using datatypes, and each DBMS uses its own special varieties. Date and time values are stored in special formats so that they may be sorted or filtered quickly and efficiently, as well as to save physical storage space.  The internal format used to store dates and times is usually of no use to your applications, and so date and time functions are almost always used to read, expand, and manipulate these values. Because of this, date and time manipulation functions are some of the most important functions in the SQL language. Unfortunately, they also tend to be the most inconsistent and least portable.

To demonstrate the use of a date manipulation function, here is a simple example. The *Orders* table contains all orders along with an order date. To retrieve all of the orders placed in a specific year, you’d need to filter by order date, but not the entire date value, just the year portion of it. This obviously necessitates extracting the year from the complete date.
```sql
SELECT order_num FROM Orders WHERE DATEPART(yy, order_date) = 2020;
```
This example uses the `DATEPART()` function, which, as its name suggests, returns a part of a date. `DATEPART()` takes two parameters: the part to return and the date to return it from. In our example `DATEPART()` specifies *yy* as the desired part and returns just the year from the `order_date` column. By comparing that to 2020, the `WHERE` clause can filter just the orders for that year.

DBMSs typically offer far more than simple date part extraction. Most have functions for comparing dates, performing date-based arithmetic, formatting dates, and more. But, as you have seen, date-time manipulation functions are particularly DBMS specific. Refer to your DBMS documentation for the list of the date-time manipulation functions it supports.

## Numeric Manipulation Functions
Numeric manipulation functions do just that—manipulate numeric data. These functions tend to be used primarily for algebraic, trigonometric, or geometric calculations and, therefore, are not as frequently used as string or date and time manipulation functions. The ironic thing is that of all the functions found in the major DBMSs, the numeric functions are the ones that are most uniform and consistent. below lists some of the more commonly used numeric manipulation functions.

| Function | Description |
|----------|-------------|
| `ABS()` | Returns absolute value |
| `COS()` | Returns Trigonometric Cosine |
| `EXP()` | Returns Exponential |
| `PI()` | Returns pi constant |
| `SIN()` | Returns Trigonometric Sine |
| `SQRT()` | Returns Square Root |
| `TAN()` | Returns Trigonometric Tangent |
