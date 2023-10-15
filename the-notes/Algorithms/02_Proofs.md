# Numbers

The ***parity*** of a number is whether the number is odd or even.  We define odd and even numbers logically, as:

- ***Even number***: Follows $x = 2k$, $k \in \mathbb{Z}$
- ***Odd number***: Follows $x = 2k + 1$, $k \in \mathbb{Z}$

A ***rational number*** indicates that there exists some $x$ and $y$, where $y \neq 0$, such that $r = \frac{x}{y}$.  

An integer $y$ ***divides*** $x$ if and only iff $y % x = 0$.  The notation for this is $x|y$.

We define prime and composite numbers as logical expressions.

- ***Prime Number***: $\exists m ((m \in \mathbb{Z} \land m < n) \land n % m = 0 \rightarrow m = 1 \lor m = n)$.
- ***Composite number***: $\exists m ((m \in \mathbb{Z} \land m < n) \rightarrow n % m = 0)$.

## Proof-Writing
Proofs are written in the same format to ensure consistency and readability.  The idea of a proof is to convey an idea to another person, so it is important the person can understand the formatting of the proof.
```c++
Theorem: /* insert theorem */
Proof: /* Start writing proof
*
*
*
*/ QED.
```

***Note**: A common alternative for QED is $\square$.*

A ***universal statement*** is a statement applicable to the entire domain.  This is equivalent to the $∀$ operator and contain "For all" or "For every".

An ***existential statement*** is a statement that applies to a singular value.  This is equivalent to the $\exists$ operator and contain "There exists".

## Methods of Proofs
There are many ways to make a proof, some being more concrete than others.

The most common and less strict is the ***direct proof***, which asks for the conclusion $q$ to be drawn from $p$ and known axioms.  This gives the writer the most flexibility in how they want to write the proof.

#### Proof by Exhaustion
***Proof by exhaustion*** is a method that proves the theorem for every value in the domain.  This is commonly done one-at-a-time for small domains of integer values.

Example: If $n \in {-1, 0, 1}$, prove that $n^2 = |n|$.
```blank
Theorem: If n \in {-1, 0, 1}, then n^2 = |n|.
Proof: We will prove via exhaustion that n^2 = |n| for all n in the domain.
       (-1)^2 = 1 and |-1| = 1.
       (0)^2 = 0 and |0| = 0.
       (1)^2 = 1 and |1| = 1.
Since the equality stands for all n in the domain, we have proved that n^2 = |n| for n = {-1, 0, 1}. QED.
```

#### Universal Generalization
***Universal generalization*** is the process of naming an arbitrary object, proves that the arbitrary statement is valid and provides no more assumptions about the value of the arbitrary object.

Example: Among two consecutive integers, one is odd and one is even.
```blank
Let x be an integer. x can be either odd or even, meaning x = 2k or x = 2k + 1.  Then, x + 1 can either hold the value x = 2k + 1 or x = 2k + 2, respectively.  In both cases, we notice that the parity of the number changes (from even->odd and odd->even respectively).  Therefore, for two consecutive integers, one is odd and one is even. QED.
```

#### Existential Proofs
An ***existence proof*** proves an existential statement.  This type of proof only needs to show that a value exists; it does not matter how the value was found but rather that the value exists and it adheres to the theorem.

Example: Prove that there exists some number $x$ such that $x^2 = x$.
```blank
Let x be a number.  If x is valued at 0, we notice that x^2 = 0 = x.  Since x = 0 makes the theorem true, there exists some x such that x^2 = x. QED.
```

#### Proof by Contrapositive
***Proof by Contrapositive*** uses the fact that if $p \rightarrow q$ is true, then so is $\neg q \rightarrow \neg p$.

#### Proof by Contradiction
***Proof by Contradiction*** assumes that the theorem provided is false, and then works to prove that the theorem is false and looks for a logical error in proving the false statement.

#### Proof by Cases
***Proof by cases*** uses cases that encompass the full domain such that each case is easier to prove.  This is similar to proof by exhaustion, but rather concatenates cases for larger domain into "buckets" where each bucket has the same proof.

Common examples of cases are positive and negative numbers, even and odd numbers, factors of a number, etc.

## Proof Terminology
Below are some common vocabulary words and phrases used in proofs.

- *Thus*/*Therefore*: Follows a previous statement to a new statement.
- *Let*: Used to introduce a new variable.
- *Suppose*: Introduces a new assumption.
- *Since*: Reminder of an earlier (or obvious) fact.
- *By definition*: Fact known because of a definition.
- *By assumption*: Fact known because of a stated assumption.
- *In other words*: Rephrase a statement more specifically.
- *Gives*/*Yields*: One equation follows another.

***Without Loss of Generality (WLOG)*** is a statement that concatenates very similar cases to avoid repetition.  This can be used very effectively but also very incorrectly, so be careful to use it properly to avoid mistakes.
