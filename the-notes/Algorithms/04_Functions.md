# Functions
A ***function*** maps elements of one set to another set such that each element of the first set corresponds to exactly one element of the second set.  In other words, if $$f : X \rightarrow Y$$, then for all $$x \in X$$, there is exactly one $$y \in Y$$ for which $$(x, y) \in f$$.

The set $$X$$ above is called the ***domain*** of $$f$$, $$Y$$ is the ***target*** and is sometimes called the ***co-domain***.  For function $$f: X \rightarrow Y$$, an element $$y$$ is in the range of $$f$$ if and only if there is an $$x \in X$$ such that $$(x,y) \in f$$.

If $$f$$ maps an element of the domain to zero elements or more than one element of the target, then $$f$$ is not ***well-defined***.

Alternatively, a function with a finite domain can be expressed graphically as an ***arrow diagram***. In an arrow diagram for a function $$f$$, the elements of the domain $$X$$ are listed on the left and the elements of the target $$Y$$ are listed on the right.

A mathematical function f is often defined by describing how f acts on an input x, as in $$f(x) = x^2 − 2$$.  However, the definition is not complete until the domain and target of $$f$$ are specified. For example: $$g: \mathbb{R} \rightarrow \mathbb{R}$$, where $$g(x) = |x|$$.

Two functions are ***equal*** if they have the same domain and target, and $$f(x) = g(x)$$ for every $$x$$ in the domain.

## Floor and Ceiling Functions
The ***floor function*** maps a real number to the greatest integer less than or equal to that number.  For example, $$\left\lfloor{3.14}\right\rfloor = 3$$, $$\left\lfloor{3}\right\rfloor = 3$$, and $$\left\lfloor{-3.14}\right\rfloor= -4$$.

The ***ceiling function*** maps a real number to the least integer greater than or equal to that number.  For example, $$\left\lceil{3.14}\right\rceil = 4$$, $$\left\lceil{3}\right\rceil = 3$$, and $$\left\lceil{-3.14}\right\rceil = -3$$.

## Properties of Functions
A function $$f : X \rightarrow Y$$ is ***one-to-one*** or ***injective*** if $$f$$ maps different elements of $$X$$ to different elements of $$Y$$.  In other words, no $$y$$ has two $$x$$.

A function $$f : X \rightarrow Y$$ is ***onto*** or ***surjective*** if for every $$y in Y$$ there is an $$x \in X$$ such that $$f(x) = y$$.  In other words, the range of $$f$$ matches the target $$Y$$.

A function is ***bijective*** if it is both one-to-one and onto.  A bijection is also called a ***one-to-one correspondence***.

When the domain and target are finite sets, it is possible to infer information about their relative sizes based on whether the function is one-to-one or onto.

- If $$f: D \rightarrow T$$ is onto, then for every element in the target, there is at least one element in the domain: $$|D| ≥ |T|$$.
- If $$f: D \rightarrow T$$ is one-to-one, then every element in the domain maps to a unique element in the target: $$|D| ≤ |T|$$.
- If $$f: D \rightarrow T$$ is a bijection, then $$f$$ is one-to-one and onto: $$|D| ≤ |T|$$ and $$|D| ≥ |T|$$, which implies that $$|D| = |T|$$.

## Inverse and Composition
If a function $$f : X \rightarrow Y$$ is a bijection, then the ***inverse*** of $$f$$ exchanges the first and second entries in each pair of $$f$$.  $$f^{-1} = {(y,x) : (x,y) \in f}$$.

The process of applying a function to the result of another function is called ***composition***.  If $$f$$ and $$g$$ are two functions, where $$f: X \rightarrow Y$$ and $$g: Y \rightarrow Z$$. The composition of $$g$$ with $$f$$, denoted $$(g\,\, ο \,f)$$, is the function $$(g\,\, o \,f): X \rightarrow Z,$$ such that for all $$x \in X$$, $$(g\,\, o\, f)(x) = g(f(x))$$.

