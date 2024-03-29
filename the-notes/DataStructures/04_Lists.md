# Lists
A ***list*** is a common ADT for holding ordered items.

Some common list operations include:

- `Append(list, x)`: Insert `x` at end of list
- `Prepend(list, x)`: Insert `x` at beginning of list
- `InsertAfter(list, w, x)`: Insert `x` after `w` in list
- `Remove(list, x)`: Remove `x` from list
- `Search(list, x)`: Find `x` in list, returns index
- `Print(list)`: Prints elements of list in order
- `Sort(list)`: Sorts list in ascending order
- `isEmpty(list)`: Returns true if list is empty, otherwise false
- `GetLength(list)`: Returns number of items in list

## Singly-Linked List
A singly-linked list is a list where each node has data and a pointer to the next node.  The last node points to `nullptr`.

- ***List Head***: The linked list's first node
- ***List Tail***: The linked list's last node

A linked list can be interpreted as follows:

![](https://cdn.discordapp.com/attachments/747649164116099082/920926123980881940/unknown.png)

The code to build the list is as follows.  Note that this function, along with all the ones below, use a `template`.  This idea is discussed in detail later.  It's simply a data type.
```c++
template <typename T>
class LinkedList {
    private:
        struct Node {
            T item;
            Node* next;
        };
        typedef Node* NodePtr;
    
        NodePtr head;
};
```

The List ***Append*** function inserts an item to the end of the list.  
```c++
template <typename T>
void LinkedList<T>::append(const T &data) {
    // create node with data
    NodePtr temp = new Node;
    temp->item = data;
    temp->next = nullptr;

    // if curr is null, insert into head
    if (head == nullptr) {
        head = temp;
        return;
    }

    // walk list to end
    NodePtr curr = head;
    while (curr->next != nullptr) {
        curr = curr->next;
    }

    // link new node into list
    curr->next = temp;
}
```

The List ***Prepend*** function inserts an item to the start of the list.
```c++
template <typename T>
void LinkedList<T>::prepend(const T &data) {
    // create node with data
    NodePtr temp = new Node;
    temp->item = data;
    temp->next = head;
    
    // insert at front
    head = temp;
}
```

The List ***InsertAfter*** function inserts an item after a given item.
```c++
template <typename T>
void LinkedList<T>::insertAfter(const T &prev, const T &data) {
    // create node with data
    NodePtr temp = new Node;
    temp->item = data;
    
    // walk to desired spot in list
    NodePtr curr = head;
    while (curr->next != nullptr) {
        if (curr->item == prev) {
            break;
        }
        curr = curr->next;
    }
    
    // assign temp next var
    temp->next = curr->next;
    
    // link node in
    curr->next = temp;
}

```

The List ***RemoveAfter*** function removes the item after a given item.
```c++
template <typename T>
void LinkedList<T>::removeAfter(const T &data) {
    // walk to item
    NodePtr prev = head;
    while (prev->item != data) {
        prev = prev->next;
    }
    NodePtr after = prev + 2;
    NodePtr curr = prev + 1;

    // remove and relink
    prev->next = after;
    delete curr;
    curr = nullptr;
}
```

## Doubly-Linked List
A ***doubly-linked list*** is a list where each node has data, a pointer pointing to the next node, and a pointer to the previous node.

The code to build the list is as follows.
```c++
class DoubleLinkedList {
    private:
        struct Node {
            T item;

            Node* next;
            Node* prev;
        };
        typedef Node* NodePtr;

        NodePtr head;
};
```

The functionality of all four functions do the exact same thing.  Here are all the codes.
```c++
template <typename T>
void DoubleLinkedList<T>::append(const T &data) {
    // create node with data
    NodePtr temp = new Node;
    temp->item = data;
    temp->next = nullptr;

    // walk list to end
    NodePtr curr = head;
    while (curr->next != nullptr) {
        curr = curr->next;
    }

    // assign prev to curr
    temp->prev = curr;

    // link into list
    curr->next = temp;
}
```
```c++
template <typename T>
void DoubleLinkedList<T>::prepend(const T &data) {
    // create node with data
    NodePtr temp = new Node;
    temp->item = data;
    temp->prev = nullptr;
    temp->next = head;

    // link into list
    head = temp;
}
```
```c++
template <typename T>
void DoubleLinkedList<T>::insertAfter(const T &prev, const T &data) {
    // create node with data
    NodePtr temp = new Node;
    temp->item = data;

    // walk list to correct spot
    NodePtr curr = head;
    while (curr->item != prev) {
        curr = curr->next;
    }

    // link temp to list elements
    temp->prev = curr;
    temp->next = curr->next;

    // put temp inside list
    curr->next->prev = temp;
    curr->next = temp;
}
```
```c++
template <typename T>
void DoubleLinkedList<T>::removeAfter(const T &data) {
    // walk list to spot being removed
    NodePtr curr = head;
    while (curr->item != data) {
        curr = curr->next;
    }
    curr = curr->next;

    // assign previous and next nodes
    NodePtr prevNode = curr->prev;
    NodePtr nextNode = curr->next;

    // delete and re-link
    prevNode->next = nextNode;
    nextNode->prev = prevNode;
    delete curr;
    curr = nullptr;
}
```

## List Traversal
The List Traverse Algorithm visits all nodes once and performs and operation on each node.  The code is the same for both Singly-Linked and Doubly-Linked, so only one is shown.
```c++
template <typename T>
void LinkedList<T>::print() const {
    NodePtr curr = head;
    
    // if list is empty, do nothing
    if (curr == nullptr) {
        return;
    }
    
    // otherwise, print the list
    std::cout << "List: ";
    while (curr != nullptr) {
        std::cout << curr->item << " ";
        curr = curr->next;
    }
    std::cout << std::endl;
}
```

Travelling in reverse is doable very easily in doubly-linked lists.
```c++
void DoubleLinkedList<T>::printReverse() const {
    NodePtr curr = head;

    // if list is empty, do nothing
    if (curr == nullptr) {
        return;
    }
    
    // otherwise, walk to end
    while (curr != nullptr) {
        curr = curr->next;
    }
    
    // starting at end, walk back
    std::cout << "List: ";
    while (curr != head) {
        std::cout << curr->item << " ";
        curr = curr->prev;
    }
    std::cout << std::endl;
}
```

Searching is super simple and works the same for singly-linked and doubly-linked lists.  The code returns the index it was found, and `-1` if not found.
```c++
template <typename T>
int LinkedList<T>::search(const T &data) const {
    NodePtr curr = head;
    int index = 0;

    // walk the list and search
    while (curr->next != nullptr) {
        if (curr->item == data) {
            return index;
        }
        curr = curr->next;
        ++index;
    }

    return -1;
}
```

## Circular Linked Lists
A ***circular linked list*** is a linked list where the head and the tail nodes are at the same place.  Since none of these codes implemented tails in the list, the code for a circular linked list is not shown.

Here is the algorithm for traversal:
```c++
CircularListTraversal(head) {
	if (head != nullptr) {
		current = head;
		do {
			visit(current);
			current = current->next;
		} while (current != nullptr);
	}
}
```