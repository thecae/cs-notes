# Logic

_**Logic**_ is the study of formal reasoning. Logic is important for proving theorems, expressing statements clearly, and conveying an argument.

A _**proposition**_ is the most basic element in logic and is a statement that is either `true` or `false`. A proposition's _**truth value**_ indicates whether it is true or false. Below are some examples.

| Proposition            | Truth Value       |
| ---------------------- | ----------------- |
| $$2+2=4$$                  | True              |
| $2+2=5$                | False             |
| Monday will be cloudy. | Unknown           |
| The movie was good.    | Matter of opinion |

## Logical Operators

A _**compound proposition**_ connects individual propositions with logical operators. A _**logical operator**_ combines propositions to yield a final result.

The list of logical operators is stated below with their truth tables:

* _**Conjunction**_ ($\land$): AND

| $p$ | $q$ | $p \land q$ |
| --- | --- | ----------- |
| T   | T   | **T**       |
| T   | F   | **F**       |
| F   | T   | **F**       |
| F   | F   | **F**       |

* _**Disjunction**_ ($\lor$): OR

| $p$ | $q$ | $p \lor q$ |
| --- | --- | ---------- |
| T   | T   | **T**      |
| T   | F   | **T**      |
| F   | T   | **T**      |
| F   | F   | **F**      |

* _**Exclusive Or**_ ($\oplus$): Either ($p$ and $q$ are different)

| $p$ | $q$ | $p \oplus q$ |
| --- | --- | ------------ |
| T   | T   | **F**        |
| T   | F   | **T**        |
| F   | T   | **T**        |
| F   | F   | **F**        |

* _**Negation**_ ($\neg$): NOT

| $p$ | $\neg p$ |
| --- | -------- |
| T   | **F**    |
| F   | **T**    |

A _**truth table**_ shows the truth value of a compound proposition for every possible combination of True and False. Truth tables are guaranteed to have $2^n$ rows, where $n$ is the number of parameters. Here is how to establish a truth table:

* Alternate the rightmost column between True and False
* For every sequential column, alternate between twice as many True and False (i.e., the second column alternates True, True, False, False, etc.)

## Conditional Statements

The _**conditional operation**_ denotes implication. The symbol for the conditional operator is $\rightarrow$. The proposition $p \rightarrow q$ is read as "If $p$, then $q$".

A compound proposition using a conditional operation is a _**conditional proposition**_ or _**conditional statement**_. The proposition $p$ is called the _**hypothesis,**_ and the proposition $q$ is the _**conclusion**_. Below is the truth table for the conditional operator.

| $p$ | $q$ | $p \rightarrow q$ |
| --- | --- | ----------------- |
| T   | T   | **T**             |
| T   | F   | **F**             |
| F   | T   | **T**             |
| F   | F   | **T**             |

_**Note**: To explain why this truth table works, consider a conditional statement as a promise. If a promise is made ($p = T$) and the follow-through is not made ($q = F$), the promise is broken and is marked as false. If the promise was never made ($p = F$), the outcome doesn't matter, and no promise is broken, and we mark that as true._

Below are some English statements that represent the same conditional operation ($p \rightarrow q$):

| Statement                 | Example                                          |
| ------------------------- | ------------------------------------------------ |
| If $p$, then $q$          | If you mow the lawn, then I will pay you.        |
| If $p$, $q$               | If you mow the lawn, I will pay you.             |
| $q$ if $p$                | I will pay you if you mow the lawn.              |
| $p$ implies $q$           | Mowing the lawn implies I will pay you.          |
| $p$ only if $q$           | You will mow the lawn only if I pay you.         |
| $p$ is sufficient for $q$ | Mowing the lawn is sufficient for me to pay you. |
| $q$ is necessary for $p$  | Mowing the lawn is necessary for me to pay you.  |

Given a conditional statement $p \rightarrow q$, we define three more variations as:

* _**Converse**_: $q \rightarrow p$
* _**Inverse**_: $\neg p \rightarrow \neg q$
* _**Contrapositive**_: $\neg q \rightarrow \neg p$

A _**biconditional statement**_ is only true when the conditional statement and the converse are both true. It is read as _if and only if_ or \*\*_iff_ and is denoted as $p \leftrightarrow q$.

## Logical Equivalence

A _**tautology**_ is a compound proposition that always evaluates to `true`, regardless of the truth value of the individual propositions.

| $p$ | $\neg p$ | $p \lor \neg p$ |
| --- | -------- | --------------- |
| T   | F        | **T**           |
| F   | T        | **T**           |

A _**contradiction**_ is a compound proposition that always evaluates to `false`, regardless of the truth value of the individual propositions.

| $p$ | $\neg p$ | $p \land \neg p$ |
| --- | -------- | ---------------- |
| T   | F        | **F**            |
| F   | T        | **F**            |

Two statements are _**logically equivalent**_ if they have the same truth value regardless of their individual propositions. The denotation for equivalent propositions is $s \equiv r$.

There are two ways to prove logical equivalence: using a truth tables to show for all values, or using propositional logic (explained later). Below is an example of using a truth table (proving $\neg p \lor \neg q \equiv \neg (p \land q)$:

| $p$ | $q$ | $\neg p$ | $\neg q$ | $p \land q$ | $\neg (p \land q)$ | $\neg p \lor \neg q$ |
| --- | --- | -------- | -------- | ----------- | ------------------ | -------------------- |
| T   | T   | F        | F        | T           | **F**              | **F**                |
| T   | F   | F        | T        | F           | **T**              | **T**                |
| F   | T   | T        | T        | F           | **T**              | **T**                |
| F   | F   | T        | T        | F           | **T**              | **T**                |

## Laws of Propositional Logic

If two propositions are logically equivalent, one can be substituted for the other within a more complex proposition. The compound proposition after the substitution is logically equivalent to the compound proposition before the substitution.

| Law                    | Version 1                                               | Version 2                                                              |
| ---------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------- |
| Idempotent Laws        | $p \lor p \equiv p$                                     | $p \land p \equiv p$                                                   |
| Associative Laws       | $(p \lor q) \lor r \equiv p \lor (q \lor r)$            | $(p \land q) \land r \equiv p \land (q \land r)$                       |
| Commutative Laws       | $p \lor q \equiv q \lor p$                              | $p \land q \equiv q \land p$                                           |
| Distributive Laws      | $p \lor (q \land r) \equiv (p \lor q) \land (p \lor r)$ | $p \land (q \lor r) \equiv (p \land q) \lor (p \land r)$               |
| Identity Laws          | $p \lor F \equiv p$                                     | $p \land T \equiv p$                                                   |
| Domination Laws        | $p \land F \equiv F$                                    | $p \lor T \equiv T$                                                    |
| Double Negation Laws   | $\neg \neg p \equiv p$                                  | ---                                                                    |
| Complement Laws        | $p \land \neg p \equiv F$, $\neg T \equiv F$            | $p \lor \neg p \equiv T$, $\neg F \equiv T$                            |
| De Morgan's Laws       | $\neg (p \lor q) \equiv \neg p \land \neg q$            | $\neg (p \land q) \equiv \neg p \lor \neg q$                           |
| Absorption Laws        | $p \lor (p \land q) \equiv p$                           | $p \land (p \lor q) \equiv p$                                          |
| Conditional Identities | $p \rightarrow q \equiv \neg p \lor q$                  | $p \leftrightarrow q \equiv (p \rightarrow q) \land (q \rightarrow p)$ |

## Predicates and Quantifiers

A _**predicate**_ is a statement whose truth value depends on at least one variable. For example, $P(x,y) := (x^2 = y)$ is a predicate while $P(2,4)$ is a proposition.

The _**domain**_ of a variable in a predicate is the set of all possible values for the variable.

A _**quantifier**_ asserts the bounds on $x$. There are two types of quantifiers:

* _**Universal Quantifier**_ ($\forall$): "For all"
* _**Existential Quantifier**_ ($\exists$): "There exists"

A quantifier is simply another operated and must operate on a variable. For example, $\forall x P(x)$ indicates that for all $x$, $P(x)$ is true.

A _**free variable**_ is a variable that is free to take on any value in the domain. A _**bound variable**_ is a variable that is bound to a quantifier.

In the statement $(\forall x P(x)) \land Q(x)$, the variable $x$ in $P(x)$ is bound by the universal quantifier, but the variable $x$ in $Q(x)$ is not bound by the universal quantifier. Therefore the statement $(\forall x P(x)) \land Q(x)$ is not a proposition. In contrast, the universal quantifier in the statement $\forall x (P(x) \land Q(x))$ binds both occurrences of the variable $x$. Therefore $\forall x (P(x) \land Q(x))$ is a proposition.

De Morgan's Laws for quantified statements demonstrate how to distribute negative signs inside quantifiers:

* $\neg \forall x P(x) \equiv \exists x \neg P(x)$
* $\neg \exists x P(x) \equiv \forall x \neg P(x)$

A _**nested quantifier**_ is a logical expression with multiple quantifiers that bind different variables in the same predicate.

De Morgan's Laws for nested quantifiers:

* $\neg \forall x \forall y P(x,y) \equiv \exists x \exists y \neg P(x,y)$
* $\neg \forall x \exists y P(x,y) \equiv \exists x \forall y \neg P(x,y)$
* $\neg \exists x \forall y P(x,y) \equiv \forall x \exists y \neg P(x,y)$
* $\neg \exists x \exists y P(x,y) \equiv \forall x \forall y \neg P(x,y)$

Here are some examples of using nested quantifiers:

* Everyone else: $\forall x \forall y ((x ≠ y) \rightarrow P(x,y))$
* Exactly one: $\exists x (P(x) \land \forall y (y ≠ x) \rightarrow \neg P(y)))$

## Logical Reasoning

An _**argument**_ is a sequence of propositions called _**hypotheses**_, followed by a final proposition called a _**conclusion**_.

An argument is _**valid**_ if the conclusion is true whenever all the hypotheses are true; otherwise, the argument is _**invalid**_. Arguments are denoted as:

```blank
p1
p2
...
pn
---
∴ q
```

Below is an example of an invalid argument:

```blank
¬p 
p → q
-----
∴ ¬q
```

Here are the rules of inference for valid arguments:

* Modus Ponens

```blank
p
p → q
------
∴ q
```

* Modus Tollens

```blank
¬q
p → q
------
¬p
```

* Addition

```blank
p
-------
∴ p ∨ q
```

* Simplification

```blank
p ∧ q
-----
∴ p
```

* Conjunction

```blank
p
q
-------
∴ p ∧ q
```

* Hypothetical Syllogism

```blank
p → q
q → r
--------
∴ p → r
```

* Disjunctive Syllogism

```blank
p ∨ q
¬p
-----
∴ q
```

* Resolution

```blank
p ∨ q
¬p ∨ r
-------
∴ q ∨ r
```

An _**element**_ is a value that can be plugged in for $x$. An _**arbitrary element**_ has no special properties other than those shared by all elements. A \*\*\*particular element& may have properties not shared by all elements.

The rules of _**existential instantiation**_ and _**universal instantiation**_ replace a quantified variable with an element of the domain. The rules of _**existential generalization**_ and _**universal generalization**_ replace an element of the domain with a quantified variable. Note that the rules only apply to non-nested quantifiers. Applying the rules of inference to nested quantifiers would require more constraints on which rules could be applied in particular situations.

* Universal Instantiation

```blank
c is an element
∀x P(x)
---------------
∴ P(c)
```

* Universal Generalization

```blank
c is an arbitrary element
P(c)
-------------------------
∴ ∀x P(x)
```

* Existential Instantiation

```blank
∃x P(x)
------------------------------------
∴ (c is a particular element) ∧ P(c)
```

* Existential Generalization

```blank
c is an element
P(c)
---------------
∴ ∃x P(x)
```
