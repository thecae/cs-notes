# Intro to C#
***C#*** is the most popular programming langugae in Microsoft to make interactive websites, mobile apps, video games, augmented reality (AR), virtual reality (VR), desktop applications, and back-end services.

- Unlike languages like Ruby and JavaScript, C# has you define the type of each data in a program. Assigning a type essentially tells a computer what operations can and cannot be performed on a piece of data. This style of coding helps programmers avoid a large class of errors that are common to Ruby and JavaScript.
- Like Java, C# is built by defining objects that interact with each other, which makes code reusable and easy to manage.

Hello World in C# -
```cs
using System;

namespace HelloWorld {
  class Program {
    static void Main() {
      Console.WriteLine("Hello World!");    
    }
  }
}
```

## Input and Output
C# uses the ***console*** command to write and read information to and from the console.  The respective commands for writing and reading are `WriteLine()` and `ReadLine()`.

A ***placeholder*** is how variables are included into the output.  Like the `.format()` command in Python (and the equivalent `string.Format()` command in C#), it is used to directly name variables where they belong.
```cs
using System;

namespace GettingInput {
  class Program {
    static void Main() {
      Console.WriteLine("How old are you?");
      string input = Console.ReadLine();
      Console.WriteLine($"You are {input} years old!");
    }
  }
}

```

***Note**: The dollarsign (`$`) before the string is necessary whenever using a placeholder in the string text.*

`Console.Write()` is used when a new line is not desired. 

## Comments
Comments match the comment style of C++:

- `//` for single-line comments
- `/*` and `*/` for multi-line comments
```cs
using System;

namespace GetInput {
  class Program {
    static void Main() {
      // gets input and returns input formatted
      Console.WriteLine("How old are you?");
      string input = Console.ReadLine();
      Console.WriteLine($"You are {input} years old!");
    }
  }
}
```

## Data Types
C# is a ***strongly-typed*** language, meaning that every data type of every variable is explicitly written.  Below are the most common data types that are used.

| Type | Description | Size (bits) | .NET type | Range |
|------|-------------|-------------|-----------|-------|
| `int` | Whole numbers | $4$ | `System.Int32` | $[-2,147,483,648, \,\,2,147,483,648]$
| `long` | Whole numbers (more range) | $8$ | `System.Int64` | $[-9,223,372,036,854,775,808,\,\, 9,223,372,036,854,775,807]$
| `float` | Floating-point numbers | $4$ | `System.Single` | $[-3.4\times 10^{38},\,\, 3.4\times 10^{38}]$
| `double` | Double precision FP | $8$ | `System.Double` | $[-1.7\times 10^{308},\,\, 1.7\times 10^{308}]$
| `decimal` | Monetary values | $16$ | `System.Decimal` | $28$ sig figs
| `char` | Single character | $2$ | `System.Char` | N/A
| `bool` | Boolean | $1$ | `System.Boolean` | `True` or `False`
| `DateTime` | Moments in time | $8$ | `System.DateTime` | $[0:0:00 \,\,01/01/0001,\,\, 23:59:59 \,\,12/31/9999]$
| `string` | Sequence of characters | $2$/char | `System.String` | N/A

Assigning the variables in C# is the same as every other strongly-typed language.

C# uses camelCase for variable, object, and function naming.  C# also has its own list of ***reserved keywords***, which can be found [here](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/).

Datatypes can be converted in two ways:

- ***Implicit Conversion***: Happens automatically when a variable of one type is assigned to the value of a variable with a different data type.  This will not yield an error only of there is no data lost during the conversion.
```cs
int myInt = 423;
double myDouble = 423.324;

double newDouble = myInt; // will not cause an error
int newInt = myDouble; // will cause an error
```

- ***Explicit Conversion***: Requires a static cast between the data types in the case that data is lost.  Before the value, use `(DataType)`.
```cs
double myDouble = 423.324;

int newInt = (int)myDouble; // will not cause an error, rounds to nearest integer
```

Note that it is also possible to use built-in functions to convert between data types.  For example, there is `Convert.ToString()` and `Convert.ToDouble()`.

```cs
Console.Write("Enter your favorite number! ");
int faveNumber = Console.ToInt32(Console.ReadLine());
```

C# follows the ***order of operations*** when doing calculations, like every other language.  C# also supports the incrementation operator and modulus.

## The Math Module
The ***math module*** is an important tool for mathematical computation.  Like C++, it supports many of the same functions: `Math.Ceiling()`, `Math.Floor()`, `Math.Abs()`, `Math.Pow()`, etc.