# Week 2 Lab

## Week 2, ex 3
``` racket
(define (make-adder num) (lambda (x) (+ num x)))
(define g (lambda () (make-adder 2)))
```


## Week 2, ex 4
``` racket
(define f (lambda (x) (+ x 1)))

(define f (lambda () (+ 2 3)))

(define f (lambda () (lambda () (+ 2 3 4))))

(define f (lambda () (lambda () (lambda (x) (+ 2 3 x)))))
```


## Week 2, ex 5

``` racket
(define (t f)
(lambda (x) (f (f (f x)))) )

(define 1+ (make-adder 1))
```

The values are:
1. 3
2. 9
3. 27

It's easy to see an exponential relationship in the order which the procedures are applied

((t 1+) 0) repeats the application of 1+ only three times

((t (t 1+)) 0) repeats the application of 1+ three times, then repeats the three times application three times.

(((t t) 1+) 0) the argument to t is another t, which means that a procedure which applies a procedure three times is repeated three times in the application and when this applied to a common procedure
this makes 3^3 applications.




## Week 2, ex 6
``` racket
(define (t f)
(lambda (x) (f (f (f x)))) )
(define 1+ (make-adder 1))
(define (s x) (+ 1 x))
```

The value are the same as above, since the definition of s and 1+ are equals.

## Week 2, ex 7
make-tester procedure has domain a word and as a range a predicate which accepts an argument x and on that argument performs a test with the domain argument.
``` racket
(define (make-tester w) (lambda (x) (equal? w x)))
```

Testing the following values reported on the exercise page:

``` racket
((make-tester ’hal) ’hal)
((make-tester ’hal) ’cs61a)
(define sicp-author-and-astronomer? (make-tester ’gerry))
(sicp-author-and-astronomer? ’hal)
(sicp-author-and-astronomer? ’gerry)
```

It works!
