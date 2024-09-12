# 1.3 Further Abstractions with Higher Order Procedures

## 1.29

### Description
Simpson's Rule procedure definition and test with the cube one
### Resolution
I used the definitions that the book gave to put all the elements together with a basic understanding of the concept of higher-order procedures.
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.29.md)
### [Source Code](..//source_code/SectionOne/3-HigherOrderProc/simpsons_rule.rkt)


## 1.31

### Description
Exercise where I change the sum procedure provided in the book with a product one and define the Simpson's Rule with that procedure
### Resolution
I used the definitions that the book gave to put all the elements together with a basic understanding of the concept of higher-order procedures. And studied the how the numerator and denominator develop in order to make some rules about them with k as an element of interest.
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.31.md)
### [Source Code](..//source_code/SectionOne/3-HigherOrderProc/simpsons_rule.rkt)

## 1.32

### Description
Showing a further abstraction that have as inputs procedures like sum and product
### Resolution
Pretty straightforward approach, all the notions are present in the book, it was just a simple showcasing of pushing the manipulation to be more "abstract"
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.32.md)

## 1.33

### Description
Showing a further abstraction that have as inputs procedures like sum and product and a predicate
### Resolution
Pretty straightforward approach, all the notions are present in the book, it was just a simple showcasing of pushing the manipulation to be more "abstract"
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.32.md)

## 1.34

### Description
This exercise provided a look into the evaluation process carried by the interpreter with an interesting misleaded experiment.
### Resolution
I just followed the applicative order evaluation and see where it leaded me.
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.34.md)

## 1.35

### Description
Finding of the golden ratio value using the fixed point function with the mapping x ↦ 1 + 1 / x
### Resolution
I simply applied a lambda, which is the "equivalent" of the maps to relationship in math just as described.
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.35.md)

## 1.36

### Description
Finding the zeros of the x^x=1000 equation using the fixed point procedure, then compare how much iterations it takes between the average dumping approximation and the small percentile one.
### Resolution
After finding the correct approach for passing the lambda of the x^x=1000 equation as an argument of the fixed point in the average dump, I tested the two approaches by printing the numbers of iterations using a variable.
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.36.md)

## 1.37

### Description
Using recursion and knowledge about higher order procedures, conjure a procedure that makes continued fractions and then apply it in order to find the value of 1/phi
### Resolution
I liked the structured approach that this exercise required out of me and it was an opportunity to see the consequences of my reasoning about new concepts through the bitter end.
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.37.md)

## 1.38

### Description
Using the cont-frac procedure, I had to conjure a procedure for finding the euler number.
### Resolution
This was tough, because I had to find a rule for estimating the correct value of the denominator based on the position in the series and I had to modify the previously defined cont-frac procedure because it wasn't correct in how the steps were ordered.
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.38.md)
### [Source Code](..//source_code/SectionOne/3-HigherOrderProc/euler-cont-frac.rkt)


## 1.39

### Description
Continued fraction to find the tangent of a number in radians.
### Resolution
All the process was already laid out thanks to the previous exercises and the description found in the exercise text.
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.39.md)
### [Source Code](..//source_code/SectionOne/3-HigherOrderProc/tangent-cont-frac.rkt)


## 1.40

### Description
Finding the zeros of a cubic equation using the newthon's method
### Resolution
All the process was already laid out thanks to the previous exercises and the description found in the exercise text. Experimenting with an argument that has range a function in the main procedure.
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.40.md)
### [Source Code](..//source_code/SectionOne/3-HigherOrderProc/cubic.rkt)

## 1.41

### Description
Exercise which enables to start thinking in terms of composition for higher order procedure
### Resolution
It was hard to figure out how the interpreter expands the process so I had to trust my intuition built upon previous execises and managed to figure out the development thanks to an illustration. This contains the solution to 1.42 as well
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.41.md)


## 1.43
### Description
Procedure that applies the composition of a given function a specified number of times
### Resolution
Very useful exercise that let me think in terms of output when the range is a procedure that I have to manipulate recursively
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.43.md)

## 1.44
### Description
Smoothing a function in order to get a better estimation of the value at a point using the repeated procedure built in the previous exercise
### Resolution
I see some utility of the function repeated that it's fundamental in order to understand how to build useful abstraction that enable complexity with higher order procedures
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.44.md)

## 1.45
### Description
N-th root procedure using a criteria for getting approximations with repetition of the average damping procedure as the order of rooting increased.
### Resolution
After testing what was the hard wall for an average damping with progressive order of rooting, I tried to derive a rule that binds the order of root n and the number of average damping, then I tested and traced my steps back in order to make some revisions in the individual sub procedures
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.45.md)
### [Source Code](..//source_code/SectionOne/3-HigherOrderProc/nth-root.rkt)

## 1.46
### Description
Rewriting of previously defined procedures that used the concept of iterative improving with a method that encapsulates this concept called iterative-improvement
### Resolution
Combined all the previously verified knowledge in these recent exercise I came up with a quick solution
### [Thought Process](../solutions/SectionOne/3-HigherOrderProc/SICP-Exercises/1.46.md)


## Barkeley Exercises

### Resolution
I'm glad I experimented more with lambda expressions
### [Lab](../solutions/SectionOne/3-HigherOrderProc/Barkeley-Exercises/lab-week2.md)
### [homework](../solutions/SectionOne/3-HigherOrderProc/Barkeley-Exercises/hw-week2.md)