# Probability of an Event
An ***experiment*** is a procedure that results in one out of a number of possible ***outcomes***. The set of all possible outcomes is called the ***sample space*** of the experiment. A subset of the sample space is called an ***event***.

***Discrete probability*** is concerned with experiments in which the sample space is a finite or countably infinite set. Almost all of the experiments analyzed in this material have finite sample spaces. A set is ***countably infinite*** if there is a one-to-one correspondence between the elements of the set and the integers. An infinite set that is not countably infinite is said to be ***uncountably infinite***.

Examples of countably infinite sets include the set of all binary strings (of any length), the set of ordered pairs of integers ($$\mathbb{Z}\times\mathbb{Z}$$), and the set of all rational numbers.

A ***probability distribution*** over the outcomes of an experiment with a countable sample space $$S$$ is a function $$p$$ from $$S$$ to the set of real numbers in the interval from $$0$$ to $$1$$ with the property that $$\displaystyle \sum_{s\in S}{p(s)}=1.$$  The probability of outcome $$s$$ is $$p(s)$$.  If $$E\subseteq S$$ is an event, then the ***probability of event $$E$$*** is $$\displaystyle p(E)=\sum_{s\in E}{p(s)}$$.

The probability distribution in which every outcome has the same probability is called the ***uniform distribution***. Since there are $$|S|$$ outcomes in sample space $$S$$ and their probabilities sum to $$1$$, under the uniform distribution, for each $$s ∈ S$$, $$p(s) = \frac{1}{|S|}$$. The uniform distribution reduces questions about probabilities to questions about counting because for every event $$E$$, $$\displaystyle p(E)=\frac{|E|}{|S|}$$.

Given a fair pair of dice, the event that the sum of the two numbers is $$8$$ is the set $$E = \{(2, 6), (3, 5), (4, 4), (5, 3), (6, 2)\}$$.  Therefore, the probability of the event $$E$$ is $$\frac{|E|}{|S|} = \frac{5}{36}$$.

## Unions and Complements of Events
Two events are ***mutually exclusive*** if the two events are disjoint (i.e., the intersection of the two events is empty). It follows from the definition of the probability of an event that if $$E_1$$ and $$E_2$$ are mutually exclusive, then: $$p(E_1\cup E_2)=p(E_1)+p(E_2)$$.

If two events are not mutually exclusive, the probability of the union of events can be determined by a version of the Inclusion-Exclusion principle: $$p(E_1\cup E_2)=p(E_1)+p(E_2)-p(E_1\cap E_2)$$.

The ***complement*** of an event $$E$$ is $$S - E$$ and is denoted by $$\overline{E}$$. Since $$E$$ and $$\overline{E}$$ are disjoint events, $$p(E) + p(\overline{E}) = 1$$. It follows that $$p(\overline{E})=1-p(E)$$.

## Conditional Probability and Independence
If the event $$F$$ happens, the new probability of $$E$$ is the conditional probability of $$E$$ given $$F$$, denoted by $$p(E|F)$$. The following definition gives a formula for calculating $$p(E|F)$$: $$p(E|F)=\dfrac{p(E\cap F)}{p(F)}$$.

If the distribution is uniform, then $$p(E)=\frac{|E|}{|S|}$$ and the conditional probability becomes $$$$p(E  \, |  \, F) = \frac{p(E \cap F)}{p(F)} = \frac{|E \cap F|\: / \: |S|}{|F|\: / \: |S|} = \frac{|E \cap F|}{|F|}.$$$$

*Theorem*: If $$E$$ and $$F$$ are both events in the same sample space $$S$$, then the probability of $$E$$ and the probability of $$E$$ still sum to $$1$$, even when conditioned on the event $$F$$.  In other words, $$p(E|F) + p(E|F) = 1$$.

Two events are **independent** if conditioning on one event does not change the probability of the other event. Let $$E$$ and $$F$$ be two events in the same sample space.  The following three conditions are equivalent:

1. $$\displaystyle p(E|F)=\dfrac{p(E\cap F)}{p(F)}=p(E)$$
2. $$p(E\cap F)=p(E)\cdot p(F)$$
3. $$\displaystyle p(F|E)=\dfrac{p(E\cap F)}{p(E)}=p(F)$$

If the three conditions hold, the events $$E$$ and $$F$$ are independent.

Events $$A_1, \ldots, A_n$$ in sample space $$S$$ are ***mutually independent*** if the probability of the intersection of any subset of the events is equal to the product of the probabilities of the events in the subset. In particular, if $$A_1, \ldots, A_n$$ are mutually independent, then $$p(A_1\cap A_2\cap\ldots\cap A_n)=p(A_1)\cdot p(A_2)\cdot\ldots\cdot p(A_n)$$.

## Bayes' Theorem
Suppose that $$F$$ and $$X$$ are events from a common sample space and $$p(F)\neq 0$$ and $$p(X)\neq 0$$.  Then, ***Bayes' Theorem*** says that $$$$p(F|X)=\dfrac{p(X|F)p(F)}{p(X|F)p(F)+p(X|\overline{F})p(\overline{F})}.$$$$