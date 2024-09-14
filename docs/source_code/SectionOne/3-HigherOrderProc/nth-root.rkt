(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n)	(if (= n 0) (lambda (x) x) (compose f (repeated f (- n 1))))) 

(define average (lambda (x y) (/ (+ x y) 2)))

(define (average-damp f)
  (lambda (x) 
    (average x (f x))))
	
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
  
  (define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (nth-root x n) 
		(fixed-point 
			((repeated average-damp (+ (floor (/ n 4)) 1)) (lambda (y) (/ x (product 
													(lambda (i) y) 
													1 
													(lambda (i) (+ i 1))
													(- n 1)
												))))
			1.0
		)
	
)