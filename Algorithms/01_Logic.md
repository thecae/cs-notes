<!---
CS NOTES :: ALGORITHMS :: LOGIC

BY: COLE ELLIS

LAST MODIFIED: 18 DEC 2021
-->

# ***Algorithms***: Logic
*Logic* is the study of formal reasoning.  Logic is important for proving theorems, expressing statements clearly, and conveying an argument.

A *proposition* is the most basic element in logic, and is a statement that is either `true` or `false`.  A proposition's *truth value* indicates where it is true or false.  Below are some examples.

| Proposition | Truth Value |
|-------------|-------------|
| 2+2=4 | True |
| 2+2=5 | False |
| Monday will be cloudy. | Unknown |
| The movie was good. | Matter of opinion |

## Logical Operators
A *compound proposition* connects individual propositions with logical operators.  A *logical operator* combines propositions to yield a final result.

The list of logical operators are stated below with their truth tables:
- *Conjunction* (`∧`): AND

| `p` | `q` | `p ∧ q` |
|-----|-----|----------|
| T | T | T |
| T | F | F |
| F | T | F |
| F | F | F | 

- *Disjunction* (`∨`): OR

| `p` | `q` | `p ∨ q` |
|-----|-----|----------|
| T | T | T |
| T | F | T |
| F | T | T |
| F | F | F | 

- *Exclusive Or* (`XOR`): Either (`p` and `q` are different)

| `p` | `q` | `p XOR q` |
|-----|-----|-----------|
| T | T | F |
| T | F | T |
| F | T | T |
| F | F | F | 

- *Negation* (`~`): NOT

| `p` | `~p` |
|-----|------|
| T | F |
| F | T |

A *truth table* shows the truth value of a compound proposition for every possible combination of True and False.  Truth tables are guaranteed to have `2^n` rows, where `n` is the number of parameters.  Here is how to establish a truth table:
- Alternate the rightmost column between True and False
- For every sequential column, alternate between twice as many True and False (i.e. second column alternates True, True, False, False,....)

## Conditional Statements
The *conditional operation* denotes implication.  The symbol for the conditional operator is `->`.  The proposition `p -> q` is read as "If `p`, then `q`".

A compound proposition using a conditional operation is a *conditional proposition* or *conditional statement*.  The proposition `p` is called the *hypothesis* and the proposition `q` is the *conclusion*.  Below is the truth table for the conditional operator.

| `p` | `q` | `p -> q` |
|-----|-----|----------|
| T | T | T |
| T | F | F |
| F | T | T |
| F | F | T |

***Note**: To explain why this truth table works, consider a conditional statement as a promise.  If a promise is made (`p = T`) and the follow-through is not made (`q = F`), the promise is broken and is marked as false.  If the promise was never made (`p = F`), the outcome doesn't matter and no promise is broken, and we mark that as true.*

Below are some Englsh statements that represent the same conditional operation (`p -> q`):

| Statement | Example |
|-----------|---------|
| If `p`, then `q` | If you mow the lawn, then I will pay you. |
| If `p`, `q` | If you mow the lawn, I will pay you. |
| `q` if `p` | I will pay you if you mow the lawn. |
| `p` implies `q` | Mowing the lawn implies I will pay you. |
| `p` only if `q` | You will mow the lawn only if I pay you. |
| `p` is sufficient for `q` | Mowing the lawn is sufficient for me to pay you. |
| `q` is necessary for `p` | Mowing the lawn is necessary for me to pay you. |

Given a conditional statement `p -> q`, we define three more variation as:
- *Converse*: `q -> p`
- *Inverse*: `~p -> ~q`
- *Contrapositive*: `~q -> ~p`

A *biconditional statement* is only true when the conditional statement and the converse are both true.  It is read as *if and only if* or *iff* and is denoted as `p <-> q`.

## Logical Equivalence
A *tautology* is a compound proposition that always evaluates to `true`, regardless of the truth value of the individual propositions.

| `p` | `~p` | `p ∨ ~p` |
|-----|------|-----------|
| T | F | T |
| F | T | T |

A *contradition* is a compound proposition that always evaluates to `false`, regardless of the truth value of the individual propositions.

| `p` | `~p` | `p ∧ ~p` |
|-----|------|-----------|
| T | F | F |
| F | T | F |

Two statements are *logically equivalent* if they have the same truth value regardless of their indiviual propositions.  The denotation for equivalent propositions is `s ≡ r`.

There are two ways to prove logical equivalence: using a truth tables to show for all values, or using propositional logic (explained later).  Below is an example of using a truth table (proving `~p ∨ ~q ≡ ~(p ∧ q)`:

| `p` | `q` | `~p` | `~q` | `p ∧ q` | `~(p ∧ q)` | `~p ∨ ~q` |
|-----|-----|------|------|----------|-------------|------------|
| T | T | F | F | T | **F** | **F** |
| T | F | F | T | F | **T** | **T** |
| F | T | T | T | F | **T** | **T** |
| F | F | T | T | F | **T** | **T** |

## Laws of Propositional Logic
If two propositions are logically equivalent, then one can be substituted for the other within a more complex proposition. The compound proposition after the substitution is logically equivalent to the compound proposition before the substitution.

| Law | Version 1 | Version 2 |
|-----|-----------|-----------|
| Idempotent Laws | `p ∨ p ≡ p`| `p ∧ p ≡ p` |
| Associative Laws | `(p ∨ q) ∨ r ≡ p ∨ (q ∨ r)` | `(p ∧ q) ∧ r ≡ p ∧ (q ∧ r)` |
| Commutative Laws | `p ∨ q ≡ q ∨ p` | `p ∧ q ≡ q ∧ p` |
| Distributive Laws | `p ∨ (q ∧ r) ≡ (p ∨ q) ∧ (p ∨ r)` | `p ∧ (q ∨ r) ≡ (p ∧ q) ∨ (p ∧ r)` |
| Identity Laws | `p ∨ F ≡ p` | `p ∧ T ≡ p` |
| Domination Laws | `p ∧ F ≡ F` | `p ∨ T ≡ T` |
| Double Negation Laws | `~~p ≡ p` | --- |
| Complement Laws | `p ∧ ~p ≡ F`, `~T ≡ F` | `p ∨ ~p ≡ T`, `~F = T` |
| De Morgan's Laws | `~(p ∨ q) ≡ ~p ∧ ~q` | `~(p ∧ q) ≡ ~p ∨ ~q` |
| Absorption Laws | `p ∨ (p ∧ q) ≡ p` | `p ∧ (p ∨ q) ≡ p` |
| Conditional Identities | `p -> q = ~p ∨ q` | `p <-> q ≡ (p -> q) ∧ (q -> p)` |

## Predicates and Quantifiers
A *predicate* is a statement whose truth value depends on at least one variable.  For example, `P(x,y) := (x^2 = y)` is a predicate while `P(2,4)` is a proposition.

The *domain* of a variable in a predicate is the set of all possible values for the variable.

A *quantifier* asserts the bounds on `x`.  There are two types of quantifiers:
- *Universal Quantifier* (`∀`): "For all"
- *Existential Quantifier* (`∃`): "There exists"

A quantifier is simply another operated and must operate on a variable.  For example, `∀x P(x)` indicates that for all `x`, `P(x)` is true.

A *free variable* is a variable that is free to take on any value in the domain.  A *bound variable* is a variable that is bound to a quantifier.

In the statement `(∀x P(x)) ∧ Q(x)`, the variable `x` in `P(x)` is bound by the universal quantifier, but the variable `x` in `Q(x)` is not bound by the universal quantifier. Therefore the statement `(∀x P(x)) ∧ Q(x)` is not a proposition. In contrast, the universal quantifier in the statement `∀x (P(x) ∧ Q(x))` binds both occurrences of the variable `x`. Therefore `∀x (P(x) ∧ Q(x))` is a proposition.

De Morgan's Laws for quantified statements demonstrate how to distribute negative signs inside of quantifiers:
- `¬∀x P(x) ≡ ∃x ¬P(x)`
- `¬∃x P(x) ≡ ∀x ¬P(x)`

A *nested quantifier* is a logical expression with more than one quantifier that bind different variables in the same predicate.

De Morgan's Laws for nested quantifiers:
- `¬∀x ∀y P(x,y) ≡  ∃x ∃y ¬P(x,y)`
- `¬∀x ∃y P(x,y) ≡  ∃x ∀y ¬P(x,y)`
- `¬∃x ∀y P(x,y) ≡  ∀x ∃y ¬P(x,y)`
- `¬∃x ∃y P(x,y) ≡  ∀x ∀y ¬P(x,y)`

Here are some examples of using nested quantifiers:
- Everyone else: `∀x ∀y ((x ≠ y) -> P(x,y))`
- Exactly one: `∃x (P(x) ∧ ∀ y (y ≠ x) -> ~P(y)))`

## Logical Reasoning
An *argument* is a sequence of propositions, called *hypotheses*, followed by a final proposition, called a *conclusion*.

An argument is *valid* if the conclusion is true whenever all the hypotheses are true, otherwise the argument is *invalid*.  Arguments are denoted as:
```blank
p1
p2
...
pn
---
∴ q
```

Below is the example of an invalid argument:
```blank
¬p 
p → q
-----
∴ ¬q
```
Here are the rules of inference for valid arguments:
- Modus Ponens
```blank
p
p -> q
------
∴ q
```
- Modus Tollens
```blank
~q
p -> q
------
~p
```
- Addition
```blank
p
-------
∴ p ∨ q
```
- Simplification
```blank
p ∧ q
-----
∴ p
```
- Conjunction
```blank
p
q
-------
∴ p ∧ q
```
- Hypothetical Syllogism
```blank
p -> q
q -> r
--------
∴ p -> r
```
- Disjunctive Syllogism
```blank
p ∨ q
~p
-----
∴ q
```
- Resolution
```blank
p ∨ q
~p or r
-------
∴ q ∨ r
```

An *element* is a value that can be plugged in for `x`.  An *arbitrary element* has no special properties other than those shared by all elements.  A *particular element& may have properties not shared by all elements.

The rules *existential instantiation* and *universal instantiation* replace a quantified variable with an element of the domain. The rules *existential generalization* and *universal generalization* replace an element of the domain with a quantified variable. Note that the rules only apply to non-nested quantifiers. Applying the rules of inference to nested quantifiers would require more constraints on which rules could be applied in particular situations.
- Universal Instantiation
```blank
c is an element
∀x P(x)
---------------
∴ P(c)
```
- Universal Generalization
```blank
c is an arbitrary element
P(c)
-------------------------
∴ ∀x P(x)
```
- Existential Instantiation
```blank
∃x P(x)
------------------------------------
∴ (c is a particular element) ∧ P(c)
```
- Existential Generalization
```blank
c is an element
P(c)
---------------
∴ ∃x P(x)
```




















```

```