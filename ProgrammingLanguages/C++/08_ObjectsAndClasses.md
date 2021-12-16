<!---
CS NOTES :: C++ :: OBJECTS AND CLASSES

BY: COLE ELLIS

LAST MODIFIED: 16 DEC 2021
-->

# ***C++***: Objects and Classes
An *object* is a group of data and operations that be performed on that data.

*Abstraction* is how the user interacts with a program at a high-level but hides the low-level backend of the program.

## Using Classes
A *Class* defines a new type that groups data and functions into an object (or container).

A class has *public member functions*, which are all the oeprations that a class user can perform on the object.  They are marked under a `public` section in the class definition.
```c++
class Restaurant {
	public:
		void setName(const std::string &restaurantName);

		void setRating(const size_t &userRating);

		void print() const;
};
```
***Note**: The semicolon at the end of the class definition is intended.  Class definitions are not methods and as such must end with a semicolon.*

A *member access operator* invokes a function on an object.  The operator is `.` and is placed after the object name.
```c++
int main() {
	Restaurant lunchPlace;
	lunchPlace.setName("McDonalds");

	return 0;
}
```

A class also has *private data members*, which are variables and functions that the member functions can access but the class user cannot.  This is where all backend computation is done.
```c++
class Restaurant {
	private:
		size_t rating;

		std::string name;

	public:
		void setName(const std::string &restaurantName);

		void setRating(const size_t &userRating);

		void print() const;
};
```

## Defining a Class
There are two parts to making a class function.  These are done independently of one another, usually in two separate files (a header *.h* file and a definition *.cpp* file).
- *Function Declaration*: Contains the function name, return type, and parameter tpes.  This is the header of the function that is seen in the class declarations above and belongs in a *.h* file.
- *Function Definition*: Along with the function declaration, this contains the function statements and return value.  This is written in a dedicated definition *.cpp* file.

The *scope resolution operator* precedes the function name in the definition file and indicates to the compiler that the function is a part of the class.
```c++
class myClass {
	private:
		int numA;

	public:
		void Fct(); // function declaration
};

void myClass::Fct() { // function definition
	numA = 0;
}

```

This can be done inline, but is not recommended for readability.
```c++
class myClass {
	private:
		int numA;

	public:
		void Fct() { // inline declaration and definition
			numA = 0;
		}
};
```

## Mutators and Accessors
A *mutator* can modify a class' data members.  This is most commonly seen with a `set` function that sets the variable name of a class.  This is also known as a *setter function*.
```c++
Person president;
president.setName("Joe Biden"); // mutator
```

An *accessor* is a function that returns the value of a private variable.  This is also known as a *getter function*.
```c++
Person president;
president.setName("Joe Biden");
std::cout << president.getName("Joe Biden"); // accessor, prints "Joe Biden"
```

*Private helper functions* are private functions that help public functions carry out a task.  It makes the public functions easier to read.
```c++
class Restaurant {
	private:
		int[100] lastHundredRatings;

		std::string name;

		double computeAverage(const int[] &array);

	public:
		void setName(const std::string &restName);

		double getRating() const;
};

double Restaurant::getRating() const {
	return computeAverage(lastHundredRatings);
}

double Restaurant::computeAverage(const int[] &array) {
	int total = 0;
	for (const int &item : array) {
		total += item;
	}
	return total / ((double) array.size());
}
```

## Constructors
A *constructor* is a function that is called when a variable is declared and can initialize data members.  The purpose of this is to give every private variable a value upon object creation.
```c++
class Restaurant {
	private:
		std::string name;

		int rating;

	public:
		Restaurant();

		void setName(const std::string &restName);

		void setRating(const int &userRating);

		void print() const;
};

Restaurant::Restaurant() { // default constructor
	name = "No Name";
	rating = -1;
}
```

The better way to do this is using the base member inilization (`:`) to initialize variables.  This doesn't call the inside of the method when you create it.
```c++
Restaurant::Restaurant() : name("No Name"), rating(-1) { // default constructor
	// do nothing inside
}
```

## Class Files
As mentioned previously, files are typically separated between declaration and definition.
- *ClassName.h*: Contains class definition and function declarations
- *ClassName.cpp*: Contains member function definitions

Below are how files look like for an example class.
```c++
// StoreItem.h
#ifndef STORE_ITEM_H
#define STORE_ITEM_H

class StoreItem {
	private:
		int weightOunces;

	public:
		void setWeight(const int &ounces);

		void print() const;
};

#endif /* STORE_ITEM_H */

// StoreItem.cpp
#include <iostream>
#include "StoreItem.h"

void StoreItem::setWeight(const int &ounces) {
	weightOunces = ounces;
}

void StoreItem::print() const {
	std::cout << "Weight (ounces): " << weightOunces << std::endl;
}

// main.cpp
#include <iostream>
#include "StoreItem.h"

int main() {
	StoreItem item1;

	item1.setWeight(16);
	item1.print();

	return 0;
}
```

A *test bench* is a program that throughly test input and output via test cases.  It runs sequential 	`if` statements and `try-catch` blocks that ensure that the program output matches the expected output.

## Overloading
To *overload* an operator or function is to redefine the function to be operable for abstract data types.  These are another function that appear in the class.

A *constructor overload* overloads the default constructor to allow for multiple types of inputs.

An *operator overload* overloads built-in operators to allow for object utilization.  Below are the operator overloads for the `Time` class.
```c++
// addition overload
Time Time::operator+(const Time &rhs) {
	Time timeTotal;
	timeTotal.hours = hours + rhs.hours;
	timeTotal.minutes = minutes + rhs.minutes;

	return timeTotal;
}

// equality overload
bool operator==(const Time &lhs, const Time &rhs) {
	return (lhs.getHours() == rhs.getHours() && lhs.getMinutes() == rhs.getMinutes());
}

// less than operator overload
bool operator<(const Time &lhs, const Time &rhs) {
	return (lhs.getHours() < rhs.getHours() || 
	       (lhs.getHours() == rhs.getHours() && lhs.getMinutes() < rhs.getMinutes()));
}
```

## Statics
A *static* is a variable that is allocated in memory exactly once.

A *static data member* is a data member of a class rather than an object.

A *static member function* is a class function that is independent of class objects.