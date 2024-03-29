# Searching Methods
***Linear Searching*** is the process of starting from the beginning, searching every element in the container until the desired item is found.
```c++
int LinearSearch(const int[] &numbers, const int &numberSize, const int &key) {
	for (int i = 0; i < numbersSize; ++i) {
		if (numbers[i] == key) {
			return i;
		}
	}

	// return -1 if not found
	return -1;
}
```

***Binary Search*** is the process of checking the middle item of a **sorted** array; if the item is less, go to left half and search again, else, go to right half and search again.
```c++
int BinarySearch(const int[] &numbers, const int &numberSize, const int &key) {
	int mid = 0;
	int low = 0;
	int high = numberSize - 1;

	while (high >= low) {
		mid = (high + low) / 2;
		if (numbers[mid] < key) { // if bigger, go to upper half
			low = mid + 1;
			continue;
		}
		if (numbers[mid] > key) { // if smaller, go to lower half
			high = mid - 1;
			continue;
		}
		if (numbers[mid] == key) { // if equal, return index
			return mid;
		}
	}

	// return -1 if not found
	return -1;
}
```

## Time Complexity
A ***constant time operation*** is defined as an operation that takes the same time to complete regardless of input values and size.

***Asymptotic Notation*** is the classification of run time complexity.

- $$O(n)$$ is the algorithmic upper-bound. For all $$n \geq 1$$, $$T(n) \leq c \cdot f(n)$$.
- $$\Omega(n)$$ is the algorithmic lower-bound. For all $$n \geq 1$$, $$T(n) \geq c \cdot f(n)$$.
- $$\Theta(n)$$ is the algorithmic tight-bound. For all $$n \geq 1$$, $$T(n) = O(f(n)) = \Omega(f(n))$$.

***Big-Oh Notation*** is how a function behaves in reaction to input size.

- Every loop that goes through an entire list has complexity $$n$$.
- Nested loops are multiplied.
- Typically, if the condition of a loop changes every iteration, the complexity is $$\log(n)$$.
- Loops with constant bounds run in constant $$O(1)$$ time.

## Sorting
***Sorting*** is the process of converting a list into ascending or descending order.

***Selection Sort*** moves unsorted elements to the sorted section.
```c++
void SelectionSort(int[] &numbers, const int &numbersSize) {
	int i = 0;
	int j = 0;
	int indexSmallest = 0;
	int temp = 0;

	// iterate through list items
	for (i = 0; i < numbersSize; ++i) {
		indexSmallest = i;
		
		// find index of smallest remaining element
		for (j = i + 1; j < numberSize; ++j) {
			if (numbers[j] < numbers[indexSmallest]) {
				indexSmallest = j;
			}
		}
		
		// swap i and indexSmallest
		std::swap(numbers[i], numbers[indexSmallest]);
	}
}
```

***Insertion Sort*** moves unsorted elements into their right spot.
```c++
void InsertionSort(int[] &numbers, const int &numbersSize) {
   int i = 0;
   int j = 0;
   int temp = 0;  // Temporary variable for swap
   
   for (i = 1; i < numbersSize; ++i) {
      j = i;

      // Insert numbers[i] into sorted part stopping once numbers[i] in correct position
      while (j > 0 && numbers[j] < numbers[j - 1]) {
         // Swap numbers[j] and numbers[j - 1]
         std::swap(numbers[j], numbers[j - 1]);
         --j;
      }
   }
}
```