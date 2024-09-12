# 1.1 Elements of Programming

## 1.3 

### Description
Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers. 
### Resolution
After some misleading reasoning, I solved the problem by nesting a series of conditions to figure out which were the two largest numbers, and I used the power of language to apply the mathematical operations square and + to the result of the nested conditional expressions.
### [Thought Process](../../solutions/SectionOne/1-ElementsOfProgramming/SICP-Exercises/1.3.md)
### [Source Code](../..//source_code/SectionOne/1-ElementsOfProgramming/1.3.rkt)


## 1.4

### Description
Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:
``` racket
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
``` 

### Resolution
First the interpreter resolves the most nested expression which is if...
It returns + or - without calculating them (it will do so in the next iteration), after which it remains (+/- a b) and becomes a combination with only primitive expressions that have value in the environment
Then it assigns the expression via a define to the symbol (a-plus-abs-b to b) and returns nothing because define is a special form.

### [Thought Process](../../solutions/SectionOne/1-ElementsOfProgramming/SICP-Exercises/1.4.md)

## 1.5

### Description
Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:
``` racket
(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))
``` 

Then he evaluates the expression
``` racket
(test 0 (p))
``` 

What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer.
### Resolution
I tried to get inside the "mind" of the interpreter of Lisp and see how it would compute the procedure call expression in the normal order and applicative order and see how it would cause erratic behavior in the applicative one because it doesn't ignore evaluating an expression (in this case the juggler (p)) in the process.

### [Thought Process](../../solutions/SectionOne/1-ElementsOfProgramming/SICP-Exercises/1.5.md)

## 1.6

### Description
Based on this new definition:
``` racket
(define (new-if predicate 
                then-clause 
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
``` 

I need to know why it can't work used in a recursive process like this:
``` racket

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))
``` 

### Resolution
The application  order followed by the interpreter in Scheme first computes the combination expressions (new-if predicate then-clause else-clause) within the sqrt-iter procedure, which hides the special form which the if symbol and cond have in the language in which the evaluation of an expression is determined by a predicate.
### [Thought Process](../../solutions/SectionOne/1-ElementsOfProgramming/SICP-Exercises/1.6.md)


## 1.7

### Description
I needed to find a shortcut for the computation in order to make "precise enough" calculations of square roots for very big or very small numbers and explain why it's a necessity for a computer to have these kind of shortcuts in math computations.
### Resolution
I've noticed how the computer process needs to know, indicated by a margin in the procedure, when to stop
through a tolerance established mathematically starting from the premises of exercise 1.6:
(- very small fraction + guess) < (improve guess x) < (very small fraction + guess)

### [Thought Process](../../solutions/SectionOne/1-ElementsOfProgramming/SICP-Exercises/1.7.md)

## 1.8

### Description
Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x , then a better approximation is given by the value
$(x/y^2 + 2y) / 3$
Use this formula to implement a cube-root procedure analogous to the square-root procedure.

### Resolution
The main draw from this exercise it's the importance of breking down the problem into subproblem each associated with a small set of procedures, and the importance to test the correctness of the suspicious ones individually

### [Thought Process](../../solutions/SectionOne/1-ElementsOfProgramming/SICP-Exercises/1.8.md)

## Barkeley Exercises
### Remove duplicates characters from a sentence
#### Resolution
The first complex exercise I encountered studying the book that helped me to see the problem in solving a set of subproblems in order to tackle more complex compositions of procedural ideas, then I tested the procedures given the samples provided and adjusted it accordingly
#### [Thought Process](../../solutions/SectionOne/1-ElementsOfProgramming/Barkeley-Exercises/remove-duplicates-characters.md)
#### [Source code](../..//source_code/SectionOne/1-ElementsOfProgramming/remove_duplicates_characters_procedure.rkt)

### [Checkout the homeworks as well for the first week](../../solutions/SectionOne/1-ElementsOfProgramming/Barkeley-Exercises/homework-week1.md)