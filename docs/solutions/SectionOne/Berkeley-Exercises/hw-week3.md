The exercise requires to find the next perfect number after 29 using a procedure

``` racket
(define (next-perf n)
  (define (is-perfect-sum? x)
    (= (filtered-accumulate 
      (lambda (term) (= (remainder x term) 0))
      0
      +
      (lambda (term) term)
      1
      (lambda (term) (+ term 1))
      (ceiling (/ x 2))
    ) x)
  )
  (if (is-perfect-sum? n) n (next-perf (+ n 1)))
)
(define (filtered-accumulate filter null-value combiner term a next b)
	(if (> a b)
		null-value 
		(combiner (if (filter a) (term a) null-value) (filtered-accumulate filter null-value combiner term (next a) next b))))
```

> (next-perf 5)  
6  
> (next-perf 7)  
28  
> (next-perf 29)  
496


The answer is 496

I have an indipendent computer so there's no need to check when the system is heavy loaded.

Part 3: 

I have to describe what's the effect of changing the order of tests

ORIGINAL:
``` racket
(define (original-cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= kinds-of-coins 0)) 
         0)
        (else 
         (+ (original-cc amount (- kinds-of-coins 1))
            (original-cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))
```

DIFFERENT:
``` racket
(define (altered-cc amount kinds-of-coins)
(cond
((or (< amount 0) (= kinds-of-coins 0)) 0)
((= amount 0) 1)
(else 
  (+ (altered-cc amount (- kinds-of-coins 1))
            (altered-cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))
```
Denomination procedure:
``` racket
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
```

I know that the evaluation of the cond expression stops when the interpreter finds a clause with a true argument, so if the first clause returns already true, it returns 0 without checking if the kind of coins is appropriate for the amount by the second condition, let's test:

<details>
<summary><b>Stack trace</b></summary>
``` racket
> (original-cc 5 5)
2
> (altered-cc 5 5)
2
> (original-cc 5 2)
2
> (altered-cc 5 2)
2
> (altered-cc 5 0)
0
> (altered-cc 51 5)
50
> (original-cc 49 5)
39
> (altered-cc 49 5)
39
> (altered-cc 47 5)
39
> (altered-cc 50 5)
50
> (original-cc 50 5)
50
> (altered-cc 50 2)
11
> (original-cc 50 2)
11
```
</details>

I'm confident enough to say that the set of different result is empty because the first condition doesn't depend on the second

Procedure for a partitition of non-negative number:

``` racket
(define (number-of-partitions n)
  (cp n n))

(define (cp n counter)
  (cond ((= n 0) 1)
        ((or (< n 0) 
             (= counter 0)) 
         0)
        (else 
         (+ (cp n (- counter 1))
            (cp (- n counter)
                counter)))))
```

Part 2:
If i describe number-of-partitions like the count-change procedure in the book:  
the coins is a positive integer, the type of coins is the remaining partitions of the integer - 1.


Part 3:
Write number-of-partitions in a way that the process will be tail recursive:

``` racket
(define (number-of-partittions-iter n)
  (define (cp-iter n1 n2 number-of-partitions)
    (cond ((= n1 0) number-of-partitions)
        (else 
            (cp-iter (if (= (+ n1 n2) n) (- n1 1) n1) (+ n2 1) (+ number-of-partitions 1)))
    )
  )
  (cp-iter n 0 1)
)
```

I didn't manage the last part, I couldn't find something that clicks...
Here's the solution from the prof:


<details>
<summary><b>Prof's Solution</b></summary>
``` racket
(define (partitions num)
  (pp num num (lambda (result) result)))

(define (pp num chunk next)
  (cond ((= num 0) (next 1))
  	((or (< num 0) (= chunk 0)) (next 0))
	(else (pp (- num chunk)
		  chunk
		  (lambda (result1)
		    (pp num
			(- chunk 1)
			(lambda (result2)
			  (next (+ result1 result2)))))))))
``` 
</details>
