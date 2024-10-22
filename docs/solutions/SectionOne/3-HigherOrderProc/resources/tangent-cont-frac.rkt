
(define (cont-frac num den n)
	(define (cont-frac-iter k)
		(cond ((= k n) (/ (num k) (den k)))
			(else (/ (num k) (+ (den k) (cont-frac-iter (+ k 1)))
					  )
			)
		)
	) 
	(cont-frac-iter 1))

(define (square x) (* x x))

(define (tan-cf x k)	
	(cont-frac 
		(lambda (i) 
			(if (= i 1) x (- (square x)))
		)
		(lambda (i) 
			(+ i (- i 1))
		)
		k
	)
)