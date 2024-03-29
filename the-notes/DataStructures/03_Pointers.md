# Pointers
A ***pointer*** is a variable that contains a memory address.

A ***dynamically-allocated array*** is an array whose size can change during runtime.

A ***linked list*** is an ADT whose elements contain both an element and a pointer.

## Arrow Notation
If an object is being referenced by pointer, arrow notation can be used to access an element of that object.
```c++
(*a).b = a->b
```

This can practically be used to access an element of `this`, or the object itself.
```c++
void Square::SetSideLength(const double &side) {
	this->sideLength = side;
}
```

## Referencing
The ***reference operator***, `&`, obtains a variable's memory address.

The ***pointer operator***, `*`, declares a pointer.
```c++
int someInt = 5;
int* somePtr = &someInt;
```

In the case above, `somePtr` holds the memory address of `someInt`.  Printing `somePtr` would return in a hexadecimal memory address rather than `5`.

The pointer operator is also the ***dereference operator***, which returns the value at an address.  This means that printing `*somePtr` would print $$5$$.
```c++
int someInt = 5;
int *somePtr = &someInt;

std::cout << someInt << &someInt << somePtr << *somePtr << std::endl;
// Output: 5 0x7ff7ba5a799c 0x7ff7ba5a799c 5

*somePtr = 10;
std::cout << someInt << *somePtr << std::endl;
// Output: 10 10
```

## Creating and Deleting Memory

A ***nullptr*** is an empty memory address.  Think of it as a string's `""` or an array's `[]`.  This is the default value of a pointer before assignment.
```c++
int *newPtr; //newPtr = nullptr
```

The ***new*** operator allocates new memory and returns a pointer value.  This is used for constructing new objects and having a pointer that points to the new object.
```c++
Point* sample = new Point;
```

The ***delete*** operator deallocates memory associated with the `new` operator.
```c++
delete pointer;
delete[] manyPoints;
```
The `delete` operator should always be used to clean up memory after use.  However, improper use of the operator can lead to dangerous results.

***Note**: Deleting a nullptr does nothing and results in a no-op.  This is not an error.*

A ***memory leak*** is when a program that allocates memory loses the ability to access that memory, typically because of failure to destroy dynamically-allocated memory.

## Parts of Memory
The ***code*** is the region of a program where instructions are stored and executed.

***Static memory*** is where global variables are stored and static (constant) local variables are stored.

The ***stack*** is where local variables are allocated during function call.  The ***heap*** is where the `new` operator allocates memory and the `delete` operator deallocates memory.

## The Big Three
The Big Three is the three major functions (apart from the constructor) that one must have in a class to ensure the proper treatment of dynamic memory.

#### The Destructor
The ***destructor*** is used when variables of that class type are destroyed.
```c++
MyClass::~MyClass() {
	delete[] myVar;
	myVar = nullptr;
}
```

#### The Copy Constructor
The ***copy constructor*** is the constructor called when an object is initialized by copying another object during declaration.
```c++
MyClass::MyClass(const MyClass &obj) {
	dataObj = obj.dataObj;
	*dataObj = *(obj.dataObj);
}
```

#### The Assignment Operator
The ***assignment operator*** eliminates memory leak issues during object copy.  This is done using the "Better Way".
```c++
const MyClass & MyClass::operator=(const MyClass &obj) {
	if (this != *rhs) {
		MyClass temp(obj);
		std::swap(dataObj, temp.dataObj);
		std::swap(*dataObj, *temp.dataObj);
	}
	return *this;
}
```

The ***Rule of 3*** states that a class that deals with dynamic memory allocation must contain the big three.
```c++
class MyClass {
	public:
		MyClass();
		MyClass(int* dataToCopy);
		~MyClass();
		MyClass(const MyClass &obj);
		const MyClass & MyClass::operator=(const MyClass &obj);
};
```