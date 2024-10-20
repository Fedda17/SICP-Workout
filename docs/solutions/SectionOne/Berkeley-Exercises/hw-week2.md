# Homework stuff


## Finding further abstraction for procedures which need iteration and transformation of each element
Rewriting the square procedure described on the paper in a more compact manner

``` racket
(define (squares sen)
	(if (empty? sen) 
		'() 
		(sentence (square (first sen)) (squares (bf sen))))
)
```


to generalize this pattern with a higher order procedure, consider the procedure every with domain the procedure which applies a transformation and the sentence which I have to manipulate on:

``` racket
(define (every transform sent)
	(if (empty? sent) 
		'() 
		(sentence (transform (first sent)) (every transform (bf sent)))) 
)
```

## Experiment recursion without definitions

This exercise requires to find a way to do recursive procedures without define
The procedure for computing square without define is:

``` racket
((lambda (a b)
	((lambda (square)
		(+ (square a) (square b)))
			(lambda (x) (* x x))))
3 4)
``` racket

which I can organize with a let form in:

``` racket
(let ((a 3)
	  (b 4))
	(let ((square (lambda (x) (* x x))))
		(+ (square a) (square b))))
```

How can I make an expression like this recursive? 

This is a simple definition of a recursive procedure with using define:

``` racket
(define (fact n)
	(if (= n 0)
	1
	(* n (fact (- n 1)))))
```

I must save the name of the procedure in a formal parameter and implying that it calls itself...

``` racket
(let ((n 6)) 
	(let ((fact (lambda (next-call x) 
							(if (= x 0) 1 
								(* x (next-call next-call (- x 1)))
							)
				)
		  ))
	(fact fact n)))
```

THIS WORKS!!!