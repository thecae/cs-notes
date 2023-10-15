# User-Defined Function Basics
A program may perform the same operation repeatedly, causing a large and confusing program due to redundancy. Program redundancy can be reduced by creating a grouping of predefined statements for repeatedly used operations, known as a ***function***. Even without redundancy, functions can prevent a main program from becoming large and confusing.

A ***function*** is a named series of statements:

- A ***function definition*** consists of the new function's name and a block of statements.  For example, `def print_area():` is a function definition and will be followed by an indented block of statements.
- A ***function call*** is an invocation of the function's name, causing the function's statements to execute.

Python comes with a number of built-in functions, such as `input()`, `int()`, `len()`, etc.  The ***`def`*** keyword is used to create new functions.
```python
def print_area(): # function definition
  pi_val = 3.14159265
  
  pizza_diameter = 12.0
  pizza_radius = pizza_diameter / 2.0
  pizza_area = pi_val * pizza_radius * pizza_radius
  
  print('{:.1f} inch pizza is {:.3f} square inches'.format(pizza_diameter, pizza_area))
  
  
print_area() # function call
```

## Function Parameters
A programmer can influence a function's behavior via an input.

- A ***parameter*** is a function input specified in a function definition.  A pizza area function might have diameter as an input.
- An ***argument*** is a value provided to a function's parameter during a function call.  An example of this is `print_area(12.0)`.

A parameter is like a variable defintion.  Upon entering the function, it is bound to an argument object provided by the call, creating a shared reference.
```python
def print_area(pizza_diameter):
  pi_val = 3.14159265
  
  pizza_radius = diameter / 2.0
  pizza_area = pi_val * pizza_radius * pizza_radius
  
  print('{:.1f} inch pizza is {:.3f} square inches'.format(pizza_diameter, pizza_area))
  
print_area(12.0)
print_area(16.0)
```

A function may have multiple parameters separated by commas.  Parameters are assigned in order of argument values.

***Note**: A function definition with no parameters must still have the parentheses, as in `def print_results():`.  The call to the function will also include these parentheses, as in `print_results()`.
```python
def print_volume(pizza_diameter, pizza_height):
  pi_val = 3.14159265
  
  pizza_radius = diameter / 2.0
  pizza_volume = pi_val * pizza_radius * pizza_radius * pizza_height
  
  print(('{:.1f} x {:.1f} inch pizza is {:.3f} cubic inches.'.format(pizza_diameter, pizza_height, pizza_volume))
  
print_volume(12.0, 0.3)
print_volume(12.0, 0.8)
print_volume(16.0, 0.8)
```
OUTPUT:
```
12.0 x 0.3 inch pizza is 33.929 cubic inches.
12.0 x 0.8 inch pizza is 90.478 cubic inches.
16.0 x 0.8 inch pizza is 160.850 cubic inches.
```

## Dynamic Typing
A programmer can call a user-defined function `add(first, second)` to add two parameters.  In turn, calling `add(5, 7)` would return $12$ while calling `add('Tora', 'Bora')` would concatenate the strings to return `ToraBora`.

The function's behavior of being able to add together different types is a concept called ***polymorphism***. Polymorphism is an inherent part of the Python language. For example, consider the multiplication operator `*`. If the two operands are numbers, then the result is the product of those two numbers. If one operand is a string and the other an integer (e.g., `'x' * 5`) then the result is a repetition of the string $5$ times: `xxxxx`.

Python uses ***dynamic typing*** to determine the type of objects as a program executes. Ex: The consecutive statements `num = 5` and `num = '7'` first assign with an integer type, and then a string type. The type of num can change, depending on the value it references. The interpreter is responsible for checking that all operations are valid as the program executes. If the function call `add(5, '100')` is evaluated, an error is generated when adding the string to an integer.

In contrast to dynamic typing, many other languages like C, C++, and Java use ***static typing***, which requires the programmer to define the type of every variable and every function parameter in a program's source code. Ex: std::string name = "John";` would declare a string variable in C and C++. When the source code is compiled, the compiler attempts to detect non type-safe operations, and halts the compilation process if such an operation is found.

Dynamic typing typically allows for more flexibility in terms of the code that a programmer can write, but at the expense of potentially introducing more bugs, since there is no compilation process by which types can be checked.

## Returning Values from Functions
A function may return one value using ***return statement***.  Below, the `compute_square()` function returns the square of its argument.
```python
def compute_square(num):
  return num * num

num_squared = compute_square(7)
print('7 squared is', num_squared)
```

The output of the above code is `7 squared is 49`.

A function can only return one item, not two or more (though a list or a tuple with multiple elements can be returned).  A function with no return statement or a return statement with no following expression (i.e. `return`), returns the value `None`.  ***`None`*** is a special keyword that indicates no value.

A return statement may appear at any point in a function, not just as the last statement.  A function may also contain multiple return statements in different locations.

A function call evaluates to its returned value, which often appears within an expression.  For example, `5 + compute_square(4)` returns $5+16=21$.

A funtion's statements may include function calls, known as ***hierarchical function calls*** or ***nested function calls***.  Code such as `user_input = int(input())` consists of a hierarchical function call, wherein the `input()` function is called and evaluates to a value that is then passed as an argument to the `int()` function.

## Scope of Variables and Functions
A variable or function object is only visible to part of a program, known as the object's ***scope***.  When a variable is created inside a function, the variable's scope is limited to *inside* that function.   In fact, because a variable's name does not exist until bound to an object, the variable's scope is actually limited to *after* the first assignment of the variable until the end of the function.
```python
centimeters_per_inch = 2.54
inches_per_foot = 12

def height_to_centimeters(feet, inches):
  total_inches = (feet * inches_per_foot) + inches
  centimeters = total+inches * centimeters_per_inch
  return centimeters
  
feet = int(input('Enter feet: '))
inches = int(input('Enter inches: '))

print('Centimeters:', height_to_centimeters(feet, inches))
```

In the program above, `total_inches` and `centimeters` are invisible to the code outside the function and cannot be used.  Such variables defined inside a function are called ***local variables***.

In contrast, a varibale defined outside a function is called a ***global variable***.  A global variable's scope extends from assignment to the end of the file and can be accessed inside of functions.  A ***global*** statement must be used to *change* the value of a global variable inside of a function.

Consider the difference of the below functions:
```python
# function 1 - without global variable
employee_name = 'N/A'

def get_name():
  name = input('Enter employee name:')
  employee_name = name

get_name()
print('Employee name: ', employee_name)
```
OUTPUT:
```
Enter employee name: John Smith
Employee Name: N/A
```
```python
# function 2 - with global variable
employee_name = 'N/A'

def get_name():
  global employee_name
  name = input('Enter employee name:')
  employee_name = name

get_name()
print('Employee name: ', employee_name)
```
OUTPUT:
```
Enter employee name: John Smith
Employee Name: John Smith
```

Functions also have a scope, which extends from the function's definition to the end of the file.  To be able to call a function, the interpreter must have already evaluated the function definition (thus binding the function name to a function object).  An attempt to call a function before a function has been defined results in an error.
```python
employee_name = 'N/A'

get_name()
print('Employee name:', employee_name)

def get_name():
    global employee_name
    name = input('Enter employee name:')
    employee_name = name
```
OUTPUT:
```
NameError: name 'get_name' is not defined
```

## Why to Define Functions
There are a number of reasons to define functions:

- *Improving Program Readability*: Programs can become hard for humans to read and understand. Decomposing a program into functions can greatly aid program readability, helping yield an initially correct program, and easing future maintenance. For larger programs, the effect is even greater.
- *Modular Program Development*: ***Modular development*** is the process of dividing a program into separate modules that can be developed and tested separately and then integrated into a single program.
- *Avoid Writing Redundant Code*: A function can be defined once, then called from multiple places in a program, thus avoiding redundant code. Examples of such functions are functions like `sqrt()` that relieve a programmer from having to write several lines of code each time a square root needs to be computed.

## Common Function Errors
When developing functions, there are a few errors that are commonly made:

- *Copy-Paste Errors*: A common error is to copy-and-paste code among functions but then not complete all necessary modifications to the pasted code.
- *Return Errors*: Another common errors is to return the wrong variable, such as returning the input variable rather than the output.  Another common error is to fail to return a value for the function at all, which returns `None`.

## Docstrings
A ***docstring*** is a string literal placed in the first line of a function body.  A docstring starts and ends with three consecutive quotation marks.  Good practice is to keep the docstring of a simple function as a single line, including the quotes.
```python
def num_seats(airliner_type):
  """Determines number of seats on a plane"""
  # Function body statements ....

def ticket_price(origin, destimation, coach = True, first_class = False):
  """
  Calculates the price of a ticket between two airports.
  Only one of coach or first_class must be True.

  Arguments:
  origin -- string representing code of origin airport
  destination -- string representing code of destination airport

  Optional keyword arguments:
  coach -- Boolean. True if ticket cost priced for a coach class ticket (default True)
  first_class -- Boolean. True if ticket cost priced for a first class ticket (default False)
  """
  # Function body statements ...
```

The `help()` function can aid a programmer by providing them with all the documentation associated with an object.
```python
def ticket_price(origin, destination, coach=True, first_class=False):
    """
    Calculates the price of a ticket between two airports.
    Only one of coach or first_class must be True.

    Arguments:
    origin -- string representing code of origin airport
    destination -- string representing code of destination airport

    Optional keyword arguments:
    coach -- Boolean. True if ticket cost priced for a coach class ticket (default True)
    first_class -- Boolean. True if ticket cost priced for a first class ticket (default False)
    """
    #Function body statements ...

help(ticket_price)
```

