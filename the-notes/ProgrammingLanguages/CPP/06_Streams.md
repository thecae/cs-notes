# Streams
An ***ostream*** is a class that supports output the the console.  An ***istream*** is a class that supports input from the user.  Both classes are contained under the `#include <iostream>` header, commonly implemented but never examined.

A ***manipulator*** is a function that overloads the insertion or extraction operators.  Examples of these are functions that change the output format.

- `std::cout << scientific`: Shows answer in scientific notation
- `std::cout << setprecision(p)`: Sets precision (number of significant figures)
- `std::cout << fixed`: Fixes number of decimal values printed
- `std::cout << showpoint`: Shows decimal point regardless of numeric type

Other manipulators include text alignment operators.

- `setw(n)`: Sets text width
- `setfill(char)`: Sets fill character
- `left`: Aligns text to left
- `right`: Aligns text to right

***Buffer manipulators*** change the format of buffer text to be printed.

- `endl`: Ends the line
- `flush`: Flushes buffer

## String Streams
An ***istringstream*** is a data type that reads input from a string.  It acts the same as reading from the console, but reads from other variables.  It requires the use of `#include <sstream>` to use.
```c++
std::string userInfo = "Amy Smith 19";

// create string stream
std::istringstream inSS(userInfo);

// read data
inSS >> firstName; // firstName = "Amy"
```

An ***ostringstream*** inserts characters into a buffer that can be printed later.
```c++
// create string stream
std::ostringstream output;

// add information to string stream
output << firstName << ", " << lastName;

// print output buffer
std::cout << output.str();
```

## File Streams
An ***ifstream*** gets data from a file.
```c++
// try opening file
std::ifstream infile;
infile.open("file.dat");

// ensure file opened 
if (!infile.is_open()) {
	std::cout << "Error reading file.";
	return 1;
}

// close file
infile.close();
```

There are only five main file input functions:

- `.open()`: Opens file
- `.close()`: Closes file
- `.is_open()`: File is open
- `.eof()`: Reached end of file
- `.fail()`: Returns true if encountered error

There are four file input flags:

- `good()`: No errors opening
- `bad()`: Error reading or writing file
- `fail()`: Logical error
- `eof()`: Reached end of file


An ***ofstream*** writes data to file.  It also requires the use of `#include <sstream>` to use.
```c++
// try opening file
std::ofstream outfile;
outfile.open("outfile.dat");

// ensure file opened
if (!outfile.is_open()) {
	std::cout << "Error opening output file.";
	return 1;
}

// output to file
outfile << "Hello World!" << std::endl;

// close file
outfile.close();
```