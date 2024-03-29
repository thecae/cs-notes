# Introduction to Python

A computer program consists of instructions executing one at a time. Basic instruction types are:

* _**Input**_: A program gets data, perhaps from a file, keyboard, touchscreen, network, etc.
* _**Process**_: A program performs computations on that data, such as adding two values like $$x + y$$.
* _**Output**_: A program puts that data somewhere, such as to a file, screen, or network.

Programs use variables to refer to data, like $$x$$, $$y$$, and $$z$$.

**Hello World Program**:

```python
def main():
	print("Hello World!)

if __name__ == '__main__':
	main()
```

## Variable Storage

Variables are given a name (underscore case or camel case) and assigned their value. In Python, data types are not explicitly announced but rather implied by the language.

```python
numCars = 30
```

Like other languages, variables can be assigned to other variables or a mathematical expression.

## Output to Console

Python uses the `print()` statement to print values.

```python
print(numCars)
print("30")
```

_Each call to `print()` outputs a new line at the end. To change the way that `print()` ends, the line, use the `end` keyword._

```python
print("First", end = ' ')
print("Second")
```

Output:

```
First Second

```

Python also accepts the usage of  for printing new lines.

Python allows for the use of commas to print two types of values in the same line. The values are separated by spaces.

```python
print("The number of cars is", numCars)
```

You can also use the format command to specifically put values into the right place and easily put more variables into the same line.

```python
def main():
	numCars = 30
	numBuses = 12
	print("There are {} cars and {} buses".format(numCars, numBuses))

if __name__ == '__main__':
	main()
```

Output:

```
There are 30 cars and 12 buses.
```

## Input from User

Python uses the `input()` command to input values from the user.

```python
print("Enter the number of cars: ", end = '')
numCars = input()
```

The `input()` command always stores values as a string, meaning `numCars` is a string and mathematical operations can't be performed on it. To change this output, a static cast to a new data type must be used.

```python
print("Enter the number of cars: ", end = '')
numCars = int(input())
```

Now, `numCars` is an integer and can be treated as such.

The code above can be simplified by putting the input line inside the `input()` statement. Note that this way, there is no space outputted after the line.

```python
numCars = int(input("Enter the number of cars: "))
```

## Error Typing

The most common error types are:

| Error Type       | Description                                                                     |
| ---------------- | ------------------------------------------------------------------------------- |
| Syntax Error     | The program contains invalid code that cannot be understood.                    |
| IndentationError | The lines of the program are not properly indented.                             |
| ValueError       | An invalid value is used – can occur if giving letters to `int()`.              |
| NameError        | The program tries to use a variable that does not exist.                        |
| TypeError        | An operation uses incorrect types – can occur if adding an integer to a string. |

Remember that _IndentationError_ happens because Python is an interpreted language and indentation matters for blocks of functions. Rather than using brackets to open and close functions, Python uses function indents.
