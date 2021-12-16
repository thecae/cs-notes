<!---
CS NOTES :: DATA STRUCTURES :: INTRO TO DATA STRUCTURES

BY: COLE ELLIS

LAST MODIFIED: 16 DEC 2021
-->

# ***Data Structures***: An Introduction to Data Structures
A *data structure* is a way of organizing, storing, and performing operations on data. There are many types of data structures, a few of which are defined below.
- *Record*: A data structure that stores subitems with an associated name
- *Array*: A data structure that stores an ordered list accessible by an item's index
- *Linked List*: A data structure that stores an ordered list as nodes connected by pointers
- *Binary Tree*: A data structure containing nodes that have a left and/or right child
- *Hash Table*: A data structure that stores unordered items by mapping each item to an array location
- *Heap*: A tree that maintains the property that the node key is either greater or less than the child keys
- *Graph*: A data structure that represents connections among items

Every data structure has its advantages.  For example, hash tables are faster than arrays for inserting and retrieving data.  Linked lists are faster than arrays for inserting because they don't require data shifting during insertion.


## Program Design
An *algorithm* is a sequence of instructions to be followed by the compiler to perform a computation.

A *computational problem* is a problem that specifies input, questions about the input, and demands output.  An *NP-complete problem* is a set of problems without an efficient algorithm to solve them.

## Abstract Data Types
*Abstract Data Types (ADT)* are data types that are defined by pre-defined user operations.  Below are a few examples.
- *List*: An ADT for holding ordered data
- *Dynamic Array*: An ADT for holding ordered data that allows for index accessing
- *Stack*: An ADT where items are inserted and removed from the top only
- *Queue*: An ADT where items are inserted at the back and removed from the front
- *Deque*: An ADT that supports insertion and removal at both ends
- *Bag*: An ADT where order doesn't matter and duplicates are allowed
- *Set*: An ADT for the collection of distinct items
- *Priority Queue*: An ADT where items have priority and are sorted by priority
- *Dictionary*: An ADT that associates a key to each value for direct accessing

## Efficiency
*Algorithm efficiency* is a measure of the amount of resources used by the algorithm.

*Runtime complexity* is a function representing the number of constant time operations performed on a size `n` input.
- *Best case*: The algorithm does the least number of operations
- *Worst case*: The algorithm does the most number of operations

*Space complexity* is a measure of fixed-size memory units performed on a size `n` units.