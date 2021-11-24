# ***Python***: Variables and Expressions

In a program, a *variable* is a named item, such as x or num_people, used to hold a value.

An *assignment statement* assigns a variable with a value, such as x = 5. That statement means x is assigned with 5, and x keeps that value during subsequent statements, until x is assigned again.

Increasing a variable's value by 1, as in x = x + 1, is common and known as *incrementing* the variable.

| List   | of       | Reserved | Python3  | Keywords | 
|--------|----------|---------|----------|--------|
| False  | await    | else    | import   | pass   |
| None   | break    | except  | in       | raise  |
| True   | class    | finally | is       | return |
| and    | continue | for     | lambda   | try    |
| as     | def      | from    | nonlocal | while  |
| assert | del      | global  | not      | with   |
| async  | elif     | if      | or       | yield  |

Variables have three things associated to them: **value**, **type**, and **identity**.  All three can be printed for a variable using the `type()` and `id()` functions.
```python
countVal = 10

print(countVal)
print(type(countVal))
print(id(countVal))
```
Output:
```
10
<class 'int'>
9789280
```
*`9789280` represents the memory address associated with `countVal`, which is a unique identifier that the compiler uses to know where to store the value given to `countVal`.*

## Floating-Point Numbers
*Floating-Point Numbers* - Real numbers with a decimal point placed appropriately (ex 98.6, 0.00001)

*Floating-Point Literal* - Written with the fractional part even if the number is an integer (ex. 1.0, 0.0)

*Scientific Notation* - Number preceding a power-of-ten exponent

*`OverflowError`* - Value too large to be stored in the memory interpreter

The `.format()` value of the `print()` function can be used to modify how float values should be printed.
```python
print("{:.2f}".format(myFloat)) # prints a float with two decimal points
```

## Arithmetic Expressions
Expression of a combination of literals and operators.

Precedence rules:
1. `()` - Parentheses operators
2. `**` - Exponent operator
3. `unary -` - Negation
4. `* / %` - Multiplication, Division, and Modulus
5. `+ -` - Addition and Subtration
6. `< > <= >=` - Comparison operators
7. `== !=` - Equality operators
8. `&& ||` - Conjunction / Disjunction operators
9. `= += -= *= /= %=` - Assignment operators

## Division and Modulo
Division returns floating point values regardless of the input data type.
* 20 / 10 = 2.0
* 50 / 50 = 1.0
* 25 / 50 = 0.5

The floored division operator (`//`) makes the division and rounds the result down to the nearest integer.  If either operand is a floating-point number, then a float is returned.
* 20 // 10 = 2
* 50 // 50 = 1
* 25 // 50 = 0
* 5.0 // 2 = 2.0

Modulus returns the remainder of the division of the two integer operands.
* 24 % 10 is 4. *Reason*: 24 / 10 is 2 with remainder 4.
* 50 % 50 is 0. *Reason*: 50 / 50 is 1 with remainder 0.
* 1 % 2 is 1. *Reason*: 1 / 2 is 0 with remainder 1.

## Compound Operators
Compound operators simplify expressions where a variable is updated by a factor of its current value.

|  Compound operator  | Expression with compound operator | Equivalent expression |
|---------------------|-----------------------------------|-----------------------|
| Addition assignment |	age += 1 | age = age + 1 |
| Subtraction assignment | age -= 1 | age = age - 1 |
| Multiplication assignment | age *= 1 |age = age * 1 |
| Division assignment | age /= 1 | age = age / 1 |
| Modulo assignment | age %= 1 | age = age % 1 |

## The Math Module
The math module supports the use of advanced math functions.  The math module has to be imported, and is done as follows:
```python
import math

def main():
	numAncestors = math.pow(2, 10) # 2^10 = 1024
	

if __name__ == '__main__':
	main()
```

Common functions in the math module:

| Function | Definition |
|----------|------------|
| `ceil(x)` | Round up value |
| `factorial(x)` | x! |
| `fmod(x, y)` | x % y |
| `fabs(x)` | \|x\| |
| `floor(x)` | Round down value |
| `fsum(X)` | Sum of a range, list, or array |
| `exp(x)` | e^x |
| `log(x, b)` | log_b(x) |
| `pow(x, y)` | x^y |
| `sqrt(x)` | Square root |
| `pi` | pi (constant) |
| `e` | Euler's constant |