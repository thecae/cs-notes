# Sets
A ***set*** is a collection of objects.  The objects in a set are called ***elements***.  A set can contain just about anything.

***Roster notation*** defines a set as a list of elements enclosed in curly braces.  $A = \{2, 4, 6, 10\}$ is an example of roster notation.  Repeating an element does not change the set, so $A = \{2, 2, 4, 6, 10\}$ is the same set.

The ***empty set*** (or ***null set***) is the set with no elements.  The symbol for the empty set is $\{\}$ or $\varnothing$.

A ***finite set*** is a set whose elements can be numbered $1$ through $n$ for some positive integer $n$.  The ***cardinality*** of a set, $|A|$, is the number of elements in a set.  In the above example, $|A| = 4$.

Below are some common mathematical sets:

- $\mathbb{N}$: The set of natural numbers
- $\mathbb{Z}$: The set of integers
- $\mathbb{Q}$: The set of rational numbers
- $\mathbb{R}$: The set of real numbers

The superscript $+$ is used to indicate the positive elements of a set.  For example, $\mathbb{Z}^+$ is the set of positive integers.

***Set-builder notation*** specifies that the set includes all elements in a larger set that also satisfy certain conditions.  The notation looks like $A = \{x \in S : P(x)\}$.  $A$ takes elements from $S$ that satisfy condition $P(x)$.

The ***universal set***, $U$, is a set that contains all elements mentioned in a particular context.  In a Venn Diagram, $U$ represents the outer box that which all elements are contained.

A set is a ***subset*** of another if every element of that set is in another set.  For example, $A \subseteq B$ if every element of $A$ is in $B$.  If $A \subseteq B$ and $A ≠ B$, then $A ⊂ B$.  This is called a ***proper subset***.

## Sets of Sets
A set can be an element of another set.  For example, $A = \{\{1, 2\}, \varnothing, \{1, 2, 3\}, 1, \{2\}\}\}$ is a set with five unique elements.

***Note**: There is an important distinction of elements.  Note that $2 ∉ A$ while $\{2\} \in A$.*

## Set Operations
The ***intersection*** of two sets is the set of all elements that are in both sets.  In a Venn Diagram, this is the space between the two sets.  For example, if $A = \{a, b, c, d, e, f\}$ and $B = \{d, e, f, g\}$, $A \cap B = \{e, f\}$.

The ***union*** of two sets is the set of all elements in either or both sets.  Note that each element is written only once, meaning that the elements of the intersection should not be written both times.  Using the example above, $A \cup B = \{a, b, c, d, e, f, g\}$.

The ***difference*** between two sets is the elements of the first set that are not in the second.  On a Venn Diagram, this is the region of one set that is unique to only that set.  From $A$ and $B$ above, $A - B = A - (A \cap B) = \{a, b, c\}$.

The ***symmetric difference*** between two sets, ($A \oplus B$), is the set of elements that are in exactly one of the two sets.  Mathematically, $A \oplus B = (A - B) \cup (B - A)$.  In the example above, $A \oplus B = \{a, b, c, g\}$.

The ***complement*** of a set, $\overline{A}$, is all the elements of $U$ that are not in $A$.  If $A = \{x \in \mathbb{Z} : x \text{ is odd}\}$, then $\overline{A}$ is the set of all even integers.

## Set Identities
A ***set identity*** is an equation involving sets that is true regardless of the contents of the set.  The set identities are similar to the logic rules and are as follows:

| Name | Version 1 | Version 2 |
|------|-----------|-----------|
| Idempotent Laws | $A \cup A = A$ | $A ∧ A = A$ |
| Associative Laws | $(A \cup B) \cup C = A \cup (B \cup C)$ | $(A \cap B) \cap C = A \cap (B \cap C)$ |
| Commutative Laws | $A \cup B = B \cup A$ | $A \cap B = B \cap A$ |
| Distributive Laws | $A \cup (B \cap C) = (A \cup B) \cap (A \cap C)$ | $A \cap (B \cup C) = (A \cap B) \cup (A \cap C)$ |
| Identity Laws | $A \cup \varnothing = A$ | $A \cap U = A$ |
| Domination Laws | $A \cap \varnothing = \varnothing$ | $A \cup U = U$ |
| Double Competent Laws | $\overline{\overline{A}} = A$ | ---- |
| Complement Laws | $A \cap \overline{A} = \varnothing$, $\overline{U} = \varnothing$ | $A \cup \overline{A} = U$, $\overline{\varnothing} = U$ |
| De Morgan's Laws | $\overline{A \cup B} = \overline{A} \cap \overline{B}$ | $\overline{A \cap B} = \overline{A} \cup \overline{B}$ |
| Absorption Laws | $A \cup (A \cap B) = A$ | $A \cap (A \cup B) = A$ |

## Cartesian Products
An ***ordered pair*** is written as $(x, y)$.  The two items in the ordered pair are called ***entries***.

The ***Cartesian product*** of two sets is the set of all ordered pairs in which the first entry is in the first set and the second entry is in the second set.  The notation is $A x B = \{(a, b) : a \in A \text{ and } b \in B\}$.

An ordered list of $n$ items is called an ***ordered $n$-tuple***.

## Strings
A sequence of characters is called a ***string***.  The set of characters used in a set of strings is called the ***alphabet***.  The ***length*** of a string is the number of characters in a string.

A ***binary string*** is a string whose alphabet is $\{0, 1\}$.  A ***bit*** is a character in a binary string.

The ***empty string*** is the unique string whose length is $0$.  The notation for the empty string is $λ$.

The ***concatenation*** of two strings is the appendage of the second string to the first string.  As a base case, $xλ = x$.

## Partitions
A ***partition*** of a non-empty set is a collection of non-empty subsets such that each element of the set is in exactly one of the partitions.  $A_1, A_2, ... , A_n$ is a partition of $A$ if all of the following hold:

- For all $i$, $A_i \subseteq A$.
- For all $i$, $A_i ≠ \varnothing$.
- $A_1, A_2, ... , A_n$ are pairwise disjoint.
- $A = A_1 \cup A_2 \cup ... \cup A_n$.

Two sets are ***disjoint*** if their intersection is the null set.  Two sets are ***pairwise disjoint*** if every pair of distinct sets in the sequence is disjoint.
  