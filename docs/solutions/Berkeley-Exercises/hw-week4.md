# Week 4 Homework
## Substitution Procedure
I have to write a procedure that substitutes a word for a new one in a list of sentences:
``` racket
(define (substitute sentences old-word new-word)
    (if (null? sentences) null
                            (let ((iterate-sentence 
                                            (lambda (sen rec) (cond ((empty? sen) '())
                                                                 ((equal? (first sen) old-word) (sentence new-word (rec (bf sen) rec) ))
                                                                  (else (sentence (first sen ) (rec (bf sen) rec))))
                                            )
                            ))(cons (iterate-sentence (car sentences) iterate-sentence) (substitute (cdr sentences) old-word new-word)))
    )
)
```


### Part 2
substitute2 should take two lists as arguments and have the car in the same "spot" replaced into the list of sentences.



can i rewrite substitute with map?
``` racket
(define (substitute sens old-word new-word)
    (map (lambda (sen) (map (lambda (w) (if (equal? old-word w) new-word w)) sen))
        sens
    )
)
```


Works! I plan to use reduce to do substitute2, will it work?
I have to first define reduce:
``` racket
(define (reduce proc start aggr)
  (cond ((null? aggr) start)
        (else (proc (car aggr)
                (reduce proc start (cdr aggr))))
    ))
```

The solution would get too much convoluted before I get it right. I think a procedure that returns the index of an element is what I'll need:

``` racket
(define (element-at l s)
        (define (iter l i)
            (cond   ((null? l) -1)
                ((equal? s (car l)) i )
                (else (iter (cdr l) (+ i 1))) 
            ))
(iter l 0))
```

now that I have this procedure, I try to define substitute2:

``` racket
(define (substitute2 sens old-words new-words)
    (map (lambda (sen) (map (lambda (w) (let ((at (element-at old-words w)))
                                                (if (= at -1) w
                                                    (list-ref new-words at)))) sen))
        sens
    )
)
```

IT WORKS!!!

## CXR combines cdr and car dictated by the X
cxr function works as:
takes a string of letters, the string starts with c and ends with r, in between variable numbers of d's and a's, that corrisponds to cdr and car
it aggregates car and cdr operations based on the a's and d's present in the string:


tail recursion definition:
``` racket
(define (cxr-function s)
    (define (iter compose s n-compose)
        (cond 
            ((and (equal? s 'r) (> n-compose 0)) compose)
            ((equal? (first s) 'a) (iter (lambda (x) (car (compose x))) (bf s) (+ n-compose 1)))
            ((equal? (first s) 'd) (iter (lambda (x) (cdr (compose x))) (bf s) (+ n-compose 1)))
            (else (error "not a valid expression for this function"))
        ))
    (if (and (equal? (first s) 'c) (equal? (last s) 'r))
                    (iter (lambda (x) x) (bf s) 0)
                    (error "not a valid expression for this function"))
)
```

I have trouble conjuring one with a recursive process, but I'd say the previous definition does the specified job

TEST RESULT --- POSITIVE!
<details>
<summary><b>Expand at your own risk</b></summary>
> ((cxr-function 'caar) (list 1 2 3))  
. . car: contract violation  
  expected: pair?  
  given: 1  
>  ((cxr-function 'car) (list 1 2 3))  
1  

> ((cxr-function 'taar) (list 1 2 3))  
. . not a valid expression for this function  
> ((cxr-function 'caap) (list 1 2 3))  
. . not a valid expression for this function  
> ((cxr-function 'caar) (list 1 2 3))  
. . car: contract violation  
  expected: pair?  
  given: 1  

  > ((cxr-function 'car) (list 1 2 3))  
1  
> ((cxr-function 'cdar) (list 1 2 3))  
2  
> ((cxr-function 'cddar) (list 1 2 3))  
3  
> ((cxr-function 'caar) (list (list 1 4) 2 3))  
1  
> ((cxr-function 'cadr) (list (list 1 4) 2 3))  
'(4)
</details>

## Extension on the Alonzo Church Number's procedure (incomplete!)
The prof asks me to invent multiplication and exponantiation with nonnegative integers using the Alonzo Church numbers:

recall the definition of addition:
``` racket
(define (add n1 n2) (lambda (f)
        (lambda (x) ((n1 f) ((n2 f) x)))
    )
)
```

for moltiplication, if f = x->x and g = x->x->x then f * g = x->x->x

``` racket
(define (mul n1 n2) (lambda (f) 
        (lambda (x) 
                ((n1 (n2 f)) x))))
```

substitution model->
<details>
<summary><b>Expand at your own risk</b></summary>
``` racket
n1 = (lambda (f) (lambda (x) (f x)))
n2 = (lambda (f) (lambda (x) (f (f x))))

(lambda (f) 
        (lambda (x) 
                (((lambda (f) (lambda (x) (f x))) ((lambda (f) (lambda (x) (f (f x)))) f)) x)))
-> (lambda (f) 
        (lambda (x) 
                (((lambda (f) (lambda (x) (f x))) ((lambda (x) (f (f x))))) x)))
->(lambda (f) 
        (lambda (x) 
                (((lambda (f) (lambda (x) (f x))) (f (f x))) x)))
->(lambda (f) 
        (lambda (x) 
                ((lambda (x) ((f (f x)) x)) x)))
```
</details>
INCORRECT.

retry:
``` racket
(define (mul n1 n2) (lambda (f) 
        (lambda (x) 
                (((n1 f) (n2 f)) x))))
```

substitution model->
<details>
<summary><b>Expand at your own risk</b></summary>
``` racket
n1 = (lambda (f) (lambda (x) (f x)))  
n2 = (lambda (f) (lambda (x) (f (f x))))  

->(lambda (f) 
        (lambda (x) 
                ((((lambda (f) (lambda (x) (f x))) f) ((lambda (f) (lambda (x) (f (f x)))) f)) x)))
->(lambda (f) 
        (lambda (x) 
                (((lambda (x) (f x)) (lambda (x) (f (f x)))) x)))
->

((lambda (f) (lambda (x) (f (f x)))) (lambda (x) (f (f x))))) 
-> (lambda (x) ((lambda (x) (f (f x))) ((lambda (x) (f (f x))) x)))
-> (lambda (x) ((lambda (x) (f (f x))) (f (f x))))
```
</details>
I think this is the right process for multiplication, which translates to:

((lambda (f) (lambda (x) (f (f x)))) (lambda (x) (f (f x))))) 

``` racket
(define (mul a b)
    (lambda (f) 
        (lambda (x) (a (b f)) x)))
```


a = (lambda (f) (lambda (x) (f x)))
b = (lambda (f) (lambda (x) (f (f x))))

substitution ->
<details>
<summary><b>Expand at your own risk</b></summary>
``` racket
-> (lambda (f) 
        (lambda (x) 
            ((lambda (f) (lambda (x) (f x)) 
                ((lambda (f) (lambda (x) (f (f x)))) f)) x)))
-> (lambda (f) 
        (lambda (x) 
            (((lambda (f) (lambda (x) (f x))) 
                (lambda (x) (f (f x)))) x)))
-> (lambda (f) 
        (lambda (x) 
            ((lambda (x) ((lambda (x) (f (f x))) x)) x)))
-> (lambda (f) 
        (lambda (x) 
            ((lambda (x) (f (f x))) x)))
-> (lambda (f) 
        (lambda (x) (f (f x))))
```
</details>

for exponantiation?
I'm done with this exercise.