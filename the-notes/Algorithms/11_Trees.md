# Introduction to Trees
A ***tree*** is an undirected graph that is connected and has no cycles.

![](https://zytools.zybooks.com/zyAuthor/DiscreteMath/37/IMAGES/embedded_image_1_df59a840-59d3-4d69-c339-9c2cc2ce1e39_nIeTo230iPtxIUWUPdYR.png)

The tree on the left is called a ***free tree*** because there is no particular organization of the vertices and edges. The tree on the right is called a ***rooted tree***. The vertex at the top of the drawing is designated as the ***root*** of the tree. The remaining vertices are organized according to their distance from the root. The distance between two vertices in an undirected graph is the number of edges in the shortest path between the two vertices. The ***level*** of a vertex is its distance from the root. The ***height*** of a tree is the highest level of any vertex. The tree on the right has height $3$.

Let $T$ be a tree and let $u$ and $v$ be two vertices in $T$. There is exactly one path between $u$ and $v$.

There is also terminology with trees, based on this tree:

![](https://zytools.zybooks.com/zyAuthor/DiscreteMath/37/IMAGES/embedded_image_1_97e4ab2e-5e17-78a1-5a08-22ab648321e9_nIeTo230iPtxIUWUPdYR.png)

- Every vertex in a rooted tree $T$ has a unique ***parent***, except for the root which does not have a parent. The parent of vertex $v$ is the first vertex after $v$ encountered along the path from $v$ to the root. (Ex: The parent of vertex $g$ is $h$.)
- Every vertex along the path from $v$ to the root (except for the vertex $v$ itself) is an ***ancestor*** of vertex $v$. (Ex: The ancestors of vertex $g$ are $h$, $d$, and $b$.)
- If $v$ is the parent of vertex $u$, then $u$ is a ***child*** of vertex $v$. (Ex: Vertices $c$ and $g$ are the children of vertex $h$.)
- If $u$ is an ancestor of $v$, then $v$ is a ***descendant*** of $u$. (Ex: The descendants of vertex $h$ are $c$, $g$, and $k$.)
- A ***leaf*** is a vertex which has no children. (Ex: The leaves are $a$, $f$, $c$, $k$, $i$, and $j$.)
- Two vertices are ***siblings*** if they have the same parent. (Ex: Vertices $h$, $i$, and $j$ are siblings because they have the same parent, which is vertex $d$.)
- A ***sub-tree*** rooted at vertex $v$ is the tree consisting of $v$ and all $v$'s descendants. (Ex: The sub-tree rooted at $h$ includes $h$, $c$, $g$, and $k$ and the edges between them.)

## Properties of Trees
A vertex is an ***internal vertex*** if the vertex has degree at least two.

*Theorem*: Any free tree with at least two vertices has at least two leaves.

*Theorem*: Let $T$ be a tree with $n$ vertices and $m$ edges, then $m = n - 1$.

## Tree Traversals
A ***tree traversal*** is the process of systematically visiting each vertex and performing an operation on that vertex.  There are two main ways to traverse a tree: pre-order and post-order.

#### Pre-Order Traversal
In a ***pre-order traversal***, a vertex is visited before its descendants.  The algorithm for a pre-order traversal is below.
```c++
Pre-order(v)

process(v)
for every child w of v:
      Pre-order(w)
end-for
```

Below is how the tree is traversed in pre-order:

![](https://zytools.zybooks.com/zyAuthor/DiscreteMath/37/IMAGES/embedded_image_1_416a9a78-249e-d543-9440-26e2da17a0d4_nIeTo230iPtxIUWUPdYR.png)

#### Post-Order Traversal
In a ***post-order traversal***, a vertex is visited after its descendants.  The algorithm for a post-order traversal is below.
```c++
Post-order(v)

for every child w of v:
      Post-order(w)
end-for
process(v)
```

Below is how the tree is traversed in post-order:

![](https://zytools.zybooks.com/zyAuthor/DiscreteMath/37/IMAGES/embedded_image_1_c6ed5c6e-6629-8b74-d7a1-38c7488c7b1e_nIeTo230iPtxIUWUPdYR.png)

## Spanning Trees
A ***spanning tree*** of a connected graph $G$ is a subgraph of $G$ which contains all the vertices in $G$ and is a tree.

Below are three different spanning trees of a graph:

![](https://zytools.zybooks.com/zyAuthor/DiscreteMath/37/IMAGES/embedded_image_1_651822a6-fb47-371d-0a58-92ef2440155b_nIeTo230iPtxIUWUPdYR.png)

There are two common methods for finding a spanning tree: Breadth-First Search and Depth-First Search.

#### Breadth-First Search
***Breadth-First Search*** (***BFS***) explores the graph by distance from the initial vertex, starting with its neighbors and expanding the tree to neighbors of neighbors, etc.

Below is the algorithm for BFS.
```c++
Breadth-first-search

Input: An undirected, connected graph G. A start vertex v1
Output: T, a breadth-first search tree.

Add v1 to T.
Add v1 to the back of the list.

while the list is not empty:
      Remove vertex v from the front of the list.
      for each neighbor w of v that is not already in T:
            Add w and {w, v} to T.
            Insert w at the back of the list.
      end-for
end-while
```

#### Depth-First Search
***Depth-First Search*** (***DFS***) favors going deep into the graph and tends to produce trees with longer paths from the start vertex.

Below is the algorithm for DFS.
```c++
Depth-first-search

Input: An undirected, connected graph G. A start vertex v1
Output: T, a depth-first search tree.

Add v1 to T.
visit(v1)
visit(v)

for every neighbor w of v:
      if w is not already in T
            Add w and {w, v} to T.
            visit(w);
      end-if
end-for
```

## Weighted Graphs and MST
A weighted graph is a graph $G = (V ,E)$, along with a function $w: E → \mathbb{R}$. The function w assigns a real number to every edge.

![](https://zytools.zybooks.com/zyAuthor/DiscreteMath/37/IMAGES/embedded_image_1_5a7db61d-4766-9878-dff7-1b574e22a998_nIeTo230iPtxIUWUPdYR.png)

A ***minimum spanning tree*** (***MST***) of a weighted graph, is a spanning tree $T$ of $G$ whose weight is no larger than any other spanning tree of $G$.

***Prim's algorithm*** is a classic algorithm for finding minimum spanning trees of the input weighted graph.  Prim's algorithm selects the smallest weight edge among all the candidate edges and adds the selected edge to $T$ along with the endpoint of the edge that is not in $T$.

Below is the algorithm for Prim's Algorithm.
```c++
Prim's Algorithm

Input: An undirected, connected, weighted graph G.
Output: T, a minimum spanning tree for G.

T := ∅.
Pick any vertex in G and add it to T.

for j = 1 to n-1
      Let C be the set of edges with one endpoint inside T and one endpoint outside T.
      Let e be a minimum weight edge in C.
      Add e to T.
      Add the endpoint of e not already in T to T.
end-for
```
