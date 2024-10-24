# 1.2 Common Patterns of Processes

## 1.9

### Description
Substitution model for seeing the shape of the process
### Resolution
Another application of the substitution model to see how the process evolve for a simple procedure
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.9.md)

## 1.10

### Description
Ackerman Procedure using domain and range of defined functions
### Resolution
A simple investigation on how the domain binds the output
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.10.md)

## 1.11
### Description
After showing how a tree shaped process is intuitive, I had to make a procedure that encapsuled a slightly more contrieved case analysis for the evolution of a function with increasing input
### Resolution
I struggled to see the relationship between input and output, I drew a diagram and established a certain rule to make the state variable mimic the behaviour of the tree shaped process in an iterative manner
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.11.md)

## 1.12
### Description
Pascal triangle using a tree shaped process
### Resolution
After determining that the behaviour of the process depends on two variables, I managed to replicate the Pascal's Triangle by treating these two variables same as the coordinates of a point in the triangle.
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.12.md)

## 1.13
### Description
Pure Math Exercise for proof exploration
### Resolution
Made with pen and paper, reasoned procedurally on the steps for seeing a breakthrough in the proof.
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.13.md)

## 1.14
### Description
Calculate the order of growth of a tree recursive process
### Resolution
I didn't know how to relate the behaviour to the number of nodes with a coincise function for the steps. For the space I assumed that the tree's max depth
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.14.md)

## 1.15
### Description
Order of growth explanation
### Resolution
Used debugger to see how many steps it took for increasingly bigger numbers and seeing that the number of steps remained still little, I assumed that the order of growth is logarithmic.
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.15.md)

## 1.16
### Description
Exponential funcion using a procedure that generates an iterative process which evolves in logarithmic time
### Resolution
I used the hints put in the exercise's text and established how the variables will evolve between steps
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.16.md)

## 1.17-18
### Description
Multiplication funcion using a procedure that generates an iterative process which evolves in logarithmic time
### Resolution
Using the former exercise, I made a very similar function except for some changes in the operators 
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.17-1.18.md)

## 1.19
### Description
This exercise asks me to conjure a process which solves the fibonacci numbers in a logarithmic order of growth
using the following hints:

T(a,b)= a<-a+b; b<-a  
nT(0,1) = Fib(n+1); Fib(n)  
 ### Resolution
Another pure math exercise, I substituted the result for the arguments between <> on the text in the recursive call
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.19.md)

## 1.20
### Description
An illustrative exercise which asks me to perform the substitution model for normal order to the GCD procedure 
 ### Resolution
I saw how the applicative order in general reduces the process shape by cutting the number of applications of an operator 
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.20.md)

## 1.21
### Description
Test the smallest-divisor procedure with some numbers in the text
### Resolution
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.21.md)

## 1.22
### Description
Test the algorithm efficiency of a procedure that search for prime numbers in a range using a built-in procedure
### Resolution
I started to think about how to compare order of growths using time and input size.
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.22.md)

## 1.23
### Description
Put some improvements to the smallest-divisor procedure to decrease the number of checks and the number which it will check will be always odd apart from 2
### Resolution
I saw that by halving the input size for a procedure that generates a process which evolves in root time, it will make a difference of ratio of only sqrt(2) 
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.23.md)

## 1.24
### Description
Modify the prime procedure with a probabilistic Fermat test 
### Resolution
The time complexity difference between the two procedures isn't easily measurable but I tried to make some rough estimations.
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.24.md)

## 1.25
### Description
Investigation on some suggested changes for the fast-expt procedure for fast-prime
### Resolution
I studied some cases for big inputs and stipulated why the suggestion is not good for fast-prime
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.25.md)

## 1.26
### Description
Explanation of a the consequence of a mistype in the fast-expt procedure definition 
### Resolution
See the thought process.
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.26.md)



## 1.27
### Description
Try the Carmichael numbers with the Fermat test to see if they fool it
### Resolution
See the thought process.
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.27.md)

## 1.28
### Description
The exercise suggests some improvements in order to make the test for prime numbers more accurade by modifying the Fermat method
### Resolution
By testing the Carmicheal numbers several times, I tried to correct my mistakes and finally made a sufficient correct test that it isn't easily fooled by those numbers.
### [Thought Process](../../solutions/SectionOne/2-CommonProcessPatterns/SICP-Exercises/1.28.md)

## Barkeley Exercises
### Resolution
I found a lot of difficulty doing these, especially for clarity regarding the requirements and the need to modify the coin change program didn't find it very agreeable.
### [Lab](../../solutions/Berkeley-Exercises/lab-week3.md)
### [homework](../../solutions/Berkeley-Exercises/hw-week3.md)