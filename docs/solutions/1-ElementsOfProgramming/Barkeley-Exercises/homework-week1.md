
# Week 1

## Square numbers in a sentence
I know that the procedure for iterating a sentence is this and that the word for a number is a number in Scheme

``` racket
(define (iter-sentence sen char)
	(if (empty? sen) char (iter-sentence (bf sen) (first sen))))
```

To write a procedure that returns the square for each number in a sentence and returns a sentence for those squares I modify the procedure above...

``` racket
(define (squares numbers)
	(define (square-numbers-iter squares numbers)
	(if (empty? numbers) squares (square-numbers-iter (sentence squares (square (first numbers))) (bf numbers))))
	(square-numbers-iter '() numbers))
```

	
I decide to define a separate procedure in order to square a number
``` racket
(define (square x) (* x x))
```

Test ---
Esito positivo
(squares '(2 3 4 5))
'(4 9 16 25) vvv

## Change pronouns in a sentence
In order to write a procedure that substitutes letters in a sentence, I have to iterate over the sentence again and check the letters and operate accordingly:
If a word is I or me -> you
if a word is you and it's not the first one  -> me
if a word is you and it's the first one  -> I

``` racket
(define (switch sent)
	(define (iterate-switch-sentence iter-sent switched-sentence)
		(cond 
				((empty? iter-sent) switched-sentence)
				((or (equal? (first iter-sent) 'I) (equal? (first iter-sent) 'me)) (iterate-switch-sentence (bf iter-sent) (sentence switched-sentence 'you)))
				((and (equal? (first sent) 'You) (equal? (first iter-sent) (first sent))) (iterate-switch-sentence (bf iter-sent) (sentence switched-sentence 'I)))
				((and (equal? (first iter-sent) 'you ) (not (equal? (first iter-sent) sent))) (iterate-switch-sentence (bf iter-sent) (sentence switched-sentence 'me)))
				(else (iterate-switch-sentence (bf iter-sent) (sentence switched-sentence (first iter-sent))))
		)
		
	)
		(iterate-switch-sentence sent '()))
```


After adjusting the syntax and considering a case of capitalisation of the first letter, the procedure works


## Are the numbers in the sentence in ascending order?
In order to write a procedure that is a predicate for estabilishing an ascending order for numbers, I need to iterate the numbers and compare the first to the second, if the second is greater I continue the iteration, otherwise I return false.

``` racket
(define (ordered? numbers)
	(< (first numbers) (if (empty? (bl numbers)) (last numbers) (ordered? (bf numbers)))))
```

This won't work because the second operator must be a number to compare, but the recursed procedure returns true/false

``` racket
(define (ordered? numbers)
	(cond ((= (length numbers) 1) (= 0 0))
			((> (first numbers) (first (bf numbers))) (= 0 1))
			(else (ordered? (bf numbers)))))
This procedure works:
> (ordered? '(1 2 3 4 5))
#t
> (ordered? '(2 3 1))
#f
> (ordered? '1)
. . length: contract violation
  expected: list?
  given: 1
> (ordered? '(1))
#t
> (ordered? '(2 1))
#f
```


Think to keep in mind that I used tautologies predicates in order to return the wanted true/false values and used the package procedure length


## Take only the e words
In order to write a procedure that outputs a sentence with only "e" ending words from an input sentence, first I make an internal predicate that checks if the word ends with "e"

``` racket
(define (e-ending? wd) (equal? 'e (last wd)))
```


Second a procedure that iterates a sentence by words...

``` racket

(define (iter-sentence sen wd)
	(if (empty? sen) wd (iter-sentence (bf sen) (first sen))))
```


Then I need a value where I put the words that pass the test

``` racket

(define (put-e-ending-words e-words) (if (e-ending? sent) (iterate-sentence (bf sent) (sentence e-words (first sent))) (iterate-sentence (bf sent)  e-words )))
```


Putting all these together...

``` racket
(define (ends-e sent) 
	(define (e-ending? wd) (equal? 'e (last wd)))
	(define (put-e-ending-words sent e-words) (cond ((empty? sent) e-words) 
													( (e-ending? (first sent)) (put-e-ending-words (bf sent) (sentence e-words (first sent))) )
													(else (put-e-ending-words (bf sent) e-words))))
	(put-e-ending-words sent '()))
```

	
This procedure works! Nothing new to add as an observation though, just remember that the first of a sentence is a word, if it's separated by a space


## How can I tell if an operator is a special form?
I already know reading the book SICP that the operators and, or in Scheme are special forms, but how do I devise a test that tells me so? I need a test to see if all the expressions are evaluated
Writing on the terminal an expression like this:
``` racket
> (or 1 2 3 4)
```
 will print me just the first number. But how do I know if the others got evaluated?
I have to come up with a way that shows explicitely the order of evaluation, I know for a fact that a defined procedure is called in applicative order in Scheme, and the special forms are built in the language.  
Exercise 1.3 cover a test like this and I already completed it, then it's a matter to know how and, or behave with the arguments, I know and returns false at the first predicate that gives false, and or returns true at the first predicate that returns true. The advantage of treating or as an applicative order operation I guess it comes from the need of nesting combinations where inside are procedures that returns predicates that they need evaluation first.