# ***Data Structures***: Containers
A *range-based for loop* is a very powerful tool for iterating through each element in a container regardless of what container it is.  It's so powerful that you don't even need its data type.

```c++
// initialize vector with some names
vector<std::string> roster;
roster.push_back("Mike");
roster.push_back("Scott");
roster.push_back("Dan");
roster.push_back("John");

// iterate through vector
for (const std::string &name : vector) {
	std::cout << name << std::endl;
}
``` 

You can pass by reference if you want to change each element of the container.
```c++
// initalize an entire container
for (double &grades: examGrades) {
	double userGrade;
	std::cin >> userGrade;
	grade = userGrade;
}
```

The `auto` data type is a super useful data type for automatically determining the data type of an object.
```c++
// uses auto for data type
for (auto &grades : examGrades) {
	// perform operations
}
```

## Container: Lists
A *list* is a container of unordered elements.  It requires the header of `#include <list>` to utilize. 

Unlike vectors, lists are doubly-linked, giving lists functions such as `push_front()` and `pop_front()`.
- `front()`: The first element of a list
- `back()`: The last element of a list
- `remove()`: Removes a specific element from the list

An *iterator* is an object that points to a location and can traverse the list bidirectionally.
```c++
list<string>::iterator it;
```

An iterator has two primary locations that it can process, and then performs pointer arithmetic to traverse:
- `.begin()`: The beginning of the list
- `.end()`: The element **after** the last element of the list

The iterator can be used in a for loop as follows:
```c++
list<string>::iterator it;
for (it = authorList.begin(); it != authorList.end(); ++it) {
	// perform operations
}
```

The `insert` function adds one or more elements to the position the iterator points at.
```c++
insert(iterPos, newItem);
```

The `erase` function removes a range of elements.
```c++
erase(iterPos);
erase(iterFirst, iterLast);
```

## Container: Pairs
A *pair* is a container with two connected data elements.  It requires the header of `#include <utility>` to utilize.

Pairs are created with the two data types placed in vector braces.
```c++
std::pair<std::string, int> myPair;
```

The `make_pair()` method makes a pair using the first and second element values.
```c++
pairObj = make_pair(firstItem, secondItem);
```

To access the elements of a pair, use:
- `.first()`: Accesses the first element
- `.second()`: Accesses the second element

## Container: Maps
A *map is a container that associates keys to values. It requires the header of `#include <map>` to utilize.

Maps are created in the same way as pais.
```c++
std::map<keyType, valType> newMap;
```

The `emplace()` command adds elements to a map, associating the key to the value.
```c++
statePopulation.emplace("CA", 38332521);
```

The `at()` command returns the value at a given key.
```c++
statePopulation.at("CA");
statePOpulation.at("CA") = 38332521;
```

The `count()` command returns `1` if a key is found, else `0`.

The `erase()` command removes all key entities, while the `clear()` command removes all entities.

## Container: Sets
A *set* is a collection of unique objects. It requires the header of `#include <set>` to utilize.
```c++
std::set<ItemType> newSet;
```

Sets return elements alphabetically and can be iterated through using an iterator or a for-each loop.

The `insert()` command adds an item to a set.
```c++
newSet.insert(userInput); // inserts userInput
newSet.insert(userInput).second; // returns 1 if inserted, else 0
```

The `count()` command returns `1` if an element is found, else `0`.

The `erase()` command removes an item.
```c++
newSet.erase(userInput); // erases userInput
newSet.erase(userInput).second; // returns 1 if erased, else 0
```

## Container: Queues
A *queue* supports element insertion at the tail and removal at the head. It requires the header `#include <queue>` to utilize.
```c++
std::queue<ItemType> que;
```

The `push()` command adds an element to the end and increases the queue's size by one.

The `pop()` command removes an element from the front and decreases the queue's size by one.

The `front()` command returns the front element of a queue.

## Container: Deques
A *deque*, or double-ended queue, supports insertion and removal at both the front and tail ends.  It requires the header `#include <deque>` to utilize.
```c++
std::deque<ItemType> newDeque;
```

Since deques have `push_front()`, `push_back()`, `pop_front()`, and `pop_back()`, deques can be used as both stacks and queues.

## Container Utilization
There are a few functions that make containers more usable.

The `find()` function finds a specific value in a range of elements.  It requires `#include <algorithm>` to use.
```c++
std::find(iterFirst, iterLast, value);
```

The `find_if()` function finds a value that satisfies a boolean.
```c++
std::find_if(iterFirst, iterLast, boolean); // boolean needs no parentheses
```

The `sort()` function sorts all elements in a container in ascending order.
```c++
std::sort(iterFirst, iterLast); // boolean: a < b
std::sort(iterFirst, iterLast, boolean); // a before b means true
``` 