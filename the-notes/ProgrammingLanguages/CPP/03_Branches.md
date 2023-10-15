# Branching
A ***branch*** is a set of code only executed under certain conditions.

## If Branch
An ***if branch*** is a branch that only passes if a condition is true.
```c++
if (2 == 2) {
	// this code executes
}

if (2 == 3) {
	// this code doesn't execute
}
```

## If-Else Branch
An ***if-else branch*** is an if branch that contains alternative instructions in case the condition fails.
```c++
if (2 == 2) {
	// this code executes
} else {
	// this code won't execute
}

if (2 == 3) {
	// this code doesn't execute
} else {
	// this code will execute
}
```

As seen here, the ***equality operator (`==`)*** is used to determine equality.  The ***inequality operator (`!=`)*** returns true if the two objects are not the same.

## Else-If Branch
An ***else-if branch*** has multiple possible conditions.
```c++
if ( /* expression 1 */ ) {
	// executed if expression 1 is true
} else if ( /* expression 2 */ ) {
	// executed if expression 2 is true and expression 1 is false
} else {
	// executed if both prior expressions are false
}
```

## Logical Operators
A ***logical operator*** treats operators as true or false, and results in a true or false.
- `&&`: AND
- `||`: OR
- `!`: NOT

Logical operators belong in the order of operations and will be the last thing to be executed other than the logical not.

1. Parentheses `()`
2. Logical Not `!`
3. Arithmetic Operators `* / + -`
4. Relational Operators `< <= > >=`
5. Equality Operators `== !=`
6. Logical And `&&`
7. Logical Or `||`

## Switch Statements
A ***switch statement*** represents multi-branch behavior; a better way to use else-if branches if they all refer to the same variable or expression.
- ***Case***: The case is the expressio checked
- ***The default case***: The case executed when no case matches
```c++
switch ( /* expression */ ) {
	case ( /* constant expression 1 */ ):
		// statements
		break;
	case ( /* constant expression 2 */ ):
		// statements
		break;
	/* ... */
	default:
		// default statements
		break;
}
```

Cases can be stacked to have multiple options.
```c++
switch (month) {
	case 3:
	case 4:
	case 5:
		std::cout << "Spring" << std::endl;
		break;
	case 6:
	case 7:
	case 8:
		std::cout << "Summer" << std::endl;
		break;
	default:
		std::cout << "Unknown" << std::endl;
		break;
}
```

A ***boolean*** is a quantitity that can be either true or false.  The typename is `bool`.

The ***ternary operator*** are three operations that stand together to build a one-line conditional statement.
```c++
( /* condition */ ) ? /* value if true */ : /* value if false */;
```

An example of this is:
```c++
int y = (x % 2 == 0) ? x : x + 1;
```