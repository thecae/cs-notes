# Balanced Trees
Balanced Trees, otherwise known as ***AVL Trees***, are binary search trees with a height balance property and contain specific operations to rebalance the tree when nodes are inserted or removed.

An AVL tree is ***height balanced*** if for any node, the heights of the nodes left and right subtrees has a magnitude no greater than one.

The ***balance factor*** of a node in an AVL tree is the height of the left subtree minus the height of the right subtree.  For a proper AVL tree, no node should have a balance factor outside of $-1$, $0$, or $1$.

To find an imbalanced AVL tree, look out for *two left nodes and no right node*.

In the absolute case, the AVL tree's height is no greater than 1.5 times the minimum binary tree height.  For example, for seven nodes, the max height is $1.5\cdot\left\lfloor{\log_2(7)}\right\rfloor=3$.

## AVL Tree Rotation
A ***rotation*** is a local rearrangement to maintain height balance and BST ordering at the same time.  There are two types of single rotations:

- ***Left rotation***: Moves down left subtree to become the new left child
- ***Right rotation***: Moves down right subtree to become the new right child

Below is an example of a right rotation, needed because `D` is imbalanced.

![](https://cdn.discordapp.com/attachments/747649164116099082/920820032727031878/unknown.png)

There are four algorithms that support AVL rotation:

- The `AVLTreeUpdateHeight` algorithm updates a node's height value by taking the maximum of the child subtree heights and adding 1.
- The `AVLTreeSetChild` algorithm sets a node as the parent's left or right child, updates the child's parent pointer, and updates the parent node's height.
- The `AVLTreeReplaceChild` algorithm replaces one of a node's existing child pointers with a new value, utilizing AVLTreeSetChild to perform the replacement.
- The `AVLTreeGetBalance` algorithm computes a node's balance factor by subtracting the right subtree height from the left subtree height.

```c++
AVLTreeUpdateHeight(node) {
   leftHeight = -1;
   if (node->left != null) {
      leftHeight = node->left->height;
   }
   rightHeight = -1;
   if (node->right != null) {
      rightHeight = node->right->height;
   }
   node->height = max(leftHeight, rightHeight) + 1;
}
```
```c++
AVLTreeSetChild(parent, whichChild, child) {
   if (whichChild != "left" && whichChild != "right") {
      return false;
   }

   if (whichChild == "left") {
      parent->left = child;
   }
   else {
      parent->right = child;
   }
   if (child != null) {
      child->parent = parent;
   }

   AVLTreeUpdateHeight(parent);
   return true;
}
```
```c++
AVLTreeReplaceChild(parent, currentChild, newChild) {
   if (parent->left == currentChild) {
      return AVLTreeSetChild(parent, "left", newChild);
   }
   else if (parent->right == currentChild) {
      return AVLTreeSetChild(parent, "right", newChild);
   }
   return false;
}
```
```c++
AVLTreeGetBalance(node) {
   leftHeight = -1;
   if (node->left != null) {
      leftHeight = node->left->height;
   }
   rightHeight = -1;
   if (node->right != null) {
      rightHeight = node->right->height;
   }
   return leftHeight - rightHeight;
}
```
Below is the right rotation algorithm used to perform the rotation in the above image.
```c++
AVLTreeRotateRight(tree, node) {
   leftRightChild = node->left->right
   if (node->parent != null)
      AVLTreeReplaceChild(node->parent, node, node->left);
   else { // node is root
      tree->root = node->left;
      tree->root->parent = null;
   }
   AVLTreeSetChild(node->left, "right", node);
   AVLTreeSetChild(node, "left", leftRightChild);
}
```

The `AVLTreeRebalance` algorithm updates the height value at a node, computes the balance factor, and rotates if the balance factor is 2 or -2.
```c++
AVLTreeRebalance(tree, node) {
   AVLTreeUpdateHeight(node)        
   if (AVLTreeGetBalance(node) == -2) {
      if (AVLTreeGetBalance(node->right) == 1) {
         // Double rotation case.
         AVLTreeRotateRight(tree, node->right);
      }
      return AVLTreeRotateLeft(tree, node);
   }
   else if (AVLTreeGetBalance(node) == 2) {
      if (AVLTreeGetBalance(node->left) == -1) {
         // Double rotation case.
         AVLTreeRotateLeft(tree, node->left);
      }
      return AVLTreeRotateRight(tree, node);
   }        
   return node;
}
```

## AVL Tree Insertion
***Inserting*** an item into an AVL tree can cause trees to imbalance.  This creates the need for ***double rotations***, of which there are four:
- ***(Left, Left) Rotations***: When inserting a smaller item to the left of a left subnode, this causes a two-long strand to the left side of the root. This must be rotated **once right**.
- ***(Left, Right) Rotations***: When inserting a bigger item than the left subnode but smaller than the root, this creates a less-than shape.  This must be **kneaded through the middle**.
- ***(Right, Left) Rotations***: When inserting a bigger item than the root but smaller than the right subnode, this creates a greater-than shape.  This must be **kneaded through the middle**. 
- ***(Right, Right) Rotations***: When inserting a larger item to the right of a right subnode, this causes a two-long strand to the right side of the root.  This must be rotated **once left**.

Below are depictions of each of the rotations.
![Double Rotations](https://cdn.discordapp.com/attachments/747649164116099082/920821498250412073/unknown.png)

Below is the AVL tree insertion algorithm.
```c++
AVLTreeInsert(tree, node) {
   if (tree->root == null) {
      tree->root = node;
      node->parent = null;
      return;
   }

   cur = tree->root;
   while (cur != null) {
      if (node->key < cur->key) {
         if (cur->left == null) {
            cur->left = node;
            node->parent = cur;
            cur = null;
         }
         else {
            cur = cur->left;
         }
      }
      else {
         if (cur->right == null) {
            cur->right = node;
            node->parent = cur;
            cur = null;
         }
         else {
            cur = cur->right;
		}
      }
   }

   node = node->parent
   while (node != null) {
      AVLTreeRebalance(tree, node);
      node = node->parent;
   }
}
```

## AVL Tree Removal
Given a key, an AVL tree ***remove*** operation removes the first-found matching node, restructuring the tree to preserve all AVL tree requirements. Removal begins by removing the node using the standard BST removal algorithm. After removing a node, all ancestors of the removed node, from the nodes' parent up to the root, are rebalanced. A node is rebalanced by first computing the node's balance factor, then performing rotations if the balance factor is 2 or -2.

Below is the Algorithm for AVL Tree Removal.
```c++
AVLTreeRemoveNode(tree, node) {
   if (node == null) {
      return false;
   }

   // Parent needed for rebalancing
   parent = node->parent;
        
   // Case 1: Internal node with 2 children
   if (node->left != null && node->right != null) {
      // Find successor
      succNode = node->right;
      while (succNode->left != null) {
         succNode = succNode->left;
      }

      // Copy the key from the successor node
      node->key = succNode->key;
            
      // Recursively remove successor
      AVLTreeRemoveNode(tree, succNode);
            
      // Nothing left to do since the recursive call will have rebalanced
      return true
   }

   // Case 2: Root node (with 1 or 0 children)
   else if (node == tree->root) {
      if (node->left != null) {
         tree->root = node->left;
      }
      else {
         tree->root = node->right;
      }
      if (tree->root != null) {
         tree->root->parent = null;
      }
      return true;
   }

   // Case 3: Internal with left child only
   else if (node->left != null) {
      AVLTreeReplaceChild(parent, node, node->left);
   }
   // Case 4: Internal with right child only OR leaf
   else {
      AVLTreeReplaceChild(parent, node, node->right);
   }

   // node is gone. Anything that was below node that has persisted is already correctly
   // balanced, but ancestors of node may need rebalancing.
   node = parent;
   while (node != null) {
      AVLTreeRebalance(tree, node);          
      node = node->parent;
   }
   return true;
}
``` 
