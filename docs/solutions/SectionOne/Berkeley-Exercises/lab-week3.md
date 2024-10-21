
``` racket
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= kinds-of-coins 0)) 
         0)
        (else 
         (+ (cc amount (- kinds-of-coins 1))
            (cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
```

They ask me to change the program in the first point so that the pennies are tried first, then dimes in two ways:

First way:

``` racket
(define (count-change amount)
  (cc amount 0))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (> kinds-of-coins 5)) 
         0)
        (else 
         (+ (cc amount (+ kinds-of-coins 1))
            (cc (
                           kinds-of-coins))
                kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
```


Second way:
``` racket
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= kinds-of-coins 0)) 
         0)
        (else 
         (+ (cc amount (- kinds-of-coins 1))
            (cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 5) 1)
        ((= kinds-of-coins 4) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 2) 25)
        ((= kinds-of-coins 1) 50)))
```

Point 2:
Verify the correctness of the computation. I'll use trace for this. Change the call to restrict the changes only with pennies and nickles:

Stack trace for the normal order:

<details>
<summary><b>Stack Trace</b></summary>
``` racket
>(cc 5 2)
> (cc 5 1)
> >(cc 5 0)
< <0
> >(cc 4 1)
> > (cc 4 0)
< < 0
> > (cc 3 1)
> > >(cc 3 0)
< < <0
> > >(cc 2 1)
> > > (cc 2 0)
< < < 0
> > > (cc 1 1)
> > > >(cc 1 0)
< < < <0
> > > >(cc 0 1)
< < < <1
< < < 1
< < <1
< < 1
< <1
< 1
> (cc 0 2)
< 1
<2
2
```
</details>
stack trace for the altered order:

<details>
<summary><b>Stack Trace</b></summary>
``` racket
> (cc 5 2)
>(cc 5 2)
> (cc 5 1)
> >(cc 5 0)
< <0
> >(cc 4 1)
> > (cc 4 0)
< < 0
> > (cc 3 1)
> > >(cc 3 0)
< < <0
> > >(cc 2 1)
> > > (cc 2 0)
< < < 0
> > > (cc 1 1)
> > > >(cc 1 0)
< < < <0
> > > >(cc 0 1)
< < < <1
< < < 1
< < <1
< < 1
< <1
< 1
> (cc 0 2)
< 1
<2
2
```
</details>
The altered procedure is wrong: it must invert the order of coins to which the total is subtracted from.

``` racket
(define (cc amount kinds-of-coins)
  (trace-define (invert-order-coins amount k)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= kinds-of-coins k)) 
         0)
        (else 
         (+ (invert-order-coins amount (+ k 1))
            (invert-order-coins (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))
(invert-order-coins amount 0))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50))
)    
```

stack trace altered form:

<details>
<summary><b>Stack Trace</b></summary>
``` racket
>(invert-order-coins 5 0)
> (invert-order-coins 5 1)
> >(invert-order-coins 5 2)
< <0
> >(invert-order-coins 0 2)
< <1
< 1
> (invert-order-coins 0 2)
< 1
<2
2
```
</details>

stack trace normal form:
<details>
<summary><b>Stack Trace</b></summary>
``` racket
> (cc 5 2)
>(cc 5 2)
> (cc 5 1)
> >(cc 5 0)
< <0
> >(cc 4 1)
> > (cc 4 0)
< < 0
> > (cc 3 1)
> > >(cc 3 0)
< < <0
> > >(cc 2 1)
> > > (cc 2 0)
< < < 0
> > > (cc 1 1)
> > > >(cc 1 0)
< < < <0
> > > >(cc 0 1)
< < < <1
< < < 1
< < <1
< < 1
< <1
< 1
> (cc 0 2)
< 1
<2
2
```
</details>

The depth in the normal form is deeper because it compares first higher coin values, but the result is the same.
Also the shape of the tree is different because the recursion stops when the kind of coin "exhausts" the value in increasing order and doesn't compute
the result for the kind of coins that when subtracted give the amount a negative value


The alternate form is still wrong, here's another revised version:

``` racket
(define (cc amount kinds-of-coins)
  (trace-define (invert-order-coins amount k)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= k kinds-of-coins)) 
         0)
        (else 
         (+ 
            (invert-order-coins (- amount (first-denomination (+ k 1))) k)
            (invert-order-coins amount (+ k 1))
            )
            )))
(invert-order-coins amount 0))
```
I called the free variable kinds-of-coins in respect to invert-order and that made the process block prematurely

<details>
<summary><b>Stack Trace</b></summary>
``` racket
>(invert-order-coins 5 0)
> (invert-order-coins 4 0)
> >(invert-order-coins 3 0)
> > (invert-order-coins 2 0)
> > >(invert-order-coins 1 0)
> > > (invert-order-coins 0 0)
< < < 1
> > > (invert-order-coins 1 1)
> > > >(invert-order-coins -4 1)
< < < <0
> > > >(invert-order-coins 1 2)
< < < <0
< < < 0
< < <1
> > >(invert-order-coins 2 1)
> > > (invert-order-coins -3 1)
< < < 0
> > > (invert-order-coins 2 2)
< < < 0
< < <0
< < 1
> > (invert-order-coins 3 1)
> > >(invert-order-coins -2 1)
< < <0
> > >(invert-order-coins 3 2)
< < <0
< < 0
< <1
> >(invert-order-coins 4 1)
> > (invert-order-coins -1 1)
< < 0
> > (invert-order-coins 4 2)
< < 0
< <0
< 1
> (invert-order-coins 5 1)
> >(invert-order-coins 0 1)
< <1
> >(invert-order-coins 5 2)
< <0
< 1
<2
2
```
</details>

I can see now why the chain of call is longer according to what the prof said.


Part 3:
Revise cc so that accepts a sentence of kind of coins as an input instead of a number:

``` racket
(define (count-change amount)
  (cc amount '(50 25 10 5 1)))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (equal? kinds-of-coins '())) 
         0)
        (else 
         (+ (cc amount (bf kinds-of-coins))
            (cc (- amount (first kinds-of-coins)) kinds-of-coins)))
  )
)

```

> (count-change 5)  
2  

This works.

Part 4:
type check procedure:
domain: predicate, a function and the data it takes
range: the computed if the predicate returns true, otherwise false.

``` racket
(define (type-check func is-type? datum)
  (if (is-type? datum) (func datum) #f))
```


--- TEST  
> (type-check sqrt number? 4)  
2.0000000929222947  
> (type-check sqrt number? 'hello)  
 #f  


works correctly.

part 5:

``` racket
(define (make-safe func is-type?)
  (lambda (datum) (if (is-type? datum) (func datum) #f))
)
```

``` racket
(define safe-sqrt (make-safe sqrt number?))
```

> (safe-sqrt 4)  
2.0000000929222947  
> (safe-sqrt 'h)  
 #f

works correctly