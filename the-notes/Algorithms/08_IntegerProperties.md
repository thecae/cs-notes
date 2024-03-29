# The Division Algorithm
***Integer Division*** is where the input and output values must always be integers.  For example, $$\frac{9}{4}=2.25$$.

The term ***divides*** indicates for two integers $$x\neq 0$$ and $$y$$, that there is some integer $$k$$ such that $$y=kx$$.  It is written as $$x\,|\,y$$ and is read "$$x$$ divides $$y$$".  If $$x$$ divides $$y$$, then $$y$$ is a ***multiple*** of $$x$$, and $$x$$ is a ***factor*** or ***divisor*** of $$y$$.

A ***linear combination*** of two numbers is the sum of multiples of those numbers.

The ***division algorithm*** states that the result of the division and the remainder are unique.  Let $$n$$ be an integer and let $$d$$ be a positive integer.  Then, there are unique $$q$$ and $$r$$ with $$0\leq r \leq d-1$$ such that $$n=qd+r$$.

We define $$q$$ and $$r$$ in terms of $$n$$ and $$d$$ using the following functions:

- ***Division***: $$q = n \text{ div } d$$
- ***Modulus***: $$r = n \bmod d$$

There are two cases the encompass the procedural version of the division algorithm.

- *Case 1*: $$n \geq 0$$
```c++
q := 0
r := n
while (r ≥ d):
  q := q + 1
  r := r - d
end-while
```

- *Case 2*: $$n < 0$$
```c++
q := 0
r := n
while (r ≥ d):
  q := q - 1
  r := r + d
end-while
```

## Modular Arithmetic
***Addition mod m*** is the operation defined by adding two numbers and applying $$\bmod m$$. ***Multiplication mod m*** is the operation defined by multiplying two numbers and applying $$\bmod m$$.

A ***ring*** is a closed system containing $$\bmod m$$ operations.  The ring $$\{0,1,2,\ldots,m-1\}$$ is denoted by $$\mathbb{Z}_m$$.

Let $$m$$ be an integer greater than $$1$$. Let $$x$$ and $$y$$ be any two integers. Then $$x$$ is ***congruent to $$y$$ mod $$m$$*** if $$x \bmod m = y \bmod m$$. The fact that $$x$$ is congruent to $$y \bmod m$$ is denoted $$x \equiv y \pmod m$$.  The consequence of this that $$x\equiv y\pmod m$$ if and only if $$m|(x-y)$$.

There are three important formulas for modular arithmetic: $$$$\begin{align*} \big((x\bmod m)+(y\bmod m)\big)\bmod m &=(x+y)\bmod m \\ \big((x\bmod m)(y\bmod m)\big)\bmod m &=(xy)\bmod m \\ \left(x^y\right)\bmod m &=\left(x\bmod m\right)^y\bmod m \end{align*}$$$$

## GCD and Euclid's Algorithm
Let x and y be two positive integers. Then $$\gcd(x, y) = \gcd(y \bmod x, x)$$.

The ***Euclidean Algorithm*** is heavily based on this idea and seeks to find the Greatest Common Divisor of any two numbers by repeating this process.  The algorithm is as follows:
```c++
The Euclidean Algorithm

Input: Two positive integers, x and y
Output: gcd(x,y)

if (y < x):
  swap(x,y)
r := y mod x

while (r ≠ 0):
  y := x
  x := r
  r := y mod x
end-while

return(x)
```

The ***Extended Euclidean Algorithm*** is an algorithm to find coefficients $$s$$ and $$t$$ such that $$\gcd(x,y)=sx+ty$$.  The key fact is that in each iteration of the loop, $$r$$ is assigned the value ($$y \bmod x$$). Let $$d = y \text{ div } x$$. According to the definition of the $$\bmod$$ and $$\text{div}$$ functions, $$y = dx + r$$, where $$r$$ is an integer in the range from $$0$$ to $$x - 1$$. The equality can be rearranged to express $$r$$ as a linear combination of $$x$$ and $$y$$: $$r = y - dx$$. Thus, each iteration of the loop gives an equation expressing the current value of $$r$$ as a linear combination of the current $$x$$ and $$y$$. In the last iteration of the loop $$r = 0$$ and in the second to last iteration of the loop r is the $$\gcd$$ of the two input integers. The values for $$s$$ and $$t$$ in the theorem above can be found by a series of substitutions using the equation from each iteration.

A ***multiplicative inverse mod n*** (or just ***inverse mod n***) of an integer $$x$$m is an integer such that $$sx \bmod n = 1$$.