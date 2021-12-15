# ***Data Structures***: Hash Tables
A *hash table* is a data structure that stores unordered items by mapping each item to an array location.  Hash tables are advantageous because it reduces the time complexity for search, insert, and remove from O(n) to O(1).
- *Key*: The value used to map to an index
- *Bucket*: Hash table array element
- *Hash Function*: A function that compute the index from the key

The *Modulo Operator* is the most common and functional has function, which finds the remainder when dividing two numbers.

A *collision* happens when an item being inserted maps to the same bucket as an existing item in the table.  This needs to be immediately resolved.

## Chaining
*Chaining* is a collision-resolution technique that involves creating (linked) lists at each bucket to extend the amount of items that can be stored in the bucket.

```c++
// hashInsert - inserts item into hash table
HashInsert(item) {
	if (hashSearch(item->key) == nullptr) {
		// go to bucket
		bucketList = hashTable[Hash(item->key)];
		
		// establish node being inserted
		node = new Node;
		node->next = nullptr;
		node->data = item;

		// append node to list
		ListAppend(node);
	}
}
```

```c++
// hashRemove - removes item from hash table
HashRemove(item) {
	// go to list where item is
	bucketList = hashTable[Hash(item->key)];
	
	// find item in list
	itemNode = ListSearch(item->key);

	// remove if found
	if (itemNode != nullptr) {
		ListRemove(itemNode);
	}
}
```
```c++
// hashSearch - looks for item and returns value or nullptr
HashSearch(key) {
	// go to list where item is
	bucketList = hashTable[Hash(key)];

	// find item in list
	itemNode = ListSearch(key);

	// return item
	return (itemNode != nullptr) ? itemNode->data : nullptr;
}
```

## Linear Probing
*Linear Probing* is a collision-handling technique that starts at the mapped bucket, then linearly searches for the next open bucket and inserts at that position.

Probing identifies two different types of empty buckets: *empty-since-start* buckets and *empty-after-removal* buckets.
 - *Empty-since-start*: Buckets that have never had an item inserted into the bucket
 - *Empty-after-removal*: Buckets that are empty because an item was removed from them

The Linear Probing *Insert* function stops at the first empty bucket, **regardless of its type**.  It returns a boolean of whether the item was inserted.
```c++
// HashInsert using linear probing
HashInsert(key) {
	// find intended bucket
	bucket = Hash(key);
	bucketsProbed = 0;

	// continue searching all sequential buckets
	while (bucketsProbed < table.size()) {
		// if empty, insert
		if (hashTable[bucket] is empty) {
			hashTable[bucket] = item;
			return true;
		}

		// otherwise, move on to next
		bucket = (bucket + 1) % table.size();
		++bucketsProbed;
	}

	// if reached here, no item was inserted
	return false;
}
```

The Linear Probing *Removal* function stops running at the first **empty-since-start** bucket, or if the item was found, or if all buckets are searched.
```c++
// HashRemove using linear probing
HashRemove(key) {
	// find intended bucket
	buckets = Hash(key);
	bucketsProbed = 0;

	// continue searching all sequential buckets
	while (bucketsProbed < table.size() && hashTable[bucket] != EmptySinceStart) {
		// if found, remove
		if (hashTable[bucket] is not empty && hashTable[bucket]->key = key) {
			hashTable[bucket] = EmptyAfterRemoval;
			return;
		}
		
		// otherwise, move on
		bucket = (bucket + 1) % table.size();
		++bucketsProbed;
	}
}
```

The Linear Probing *Search* function follows the same process as the *Remove* function.
```c++
// HashSearch using linear probing
HashSearch(key) {
	// find intended bucket
	buckets = Hash(key);
	bucketsProbed = 0;

	// continue searching all sequential buckets
	while (bucketsProbed < table.size() && hashTable[bucket] != EmptySinceStart) {
		// if found, return item
		if (hashTable[bucket] is not empty && hashTable[bucket]->key = key) {
			return hashTable[bucket];
		}
		
		// otherwise, move on
		bucket = (bucket + 1) % table.size();
		++bucketsProbed;
	}

	// if not found, return nullptr
	return nullptr;
}
```

## Quadratic Probing
*Quadratic Probing* is a collision-handling technique that starts at the key-mapped bucket and quadratically-searches until an empty bucket is defined.

Quadratic probing follows a user-defined iteration function, that which goes through the sequential points to find the next open space.  Quadratic probing also uses the same convention as linear probing when dealing with empty-since-start and empty-after-removal buckets.

The standard equation for quadratic probing is: `(Hash(key) + c1(i) + c2(i * i)) % table.size()`, where `i` is the iterator.

```c++
// HashInsert using quadratic probing
HashInsert(item) {
	// bucketsProbed is our iterator
	bucketsProbed = 0;

	// find intended hash bucket
	bucket = Hash(item->key) % table.size();

	// iterate and find empty bucket
	while (bucketsProbed < table.size()) {
		// if found, insert
		if (hashTable[bucket] is empty) {
			hashTable[bucket] = item;
			return true;
		}

		// otherwise, change bucket to next value per function
		bucket = (Hash(item->key) + c1(bucketsProbed) + c2(bucketsProbed * bucketsProbed)) % table.size();
		++bucketsProbed;
	}

	// if insert not possible, return false
	return false;		
}
```
```c++
// HashRemove using quadratic probing
HashRemove(item) {
	// bucketsProbed is our iterator
	bucketsProbed - 0;

	// find intended hash bucket
	bucket = Hash(item->key) % table.size();

	// iterate and find empty bucket
	while (bucketsProbed < table.size() && hashTable[bucket] != EmptySinceStart) {
		// if found, remove
		if (hashTable[bucket] is not empty && hashTable[buckey]->key = key) {
			hashTable[bucket] = EmptyAfterRemoval;
			return;
		}

		// otherwise, change bucket to next value per function
		bucket = (Hash(item->key) + c1(bucketsProbed) + c2(bucketsProbed * bucketsProbed)) % table.size();
		++bucketsProbed;
	}
}
```
```c++
// HashSearch using quadratic probing
HashSearch(item) {
	// bucketsProbed is our iterator
	bucketsProbed - 0;

	// find intended hash bucket
	bucket = Hash(item->key) % table.size();

	// iterate and find empty bucket
	while (bucketsProbed < table.size() && hashTable[bucket] != EmptySinceStart) {
		// if found, remove
		if (hashTable[bucket] is not empty && hashTable[buckey]->key = key) {
			return hashTable[bucket];
		}

		// otherwise, change bucket to next value per function
		bucket = (Hash(item->key) + c1(bucketsProbed) + c2(bucketsProbed * bucketsProbed)) % table.size();
		++bucketsProbed;
	}
	
	// if not found, return nullptr
	return nullptr;	
}
```

## Double Hashing
*Double Hashing* is a collision-resolution technique that uses two different hash functions to compute indices.

The standard probing equation is: `(H1(key) + H2(key)) % table.size()`.

## Hash Table Resizing
To *resize* a hash table is to increase the number of buckets, preserving all original elements.  This does not mean, however, that they will be matched with the same index value, but rather all elements of the old table wil be in the new table.

The common resize value is the **next prime number greater than twice the current size**.

Below is the process for resizing a hash table.
```c++
// HashResize - resizes a hash table to a bigger size
HashResize(currentSize) {
	// find new size and construct new Array
	newSize = nextPrime(2 * currentSize);
	newArray = new Array[newSize];

	// initialize all elements as EmptySinceStart
	for (item : newArray) {
		item = EmptySinceStart;
	}
	
	// iterate through old array and hash to new array
	bucket = 0;
	while (bucket < currentSize) {
		if (hashTable[bucket] is not empty) {
			key = hashTable[bucket];
			HashInsert(newArray, key);
		}
	}

	// return new hash table
	return newArray;
}

// Hash - defined has function
Hash(key, tableSize) {
	return key % tableSize;
}
```

Resizing should be considered when one of the following exceeds a certain threshold:
- *Load Factor*: Percentage of filled buckets (typically `> 60%`)
- *Open Addressing Resolution*: Number of collisions per insert (typically `> table.size()/3`)
- *Chaining Resolution*: Size of Bucket's Linked List (typically `> 4`)

## Methods of Hashing
There are many ways to hash a function, some of them more consistent than others.

A *perfect hash function* maps items to buckets perfectly and without collision.

*Modulo hash functions* uses division remainder of key and table size.
```c++
// Modulo hash function
Hash(key, size) {
	return key % size;
}
```

*Mid-Square hash functions* extracts the middle `R` digits from a number's square and returns `R % table.size()`.  This is primarily done bitwise for speed.
```c++
// Mid square hash function
MidSquareHash(key, R, size) {
	squaredKey = key * key;
	lowBits = (32 - R) / 2;
	extractedBits = squaredKey >> lowBits;
	extractedBits = extractedBits & (0xFFFFFFFF >> (32 - R));

	// modulus table size
	return extractedBits % size;
}
```

An easier function to implement is to use a time-based seed function, which relies on similar logic but does all computations in base 10.

**Multiplicative String hash functions* repeatedly multiplies hash functions and adds the ASCII value of each string character to the function.
```c++
// Multiplicative string hash function
HashMultiplicative(key, hashMultiplier, size) {
	stringHash = InitialValue;

	// for each character, multiply and add char value
	for (strChar : key) {
		stringHash = (stringHash * hashMultiplier) + strChar;
	}
	
	// modulus table size
	return stringHash % size;
}
```

## Direct Access Functions
*Direct Access Functions* use the item's key as the bucket index. This makes their code and implementation super simple
```c++
// HashInsert using Direct Access
HashInsert(item) {
	hashTable[item->key] = item;
}
```
```c++
// HashRemove using Direct Access
HashRemove(item) {
	hashTable[item->key] = Empty;
```
```c++
// HashSearch using Direct Access
HashSearch(key) {
	if (hashTable[key] is not empty) {
		return hashTable[key];
	}
	
	// return false if not found
	return nullptr;
}
```

## Cryptography
*Cryptography* is the field of study focused on transmitting data securely.  It uses *encryption* to alter data to hide its meaning, then *decryption* to reconstruct the original data from the encrypted data.

*Cryptographic Hashing Functions* are hash functions that are made specifically for cryptography.

*Password Hashing* is the process for producing a hash value for a password to add extra security.