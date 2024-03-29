# Binary Relations
A ***binary relation*** is a subset of $$A \times B$$.  Binary refers to the fact that the relation is a subset of the Cartesian product of two sets.  For $$a \in A$$ and $$b \in B$$, $$(a,b) \in R$$ is denoted by $$aRb$$.

In an ***arrow diagram*** of $$R$$, the elements of $$A$$ are listed on the left and the elements of $$B$$ on the right; there is an arrow from $$a \in A$$ to $$b \in B$$ if $$aRb$$.

The ***matrix representation*** of relation $$R$$ between $$A$$ and $$B$$ is a rectangular array of numbers with $$|A|$$ rows and $$|B|$$ columns. Each row corresponds to an element of $$A$$ and each column corresponds to an element of $$B$$. For $$a \in A$$ and $$b \in B$$, there is a $$1$$ in row $$a$$, column $$b$$, if $$aRb$$. Otherwise, there is a $$0$$.

A ***binary relation*** on a set $$A$$ is a subset of $$A \times A$$.  The set $$A$$ is called the ***domain***.

## Properties of Binary Relations
#### Reflexive and Anti-Reflexive
A binary relation $$R$$ is ***reflexive*** if and only if for **every** $$x \in A$$, $$xRx$$.  In the case of a directed graph, this would be indicated by a self-loop on every node.  

Notice that the definition of reflexive is a universal statement. In order for a binary relation to be reflexive, every element in the set must be related to itself. In order to show that a relation is not reflexive, it is only necessary to show that there is a particular $$x \in A$$ such that $$xRx$$ is not true.

A binary relation $$R$$ is ***anti-reflexive*** if and only if for every $$x$$ in the domain of $$R$$, it is not true that $$xRx$$.  This means that there are no self-loops in the directed graph.

The definition of anti-reflexive is also a universal statement. In order for a binary relation to be anti-reflexive every element in the set must not be related to itself. In order to show that a relation is not anti-reflexive, it is only necessary to show that there is a particular $$x \in A$$ such that $$xRx$$ is true.

#### Symmetric and Anti-Symmetric
A binary relation $$R$$ is ***symmetric*** if and only if for every pair, $$x,y \in A$$, $$xRy$$ if and only if $$yRx$$.  This is best viewed on a directed graph as having a double-ended arrow between every point on the graph.

A relation is symmetric if for every pair of elements x and y in the domain, one of the following situations holds:

- $$xRy$$ and $$yRx$$ are both true
- Neither $$xRy$$ nor $$yRx$$ is true

The situation that is not allowed in a symmetric relation is for there to be a pair, $$x$$ and $$y$$, such that $$x$$ is related to $$y$$ but $$y$$ is not related to $$x$$.

Notice that the definition of symmetric is a universal statement. The criteria is that for every pair, the two elements in the pair are both related to each other or both not related to each other. If there is any pair of elements, $$x$$ and $$y$$, where $$x$$ is related to $$y$$ and $$y$$ is not related to $$x$$, then the relation is not symmetric.

Suppose that R is a relation on set A. R is ***anti-symmetric*** if and only if for every pair, x and $$y \in A$$, if $$x \neq y$$ then it can not be the case that $$xRy$$ and $$yRx$$ are both true.  On a directed graph, this means that there are no double-ended arrows (i.e. there is only one way to get from any point to the next point).

A relation is anti-symmetric if for every pair of distinct elements in the domain one of the following situations holds:

- $$xRy$$, but it is not true that $$yRx$$
- $$yRx$$, but it is not true that $$xRy$$
- Neither $$xRy$$ nor $$yRx$$ is true

The situation that is not allowed in an anti-symmetric relation is for there to be a pair, $$x$$ and $$y$$, such that $$x \neq y$$ and $$xRy$$ and $$yRx$$ are both true. Notice that the definition of anti-symmetric is a universal statement. If any pair, $$x$$ and $$y$$, in the domain have the forbidden pattern of $$x \neq y$$, $$xRy$$ and $$yRx$$, then the relation is not anti-symmetric. One way to show that a relation is anti-symmetric is to take an arbitrary pair of elements in the domain, $$x$$ and $$y$$, and show that the assumptions $$xRy$$ and $$yRx$$ necessarily imply that $$x = y$$.

#### Transitive
Suppose that $$R$$ is a relation on set $$A$$. $$R$$ is ***transitive*** if and only if for every three elements, $$x,y,z \in A$$, if $$xRy$$ and $$yRz$$, then it must also be the case that $$xRz$$.

The situation that is not allowed in a transitive relation is for there to be an $$x$$, $$y$$, and $$z$$, such that $$xRy$$ and $$yRz$$ are true but $$xRz$$ is not true. Notice that the definition of transitive is a universal statement. If any $$x$$, $$y$$, and $$z$$ in the domain have the forbidden pattern of $$xRy$$ and $$yRz$$ but not $$xRz$$, then the relation is not transitive. If there is no triple $$x$$, $$y$$, and $$z$$ that has the forbidden pattern, then the relation is transitive.

## Directed Graphs
A ***directed graph***, or ***digraph***, consists of a pair of vertices ($$V$$) and edges ($$E$$).  A vertex is typically pictured as a dot or a circle labeled with the name of the vertex. An edge $$(u,v) \in E$$, is pictured as an arrow going from the vertex labeled $$u$$ to the vertex labeled $$v$$.  The vertex $$u$$ is the ***tail*** of the edge $$(u,v)$$ and vertex $$v$$ is the ***head***. If the head and the tail of an edge are the same vertex, the edge is called a ***self-loop***.

The ***in-degree*** of a vertex is the number of edges pointing into it. The ***out-degree*** of a vertex is the number of edges pointing out of it.

## Walks
A ***walk*** is a sequence of alternating vertices and edges that starts and ends with a vertex.
$$$$<v_0, (v_0,v_1), v_1, (v_1,v_2), v_2, \ldots , v_{l-1}, (v_{l-1},v_l), v_l>$$$$

A walk can also be written as just the vertices because the edges are determined by the vertices, i.e. $$<v0, v1, ... , vl>$$.

The ***length of a walk*** is the number of vertices in the walk.

An ***open walk*** is a walk in which the first and last vertices are not the same. A ***closed walk*** is a walk in which the first and last vertices are the same.

In many contexts, walks that do not repeat vertices or edges are preferable. For example, an airline trip that arrived at the same airport twice would be inefficient.

- A ***trail*** is an open walk in which no edge occurs more than once.
- A ***circuit*** is a closed walk in which no edge occurs more than once.
- A ***path*** is a trail in which no vertex occurs more than once.
- A ***cycle*** is a circuit of length at least 1 in which no vertex occurs more than once, except the first and last vertices which are the same.

## Graph Powers
$$E^k$$ is the relation $$E$$ composed with itself $$k$$ times. The graph $$G^k$$ is defined to be the directed graph whose edge set is $$E^k$$ and is called the $$k$$th power of $$G$$.

*Theorem*: Let $$G$$ be a directed graph. Let $$u$$ and $$v$$ be any two vertices in $$G$$. There is an edge from $$u$$ to $$v$$ in $$G^k$$ if and only if there is a walk of length $$k$$ from $$u$$ to $$v$$ in $$G$$.

The relation $$R+$$ is called the ***transitive closure of $$R$$*** and is the smallest relation that is both transitive and includes all the pairs from $$R$$. In other words, any relation that contains all the pairs from $$R$$ and is transitive must include all the pairs in $$R+$$. If $$G$$ is a directed graph, then $$G+$$ is called the transitive closure of $$G$$.

To find the transitive closure of a relation $$R$$ on $$A$$: If there are three elements $$x,y,z \in A$$ such that $$(x,y) \in R$$, $$(y,z) \in R$$ and $$(x,z) \notin R$$, then add $$(x,z) to R$$. Repeat until no pair is added to $$R$$.

## Partial, Strict, and Total Orders
A relation R on a set A is a ***partial order*** if it is reflexive, transitive, and anti-symmetric. The notation $$a ⪯ b$$ is used to express $$aRb$$, reflecting the fact that a partial order acts like a $$≤$$ operator on the elements of $$A$$.  The domain along with a partial order defined on it is denoted $$(A, ⪯)$$ and is called a ***partially ordered set*** or ***poset***.

Two elements of a partially ordered set, $$x$$ and $$y$$, are said to be comparable if $$x ⪯ y$$ or $$y ⪯ x$$. Otherwise they are said to be incomparable. A partial order is a total order if every two elements in the domain are comparable. The partial order $$(Z, ≤)$$ is an example of a total order.

An element $$x$$ is a minimal element if there is no $$y \neq x$$ such that $$y ⪯ x$$. An element $$x$$ is a maximal element if there is no $$y \neq x$$ such that $$x ⪯ y$$.

A ***Hasse diagram***, named after the 20th century German mathematician Helmut Hasse, is a useful way to depict a partial order on a finite set. Each element is represented by a labeled point. The idea is to show precedence relationships by placing elements that are greater than others towards the top of the diagram. 

For any $$x$$ and $$y$$ such that $$x \neq y$$:

- If $$x ⪯ y$$, then make x appear lower in the diagram than $$y$$.
- If $$x ⪯ y$$ and there is no $$z$$ such that $$x ⪯ z$$ and $$z ⪯ y$$, then draw a segment connecting $$x$$ and $$y$$.

A relation $$R$$ is a ***strict order*** if $$R$$ is transitive and anti-reflexive. The notation $$a ≺ b$$ is used to express $$aRb$$ and is read "a is less than b".

A strict order is a ***total order*** if every pair of elements is comparable.

## Directed Acyclic Graphs
A ***directed acyclic graph*** (or ***DAG*** for short) is a directed graph that has no cycles.

A ***topological sort*** for a DAG is an ordering of the vertices that is consistent with the edges in the graph. That is, if there is an edge $$(u,v)$$, then $$u$$ appears earlier than $$v$$ in the topological sort.

## Equivalence Relations and Classes
A relation $$R$$ is an ***equivalence relation*** if $$R$$ is reflexive, symmetric, and transitive. If a relation $$R$$ is an equivalence relation, the notation $$a~b$$ is used to express $$aRb$$. $$a~b$$ is read "a is equivalent to b".

If A is the domain of an equivalence relation and $$a \in A$$, then $$[a]$$ is defined to be the set of all $$x \in A$$ such that $$a~x$$. The set $$[a]$$ is called an equivalence class. Consider an example in which the domain is the set of natural numbers and $$x~y$$ if $$x$$ and $$y$$ have the same remainder when divided by $$3$$.

- $$[0]$$ is the set of all natural numbers whose remainder is $$0$$ when divided by $$3$$.
- $$[1]$$ is the set of all natural numbers whose remainder is $$1$$ when divided by $$3$$.
- $$[2]$$ is the set of all natural numbers whose remainder is $$2$$ when divided by $$3$$.

Equivalence relations have a special mathematical structure, described in the following theorem which says that two equivalence classes are either identical or completely disjoint.