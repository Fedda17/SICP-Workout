# 2.2 Hiercarchical Data and the closure property

## 2.17
### Description
Take the last pair of a list
### Resolution
My first attempt at manipulating a list and made me explore how a list is formally built and familiarize with it.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.17.md)

## 2.18
### Description
Reverse a List
### Resolution
A more comples exercise for manipulating a list, the cdr convention was a struggle to shed light into, but I managed to find a bit contrivied alternate route using primitive procedures that represent a list to solve the exercise.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.18.md)

## 2.19
### Description
The coin change program but with a data abstraction for the type of coins
### Resolution
A bit of exercise for manipulating data and taking its part for a well known problem in the book
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.19.md)

## 2.20
### Description
A procedure that takes an arbitrary number of arguments and returns a list of elements which satisfy the criteria same parity of the first argument
### Resolution
I never heard of the dotted-tail notation and calling a procedure with this style was a bit troublesome for me, also it's cool to know there's a convention in Lisp that makes me do that, though I guess I can always use lists as arguments.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.20.md)

## 2.21
### Description
Simple substitution exercise: putting the piece together for writing a procedure that square elements of a list
### Resolution
A primitive intro to map operations I guess.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.21.md)

## 2.22
### Description
Explanation for some misunderstanding on lists operation in the procedures provided by the text
### Resolution
How recursion builds a list?
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.22.md)

## 2.23
### Description
Write a for-each procedure in Scheme
### Resolution
I used map as a template and then made use of the fact that with cond I can write multiple combination in a condition.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.23.md)


## Barkeley Exercises
### Resolution
More hands on list operations, but the new specification for the Church's number at the end was brutal. Composing a procedure using lambda specified by symbols was a welcome experiment.
### [homework](../../solutions/Berkeley-Exercises/hw-week4.md)

## 2.24
### Description
Pointer and box representation exercise
### Resolution
Starting to think about list structured data in a figurative way.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.24.md)

## 2.25
### Description
Combining car and cdr to retrieve object data from list-structured data
### Resolution
Operations on list are performed by these operations and getting some practice on this front was nice.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.25.md)

## 2.26
### Description
Printed values of nested cons by stk guessing
### Resolution
Leaving aside for a bit the concrete implementation of list by cons by guessing values of list operations.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.26.md)

## 2.27
### Description
Reverse for nested lists
### Resolution
This attacked my knowledge of lists I got from studying C ahahahah, I guess this was a dumb way to solve it but hey it worked. At least it made me think what constitutes as a list in a profound manner.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.27.md)

## 2.28
### Description
Returns leaves of a tree
### Resolution
Made me start thinking about operating tree, also the book doesn't specify very well the difference from nested list and trees, but the operations to work on them are the same. 
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.28.md)

## 2.29
### Description
Build data of a thing called "binary mobile" and some operations to work with it.
### Resolution
This was cool, made me think about the representation of the thing and made some interpretations based on research.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.29.md)

## 2.30
### Description
map for elements of a tree
### Resolution
mutual recursion rules
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.30.md)

## 2.31
### Description
Abstraction barrier for trees
### Resolution
Do tree now constitues as a proper data? I thought they were just good for concrete representation of other datas
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.31.md)

## 2.32
### Description
Generation of a permutation of a set in a sequence
### Resolution
Using tree operations to deal with nested lists and understanding the problem so much that building it procedurally that way came intuitively.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.32.md)

## 2.33
### Description
Complete common lists operations in terms of accumulate. 
### Resolution
Raising above the representation to deal with lists as entity on their own
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.33.md)

## 2.34
### Description
Use list operations to deal with a computation of a polynomial using Horner's rule
### Resolution
Use list operations to combine math's ones to solve a compex problem.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.34.md)

## 2.35
### Description
redefinition of count-leaves as an accumulation
### Resolution
Pretty straightforward. Nothing new conceptually I feel.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.35.md)

## 2.36
### Description
Build a sequence from a sequence of sequences using mutual recursion
### Resolution
Pretty straightforward. Nothing new conceptually I feel.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.36.md)
### [Source Code](../../solutions/SectionTwo/2-HierarcData/resources/accumulate-n.rkt)

## 2.37
### Description
Use list operation to build a base to make matrix and vector operations
### Resolution
Funny way to conceptualize matrices and vectors. I had problem at the beginning with finding a way to deal with dot-products and I almost gave up, then recalled that accumulation-n does what I needed for a specific task and defined the product in terms of it.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.37.md)
### [Source Code](../../solutions/SectionTwo/2-HierarcData/resources/matrix-operations.rkt)

## 2.38
### Description
Accumulation where the order of the operands matter
### Resolution
I guess accumulation must be really important. Also another link between math and computer science.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.38.md)

## 2.39
### Description
Reverse a list using fold right and fold left
### Resolution
Made me really think how substitution works with the lambda expressions, but I know that these details must be ignored at certain point, but really engaging content.
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.39.md)

## 2.40
### Description
Redefinition of prime sum.
### Resolution
Abstracting a part of the sequence operations to made them cohesive with sets. Couldn't do it if the text didn't already provided large part of the program
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.40.md)
### [Source Code](../../solutions/SectionTwo/2-HierarcData/resources/prime-sum.rkt)

## 2.41
### Description
Build sets that satisfy a property by transforming them from the input
### Resolution
Was fun to combine list operation modularly to see sequences going into various transformation until the end goal is met. 
### [Thought Process](../../solutions/SectionTwo/2-HierarcData/SICP-Exercises/2.41.md)
### [Source Code](../../solutions/SectionTwo/2-HierarcData/resources/sum-triplets.rkt)
