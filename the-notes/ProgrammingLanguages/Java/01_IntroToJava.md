# Intro to Java
***Java*** is an extremely popular and robust programming language known for its portability and consistency across multiple platforms.  The motto for Java upon development was "write once, run everywhere", which is powered by the Java Virtual Machine to allow the same Java code to be written on any platform.

Hello World in Java -
```java
public class HelloWorld {
  public static void main(String[] args) {
    System.out.println("Hello World!");
  }
}
```

## Basic Output
Printing happens at the `System` level in Java.  Functions are written inside packages, so dots (`.`) are used to move inside subpackages to retrieve functions.  The function for printing (with a newline after) is `System.out.println()`.  Without the new line, it is `System.out.print()`.

## Commenting
Comments match the comment style of C++/C#:

- `//` for single-line comments
- `/*` and `*/` for multi-line comments

```java
public class HelloWorld {
  public static void main(String[] args) {
    // print Hello World
    System.out.println("Hello World!");
  }
}
```

Java does not interpret whitespace in code, although it is crucial for readability.

## Compiler and Error-Catching
Java is a ***compiled programming language***, meaning the code we write in a *.java* file is transformed into byte code by a compiler before it is executed by the Java Virtual Machine on your computer.

A compiler is a program that translates human-friendly programming languages into other programming languages that computers can execute.

![](https://content.codecademy.com/courses/learn-java/revised-2019/Java%20M1L1-%20Compilation%20Process%20ART%20409.png)

The terminal command to execute a Java file is `javac MyProgram.java`.  To compile a class, `java MyProgram.class`.

Basic program format:
```java
//This is the class declaration
public class CountComment {
  //This is the main method that runs when you compile
	public static void main(String[] args) {
    //This is where you will define your variable
    int numComments = 6;
    //This is where you will print your variable
    System.out.println(numComments);
	}
  
  //This is the end of the class
}

//This is outside the class
```

## Data Types
Data Types in Java are similar to most other programing languages
```java
public class Creator {
	public static void main(String[] args) {
    String name = "James Gosling"; // string
    int yearCreated = 1995; // integer
    System.out.println(name); // printing variables is the same
    
    double androidShare = 81.7;
    boolean intsCanHoldDecimals = false;
    char expectedGrade = 'A';
	}
}
```

Java also supports the use of compound operators and incrementation.

Java supports the standard ***order of operations*** like every other programming language.

To declare a constant, use the `final` declaration:
```java
final double pi = 3.14;
```

## Strings
So far, we have learned ***primitive*** data types, which are the simplest types of data with no built-in behavior. Our programs will also use Strings, which are ***objects***, instead of primitives. Objects have built-in behavior.

Strings hold sequences of characters. We’ve already seen instances of a String, for example, when we printed out "Hello World". There are two ways to create a String object: using a String literal or calling the String class to create a new String object.

A String literal is any sequence of characters enclosed in ***double-quotes*** (""). Like primitive-type variables, we declare a String variable by specifying the type first:
```java
String greeting = "Hello World";
```

We could also create a new String object by calling the String class when declaring a String like so:
```java
String greeting = new String("Hello World");
```

There are some slight differences in how they're used, but for the most part, string literals will be used.

Java is ***Static typed*** like C, C++, and C#, meaning that a program will not compile if a variable is assigned to the wrong type.

Strings contain similar functions to other languages, one of the most important being `.equals()`.  Since the equality operator is not overloaded, the use of the `equals` function is necessary for comparing strings.

## Classes and Objects
Here is the basic format for a class:
```java
public class Car {
// scope of Car class starts after curly brace
 
  public static void main(String[] args) {
    // scope of main() starts after curly brace
 
    // program tasks
 
  }
  // scope of main() ends after curly brace
 
}
// scope of Car class ends after curly brace
```

In order to make an instance of a class (called an ***object***), a ***constructor*** must be defined.  The constructor shares the same name as the class.
```java
public class Car {
  public Car() {
    // constructor goes here
  }
  
  public static void main(String[] args) {
    // main method
  }
}
```

When an object is created, the constructor sets the ***initial state*** of the object. The state is made up of associated data that represents the characteristics of an object.

We’ll add data to an object by introducing instance variables, or ***instance fields***.  Instance fields are similar to public variables inside of a C++ class; they can be accessed outside the class using the dot `.` operator.
```java
public class Store {
  String productType;
  
  public Store(String product) {
    productType = product;
  }
  
  public static void main(String[] args) {
    Store lemonadeStand = new Store("lemonade"); // constructor
    
    System.out.println(lemonadeStand.productType); // print instance field
  }
}
```

Functions can also be done in this manner:
```java
public class Store {
  String productType;
  
  public Store(String product) {
    productType = product;
  }
  
  // create new public function to advertide
  public void advertise() {
    System.out.println("Selling " + productType + "!");
  }
  
  public static void main(String[] args) {
    Store lemonadeStand = new Store("lemonade");
    
    lemonadeStand.advertise(); // call to function
  }
}
```

