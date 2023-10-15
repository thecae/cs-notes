# Intro to C++
A program is a set of instructions that are executed one at a time.  There are three parts to a function:

- ***Input***: Getting data from user (file, keyboard, etc.)
- ***Process***: Performing computations on data
- ***Output***: Puts data somewhere (file, screen, etc.)

## Basic Program Formatting
Programs are formatted with a main function that has a return value to indicate to the user that the function executed properly.  Include statements are written above all functions and global variables written below.

Hello World Program:
```c++
#include <iostream>
// basic input and output

int main() {
	std::cout << "Hello World" << std::endl;
	
	return 0;
}
```

Functions are written with curly braces to define the boundaries of the function.  Data types are explicitly defined for variables.  Semicolons are written at the end of an expression to end it.

Note: `using namespace std;` is no longer used.

## Inputting Data
Data is inputted using the `cin` function located within the standard library.  Variables must be defined with a data type before they are inputted, and their input must match the specified type or an error will occur.
```c++
int myVal;
std::cin >> myVal;
```

## Outputting Data
Data is outputted to console using the `cout` function within the standard library.  This function prints exactly as desired with no extra spaces or new lines after the function.  The output operator can be used multiple times to append multiple things to a line.
```c++
int inchesPerFoot = 12;
std::cout << "There are " << inchesPerFoot << " inches per foot." << std::endl;
```

## Variables
***Variables*** are named objects to store data.  They are connected to a data type that cannot be changed after declaration.  Variables, however, can be static-casted.
```c++
int myVal = 5;
```

## Comments
Comments are used to explain to someone else viewing a program.  Comments are ignored by the compiler.


Single-line comments are prefaced with `//` and comment out the rest of the line.
```c++
int inchesPerFoot = 12; // 12 inches per foot
```

Multi-line comments start with `/*` and end with `*/`.  Anything after the termination line will be interpreted by the compiler.  They are most often used for explaining the purpose of a function before it is defined.
```c++
/* formats and prints the name and list of the families that have the largest
 * size of the inputted file.
 * pre: empty outfile
 * post: printed outfile containing the largest families
 */
void printMap(std::ofstream &outfile, const FamilyNameMap &myMap, size_t largestSize);
```
Note that the asterisks in between are optional but helpful for making each line start at the same spot for formatting purposes. 

For the most part, ***whitespace*** (spaces, tabs, newlines) is also ignored by the compiler. 

## Errors and Warnings
Errors in C++ are very similar to most other languages.

***SyntaxError***: Violating language rules on how functions and symbols work.

Unclear Error Message: The compiler making its best guess as to the error made and how to fix it

***LogicError*** (Bugs): Errors during program running

***Warnings***: Compiler message indicating possible logic error but still lets the program run.