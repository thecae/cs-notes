<!---
CS NOTES :: C++ :: VARIABLES AND ASSIGNMENTS

BY: COLE ELLIS

LAST MODIFIED: 17 DEC 2021
-->

# ***C++***: Variables and Assignments
A *variable* is a named item or object.  It is given an *assignment*, which is the value given to the variable.
```c++
int x = 5; // var = x, assignment = 5
```

To *increment* a value is to increase its value by one.
```c++
x = x + 1;
++x; // uses increment operator
```

*Variable declaration* is a statement that declares a new variable and a data type.
```c++
int numPeople;
```

The *assignment statement* assigns a variable (the left side) with a value (the right side).
```c++
numPeople = 8;
```

An *expression* can be a number (`80`), a variable (`numPeople`), or a calculation (`numPeople + 1`).  An *integer literal* is a standalone number.

An *identifier* is a name created by the programmer for a variable or function.  Identifiers must:
- Be a sequence of alphanumeric characters and underscores
- Starts with a letter or underscore

*Reserved words* are words that have meaning in language that can't be variable names.

| List | of | Reserved | Words |
|------|----|----------|-------|
| alignas | decltype | namespace | struct |
| alignof | default | new | switch |
| and | delete | noexcept | template |
| and_eq | do | not | this |
| asm | double | not_eq | thread_local |
| auto | dynamic_cast | nullptr | throw |
| bitand | else | opertor | true |
| bitor | enum | or | try |
| bool | explicit | or_eq | typedef |
| break | export | private | typeid |
| case | extern | protected | typename |
| catch | false | public | union |
| char | float | register | unsigned |
| char16_t | for | reinterpret_cast | using |
| char32_t | friend | return | virtual |
| class | goto | short | void |
| compl | if | signed | volatile |
| const | inline | sizeof | wchar_t |
| constexpr | int | static | while |
| const_cast | long | static_assert | xor |
| continue | mutable | static_cast | xor_eq |

A *statement* is a combination of variables, literals, operators, and parentheses.

## Operators
The Order of Operations in coding is:
1. Parentheses
2. Unary Operators (Negatives)
3. Multiplication, Division, and Modulus
4. Addition and Subraction

Compound operators are a shorthand way to update variables.
```c++
numAtoms += 5; // numAtoms = numAtoms + 5;
```
The compound operators are `+=`, `-=`, `*=`, `/=`, and `%=`.

## Number Types
A *floating-point number* is a real number containing a decimal point.  This is stored using a `double` datatype.

A number is *not a number (NaN)* if a number is unrepresentable or an undefined value.

A *constant value* is a defined value that can't change.  The convention for constants is all capital letters and underscores.
```c++
const double SPEED_OF_LIGHT = 3.0c8;
```

## Math Functions
The most important math class is `#include <cmath>` which has all the needed math functions.  Unlike other languages such as Python, the class name is not needed in the function call.
- `pow(x, y)`: x^y
- `sqrt(x)`: square root
- `fabs(x)`: |x|
- `floor(x)`: greatest integer function
- `ceil(x)`: least integer function
- `cos(x)`: trigonometric cosine function

A *type conversion* is the changing of datatypes from one type to another.  A *typecast* explicitly converts one type to another.  A *static cast* converts a value to a given type.
```c++
int myIntVar = 7;
static_cast<double>(myIntVar); // myIntVar becomes 7.0
```

## Characters and Strings
A *character* is a single ASCII value (character literal or escape character).
```c++
char myChar = 'A';
```

An *escape sequence* is a two character sequence starting wth a backslash representing a special character.
- `\n`: newline
- `\t`: tab
- `\'`: single quote
- `\"`: double quote
- `\\`: backslash literal

A *string* is a sequence of characters.  A *string literal* is a standalone string surrounded by double quotes.  Examples of this are `"Hello!"`, `"abc123"`, and `"52 Main St."`.

To assign strings, use the string class (`#include <string>`).  Strings are members of the standard library.
```c++
std::string myString = "Good morning!";
```

To input a string, use `std::cin`.  However, it doesn't take whitespaces.
```c++
std::string name;
std::cin >> firstName;
std::cin >> lastName;
```

Alternatively, use the `getline()` function to include whitespace.
```c++
std::string name;
getline(std::cin, name);
```

## Numeric Data
A number *overflows* if the value assigned is greater than the maximum allowed value.
```c++
int x = 2000 * 2000 * 2000; // x overflows
```

An *unsigned* variable assumes that the variable is positive, which gives it better storage.  This is best seen from a binary computer architecture perspective.
```c++
unsigned size_t memSize;
```

*Random numbers* are generated using the C Standard Library (`#include <cstdlib>`).  A number can be defined as a random integer from `0` to `RAND_MAX` (about 2 billion).
```c++
int x = rand();
```

The `auto` datatype is a powerful data type that automatically predicts the type the data will be.
```c++
auto x = 9; // x becomes an int
auto x = 9.0; // x becomes a double
```