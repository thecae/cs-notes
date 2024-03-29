# Trees

## Binary Trees
A ***binary tree*** is a tree where each node has up to two children.  If a binary tree has one child, it must be the left child.

- ***Leaf***: A tree with no children
- ***Internal Node***: A node with at least one child
- ***Parent***: The node whose child is ours
- ***Ancestors***: Parent, Parent's Parent, ... , Root
- ***Root***: Node with no parent

There are a few more vocabulary words to describe trees:

- ***Edge***: A link between a parent and child
- ***Depth***: Number of edges from a given node to the root
- ***Level***: All nodes with the same depth
- ***Height***: Maximum depth of any node

There are a few adjectives that describe graphs:

- ***Full***: Every node contains 0 or 2 children
- ***Complete***: All nodes but possibly the last contain the maximum number of nodes
- ***Perfect***: All internal nodes have two children and all leaf nodes are on the same level

***Binary Space Partitioning (BSP)*** is the process of repeatedly separating a region into two parts and cataloging objects in the region.

## Binary Search Trees
A ***Binary Search Tree (BST)*** is a tree where every node's left subtree is less than the root node and the right subtree is greater than the root node.

Searching a BST is very simple:
```c++
// Binary Search Algorithm
BinarySearch(currentNode, destKey) {
	if (currentNode->key == destKey) {
		return currentNode;
	}
	if (currentNode->key < destKey) {
		return BinarySearch(currentNode->left);
	}
	 if (currentNode->key > destKey) {
		return BinarySearch(currentNode->right);
	}
}
```

A ***successor*** is the node that comes after a node in BST ordering.

A ***predecessor*** is the node that comes before a node in BST ordering.

## Tree Traversal
***Tree Traversal*** is the process of visiting ever ndoe in a tree and performing an operation on that node.

***Inorder Traversal*** visits nodes from smallest to largest and is used for sorting.

The algorithm is as follows:
```c++
BSTPrintInorder(node) {
  if (node == nullptr) {
      return;
  }

  BSTPrintInorder(node->left);
  Print node;
  BSTPrintInorder(node->right);
}
```

The height of a BST is `floor( log2(N) )`, where `N` is the number of nodes.  The height can also be found using this algorithm:


```c++
BSTGetHeight(node) {
   if (node == nullptr) {
      return -1;
   }
   leftHeight = BSTGetHeight(node->left);
   rightHeight = BSTGetHeight(node->right);
   return 1 + max(leftHeight, rightHeight);
}
```

## Binary Tree Insertion
There are three parts of Binary Tree insertion:
- ***Insert as left child***: If the new node's key is less than the current node, and the current node's left child is null, the algorithm assigns that node's left child with the new node.
- ***Insert as right child***: If the new node's key is greater than or equal to the current node, and the current node's right child is null, the algorithm assigns the node's right child with the new node.
- ***Search for insert location***: If the left (or right) child is not null, the algorithm assigns the current node with that child and continues searching for a proper insert location.

The algorithm is as follows:
```c++
BSTInsert(tree, node) {
   if (tree->root == nullptr) {
      tree->root = node;
   }
   else {
      currentNode = tree->root
      while (currentNode != nullptr) {
         if (node->key < currentNode->key) {
            if (currentNode->left == nullptr) {
               currentNode->left = node;
               currentNode = null;
            }
            else {
               currentNode = currentNode->left;
            }
         }
         else {
            if (currentNode->right == nullptr) {
               currentNode->right = node;
               currentNode = null;
            }
            else {
               currentNode = currentNode->right;
            }
         }
      }
   }
}
```

## Binary Tree Removal
Given a key, a BST remove operation removes the first-found matching node, restructuring the tree to preserve the BST ordering property. The algorithm first searches for a matching node just like the search algorithm. If found (call this node X), the algorithm performs one of the following sub-algorithms:
- ***Remove a leaf node***: If X has a parent (so X is not the root), the parent's left or right child (whichever points to X) is assigned with null. Else, if X was the root, the root pointer is assigned with null, and the BST is now empty.
- ***Remove an internal node with single child***: If X has a parent (so X is not the root), the parent's left or right child (whichever points to X) is assigned with X's single child. Else, if X was the root, the root pointer is assigned with X's single child.
- ***Remove an internal node with two children***: This case is the hardest. First, the algorithm locates X's successor (the leftmost child of X's right subtree), and copies the successor to X. Then, the algorithm recursively removes the successor from the right subtree.

Since these cases are complicated, so is the algorithm:
```c++
BSTRemove(tree, key) {
   par = null;
   cur = tree->root;
   while (cur != nullptr) { // Search for node
      if (cur->key == key) { // Node found 
         if (cur->left == nullptr && cur->right == nullptr) { // Remove leaf
            if (par == nullptr) { // Node is root
               tree->root = null;
			}
            else if (par->left == cur) {
               par->left = null;
			}
            else {
               par->right = null;
			}
         }
         else if (cur->right == nullptr) {                // Remove node with only left child
            if (par == nullptr) { // Node is root
               tree->root = cur->left; {
			}
            else if (par->left == cur) {
               par->left = cur->left;
			}
            else {
               par->right = cur->left;
			}
         }
         else if (cur->left == nullptr) {                // Remove node with only right child
            if (par == nullptr) { // Node is root
               tree->root = cur->right;
			}
            else if (par->left == cur) {
               par->left = cur->right;
			}
            else {
               par->right = cur->right;
			}
         }
         else {                                      // Remove node with two children
            // Find successor (leftmost child of right subtree)
            suc = cur->right;
            while (suc->left != nullptr)
               suc = suc->left;
            successorData = Create copy of suc data;
            BSTRemove(tree, suc->key);     // Remove successor
            Assign cur data with successorData
         }
         return; // Node found and removed
      }
      else if (cur->key < key) { // Search right
         par = cur;
         cur = cur->right;
      }
      else {                     // Search left
         par = cur;
         cur = cur->left;
      }
   }
   return; // Node not found
}
```

## Binary Tree Recursion
BST search can be implemented using recursion. A single node and search key are passed as arguments to the recursive search function. Two base cases exist. The first base case is when the node is null, in which case null is returned. If the node is non-null, then the search key is compared to the node's key. The second base case is when the search key equals the node's key, in which case the node is returned. If the search key is less than the node's key, a recursive call is made on the node's left child. If the search key is greater than the node's key, a recursive call is made on the node's right child.
```c++
BSTSearch(tree, key) {
   return BSTSearchRecursive(tree->root, key);
}

BSTSearchRecursive(node, key) {
   if (node != nullptr) {
      if (key == node->key) {
         return node;
	  }
      else if (key < node->key) {
         return BSTSearchRecursive(node->left, key);
	  }
      else {
         return BSTSearchRecursive(node->right, key);
	  }
   }
   return nullptr;
}
```

In a BST without parent pointers, a search for a node's parent can be implemented recursively. The algorithm recursively searches for a parent in a way similar to the normal BSTSearch algorithm. But instead of comparing a search key against a candidate node's key, the node is compared against a candidate parent's child pointers.
```c++
BSTGetParent(tree, node) {
   return BSTGetParentRecursive(tree->root, node);
}

BSTGetParentRecursive(subtreeRoot, node) {
   if (subtreeRoot == nullptr) {
      return nullptr;
   }

   if (subtreeRoot->left == node || subtreeRoot->right == node) {
      return subtreeRoot;
   }

   if (node->key < subtreeRoot->key) {
      return BSTGetParentRecursive(subtreeRoot->left, node);
   }
   return BSTGetParentRecursive(subtreeRoot->right, node);
}
```

BST insertion and removal can also be implemented using recursion. The insertion algorithm uses recursion to traverse down the tree until the insertion location is found. The removal algorithm uses the recursive search functions to find the node and the node's parent, then removes the node from the tree. If the node to remove is an internal node with 2 children, the node's successor is recursively removed.

```c++
STInsert(tree, node) {
   if (tree->root == nullptr) {
      tree->root = node;
   }
   else {
      BSTInsertRecursive(tree->root, node);
   }
}

BSTInsertRecursive(parent, nodeToInsert) {
   if (nodeToInsert->key < parent->key) {
      if (parent->left == nullptr) {
         parent->left = nodeToInsert;
	  }
      else {
         BSTInsertRecursive(parent->left, nodeToInsert);
	  }
   }
   else {
      if (parent->right == nullptr) {
         parent->right = nodeToInsert;
	  }
      else {
         BSTInsertRecursive(parent->right, nodeToInsert);
	  }
   }
}

BSTRemove(tree, key) {
   node = BSTSearch(tree, key);
   parent = BSTGetParent(tree, node);
   BSTRemoveNode(tree, parent, node);
}

BSTRemoveNode(tree, parent, node) {
   if (node == null) {
      return false;
   }
        
   // Case 1: Internal node with 2 children
   if (node->left != null && node->right != null) {
      // Find successor and successor parent
      succNode = node->right;
      successorParent = node;
      while (succNode->left != null) {
         successorParent = succNode;
         succNode = succNode->left;
      }
            
      // Copy the value from the successor node
      node = Copy succNode;
            
      // Recursively remove successor
      BSTRemoveNode(tree, successorParent, succNode);
   }

   // Case 2: Root node (with 1 or 0 children)
   else if (node == tree->root) {
      if (node->left != null) {
         tree->root = node->left;
	  }
      else {
         tree->root = node->right;
	  }
   }

   // Case 3: Internal with left child only
   else if (node->left != null) {
      // Replace node with node left child
      if (parent->left == node) {
         parent->left = node->left;
	  }
      else {
         parent->right = node->left;
	  }
   }

   // Case 4: Internal with right child only OR leaf
   else {
      // Replace node with node right child
      if (parent->left == node) {
         parent->left = node->right;
	  }
      else {
         parent->right = node->right;
	  }
   }        

   return true;
}
```