<!---
CS NOTES :: C++ :: EXCEPTIONS

BY: COLE ELLIS

LAST MODIFIED: 17 DEC 2021
-->

# ***C++***: Exceptions
*Error-checking code* is code a programmer writes to detect and handle errors that occur during program execution. 

An *exception* is a circumstance that a program was not designed to handle, such as if the user enters a negative height.

C++ has special constructs, `try`, `throw`, and `catch`, known as *exception-handling constructs*, to keep error-checking code separate and to reduce redundant checks.
```c++
// ... normal code

try {
	/* ... */

	// if error detected
	throw exceptionType;

	/* ... */
} catch (exceptionType excpt) {
	// handle exception
}

// ... continue code
```

The exception-handling construct has three main parts:
- A `try` block block surrounds normal code, which is exited immediately if a throw statement executes.
- A `throw` statement statement appears within a try block; if reached, execution jumps immediately to the end of the try block. The code is written so only error situations lead to reaching a throw.
- A `catch` clause clause immediately follows a try block; if the catch was reached due to an exception thrown of the catch clause's parameter type, the clause executes. The clause is said to catch the thrown exception.

Below is an example of the `try-catch` block for password creation.
```c++
#include <iostream>
#include <stdexcept>
#include <string>

int main() {
   std::string password;
   bool validPassword = false;

   while (!validPassword) {
      try {
         std::cin >> password;

         if (password.length() < 8) {
            throw std::runtime_error("Invalid");
         }

         validPassword = true;
         std::cout << "Accepted" << std::endl;
      }
      catch (runtime_error& excpt) {
         std::cout << "Error: " << excpt.what() << std::endl;
      }
   }

   return 0;
}
```

Exceptions can be used within functions as a better method to ensure that the inputted values are correct.  Here is an example:
```c++
#include <iostream>
#include <stdexcept>

int GetWeight() {
   int weightParam;     // User defined weight
   
   // Get user data
   std::cout << "Enter weight (in pounds): ";
   std::cin >> weightParam;
   
   // Error checking, non-negative weight
   if (weightParam < 0) {
      throw std::runtime_error("Invalid weight.");
   }
   return weightParam;
}

int GetHeight() {
   int heightParam;     // User defined height
   
   // Get user data
   std::cout << "Enter height (in inches): ";
   std::cin >> heightParam;
   
   // Error checking, non-negative height
   if (heightParam < 0) {
      throw std::runtime_error("Invalid height.");
   }
   return heightParam;
}

int main() {
   int weightVal;        // User defined weight (lbs)
   int heightVal;        // User defined height (in)
   float bmiCalc;        // Resulting BMI
   char quitCmd;         // Indicates quit/continue
   
   quitCmd = 'a';

   while (quitCmd != 'q') {
      try {
         // Get user data
         weightVal = GetWeight();
         heightVal = GetHeight();
         
         // Calculate BMI and print user health info if no input error
         bmiCalc = (static_cast<float>(weightVal) /
                    static_cast<float>(heightVal * heightVal)) * 703.0;
         
         std::cout << "BMI: " << bmiCalc << std::endl;
         std::cout << "(CDC: 18.6-24.9 normal)" << std::endl;
      }
      catch (runtime_error &excpt) {
         // Prints the error message passed by throw statement
         std::cout << excpt.what() << std::endl;
         std::cout << "Cannot compute health info." << std::endl;
      }
      
      // Prompt user to continue/quit
      std::cout << std::endl << "Enter any key ('q' to quit): ";
      std::cin >> quitCmd;
   }
   
   return 0;
}
```
`OUTPUT:`
```
Enter weight (in pounds): 150
Enter height (in inches): 66
BMI: 24.208
(CDC: 18.6-24.9 normal)

Enter any key ('q' to quit): a
Enter weight (in pounds): -1
Invalid weight.
Cannot compute health info.

Enter any key ('q' to quit): a
Enter weight (in pounds): 150
Enter height (in inches): -1
Invalid height.
Cannot compute health info.

Enter any key ('q' to quit): q
```

## Multiple Handlers
Sometimes there is a need to throw different exception types.  The `catch(...)` is a catch-all, which catches any type.  This is similar to an `else` or a `default`.
```c++
// ... means normal code
...
try {
   ...
   throw objOfExcptType1;
   ...
   throw objOfExcptType2;
   ...
   throw objOfExcptType3;
   ...
}
catch (ExcptType1& excptObj) {
   // Handle type1
}
catch (ExcptType2& excptObj) {
   // Handle type2
}
catch (...) {
   // Handle others (e.g., type3)
}
... // Execution continues here
```
