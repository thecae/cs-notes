# Loops
Loops are a group of statements that execute multiple times per a specified condition.

## While Loops
A ***while loop*** is a loop that executes the loop body so long as the expression evaluates to `true`.
```c++
while ( /* expression */ ) {
	// loop body
```

An ***infinite loop*** is a loop that never ends because the condition is always met.  These are dangerous to programming and can often be hard to spot.

A ***do-while*** loop is a while loop that executes the statements and then checks the condition.  This guarantees that the loop body runs at least once.
```c++
do {
	// loop body
} while ( /* expression */ );
```

# For Loops
A ***for loop*** is a loop that runs a specific amount of times.
```c++
for (int i = 0; i < 5; ++i) {
	std::cout << i << std::endl;
}
```

Here is the same code written as a while loop:
```c++
int i = 0;
while (i < 5) {
	std::cout << i << std::endl;
	++i;
}
```

A ***Sentinel value*** is a special value that indicates the end of a list.  Sometimes, this can be a `nullptr` and other times the escape character (`\0`).


A ***nested loop*** is a loop inside of a loop.  There can be an infinite number of nested loops.

## Scopes and Loop Manipulation
A ***break statement*** is a statement that immediately causes the loop to exit.
```c++
for (int i = 0; i < num; ++i) {
	if ( /* expression */ ) {
		break;
	}

	// other statements
}
```

A ***continue statement*** is like a break statement, but causes the loop to jump to the next continue check.

The ***scope*** of a variable is the region of code that a variable can access.
```c++
for (int i = 0; i < newNum < ++i) {
	int valSquared = userNum * userNum;
}

std::cout << valSquared << std::endl; // generates error, valSquared unknown
```

A ***block*** is a brace-enclosed sequence of statements.  Variables defined inside a block can't be seen outside.