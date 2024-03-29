# Functions
A ***function*** is a group of pre-defined statements.

- A ***function definition*** is a function's name and statements.
```c++
double CalcPizzaArea(const &int radius) {
	return 3.14 * radius * radius;
```
- A ***function call*** is the execution of the function in code.
```c++
double area = CalcPizzaArea(4);
```

A ***return statement*** is what the function value returns.

A ***parameter*** is the function input specified during definition.  An ***argument*** is the value provided during function call.

A ***void function*** is a function with no return.

## Development and Testing
***Modular development*** is dividing a program into separate modules to develop and test separately.

***Incremental development*** is the writing and testing of small amounts of code. This is the best way to develop code to debug as you go, for if there are errors, it is easiest to determine where the errors are.

The ***function stub*** is a function written without definition.  

***Unit testing*** is the process of individually testing a small part of program.  This is typically done by testing each function and predicting the expected output and comparing that with the output of the program.

The `assert()` function is the process of individually testing a small part of the program. It prints an error message and exits the program if the boolean argument is false.

## Passing Data
To ***pass-by-value*** is where an argument's value is copied into a local parameter for the variable.

To ***pass-by-reference*** refers directly to the argument memory location.  This means that changing the reference value also changes the original variable.

```c++
// passing by value
#include <iostream>

void convertHrMin(int timeVal, int hrVal, int minVal) {
	hrVal = timeVal / 60;
	minVal = timeVal % 60;
}

int main() {
	int totalTime = 0;
	int userHour = 0;
	int userMin = 0;

	// input time
	std::cin >> totalTime;
	
	// convert
	convertHrMin(totalTime, userHour, userMin);

	// print
	std::cout << userHour << ":" << userMin << std::endl;

	return 0;
}
```
`OUTPUT: 0:0`

```c++
// passing by reference
#include <iostream>

void convertHrMin(int timeVal, int &hrVal, int &minVal) {
	hrVal = timeVal / 60;
	minVal = timeVal % 60;
}

int main() {
	int totalTime = 0;
	int userHour = 0;
	int userMin = 0;

	// input time
	std::cin >> totalTime;
	
	// convert
	convertHrMin(totalTime, userHour, userMin);

	// print
	std::cout << userHour << ":" << userMin << std::endl;

	return 0;
}
```
`OUTPUT: 2:36`

A ***reference*** is a variable type that refers to another variable.
```c++
int &userValReference = userInput;
```

Note that reference values must be sent to a value or an error will be thrown.  `userValReference` contains the current memory address of `userInput`.

A ***global variable*** is a variable that is declared outside the scope of any function.  This means that any variable can access it.  It is also declared ***constant***.

## Compiler Processing
A ***preprocessor*** is a tool that scans the file looking for lines beginning with the hashtag. At that time, the preprocessor includes all necessary functions.

The ***preprocessor directive*** is a line directing the preprocessor to modify the file before the compilaton continues.

The ***include directive*** directs the compiler to replace the line with the contents of the given filename.
```c++
// user file goes in quotes
#include "MyClass.h"
// pre-defined includes go in brackets
#include <iostream>
```

***Header guards*** only include contents of the header file once.  These are primarily used in *.h* files.
```c++
#ifndef FILENAME_H
#define FILENAME_H

// header file comments

#endif /* FILENAME_H */
```