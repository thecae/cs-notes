# String Basics
A ***string*** is a sequence of characters, like the text `JOHN`, that can be stored in a variable.  A ***string literal*** is a string value specified in the source code of a program.  A programmer creates a string literal by surrounding text with single or double quotes, such as 'JOHN' or "JOHN".

The string type is a special construct known as a ***sequence type***, a type that specifies a collection of objects ordered from left to right.  A string's characters are ordered from the string's first letter to the last.  A character's position in a string is called the character's index, which starts at $$0$$.  In "JOHN", $$J$$ is at $$0$$, $$O$$ is at $$1$$, etc.

A programmer can assign a string just as with other types. Ex: `str1 = 'Hello'`, or `str1 = str2`. The `input()` function can also be used to get strings from the user.  An empty string is a sequence type with 0 elements, created with two quotes. Ex: `my_str = ''`.

A common operation is to find the length, or the number of characters, in a string.  The `len()` built-in function can be used to find the length of a string.
```python
name = 'John Smith'
print(len(name))
```
The output of the above code is $$10$$.

Programs commonly access an individual character of a string.  A programmer can access a character at a specific index by appending ***brackets*** (`[]`) containing the index.
```python
alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
print(alphabet[0], alphabet[1], alphabet[25])
```
The output of the above code is `A B Z`.

***Note**: Negative indices can be used to access characters starting from the rightmost character of the string, instead of the leftmost.*

Writing or altering individual characters of the string is not allowed.  Strings are ***immutable*** objects, meaning that string values cannot change once created. In other words, `alphabet[0] = 'A'` is invalid and results in a `TypeError`. Rather, an assignment statement can change an entire string variable.

A program can add new characters to the end of a string in a process known as ***string concatenation***.
```python
string_1 = "abc"
string_2 = "123"
strings = string_1 + string_2 # strings = "abc123"
```

## Representing Text
Python uses ***Unicode*** to represent every possible character as a unique number, known as a ***code point***.  For example, the character $$G$$ has a code point decimal value of $$71$$.  In total, there are more than $$1,000,000$$ code points in the Unicode standard character set.

In addition to visible characters like $$\$$$$ or $$5$$, several special characters called ***escape sequences*** exist.  An escape sequence is a two-item sequence that denotes specialized formatting.  The first part of the escape sequence is a $$\\$$, or a backslash, that denotes the character is an escape sequence.  The character of that is the definition of the sequence.

| Escape Sequence | Explanation | Example Code | Output |
|-----------------|-------------|--------------|--------|
| `\\` | Backslash (`\`) | `print('\\home\\users\\')` | `\home\users\` |
| `\'` | Single Quote (`'`) | `print('Name: John O\'Donald')` | `Name: John O'Donald` |
| `\"` | Double Quote (`"`) | `print("He said, \"Hello friend!\".")` | `He said, "Hello friend!".`
| `\n` | Newline | `print('My name...\nIs John...')` | `My name...`<br>`Is John...` |
| `\t` | Tab (indent) | `print('1. Bake Cookies\n.\t1.1. Preheat oven')` | `1. Bake cookies`<br>`.    1.1. Preheat oven` |

Escape sequences can be ignored using a ***raw string***.  A raw string is created by adding an `r` before a string literal, as seen below.
```python
my_string = 'This is a \n \'normal\' string\n'
my_raw_string = r'This is a \n \'normal\' string'

print(my_string)
print(my_raw_string)
```
OUTPUT:
```
This is a 
 'normal' string
 
This is a \n \'normal\' string\n
```

Sometimes converting between a text character and the encoded value is useful.  The built-in function `ord()` returns an encoded integer value for a string of length one.  The built-in function `chr()` returns a string of one character for an encoded integer.

## String Formatting
The string `format()` function allows a programmer to create a string with placeholders that are replaced by values or variable values at execution.  A placeholder surrounded by curly braces `{}` is called a ***replacement field***.  Values inside the `format()` parentheses are inserted into the replacement fields in the string.
```python
number = 6
amount = 32

print('{} burritos cost $${}'.format(number, amount))
```
The output of the above code is `6 burritos cost $$32`.

The three ways to provide values to replacement fields include:

| Replacement Definition | Example | Formatted String Result |
| Positional | `'The {1} in the {0} is {2}.'.format('hat', 'cat', 'fat')` | `The cat in the hat is fat.` |
| Inferred Positional | `'The {} in the {} is {}.'.format('cat', 'hat', 'fat')` | `The cat in the hat is fat.` |
| Named | `'The {animal} in the {headwear} is {shape}.'.format(animal='cat', headwear='hat', shape='fat')` | `The cat in the hat is fat.` |

Named replacement allows a programmer to create a ***keyword argument*** that defines a name and value in the `format()` parentheses.  The name can then be placed into a replacement field.

***Note**: The positional and inferred positional replacement types cannot be combined.  However, named and either positional replacement type can be combined.*

Double braces `{{}}` can be used to place an actual curly brace into a string.  For example, `'{0} {{Bezos}}'.format('Amazon')` produces the string `Amazon {Bezos}`.

A ***format specification*** inside of a replacement field allows a value's formatting in the string to be customized.  A common format specification is to provide a ***presentation type*** for the value, such as integer ($$4$$), floating point ($$4.0$$), fixed precision decimal ($$4.000$$), percentage ($$4\%$$), binary ($$100_2$$), etc.

| Type | Description | Example | Output |
|------|-------------|---------|--------|
| `s` | String (default) | `'{:s}'.format('Aiden')` | `Aiden` |
| `d` | Decimal (integer) | `'{:d}'.format(4)` | `4` |
| `b` | Binary (integer) | `'{:b}'.format(4)` | `100` |
| `x,X`| Hexadecimal (LC-`x`, UC-`X`) | `'{:x}'.format(15)` | `f` |
| `e` | Scientific/Exponent | `'{:e}'.format(44)` | `4.400000e+01` |
| `f` | Fixed-point (6 places) | `'{:f}'.format(4)` | `4.000000` |
| `.[p]f` | Fixed-point | `'{:.2f}'.format(4)` | `4.00` |

The colon `:` in the replacement field separates the "what" on the left side from the "how" on the right.  The left side can be omitted (inferred), a number (positional), or a name (named).

## General If-Else Branches
A ***branch*** is a program path taken only if an expression's value is true.  For example, a hotel may discount a price only for people over age $$60$$.  Such a branch is commonly known as an ***if-branch***: a branch taken only if an expression evaluates to `true`.

An ***if-else*** structure has two branches: the first branch is taken if an expression is true, else the other branch is taken.

Commonly a programmer wishes to take one of multiple (three or more) branches.  An if-else can be extended to an ***if-elseif-else*** structure.  Each branch's expression is checked in sequence; as soon as one branch's expression is found to be true, that branch is taken.  If no expression is found true, execution will reach the else branch, which then executes.

An ***if*** statement executes a group of statements if an expression is true.  The statements in a branch must be indented some number of spaces, typically four ($$4$$).
```python
hotel_rate = 155
user_age = int(input('Enter age: '))

if user_age > 65:
  hotel_rate = hotel_rate - 20
  
print('Your hotel rate:', hotel_rate)
```

An ***if-else*** statement executes one group of statements when an expression is true and another group of statements when the expression is false.
```python
# statements executing before branches

if ### expression ###:
  # execute if expression is true
else:
  # execute if expression is false

# statements executing after branches
```

For an ***if-elseif-else*** statement, the `elif` command is used.
```python
if expression1:
   # Statements that execute when expression1 is true
   # (first branch)
elif expression2:
   # Statements that execute when expression1 is false and expression2 is true
   # (second branch)
else:
   # Statements that execute when expression1 is false and expression2 is false
   # (third branch)
```

The ***equality operator*** (***`==`***) evaluates to true if the left side and right side are equal.  There is a big difference betwen the equality operator (`==`) and the assignment operator (`=`).

A branch's statements can include any valid statements, including another if-else statements, known as ***nested if-else statements***.
```python
user_choice = 2  # Hardcoded values for this tool. Could be input()...
num_items = 5

if user_choice == 1:    
   print('user_choice is 1')
elif user_choice == 2:
   if num_items < 0:
      print('user_choice is 2 and num_items < 0')
   else:
      print('user_choice is 2 and num_items >= 0')
else:
   print('user_choice is neither 1 or 2')
```

Sometimes the programmer has multiple if statements in sequence, which looks similar to a multi-branch if-else statement but has a very different meaning. Each if statement is independent, and thus more than one branch can execute, in contrast to the multi-branch if-else arrangement.

A ***boolean*** is a data type that is either `true` or `false`.  A ***boolean operator*** treats operands as true or false and evaluates to a value of `true` or `false.  The three boolean operators are `and`, `or`, and `not`.

Python supports ***operator chaining***.  For example, `a < b < c` is a valid statement that returns true if `a < b` and `b < c`.

In programming languages, strings are equal only if they have the same number of characters and corresponding characters are identical.  For example:
```python
my_str = 'Tuesday'

print(my_str == 'Tuesday')
print(my_str == 'tuesday')
```
OUTPUT:
```
true
false
```

Given `age = 19`, `days = 7`, and `user_char = 'q'`:

| Expression | Value |
|------------|-------|
| `(age > 16) and (age < 25)` | `true` |
| `(age > 16) and (days > 10)` | `false`, `days < 10` |
| `(age > 16) or (days > 10)` | `true` |
| `not (days > 10)` | `true` |
| `not (age > 16)` | `false`, `age > 16` |
| `not (user_char == 'q')` | `false`, `user_char == 'q'` |

