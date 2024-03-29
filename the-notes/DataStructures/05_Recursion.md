# Recursive Algorithms
An ***algorithm*** is a sequence of steps that are followed for solving a problem.

A ***recursive algorithm*** is an algorithm that breaks the problem into sub-problems and applies the same algorithm.  A ***recursive function*** is a function that calls itself.
```c++
size_t Factorial(int n) {
	if (n == 1) {
		return n;
	}
	return n * Factorial(n - 1);
}
```

The ***base case*** is the case where the algorithm actually indicates what to do.  In the case above, $$n = 1$$ is the base case.  A recursive algorithm can have many bases cases, but must have one.  The general best idea is to determine the base case and then write the recursive case. 

## Recursive Searching and Sorting
***Binary Search*** is a recursive function that begins at the midpoint of a sorted array and halves the range after each iteration.

***Quicksort*** is a recursive algorithm that repeatedly partitions the set into high and low portions and then sorts those portions.

The ***pivot*** is the point of partition, most commonly the first or middle element of the array.

Quicksort offers the following speed of sorting:

- Number of comparisons: $$n\log_2(n)$$
- Levels of partition: $$\log_2(n)$$

## Stack Overflow
A program exhibits ***conditional compilation*** as a method of debugging outputs.

The ***stack frame*** is local memory reserved for parameters, variables, and function items.  It essentially serves as a heap or RAM.

***Stack overflow*** happens when the stack frame extends beyond the allocated region.