# Graphs
A ***graph*** is an ADT that represents connections among items.  Graphs have two components:

- ***Vertex***: An item in the graph
- ***Edge***: A connection between two vertices

There a few vocabulary words that describe the relationship between parts of a graph:

- ***Adjacent***: Two vertices are connected by an edge
- ***Path***: A sequence of edges that connect one vertex to another 
- ***Path Length***: Number of edges in a path
- ***Distance***: Number of edges on the shortest path

There are three types of graphs:

- ***Undirected Graph***: Edges connect to vertex.  It can be traversed in either direction.
- ***Directed Graph***: Edges are connected by a directed edges, and can only be traveled in the specified direction.
- ***Weighted Graph***: A directed graph where each edge is assigned a real value.

A graph is ***cyclic*** if it contains a cycle (a path where the starting vertex is the same as the terminating vertex), and ***acyclic*** if there are no cycles.

## Graph Representations
Graphs can be represented three types of ways:

- The graph itself
- ***Adjacency List***: A list of ordered pairs that indicate the existing connections between vertices on the graph
- ***Adjacency Matrix***: A matrix of size $n \times n$, where $n$ is the number of vertices, where an element is marked as $1$ if an edge connects the row to the column, and $0$ otherwise.

In computer storage, adjacency matrices are the best way to store graphs because a program can easily access the element of a matrix and determine if an edge is there.  For people describing graphs, adjacency lists are more useful because they're more compact, easier to read, less prone for mistakes, and easier to communicate.

## Graph Traversals
***Graph Traversal*** is the process of visiting all vertices of a graph in some order.

#### Depth-First Searching 

***Depth-First Searching (DFS)*** is the process of visiting a starting vertex, visiting all vertices along each path and backtracking once an end is reached.

DFS is best achieved by implementing a **stack**, since applicable items are added to the top of the stack and then pulled off the top of the stack, pushing down a certain path.  DFS is best done with LIFO storage.

#### Breadth-First Searching

***Breadth-First Searching (BFS)*** is the process of visiting a starting vertex, visiting all vertices adjacent to the vertex of the same distance, then moving on to the next smallest distance.

BFS is best achieved by implementing a **queue**, since applicable terms are added to the back of the queue and then pulled off the front, causing the searcher to search the adjacent locations before moving down paths.  BFS is best done with FIFO storage.

## Dijkstra's Shortest Path
***Dijkstra's shortest path algorithm***, created by Edsger Dijkstra, determines the shortest path from a start vertex to each vertex in a graph. 

For each vertex, Dijkstra's algorithm determines the vertex's distance and predecessor pointer. A vertex's distance is the shortest path distance from the start vertex. A vertex's predecessor pointer points to the previous vertex along the shortest path from the start vertex.

Dijkstra's algorithm initializes all vertices' distances to infinity ($\infty$), initializes all vertices' predecessors to null, and enqueues all vertices into a queue of unvisited vertices. The algorithm then assigns the start vertex's distance with $0$. While the queue is not empty, the algorithm dequeues the vertex with the shortest distance. For each adjacent vertex, the algorithm computes the distance of the path from the start vertex to the current vertex and continuing on to the adjacent vertex. If that path's distance is shorter than the adjacent vertex's current distance, a shorter path has been found. The adjacent vertex's current distance is updated to the distance of the newly found shorter path's distance, and vertex's predecessor pointer is pointed to the current vertex. 
```c++
DijkstraShortestPath(startV) {
   for each vertex currentV in graph {
      currentV->distance = Infinity
      currentV->predV = 0
      Enqueue currentV in unvisitedQueue
   }

   // startV has a distance of 0 from itself
   startV->distance = 0

   while (unvisitedQueue is not empty) {
      // Visit vertex with minimum distance from startV
      currentV = DequeueMin unvisitedQueue

      for each vertex adjV adjacent to currentV {
         edgeWeight = weight of edge from currentV to adjV
         alternativePathDistance = currentV⇢distance + edgeWeight
            
         // If shorter path from startV to adjV is found,
         // update adjV's distance and predecessor
         if (alternativePathDistance < adjV⇢distance) {
            adjV->distance = alternativePathDistance
            adjV->predV = currentV
         }
      }
   }
}
```

## Bellman-Ford Shortest Path
The ***Bellman-Ford shortest path algorithm***, created by Richard Bellman and Lester Ford, Jr., determines the shortest path from a start vertex to each vertex in a graph. For each vertex, the Bellman-Ford algorithm determines the vertex's distance and predecessor pointer. A vertex's distance is the shortest path distance from the start vertex. A vertex's predecessor pointer points to the previous vertex along the shortest path from the start vertex.

The Bellman-Ford algorithm initializes all vertices' current distances to infinity ($\infty$) and predecessors to null, and assigns the start vertex with a distance of $0$. The algorithm performs $V-1$ main iterations, visiting all vertices in the graph during each iteration. Each time a vertex is visited, the algorithm follows all edges to adjacent vertices. For each adjacent vertex, the algorithm computes the distance of the path from the start vertex to the current vertex and continuing on to the adjacent vertex. If that path's distance is shorter than the adjacent vertex's current distance, a shorter path has been found. The adjacent vertex's current distance is updated to the newly found shorter path's distance, and the vertex's predecessor pointer is pointed to the current vertex.

The Bellman-Ford algorithm does not require a specific order for visiting vertices during each main iteration. So after each iteration, a vertex's current distance and predecessor may not yet be the shortest path from the start vertex. The shortest path may propagate to only one vertex each iteration, requiring V-1 iterations to propagate from the start vertex to all other vertices.
```c++
BellmanFord(startV) {
   for each vertex currentV in graph {
      currentV->distance = Infinity
      currentV->predV = null
   }

   // startV has a distance of 0 from itself
   startV⇢distance = 0

   for i = 1 to (number of vertices - 1) { // Main iterations
      for each vertex currentV in graph {
         for each vertex adjV adjacent to currentV {
            edgeWeight = weight of edge from currentV to adjV
            altPathDistance = currentV->distance + edgeWeight
                
            // If shorter path from startV to adjV is found,
            // update adjV's distance and predecessor
            if ( altPathDistance < adjV->distance ) {
               adjV->distance = altPathDistance
               adjV->predV = currentV
            }
         }
      }
   }

   // Check for negative weight cycle
}
```
