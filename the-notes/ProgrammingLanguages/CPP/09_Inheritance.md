# Inheritance
A ***derived class*** (or ***subclass***) is a class that is derived from another class.  The ***base class*** (or ***superclass***) is the generic class that the derived class is based from.

***Inheritance*** is the concept that the derived class inherits properties from the base class.
```c++
// Base class
class GenericItem {
   public:
      void SetName(std::string newName) { 
          itemName = newName; 
      }
   
      void SetQuantity(int newQty) {
          itemQuantity = newQty; 
      }
   
      void PrintItem() {
          std::cout << itemName << " " << itemQuantity << endl;
      }
   
   private:
      std::string itemName;
      int itemQuantity;
};

// Derived class inherits from GenericItem 
class ProduceItem : public GenericItem { 
   public:
      void SetExpiration(std::string newDate) { 
          expirationDate = newDate; 
      }
   
      std::string GetExpiration() { 
          return expirationDate; 
      }
   
   private:
      std::string expirationDate;
};
```

Below are some inheritance variations:

- A derived class can serve as a base class for another class. Ex: `class FruitItem: public ProduceItem {...}` creates a derived class `FruitItem` from `ProduceItem`, which was derived from `GenericItem`.
- A class can serve as a base class for multiple derived classes. Ex: `class FrozenFoodItem: public GenericItem {...}` creates a derived class FrozenFoodItem that inherits from `GenericItem`, just as `ProduceItem` inherits from `GenericItem`.
- A class may be derived from multiple classes. Ex: `class House: public Dwelling, public Property {...}` creates a derived class House that inherits from base classes `Dwelling` and `Property`.

## Member Access
The members of a derived class have access to the public members of the base class, but not to the private members of the base class. This is logical—allowing access to all private members of a class merely by creating a derived class would circumvent the idea of private members. Thus, adding the following member function to the Restaurant class yields a compiler error.

A third access specifier is ***protected***, which provides access to derived classes but not by anyone else. The following illustrates the implications of the protected access specifier.
```c++
class Business {   
   protected: // Members accessible by self and derived classes
      std::string name;
   
   private:   // Members accessible only by self
      std::string address;

   public:    // Members accessible by anyone
      void PrintMembers();
};

class Restaurant : public Business {
   private:
      int rating;

   public:

      /* ... */

      void DisplayRestaurant() {
         // Attempted accesses
         PrintMembers();             // OK
         name = "Gyro Hero";         // OK    ("protected" above made this possible)
         address = "5 Fifth St";     // ERROR
      }

      // Other class members ...

};

int main() {
   /* ... */
   
   Business business;
   Restaurant restaurant;
   
   /* ... */
   
   // Attempted accesses
   business.PrintMembers();          // OK
   business.name  = "Gyro Hero";     // ERROR (protected only applies to derived classes)
   business.address = "5 Fifth St";  // ERROR
   
   restaurant.PrintMembers();         // OK
   restaurant.name  = "Gyro Hero";    // ERROR
   restaurant.rating = 5;  // ERROR
   
   return 0;
}
```

To summarize the type of specifiers, consult the below table.

| Specifier | Description |
|-----------|-------------|
| `private` | Accessible by self |
| `protected` | Accessible by self and derived classes |
| `public` | Accessible by self, derived classes, and everyone else |

Separately, the keyword "public" in a class definition like `class DerivedClass: public BaseClass {...}` has a different purpose, relating to the kind of inheritance being carried out:

- `public` : "`public->public, protected->protected`" -- public members of `BaseClass` are accessible as public members of DerivedClass, and protected members of `BaseClass` are accessible as protected members of `DerivedClass`.
- `protected` : "`public->protected, protected->protected`" -- public and protected members of BaseClass are accessible as protected members of `DerivedClass`.
- `private` : "`public->private, protected->private`" -- public and protected members of BaseClass are accessible as private members of `DerivedClass`. Incidentally, if the specifier is omitted as in "`class DerivedClass: BaseClass {...}`", the default is private.

## Overriding Member Functions
When a derived class defines a member function that has the same name and parameters as a base class's function, the member function is said to ***override*** the base class's function.
```c++
class Business {
   public:
      ...
      std::string GetDescription() const {
         return name + " -- " + address;
      }

   protected:
      std::string name;
      std::string address;
};

class Restaurant : public Business {
   public:
      ...
      std::string GetDescription() const { // overrides above GetDescription function
         return name + " -- " + address + 
            "\n  Rating: " + std::to_string(rating);
      }

   private:
      int rating;
};

int main() {
   Restaurant favoritePlace;
   favoritePlace.SetName("Friends Cafe");
   favoritePlace.SetAddress("500 W 2nd Ave");
   favoritePlace.SetRating(5);
   std::cout << favoritePlace.GetDescription() << endl;

   return 0;
}
```

An overriding function can call the overridden function by prepending the base class name.
```c++
class Restaurant : public Business {

   /* ... */

   std::string GetDescription() const {
      return Business::GetDescription() + "\n  Rating: " + std::to_string(rating);
   };

   /* ... */
};
```

# Polymorphism and Virtual Member Functions
***Polymorphism*** refers to determining which program ehavior to execute depending on the data type.  There are two types:

- ***Compile-time polymorphism*** is when the compiler determines which function to call at compile-time.
- ***Runtime polymorphism*** is when the compiler is unable to determine which function to call at compile-time, so the determination is made while the program is running.

```c++
// Compile-Time Polymorphism
void DriveTo(std::string restaurant) {
   std::cout << "Driving to " << restaurant << endl;
}

void DriveTo(Restaurant restaurant) {
   std::cout << "Driving to " << restaurant.GetDescription() << endl;
}

int main() {
   DriveTo("Big Mac's");  // Call string version
}
```
```c++
// Runtime Polymorphism
void DriveTo(Business* businessPtr) {
   std::cout << "Driving to " << businessPtr->GetDescription() << endl;
}

int main() {
   int index;
   std::vector<Business*> businessList;
   Business* businessPtr;
   Restaurant* restaurantPtr;
   
	/* ... */
   
   businessList.push_back(businessPtr);
   businessList.push_back(restaurantPtr);

   index = rand() % businessList.size();
   DriveTo(businessList.at(index));
}
```

The program above uses a C++ feature called ***derived/base class pointer conversion***, where a pointer to a derived class is converted to a pointer to the base class without explicit casting. 

A ***virtual function*** is a member function that may be overriden in a derived class and is used for runtime polymorphism.  The ***override*** keyword is an optional keyword to indicate that a virtual function is overridden in a derived class.
```c++
class Business {
public:
   std::string GetDescription() const {
      return name + " -- " + address;
   }
   ...
};

class Restaurant : public Business {
public:
   std::string GetDescription() const {
      return name + " -- " + address +
         "\n  Rating: " + std::to_string(rating);
   }
   ...
};

int main() {
   Business* businessPtr;
   Restaurant favoriteCafe;
   favoriteCafe.SetName("Friends Cafe");
   favoriteCafe.SetAddress("500 2nd Ave");
   favoriteCafe.SetRating(5);

   // Point to favoriteCafe
   businessPtr = &favoriteCafe;

   std::cout << businessPtr->GetDescription();
}
```

A ***pure virtual function*** is a virtual function that has no definition in the base class, and all derived classes must override the function.  It is declared with a virtual function and is assigned to zero.  A class with at least one pure virtual function is known as an ***abstract base class***.
```c++
class Business {
public:
   void SetName(std::string busName) {
      name = busName;
   }

   void SetAddress(std::string busAddress) {
      address = busAddress;
   }

   virtual std::string GetDescription() const {
      return name + " -- " + address;
   }

   virtual std::string GetHours() const = 0;     // pure virtual function

protected:
   std::string name;
   std::string address;
};
```

## Abstract Classes
Object-Oriented Programming (OOP) is a powerful programming technique consisting of three main features:

- ***Classes***: Encapsulates data and behavior into objects
- ***Inheritance***: Allows one class to be based on another
- ***Abstract class***: A class that guides the design of subclasses but does not function as a standalone object

To summarize:

- A ***pure virtual function*** is a virtual function that is not implemented in the base class, thus all derived classes must override the function.
- An ***abstract class*** is a class that cannot be instantiated as an object, but is the superclass for a subclass and specifies how the subclass must be implemented. Any class with one or more pure virtual functions is abstract.
- A ***concrete class*** is a class that is not abstract, and hence can be instantiated.

## Is-a Vs. Has-a
***Composition*** (a has-a relationship) is the idea that one object may be made up of other objects.  This does not involve inheritance.
```c++
class ChildInfo {
   string firstName;
   string birthDate;
   string schoolName;

   /* ... */
};

class MotherInfo { // a mother HAS a child
   string firstname;
   string birthDate;
   string spouseName;
   vector<ChildInfo> childrenData;

   /* ... */
};
```

***Inheritance*** (a is-a relationship) where a class is made up of other classes' objects.
```c++
class PersonInfo {
   string firstName;
   string birthDate;

   /* ... */
};

class ChildInfo : public PersonInfo { // a child IS A person
   string schoolName;

   /* ... */
};

class MotherInfo : public PersonInfo {
   string spouseName;
   vector<ChildInfo> childrenData;

   /* ... */
};
```

Programmers commonly draw class inheritance relationships using ***Unified Modeling Language (UML)***.  UML a language for software design that uses different types of diagrams to visualize the structure and behavior of programs. A ***structural diagram*** visualizes static elements of software, such as the variables and functions used in the program. A ***behavioral diagram*** visualizes dynamic behavior of software, such as the flow of an algorithm.

A UML ***class diagram*** is a structural diagram that can be used to visually model the classes of a computer program, including member variables and functions.

- `-`: Private Variable
- `+`: Public Variable
- `->`: Identifies one class inherits from another
- *Italics*: Denotes abstract classes
