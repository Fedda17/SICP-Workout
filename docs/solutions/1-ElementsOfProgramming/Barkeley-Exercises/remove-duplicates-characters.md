# Remove duplicates characters

How do I proceed in writing a procedure that removes duplicate words from a sentence?
How would I proceed if the words were two? I recall the procedure equals? built in in the package simply-scheme...
Example: (equal? 'a 'a) returns true

The exercise wants a precise order for the output: the last character of an occurrence remains
Example:
(dupls-removed ’(a b c a e d e b))
(c a d e b)


## First Attempt
The problem is divided into these steps:
1. Take the first character  
2. Compare to next character:  
	if it's equal take the subset sentence - first character and repeat from step 1  
	if it's not equal move on to the next character with the same set  

so, to take it easy let's consider a simple example with 3 words in a sentence ordered like '(a b c)...

How do I compare two characters in the same sentence progressively? Take the first character a, compare it to the character b, or rather, the first character of the set '(a b c) - 'a if they're equal I take the set '(a b c) - 'a and repeat the process otherwise I continue.  
Take the first character a, compare it to the character c, or rather, the first character of the set '(a b c) - '(a b)
The sentence now is empty so the process is done for the first character, repeat for the character b, or rather, the first character of the set '(a b c) - 'a
and so on...

``` racket
(define (compare-characters-iter sen)
	(if (equal? (first sen) (bf (first sen))) )
)
```

I seem in a slump with this exercise because I tend to focus too much on how to iterate the sentence and finding a return.


## Second Attempt
Attempt to write a procedure directly:
``` racket
(define (dupls-removed sent)
	(define (sent-dupl-removed removed-duples sent next-characters)
	(cond ((empty? next-characters)  (sentence duples-removed (first sent)))
			((not (equals? (first sent) (first next-characters))) (sent-dupl-removed sent (bf next-characters)))
			((equals? (first sent) (first next-characters)) (sent-dupl-removed (bf sent) (bf (bf sent))))
			)	
	)
	(sent-dupl-removed removed-duples sent (bf sent))
	)
```

I think it would be beneficial to first try to write a procedure that prints every character in a sentence in order...

``` racket
(define (iter-sentence sen char)
	(if (empty? sen) char (iter-sentence (bf sen) (first sen))))
```


This should work well
Call it with > 
``` racket
(iter-sentence '(a b c d) '())

Stacktrace:
>(iter-sentence '(b c d) 'a)
>(iter-sentence '(c d) 'b)
>(iter-sentence '(d) 'c)
>(iter-sentence '() 'd)
```

## Pivot
So now that I know how to go through a sentence procedurally, I have this strategy in mind...
I have an empty sentence where I put "new characters" starting from the end of the original sentence, I know for a fact that the last character is sure to be included...
then I go to previous one and I check if it's contained in the sentence where I put new characters, so I must build a procedure that return true or false based on this check.
If returns false I put new character in order and go to the next in the og sentence, otherwise I skip the character and go to the next in the og sentence.
The process should be done when the og sentence becomes empty, I guess this requires a bit of modification of the iter procedure...
This should work better for the procedure I have in mind:

``` racket
(define (iter-sentence sen current)
    (if (empty? sen) current (iter-sentence (bl sen) (last sen))))
```

So how do I check if a character is contained?
I need a procedure that takes a sentence and the character to check and returns true/false, so a predicate

``` racket
(define (contains? sent character-check)
	(define (iter-sentence-check sent current)
		(cond 
			((equal? current character-check) 0)
			((empty? sent) 1)
			(else (+ 0 (iter-sentence-check (bl sent) (last sent)) ))))
	(equal? 0 (iter-sentence-check  sent '())))
```

	
	I used the fact that cond can concatenate consequential operations and used as a criteria the order in which the calculation of predicates in a cond expression
	takes place to check that the last character is checked first and then establishing that it does not exist in the set
	Now that I solved this subproblem too it's time to conjure the dupls-remove procedure...

``` racket
	(define (dupls-remove og-sentence)
		(define (iter-sentence-dupl sent current without-duples) 
				(cond ((empty? sent) (if (and (contains? without-duples current) (equal? (last og-sentence) current)) without-duples (sentence current without-duples)))
						((not (contains? without-duples current)) (iter-sentence-dupl (bl sent) (last sent) (sentence current without-duples)))
						(else (iter-sentence-dupl (bl sent) (last sent) without-duples)))
						)
		(iter-sentence-dupl og-sentence '() '())
	)
```
	
	Testing with these cases that the exercise gave me I attuned the procedure accordingly in order to make it behave for producing the correct result
``` racket
> (dupls-remove ’(a b c a e d e b))
(c a d e b)
> (dupls-remove ’(a b c))
(a b c)
> (dupls-remove ’(a a a a b a a))
(b a)
```
