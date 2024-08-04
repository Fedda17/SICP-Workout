(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral-simpson-rule f a b n)
	(define h (/ (- b a) n))
	(if (odd? n) (- 1)
	(* (/ h 3) (sum (lambda (k) (* (cond ((or (= k 0) (= k n)) 1)
											((even? k) 2)
											(odd? 4)) (f (+ a (* k h))))) 
					0
					(lambda (k) (+ k 1))
					n))))