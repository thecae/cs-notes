<!---
CS NOTES :: ALGORITHMS :: SETS

BY: COLE ELLIS

LAST MODIFIED: 20 DEC 2021
-->

# ***Algorithms***: Sets
A *set* is a collection of objects.  The objects in a set are called *elements*.  A set can contain just about anything.

*Roster notation* defins a set as a list of elements enclosed in curly braces.  `A = {2, 4, 6, 10}` is an example of roster notation.  Repeating an element does not change the set, so `A = {2, 2, 4, 6, 10}` is the same set.

The *empty set* (or *null set*) is the set with no elements.  The symbol for the empty set is `{}` or `∅`.

A *finite set* is a set whose elements can be numbered `1` through `n` for some positive integer `n`.  The *cardinality* of a set, `|A|`, is the number of elements in a set.  In the above example, `|A| = 4`.

Below are some common mathematical sets:
- `ℕ`: The set of natural numbers
- `ℤ`: The set of integers
- `ℚ`: The set of rational numbers
- `ℝ`: The set of real numbers

The superscript `+` is used to indicate the positive elements of a set.  For example, `ℤ+` is the set of positive integers.

*Set-builder notation* specifies that the set includes all elements in a larger set that also saitisfy serctain conditions.  The notation looks like `A = {x ∈ S : P(x)}`.  `A` takes elements from `S` that satisfy condition `P(x)`.

The *universal set*, `U`, is a set that contains all elements mentioned in a particular context.  In a Venn Diagram, `U` represents the outer box that which all elements are contained.

A set is a *subset* of another if every element of that set is in another set.  For example, `A ⊆ B` if every element of `A` is in `B`.  If `A ⊆ B` and `A ≠ B`, then `A ⊂ B`.  This is called a *proper subset*.

## Sets of Sets
A set can be an element of another set.  For example, `A = {{1, 2}, ∅, {1, 2, 3}, 1, {2}}}` is a set with five unique elements.

***Note**: There is an important distinction of elements.  Note that `2 ∉ A` while `{2} ∈ A`.*

## Set Operations
The *intersection* of two sets is the set of all elements that are in both sets.  In a Venn Diagram, this is the space between the two sets.  For example, if `A = {a, b, c, d, e, f}` and `B = {d, e, f, g}`, `A ∩ B = {e, f}`.

The *union* of two sets is the set of all elements in either or both sets.  Note that each element is written only once, meaning that the elements of the intersection should not be written both times.  Using the example above, `A ∪ B = {a, b, c, d, e, f, g}`.

The *difference* between two sets is the elements of the first set that are not in the second.  On a Venn Diagram, this is the region of one set that is unique to only that set.  From `A` and `B` above, `A - B = A - (A ∩ B) = {a, b, c}`.

The *symmetric difference* between two sets, (`A XOR B`), is the set of elements that are in exactly one of the two sets.  Mathematically, `A XOR B = (A - B) ∪ (B - A)`.  In the example above, `A XOR B = {a, b, c, g}`.

The *complement* of a set, `A'`, is all the elements of `U` that are not in `A`.  If `A = {x ∈ ℤ : x is odd}`, then `A'` is the set of all even integers.

## Set Identities
A *set identity* is an equation involving sets tha is true regardless of the contents of the set.  The set identities are similar to the logic rules and are as follows:

| Name | Version 1 | Version 2 |
|------|-----------|-----------|
| Idempotent Laws | `A ∪ A = A` | `A ∧ A = A` |
| Associative Laws | `(A ∪ B) ∪ C = A ∪ (B ∪ C)` | `(A ∩ B) ∩ C = A ∩ (B ∩ C)` |
| Commutative Laws | `A ∪ B = B ∪ A` | `A ∩ B = B ∩ A` |
| Distributive Laws | `A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∩ C)` | `A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)` |
| Identity Laws | `A ∪ ∅ = A` | `A ∩ U = A` |
| Domination Laws | `A ∩ ∅ = ∅` | `A ∪ U = U` |
| Double Competent Laws | `(A')' = A` | ---- |
| Complement Laws | `A ∩ A' = ∅`, `U' = ∅` | `A ∪ A' = U`, `∅' = U` |
| De Morgan's Laws | `(A ∪ B)' = A' ∩ B'` | `(A ∩ B)' = A' ∪ B'` |
| Absorption Laws | `A ∪ (A ∩ B) = A` | `A ∩ (A ∪ B) = A` |

## Cartesian Products
An *ordered pair* is written as `(x, y)`.  The two items in the ordered pair are called *entries*.

The *Cartesian product* of two sets is the set of all ordered pairs in which the first entry is in the first set and the second entry is in the second set.  The notation is `A x B = {(a, b) : a ∈ A and b ∈ B}`.

An ordered list of `n` items is called an *ordered `n`-tuple*.

## Strings
A sequence of characters is called a *string*.  The set of characters used in a set of strings is called the *alphabet*.  The *length* of a string is the number of characters in a string.

A *binary string* is a string whose alphabet is `{0, 1}`.  A *bit* is a character in a binary string.

The *empty string* is the unique string whose length is `0`.  The notation for the empty string is `λ`.

The *concatentation* of two strings is the appendage of the second string to the first string.  As a base case, `xλ = x`.

## Partitions
A *partition* of a non-empty set is a collection of non-empty subsets such that each element of the set is in exactly one of the partitions.  `A1, A2, ... , An` is a partition of `A` if all of the following hold:
- For all `i`, `Ai ⊆ A`.
- For all `i`, `Ai ≠ ∅`.
- `A1, A2, ... , An` are pairwise disjoint.
- `A = A1 ∪ A2 ∪ ... ∪ An`.

Two sets are *disjoint* if their intersection is the null set.  Two sets are *pairwise disjoint* if every pair of distinct sets in the sequence is disjoint.
  