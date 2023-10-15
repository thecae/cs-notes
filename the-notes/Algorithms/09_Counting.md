# Sum and Product Rules
The ***product rule*** provides a way to count sequences.  Let $A_1,A_2,\ldots,A_n$ be finite sets.  Then, $|A_1\times A_2\times \ldots\times A_n|=|A_1|\cdot |A_2|\cdot \ldots\cdot |A_n|$.

$\Sigma$ is a set of a characters, called an ***alphabet***.  In the same way, $\Sigma^n$ is the set of all strings of length $n$ whose characters come from the set $\Sigma$.  If $\Sigma=\{0,1\}$, then $\Sigma^6$ is the set of all binary strings with $6$ bits (i.e. $011101$).  The product rule also applies in this manner: $$|\Sigma^n| 
= |\underbrace{\Sigma \times \Sigma \times \cdots \times \Sigma}_\text{n times}| = 
\underbrace{|\Sigma| \cdot |\Sigma| \cdots |\Sigma|}_\text{n times}
 = |\Sigma|^n$$
 
The ***sum rule*** is applied when there are multiple choices but only one selection is made.  Consider $n$ sets $A_1,A_2,\ldots,A_n$.  If the sets are pairwise disjoint, then $|A_1\cup A_2\cup \ldots\cup A_n|=|A_1|+|A_2|+\ldots+|A_n|$.

## The Bijection Rule
The ***bijection rule*** says that if there is a bijection from one set to another then the two sets have the same cardinality.

A function $f$ from a set $S$ to a set $T$ is called a ***bijection*** if and only if $f$ has a well defined inverse. The inverse of a function f that maps set $S$ to set $T$ is a function $g$ that maps $T$ to $S$ such that for every $s \in S$ and every $t \in T$, $f(s) = t$, if and only if $g(t) = s$. If a function $f$ has an inverse, it is denoted by $f^{-1}$.

The ***$k$-to-1 rule*** uses a $k$-to-1 correspondence to count the number of elements in the range by counting the number of elements in the domain and dividing by $k$.  Let $X$ and $Y$ be finite sets. The function $f : X\rightarrow Y$ is a ***$k$-to-1 correspondence*** if for every $y \in Y$, there are exactly $k$ different $x \in X$ such that $f(x) = y$.  Suppose there is a $k$-to-1 correspondence from a finite set $A$ to a finite set $B$. Then $|B| = \frac{|A|}{k}$.

## Generalized Product Rule
The ***generalized product rule*** says that in selecting an item from a set, if the number of choices at each step does not depend on previous choices made, then the number of items in the set is the product of the number of choices in each step.

Consider a set $S$ of sequences of $k$ items. Suppose there are:

- $n_1$ choices for the first item.
- For every possible choice for the first item, there are $n_2$ choices for the second item.
- For every possible choice for the first and second items, there are $n_3$ choices for the third item.
⋮
- For every possible choice for the first $k-1$ items, there are $n_k$ choices for the $k$th item.

Then |S| = n_1\cdot n_2\cdot\ldots\cdot n_k$.

## Counting Permutations
An ***$r$-permutation*** is a sequence of $r$ terms with no repetitions, all taken from the same set.

A ***permutation*** is a sequence that contains each element of a finite set exactly once.  For example, $\{a,b,c\}$ has six permutations: $(a,b,c), (b,a,c), (c,a,b), (a,c,b), (b,c,a), (c,b,a)$.

To compute, permutations, the notation is $P(n,r)=\dfrac{n!}{(n-r)!}$.

A subset of size $r$ is called an ***$r$-subset***.  An $r$-subset is sometimes referred to as an ***$r$-combination***.

The number of ways to select an $r$-subset from a set of size $n$ is $\displaystyle C(n,r)=\binom{n}{r}=\dfrac{n!}{r!(n-r)!}$.

Gauss' Identity for Combinations says that $${n \choose n-r} = \frac{n!}{(n-r)!(n-(n-r))!} = \frac{n!}{(n-r)!r!} = {n \choose r}.$$

An equation is called an ***identity*** if the equation holds for all values for which the expressions are well-defined.  The equation $\displaystyle \binom{n}{r}=\binom{n}{n-r}$ is an identity.

## Counting by Complement
***Counting by Complement*** is a technique for counting the number of elements in a set $S$ that have a property by counting the total number of elements in $S$ and subtracting the number of elements in $S$ that do not have the property.  The principle of counting by complement can be written using set notation where $P$ is the subset of elements in $S$ that have the property: $$|P|=|S|-|\overline{P}|.$$

## Permutations with Repetitions
A ***permutation with repetition*** is an ordering of a set of items in which some of the items may be identical to each other.

The number of distinct sequences with $n_1$ $1$'s, $n_2$ $2$'s, $\ldots$, $n_k$ $k$'s, where $n = n_1 + n_2 +\ldots+ n_k$ is $\displaystyle \dfrac{n!}{n_1!n_2!\cdots n_k!}$.

## Counting Multisets
A ***multiset*** is a collection that can have the multiple instances of the same kind of item.  When the expression $\{1, 2, 2, 3\}$ is viewed as a set, the repetitions don't matter and $\{1, 2, 2, 3\} = \{1, 2, 3\}$. However, when the expression $\{1, 2, 2, 3\}$ is viewed as a multiset, then the fact that there are two occurrences of 2 is important, and $\{1, 2, 2, 3\} ≠ \{1, 2, 3\}$. Two multisets are equal if they have the same number of each type of element. The curly braces denote the fact that the order in which the elements are listed does not matter, so $\{1, 2, 2, 3\}$ is equal to $\{2, 1, 2, 3\}$.

The number of ways to select n objects from a set of m varieties is $$\binom{n+m-1}{m-1}$$ if there is no limitation on the number of each variety available and objects of the same variety are indistinguishable.

A set of identical items are called ***indistinguishable*** because it is impossible to distinguish one of the items from another. A set of different or distinct items are called ***distinguishable*** because it is possible to distinguish one of the items from the others.

## The Balls in Bins Problem
The table below shows the number of ways to place n balls into m distinguishable bins. Some of the restrictions on the number of balls per bins imply a relationship between m and n. For example, if there can be at most one ball per bin, then m, the number of bins, must be at least n, the number of balls. If the same number of balls must be placed in each bin, then m, the number of bins, must evenly divide n, the number of balls.

Each of the six formulas in the table is explained below based on counting techniques.

| | No Restrictions | At most one ball per bin | Same number of balls per bin |
|-|-----------------|--------------------------|------------------------------|
| | any positive $m,n$ | $m \geq n$ | $m\,\,|\,\,n$ |
| Indistinguishable | $\displaystyle \binom{n+m-1}{m-1}$ | $\displaystyle \binom{m}{n}$ | $1$ |
| Distinguishable | $m^n$ | $P(m,n)$ | $\dfrac{n!}{((n/m)!)^m}$ |

## Inclusion-Exclusion
The ***principle of inclusion-exclusion*** is a technique for determining the cardinality of the union of sets that uses the cardinality of each individual set as well as the cardinality of their intersections.

Inclusion-Exclusion for two sets says if $A$ and $B$ are two finite sets, then $|A ∪ B| = |A| + |B| - |A ∩ B|$.

For three sets, PIE says that if $A$, $B$, and $C$ are three finite sets, then $|A ∪ B ∪ C| = |A| + |B| + |C| - |A ∩ B| - |B ∩ C| - |A ∩ C| + |A ∩ B ∩ C|$.

The generalized principle says that for $n$ sets $A_1,A_2,\ldots,A_n$ that $$\begin{align*}
|A_1 \cup A_2 \cup \cdots \cup A_n|  &= \sum_{j=1}^n |A_j|\\
&\\
& - \sum_{1 \le j \lt k \le n} |A_j \cap A_k|\\
&\\
& + \sum_{1 \le j \lt k \lt  l \le n} |A_j \cap A_k \cap A_l|\\
&\\
\cdots
&\\
& + (-1)^{n+1} |A_1 \cap A_2 \cap \cdots \cap A_n|
\end{align*}$$

A collection of sets is ***mutually disjoint*** if the intersection of every pair of sets in the collection is empty. If we apply the principle of inclusion-exclusion to determine the union of a collection of mutually disjoint sets, then all the terms with the intersections are zero.

## The Pigeonhole Principle
The ***pigeonhole principle*** says that if $n+1$ pigeons are placed in $n$ boxes, then there must be at least one box with more than one pigeon. 

Consider a function whose domain has at least $n$ elements and whose target has $k$ elements, for $n$ and $k$ positive integers. Then there is an element $y$ in the target such that $f$ maps at least $\left\lceil{\frac{n}{k}}\right\rceil$ elements in the domain to $y$.

Suppose that a function $f$ maps a set of $n$ elements to a target set with $k$ elements, where $n$ and $k$ are positive integers. In order to guarantee that there is an element $y$ in the target to which $f$ maps at least $b$ elements from the domain, then $n$ must be at least $k(b - 1) + 1$.