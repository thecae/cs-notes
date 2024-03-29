# Arrays and Vectors
An ***array*** is a special variable having one name, but storing a list of data, with each item directly accessible.

- An ***element*** is each item in an array
- An ***index*** is each element's location number.  An element is accessible by its index.

Declaring an array requires a pre-determined array size that cannot be changed after creation.
```c++
int myArray[5]; // creates an array of size 5
```

## Vectors
A ***vector*** is an ordered list of elements of a data type.  Vectors require the inclusion of `#include <vector>` to use and is a member of the standard library.  Vectors can change size at runtime.
```c++
vector<DataType> vectorName(numElements);
vector<DataType> vectorName(numElements, initialValue);
vector<DataType> vectorName = {element01, element02, element03, ..., element n};
```

Vectors have a few functions that encompass its use in the standard library:

- `.at()`: Finds the value at a position.
```c++
vectorName.at(index);
```
- `.size()`: Returns number of elements of a vector
```c++
vectorName.size();
```
- `.resize()`: Changes vectors size, deleting end elements if size shrinks
```c++
vectorName.resize(newSize);
```
- `.push_back()`: Appends an element to the end of the vector
```c++
vectorName.push_back(newElement);
```
- `.back()`: Returns the last element in the vector
```c++
vectorName.back();
```
- `.pop_back()`: Removes the last element of the vector
```c++
vectorName.pop_back();
```

The ***swap*** function changes the names of two variables and is a member of the standard library.

A ***temporary*** variable is a variable that briefly stores a value.  This method can also be used two swap two numbers.

## Vectors Versus Arrays
Vectors and arrays have quite a few differences, making them useful in different situations.

- Arrays have simple syntax and are easy to use, but vectors are safer and less prone to memory overwrite.
- Arrays can't change their size during runtime, but vectors can.  To make an array bigger, you must allocate a new array of a bigger size, then move every element from the old array to the new array.
```c++
int myArray[size]; // constant size
vector.push_back(newElement); // increased size by one
```
- Arrays can be declared with two dimensions but vectors can't.
```c++
int twoDim[rows][cols];
```

## Strings and C-Strings
A ***string*** is a sequence of characters.  It requires the inclusion of `#include <string>` to utilize.
```c++
std::string myStr = "String";
```

A ***c-string*** is a character array that forms a string.  To use a formal c-string, include `#include <cstring>`.
```c++
char myStr[6] = {'S', 't', 'r', 'i', 'n', 'g'};
```

A ***null-terminated string*** is a c-string that ends in a null character.

C-string modification functions include:

- `strcpy(destStr, origStr)`: Copies origStr (until '\0' to destStr)
- `strncpy(destStr, origStr, num)`: Copies up to num chars
- `strcat(destStr, origStr)`: Copies origStr to end of destStr
- `strncat(destStr, origStr, num)`: Copies num chars of origStr

C-string information functions include:

- `strchr(srcStr, searchChar)`: Returns first address, else NULL
- `size_t strlen(srcChar)`: Returns number of characters
- `int str_cmp(str1, str2)`: Returns 0 if equal, else non-zero
