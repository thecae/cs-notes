<!---
CS NOTES :: DATA STRUCTURES :: STACKS AND QUEUES

BY: COLE ELLIS

LAST MODIFIED: 16 DEC 2021
-->

# ***Data Structures***: Stacks and Queues
Stacks and Queues are really important data types for storing ordered values for use later.  These will be used primarily later for searching algorithms.

## Stacks
A *stack* is an ADT where items are only inserted and removed from the top of the stack.

Stacks have only a few functions that compass their entire capability:
- *push*: Insert item to the top of the stack
- *pop*: Remove the top item from the stack
- *peek*/*Top*: View the item at the top of the stack
- *empty*: Returns true if stack is empty, else false
- *size*: Returns number of items in stack

Stacks are implemented using *Last-In-First-Out (LIFO)* methodology.  They are implemented via a linked list.
```c++
StackPush(stack, item) {
	// make new node to insert
	newNode = new Node;
	newNode->next = nullptr;
	newNode->data = item;

	// add item to list
	ListPrepend(stack, newNode);
}

StackPop(stack) {
	// find item on top
	stackItem = stack->head->data;
	
	// remove head item
	ListRemoveAfter(stack, null);
	return headData;
}
```

The stack ADT would look like `head -> 5 -> 4 -> 3 -> 2 -> null`.

## Queues
A *queue* is an ADT where items are inserted at the back and removed from the front.

Queues also only have a few functions that compass their entire capability:
- *enqueue*/*push*: Inserts item at the end of the queue
- *dequeue*/*pop*: Removes item from the front of the queue
- *Peek*/*front*: View the item at the front of the queue
- *empty*: Returns true if queue is empty, else false
- *size*: Returns number of items in queue

Queues are implemented using *First-In-First-Out (FIFO)* methodology.  They are implemented via a linked list.
```c++
QueueEnqueue(queue, item) {
	// make new node to insert
	newNode = new Node;
	newNode->next = nullptr;
	newNode->data = item;

	// add item to list
	ListAppend(queue, newNode);
}

QueueDequeue(queue, item) {
	// find item in front
	stackItem = queue->head->data;
	
	// remove head item
	ListRemoveAfter(queue, null);
	return headData;
}
```

A queue ADT would look the same as a stack.

## Deques
A *deque*, or double-ended queue, is an ADT that supports insertion and removal at both ends of the queue.

The functions for a deque match very closely to that of a queue.
- `push_front`: Insert item at front of deque
- `push_back`: Insert item at back of deque
- `pop_front`: Remove item from front of deque
- `pop_back`: Remove item from back of deque
- `front`: View item at front of deque
- `back`: View item at back of deque
- `empty`: Returns true if deque is empty, else false
- `size`: Returns number of elements in deque 