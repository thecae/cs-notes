# Sequences
A ***sequence*** is a special type of function in which the domain is a set of consecutive integers.  When a function is specified as a sequence, it can either be written in function terms ($$g(k)$$) or using a subscript ($$g_k$$).

A value $$g(k)$$ is called a ***term*** of the sequence, and $$k$$ is the ***index*** of $$g(k)$$.  The entire sequence is denoted by $$\{g(k)\}$$.

A sequence with a finite domain is called a ***finite sequence***.  In a finite sequence, there is an ***initial index*** $$m$$ and a ***final index*** $$n$$, where $$n \geq m$$.  Then, $$a(m)$$ is the ***initial term*** and $$a(n)$$ is the ***final term***.  A sequence with an infinite domain is called an infinite sequence. In an infinite sequence, the indices go to infinity in the positive direction. There is an initial index $$m$$, and the sequence is defined for all indices $$k$$ such that $$k \geq m$$.

A sequence can be specified by an ***explicit*** formula showing how the value of the term $$a_k$$ depends on $$k$$.  For example, $$a_k = 2^k$$ for $$k \geq 1$$ shows the infinite sequence $$\{a_k\} = 2, 4, 8, 16, \ldots$$.

A sequence is increasing if for every two consecutive indices, $$k$$ and $$k + 1$$, in the domain, $$a_k < a_{k+1}$$. A sequence is non-decreasing if for every two consecutive indices, $$k$$ and $$k + 1$$, in the domain, $$a_k ≤ a_{k+1}$$. Notice that an increasing sequence is always non-decreasing as well, because if $$a_(k) < a_{k+1}$$ then it is also true that $$a_k ≤ a_{k+1}$$.  A sequence is decreasing if for every two consecutive indices, $$k$$ and $$k + 1$$, in the domain, $$a_k > a_{k+1}$$. A sequence is non-increasing if for every two consecutive indices, $$k$$ and $$k + 1$$, in the domain, $$a_k ≥ a_{k+1}$$.

## Geometric and Arithmetic Sequences
A ***geometric sequence*** is a sequence of real numbers where each term after the initial term is found by taking the previous term and multiplying by a fixed number called the ***common ratio***. A geometric sequence can be finite or infinite.

An ***arithmetic sequence*** is a sequence of real numbers where each term after the initial term is found by taking the previous term and adding a fixed number called the ***common difference***. An arithmetic sequence can be finite or infinite.

## Recurrence Relations
A rule hat defines the term $$a(n)$$ as a function of previous terms in the sequence is called a ***recurrence relation***.

Below is the recurrence relation defining an arithmetic sequence.
$$$$\begin{cases}
a_0 = a \text{ (initial value)} \\
a_n = d + a_{n-1} \text{ (recurrence relation)} \end{cases}$$$$

Below is the recurrence relation defining a geometric sequence.
$$$$ \begin{cases}
a_0 = a \text{ (initial value)} \\
a_n = r *** a_{n-1} \text{ for } n \geq 1 \text{ (recurrence relation)} \end{cases}$$$$

A famous recurrence relation is known as the ***Fibonacci sequence***, which is frequently used to model population growth and analyzing data structures and algorithms.  The sequence is defined by:
$$$$\begin{cases}
f_0 = 0 \\
f_1 = 1 \\
f_n = f_{n-1} + f_{n-2} \end{cases}$$$$

## Summations
***Summation notation*** is used to express the sum of terms in a numerical sequence.  The notation is expressed using capital sigma ($$\Sigma$$): $$$$\sum_{i=s}^{t}{a_i}=a_s+a_{s+1}+\ldots+a_t.$$$$  The variable $$i$$ is called the ***index*** of the summation.  The value $$s$$ is the ***lower limit*** and $$t$$ is the ***upper limit*** of the summation.

The expression $$\displaystyle\sum_{j=1}^{4}{j^3}$$ is called the ***summation form*** and the expression $$1^3+2^3+3^3+4^3$$ is called the ***expanded form***.

A ***closed form*** for a sum is a mathematical expression that expresses the value of the sum without summation notation.

For an arithmetic sequence, $$$$\sum_{k=0}^{n-1}{(a+kd)}=an+\dfrac{dn(n-1)}{2}.$$$$

For a geometric sequence, $$$$\sum_{0}^{n-1}{a\cdot r^k}=\dfrac{a(r^n-1)}{r-1}.$$$$

A term can be pulled out from either the front or back end:
$$$$\sum_{k=m}^{n}{a_k}=a_m+\sum_{k=m+1}^{n}{a_k}=\sum_{k=m}^{n}{a_k}+a_n.$$$$

## Mathematical Induction
***Mathematical Induction*** is a proof technique for proving statements about elements in a sequence.  There are two components of an inductive proof:

- ***Base Case***: Establishes that the theorem is true for the first value in the sequence.
- ***Inductive Step***: Establishes that if the theorem is true for $$k$$, then the theorem also holds for $$k+1$$.

The ***Principle of Mathematical Induction***: If the base case (for $$n=1$$) is true and the inductive step is true, then the theorem holds for all positive integers.

In the statement "$$S(k)$$ implies $$S(k+1)$$" of the inductive step, the supposition that $$S(k)$$ is true is called the ***inductive hypothesis***.  The steps to prove an inductive hypothesis are:

- Prove the base case ($$n=1$$)
- Find the recurrence relation
- Assume that $$k+1$$ is true
- Prove that the equality is true

The ***Principle of Strong Induction*** assumes that the fact to be proven holds for all values less than or equal to $$k$$ and process that the fact holds for $$k+1$$.  Strong induction also has two components:

- ***Base Case***: $$S(0)$$ and $$S(1)$$ are true.
- ***Inductive Step***: For every $$k \geq 1$$, $$(S(0) \land S(1) \land \ldots \land S(k))\rightarrow S(k+1)$$.

The ***well-ordering principle*** says that any non-empty subset of the non-negative integers has a smallest element.

## Loop Invariants
The field of ***program verification*** is concerned with formally proving that programs perform correctly. A program's correct behavior is defined by stating that if a ***pre-condition*** is true before the program starts, then the program will end after a finite number of steps and a ***post-condition*** is true after the program ends.

Using this to compute the minimum of three values:
```
ComputeMin(x, y, z)

     // Pre-condition for the program = pre-condition for Segment 1
     // [x,y,z are three numbers]

min := x;  //Segment 1

     // Post-condition for Segment 1 = pre-condition for Segment 2
     // [min ∈ {x} and min ≤ x]

If (y ≤ min), then min := y;  //Segment 2

     // Post-condition for Segment 2 = pre-condition for Segment 3
     // [min ∈ {x,y}, min ≤ x, and min ≤ y]

If (z ≤ min), then min := z;  //Segment 3

     // Post-condition for Segment 3 = post-condition for the program
     // [min ∈ {x,y,z}, min ≤ x, min ≤ y, and  min ≤ z]

Return(min)
```

A ***loop invariant*** is an assertion that is true before each iteration of a loop. Below are the steps in using a loop invariant:
Given a while loop with condition C and a loop invariant I, the four steps below are sufficient to establish that if the pre-condition is true before the loop, then the post-condition is true after the loop:

- Show that if the pre-condition is true before the loop begins, then $$I$$ is also true.
- Show that if $$C$$ and $$I$$ are both true before an iteration of the loop, then I is true after the iteration.
- Show that the condition $$C$$ will eventually be false.
- Show that if $$\neg C$$ and $$I$$ are both true, then the post-condition is true.

## Recursive Definitions
The factorial function $$f(n) = n!$$ for $$n \geq 0$$ can be defined as: $$f(n)=n!=n(n-1)(n-2)\ldots(2)(1)$$.  However, a more precise definition that eliminates the ambiguous ellipses is $$$$\begin{cases} f(0)=1 \\ f(n)=n\cdot f(n-1) \text{ for } n\geq 1 \end{cases}$$$$

The second definition is a recursive definition.  In a ***recursive definition***, the value of the function is defined in terms of the output value of the function on smaller input values.  ***Recursion*** is the process of computing the value of a function using the result of the function on smaller input values.

There are three components of a recursive definition on a set:

- A ***basis*** explicitly states that one or more specific elements are in the set.
- A ***recursive rule*** shows how to construct additional elements in the set from elements already known to be in the set. (There is often more than one recursive rule).
- An ***exclusion statement*** states that an element is in the set only if it is given in the basis or can be constructed by applying the recursive rules repeatedly to elements given in the basis.

## Structural Induction
***Structural induction*** is a type of induction used to prove theorems about recursively defined sets that follows the structure of the recursive definition.

*Example*: A string of parentheses is ***balanced*** if the number of left parentheses is equal to the number of right parentheses.

## Recursive Algorithsm
A ***recursive algorithm*** is an algorithm that calls itself. Like recursively defined sequences and structures, a recursively defined algorithm has a base case in which the output is computed directly on an input of small size or value. On a larger input, the algorithm calls itself on an input of smaller size and uses the result to construct a solution to the larger input. An algorithm's calls to itself are known as ***recursive calls***. Here is an example of a recursive algorithm to compute n!.
```
Factorial(n)

Input: Non-Negative Integer n
Output: n!

if (n = 0), Return(1)
r := Factorial(n - 1) // Recursive call

Return (r * n)
```

A ***divide-and-conquer algorithm*** solves a problem recursively by breaking the original input into smaller sub-problems of roughly equal size. There are three basic steps in a divide-and-conquer algorithm:

- Break the input into smaller sub-problems of the same type on smaller inputs
- Solve each sub-problem recursively
- Combine the solutions of the sub-problems to obtain a solution to the original problem

Below is the algorithm to find the smallest element in a list:
```
FindMin(L)

If L has only one item x, Return(x)

Break list L into two lists, A and B

a := FindMin(A)
b := FindMin(B)

If (a ≤ b), then Return(a)
Else Return(b)
```