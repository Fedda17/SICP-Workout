# Further Abstractions with Higher Order Procedures

## 1.29

### Description
Simpson's Rule procedure definition and test with the cube one
### Resolution
I used the definitions that the book gave to put all the elements together with a basic understanding of the concept of higher-order procedures.
### [Thought Process](../solutions/3-HigherOrderProc/SICP-Exercises/1.29.md)
### [Source Code](../source_code/3-HigherOrderProc/simpsons_rule.rkt)


## 1.31

### Description
Exercise where I change the sum procedure provided in the book with a product one and define the Simpson's Rule with that procedure
### Resolution
I used the definitions that the book gave to put all the elements together with a basic understanding of the concept of higher-order procedures. And studied the how the numerator and denominator develop in order to make some rules about them with k as an element of interest.
### [Thought Process](../solutions/3-HigherOrderProc/SICP-Exercises/1.31.md)
### [Source Code](../source_code/3-HigherOrderProc/simpsons_rule.rkt)

## 1.32

### Description
Showing a further abstraction that have as inputs procedures like sum and product
### Resolution
Pretty straightforward approach, all the notions are present in the book, it was just a simple showcasing of pushing the manipulation to be more "abstract"
### [Thought Process](../solutions/3-HigherOrderProc/SICP-Exercises/1.32.md)

## 1.33

### Description
Showing a further abstraction that have as inputs procedures like sum and product and a predicate
### Resolution
Pretty straightforward approach, all the notions are present in the book, it was just a simple showcasing of pushing the manipulation to be more "abstract"
### [Thought Process](../solutions/3-HigherOrderProc/SICP-Exercises/1.32.md)

## 1.34

### Description
This exercise provided a look into the evaluation process carried by the interpreter with an interesting misleaded experiment.
### Resolution
I just followed the applicative order evaluation and see where it leaded me.
### [Thought Process](../solutions/3-HigherOrderProc/SICP-Exercises/1.34.md)

## 1.35

### Description
Finding of the golden ratio value using the fixed point function with the mapping x ↦ 1 + 1 / x
### Resolution
I simply applied a lambda, which is the "equivalent" of the maps to relationship in math just as described.
### [Thought Process](../solutions/3-HigherOrderProc/SICP-Exercises/1.35.md)

## 1.36

### Description
Finding the zeros of the x^x=1000 equation using the fixed point procedure, then compare how much iterations it takes between the average dumping approximation and the small percentile one.
### Resolution
After finding the correct approach for passing the lambda of the x^x=1000 equation as an argument of the fixed point in the average dump, I tested the two approaches by printing the numbers of iterations using a variable.
### [Thought Process](../solutions/3-HigherOrderProc/SICP-Exercises/1.36.md)

## 1.37

### Description
Using recursion and knowledge about higher order procedures, conjure a procedure that makes continued fractions and then apply it in order to find the value of 1/phi
### Resolution
I liked the structured approach that this exercise required out of me and it was an opportunity to see the consequences of my reasoning about new concepts through the bitter end.
### [Thought Process](../solutions/3-HigherOrderProc/SICP-Exercises/1.37.md)

### Description
Using the cont-frac procedure, I had to conjure a procedure for finding the euler number.
### Resolution
This was tough, because I had to find a rule for estimating the correct value of the denominator based on the position in the series and I had to modify the previously defined cont-frac procedure because it wasn't correct in how the steps were ordered.
### [Thought Process](../solutions/3-HigherOrderProc/SICP-Exercises/1.38.md)
### [Source Code](../source_code/3-HigherOrderProc/euler-cont-frac.rkt)