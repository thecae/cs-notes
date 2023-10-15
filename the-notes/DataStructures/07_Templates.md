# Templates
Functions can be built with different data types to accomplish similar goals.  This overloading of data type makes multiple long functions with very repetitive code.
```c++
int TripleMinInt(int item1, int item2, int item3) {
	int minVal = item1;
	if (item2 < minVal) {
		minVal = item2;
	}
	if (item3 < minVal) {
		minVal = item3;
	}
	return minVal;
}

char TripleMinChar(char item1, char item2, char item3) {
	char minChar = item1;
	if (item2 < minChar) {
		minChar = item2;
	}
	if (item3 < minVal) {
		minChar = item3;
	}
	return minChar;
}
```

A ***function template*** is a function definition that has a special typename as another variable.  It is given a typename and can be used as any other datatype.
```c++
template <typename T>
T TripleMin(T item1, T item2, T item3) {
	T minVal = item1;
	if (item2 < minVal) {
		minVal = item2;
	}
	if (item3 < minVal) {
		minVal = item3;
	}
	return minVal;
}
```

## Template Classes
***Class templates*** uses type parameters in the entire class in place of datatypes.
```c++
template <typename T>
class Triplet {
	private:
		T item1;
		T item2;
		T item3;
	
	public:
		Triplet(T val1 = 0, T val2 = 0, T val3 = 0);

		T minItem() const;

		void printAll() const;
};

template <typename T>
Triplet<T>::Triplet(T val1, T val2, T val3) {
	item1 = val1;
	item2 = val2;
	item3 = val3;
}

int main() {
	Triplet<int> trip(3, 2, 5);
}
```	

In this case, the ***template*** parameter is used in place of any type.
