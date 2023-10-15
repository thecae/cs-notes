# Algorithms
An ***algorithm*** is a step-by-step method for solving a problem.  A description of an algorithm usually includes:

- A name for the algorithm
- A brief description of the task performed by the algorithm
- A description of the input
- A description of the output
- A sequence of steps to follow

Algorithms are often described in ***pseudo-code***, which is a language in between written English and a computer language. Steps are formatted carefully as indented lists so as to convey the structure of the approach. The steps themselves are expressed in brief English phrases or mathematical symbols.

An important type of step in an algorithm is an ***assignment***, in which a variable is given a value. An assignment operator is denoted by: `x := y`.

The output of an algorithm is specified by a ***return*** statement. For example, the statement `Return(x)` would return the value of x as the output of the algorithm. A return statement in the middle of an algorithm causes the execution of the algorithm to stop at that point and return the indicated value.

## The If-Statement and If-Else-Statement
An ***if-statement*** tests a condition, and executes one or more instructions if the condition evaluates to true. In a single line if-statement, a condition and instruction appear on the same line.
```c++
if (x = 5), y := 7
```

An if-statement can also be followed by a sequence of indented operations with a final end-if statement. In the block of code below, all $n$ operations would be executed if the condition evaluates to true. If the condition evaluates to false, then the algorithm proceeds with the next instruction after the end-if.
```c++
if ( condition )
    Step 1
    Step 2
    . . .
    Step n
end-if
```

An ***if-else-statement*** tests a condition, executes one or more instructions if the condition evaluates to true, and executes a different set of instructions if the condition evaluates to false. The steps to be executed if the condition evaluates to true are indented below the if-statement. The steps to be executed if the condition evaluates for false are indented below the else statement, followed by a final end-if statement.
```c++
if ( condition )
    /* One or more steps */
else
    /* One or more steps */
end-if
```

## Loops
In a ***for-loop***, a block of instructions is executed a fixed number of times as specified in the first line of the for-loop, which defines an index, a starting value for the ***index***, and a final value for the index. Each repetition of the block of instructions inside the for-loop is called an ***iteration***. The index is initially assigned a value equal to the starting value, and is incremented just before the next iteration begins. The final iteration of the for-loop happens when the index reaches the final value.
```c++
for i = s to t
    Step 1
    Step 2
    . . .
    Step n
end-for
```

The ***while-loop*** is similar to the for-loop in that it provides a way to specify that a sequence of steps should be repeated. A for-loop specifies the number of iterations in advance, via the beginning and ending index values. A while-loop iterates an unknown number of times, ending when a certain condition becomes false.
```c++
while ( condition )
    Step 1
    Step 2
    . . .
    Step n
end-while
```

A ***nested loop*** is a loop that appears within another loop. The nested loop, known as the inner loop, is treated as a sequence of steps inside the outer loop.

## Asymptotic Growth of Functions
Let f be a function that maps positive integers to positive real numbers ($f : \mathbb{Z}^+ → \mathbb{Z}^+$). The ***asymptotic growth*** of the function $f$ is a measure of how fast the output $f(n)$ grows as the input $n$ grows. The classification of functions using $O$, $\Omega$, and $\Theta$ notation (called ***asymptotic notation***) provides a way to concisely characterize the asymptotic growth of a function. Asymptotic notation is a useful tool for evaluating the efficiency of algorithms.

The notation $f = O(g)$ is read "f is Oh of g". $f = O(g)$ essentially means that the function $f(n)$ is less than or equal to $g(n)$, if constant factors are omitted and small values for $n$ are ignored. In the expressions $7n^3$ and $5n^2$, the $7$ and the $5$ are called ***constant factors*** because the values of $7$ and $5$ do not depend on the variable $n$. If $f$ is $O(g)$, then there is a positive number $c$ such that when $f(n)$ and $c\cdot g(n)$ are graphed, the graph of $c\cdot g(n)$ will eventually cross $f(n)$ and remain higher than $f(n)$ as $n$ gets large.

Let $f$ and $g$ be two functions from $\mathbb{Z}^+$ to $\mathbb{R}^+$. Then $f = O(g)$ if there are positive real numbers $c$ and $n_0$ such that for any $n \in \mathbb{Z}^+$ such that $n \geq n_0$, $f(n) \leq c\cdot g(n)$.

The $O$ notation serves as a rough upper bound for functions (disregarding constants and small input values). The $\Omega$ notation is similar, except that it provides a lower bound on the growth of a function.

Let $f$ and $g$ be two functions from $\mathbb{Z}^+$ to $\mathbb{R}^+$. Then $f = \Omega(g)$ if there are positive real numbers $c$ and $n_0$ such that for any $n \in \mathbb{Z}^+$ such that $n \geq n_0$, $f(n) \geq c\cdot g(n)$.

The $\Theta$ notation indicates that two functions have the same rate of growth.

Let $f$ and $g$ be two functions $\mathbb{Z}^+$ to $\mathbb{R}^+$. $f = \Theta(g)$ if $f = O(g)$ and $f = \Omega(g)$.

If $f = \Theta(g)$, then $f$ is said to be ***order*** of $g$.

A function that does not depend on $n$ at all is called a constant function. $f(n) = 17$ is an example of a constant function. Any constant function is $\Theta(1)$.  A function $f(n)$ is said to be polynomial if $f(n)$ is $\Theta(nk)$ for some positive real number $k$.

| Function | Name |
|----------|------|
| $\Theta(1)$ |	Constant |
| $\Theta(\log(\log(n)))$ |	Log log |
| $\Theta(\log(n))$ | Logarithmic |
| $\Theta(n)$ | Linear |
| $\Theta(n \log(n))$ | $n$ log $n$ |
| $\Theta(n^2)$ | Quadratic |
| $\Theta(n^3)$ | Cubic |
| $\Theta(c^n)$, $c > 1$ | Exponential |
| $\Theta(n!)$ | Factorial |

## Algorithm Analysis
The amount of resources used by an algorithm is referred to as the algorithm's ***computational complexity***. The primary resources to optimize are the time the algorithm requires to run (time complexity) and the amount of memory used (***space complexity***). 

The time complexity of an algorithm is defined by a function $f : \mathbb{Z}^+ → \mathbb{Z}^+$ such that $f(n)$ is the maximum number of atomic operations performed by the algorithm on any input of size $n$.

The ***asymptotic time complexity*** of an algorithm is the rate of asymptotic growth of the algorithm's time complexity function $f(n)$.

The most common way to analyze the complexity of algorithms whose run time varies with different features of the input is to count the number of operations performed in the worst (most time-consuming) case. The ***worst-case analysis*** of an algorithm evaluates the time complexity of the algorithm on the input of a particular size that takes the longest time.

The ***worst-case*** time complexity function $f(n)$ is defined to be the maximum number of atomic operations the algorithm requires, where the maximum is taken over all inputs of size $n$.

The input of a given size that maximizes $f(n)$ is the worst-case input for the algorithm. For the searching algorithm given above, the worst-case input is when the item $x$ does not occur in the list at all. Determining an upper bound and a lower bound for the time complexity of an algorithm require two different tasks:
- When proving an upper bound on the worst-case complexity of an algorithm (using Oh-notation), the upper bound must apply for every input of size $n$.
- When proving a lower bound for the worst-case complexity of an algorithm (using $\Omega$ notation), the lower bound need only apply for at least one possible input of size $n$.

Worst-case analysis can lead to overly pessimistic results in some cases if the worst-case input for an algorithm is highly unusual and the algorithm takes much less time on typical inputs. ***Average-case analysis*** is an alternative to worst-case analysis that tries to address this shortcoming. Average-case analysis evaluates the time complexity of an algorithm by determining the average running time of the algorithm on a random input.