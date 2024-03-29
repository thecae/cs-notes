# Introduction to Graphs
Graphs are fundamental objects in discrete mathematics that model relationships between pairs of objects. Graphs arise in a wide array of disciplines but play an especially important role in computer science.

Directed graphs were introduced in the context of relations. Here we are concerned with undirected graphs. In an ***undirected graph***, the edges are unordered pairs of vertices, which is useful for modeling relationships that are symmetric. For example, an undirected graph could be used to model sibling relationships within a family. Unlike parent/child relationships in which the two people have different roles, sibling relationships are symmetric. Two people are mutual siblings or neither one is the sibling of the other.

A graph consists of a pair of sets $$(V,E)$$, where $$V$$ is a set of vertices and $$E$$ is a set of edges. A graph is ***finite*** if the vertex set is finite. This material will only be concerned with finite graphs. A single element of $$V$$ is called a ***vertex*** and is usually represented pictorially by a dot with a label. Each edge in $$E$$ is a set of two vertices from $$V$$ and is drawn as a line connecting the two vertices.

In the graph below, the vertex set is $$V=\{a,b,c,d,e\}$$.  It has six edges.

![](https://zytools.zybooks.com/zyAuthor/DiscreteMath/37/IMAGES/embedded_image_1_80cbc6ce-8034-cbfb-494a-5469313fe927_nKvM2uQBzeW3vtnU4eWZ.png)

The graph drawn above can also be described by listing the vertex set and the edge set:

$$$$\begin{align*}
V &= \{a, b, c, d, e\}\\
E &= \{ \{a, b\}, \{a, c\}, \{b, c\}, \{b, e\}, \{c, d\}, \{d, e\} \}\\
\end{align*}$$$$

***Parallel edges*** are multiple edges between the same pair of vertices. Imagine a graph whose vertex set is a set of cities and whose edges are roads connecting pairs of cities. It is possible for there to be two different roads between the same two cities. In defining graphs with parallel edges, it would be important to have an additional label besides the two endpoints to specify an edge in order to distinguish between different parallel edges. A graph can also have a ***self-loop*** which is an edge between a vertex and itself. The graph below has two parallel edges between vertices $$a$$ and $$b$$. There is also a self-loop at vertex $$c$$.

![](https://zytools.zybooks.com/zyAuthor/DiscreteMath/37/IMAGES/embedded_image_1_45908935-876f-a6db-c026-26d5c30e6b6a_nKvM2uQBzeW3vtnU4eWZ.png)

If a graph does not have parallel edges or self-loops, it is said to be a ***simple graph***. Unless otherwise specified, an undirected graph in this material is assumed to be a simple graph.

There are some common graph terms used throughout.  Considering the following graph, here are those definitions:

![](https://zytools.zybooks.com/zyAuthor/DiscreteMath/37/IMAGES/embedded_image_1_db4ca514-a438-b239-65da-49cdeb654671_nKvM2uQBzeW3vtnU4eWZ.png)

- If there is an edge between two vertices, they are said to be ***adjacent***. In the graph above, $$d$$ and $$e$$ are adjacent, but $$d$$ and $$b$$ are not adjacent.
- Vertices $$b$$ and $$e$$ are the ***endpoints*** of edge $$\{b, e\}$$. The edge $$\{b, e\}$$ is ***incident*** to vertices $$b$$ and $$e$$.
- A vertex $$c$$ is a ***neighbor*** of vertex $$b$$ if and only if $$\{b, c\}$$ is an edge. In the graph above, the neighbors of b are the vertices $$a$$, $$c$$, and $$e$$.
- In a simple graph, the ***degree*** of a vertex is the number of neighbors it has. In the graph above, the degree of $$b$$ is $$3$$ and the degree of vertex $$a$$ is $$2$$. The degree of vertex $$b$$ is denoted by $$\deg(b)$$.
- The ***total degree*** of a graph is the sum of the degrees of all of the vertices. The total degree of the graph above is $$2 + 3 + 3 + 2 + 2 = 12$$.
- In a ***regular graph***, all the vertices have the same degree. In a ***$$d$$-regular graph***, all the vertices have degree $$d$$. The graph above is not regular because $$deg(a) ≠ deg(b)$$.
- A graph $$H = (V_H, E_H)$$ is a ***subgraph*** of a graph $$G = (V_G, E_G)$$ if $$V_H ⊆ V_G$$ and $$E_H ⊆ E_G$$. Note that any graph $$G$$ is a subgraph of itself.

A ***complete graph*** is a graph where every vertex is connected to every other vertex.

## Graph Representation

Consider the two graphs:
![](https://zytools.zybooks.com/zyAuthor/DiscreteMath/37/IMAGES/embedded_image_1_e504d225-e7ad-2b1d-2a65-d6e347c4c748_nKvM2uQBzeW3vtnU4eWZ.png)

These graphs are the exact same!  Note that they have the same vertices and same edge list, seen below:
$$$$\begin{align*}
V &= \{a, b, c, d, e\}\\
E &= \{ \{a, b\}, \{a, c\}, \{b, c\}, \{b, e\}, \{c, d\}, \{d, e\} \}\\
\end{align*}$$$$

An ***adjacency list*** representation of a graph is where each node is listed and each of its connections are listed next to it.  Written similar to a hash table using chaining, each node represents one of the indices of the hash table.

![](https://cdn.discordapp.com/attachments/733788698277052438/923424923488243752/unknown.png)

The ***matrix representation*** of a graph with $$n$$ vertices is an $$n\times n$$ matrix whose entries are all either $$0$$ or $$1$$, indicating whether or not each edge is present.  Entry $$M_{i,j}=1$$ if and only if $$\{i, j\}$$ is an edge in the graph.  If a graph is undirected, then $$M_{i,j} = M_{j,i}$$.

![](https://cdn.discordapp.com/attachments/733788698277052438/923425469100064788/unknown.png)

Two graphs are said to be ***isomorphic*** if there is a correspondence between the vertex sets of each graph such that there is an edge between two vertices of one graph if and only if there is an edge between the corresponding vertices of the second graph. The graphs are not identical but the vertices can be relabeled so that they are identical.

A property is said to be ***preserved under isomorphism*** if whenever two graphs are isomorphic, one graph has the property if and only if the other graph also has the property.

## Walks, Trails, Circuits, Paths, and Cycles
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

In an undirected graph, if there is a path from vertex $$v$$ to vertex $$w$$, then there is also a path from $$w$$ to $$v$$. The two vertices, $$v$$ and $$w$$, are said to be ***connected***. A vertex is always considered to be connected to itself. If the graph represents a road or communication network, then it is very desirable for every pair of vertices to be connected. The property of being connected can be extended to sets of vertices and the entire graph:

- A set of vertices in a graph is said to be connected if every pair of vertices in the set is connected.
- A graph is said to be connected if every pair of vertices in the graph is connected, and is ***disconnected*** otherwise.
A ***connected component*** is a maximal set of vertices that is connected. The word "maximal" means that if any vertex is added to a connected component, then the set of vertices will no longer be connected.

A vertex that is not connected with any other vertex is called an ***isolated vertex*** and is therefore a connected component with only one vertex.

An undirected graph $$G$$ is ***$$k$$-vertex-connected*** if the graph contains at least $$k + 1$$ vertices and remains connected after any $$k - 1$$ vertices are removed from the graph. The ***vertex connectivity*** of a graph is the largest $$k$$ such that the graph is $$k$$-vertex-connected. The vertex connectivity of a graph G is denoted $$κ(G)$$.

The vertex connectivity of a graph is the minimum number of vertices whose removal disconnects the graph into more than one connected component.

An undirected graph $$G$$ is ***$$k$$-edge-connected*** if it remains connected after any $$k - 1$$ edges are removed from the graph. The ***edge connectivity*** of a graph is the largest $$k$$ such that the graph is $$k$$-edge-connected. The edge connectivity of a graph $$G$$ is denoted $$λ(G)$$.

The edge connectivity of a graph is the minimum number of edges whose removal disconnects the graph into more than one connected component.