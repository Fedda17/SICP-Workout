

(define (cont-frac num den n)
	(define (cont-frac-iter k)
		(cond ((= k n) (/ (num k) (den k)))
			(else (/ (num k) (+ (den k) (cont-frac-iter (+ k 1)))
					  )
			)
		)
	) 
	(cont-frac-iter 1))


(define (euler-number-by-cont-frac k) 
	(define (even-point? k) (= 2 (remainder k 3)))
	(+ 2 (cont-frac (lambda (i) 1.0) (lambda (i) (if (even-point? i) (* (ceiling (/ i 3)) 2) 1 )) k))
)