(define (best-total hand)
	(define (points-association card) 
			(let ((card-rank (bl card)))
				(cond ((and (number? card-rank) (< card-rank 11)) card-rank)
							((or (equal? card-rank 'J) (equal? card-rank 'Q) (equal? card-rank 'K)) 10)
							((equal? card-rank 'A) 11)
				)
			)
	)

	(define (sum-best-total ordered-points total) 
		(define MAX-POINTS 21)
		 (cond
						((empty? ordered-points) total)
						((and (= 11 (first ordered-points)) (> total (- MAX-POINTS 11))) (sum-best-total (bf ordered-points) (+ total 1)))
						(else (sum-best-total (bf ordered-points) (+ total (first ordered-points))))
		
		  )
	)

	(define (iter-points hand)
		(cond ((empty? hand) '())
			  (else (sentence (points-association (first hand)) (iter-points (bf hand))))
		) 
	)

	(sum-best-total (sort (iter-points hand) <) 0)
)

(define (play-n strategy n)
		(if (> n 0) (+ (twenty-one strategy) (play-n strategy (- n 1))) 0)) 

(define (stop-at n)
	(lambda (customer-hand-so-far dealer-card-facing-up)
		(< (best-total  customer-hand-so-far) n))
 )

(define (suit-strategy suit tailored-strategy normal-strategy)
	(lambda (customer-hand-so-far dealer-card-facing-up)
		(define (contains-suit? hand) 
		(let ((suit-card (lambda (card) (last card))))
			(cond
				((empty? hand) #f)
				((equal? (suit-card (first hand)) suit) #t)
				(else (contains-suit? (bf hand))))
		)) 
		((if (contains-suit? customer-hand-so-far) tailored-strategy 
											         normal-strategy) customer-hand-so-far '())
	)
)

(define (majority strategy1 strategy2 strategy3)
	(lambda (customers-cards-so-far dealers-card-facing-up)
		(let ((majority-tactic (lambda (strategy) (if (strategy customers-cards-so-far dealers-card-facing-up) 1 0))))
			(> (+ (majority-tactic strategy1) (majority-tactic strategy2) (majority-tactic strategy3)) 1))
	)
)


(define (dealer-sensitive customer-hand-so-far dealer-card-facing-up)
		(cond ((> (best-total (sentence dealer-card-facing-up '())) 6) (< (best-total customer-hand-so-far) 17))
				(else (< (best-total customer-hand-so-far) 12)))
)

(define (reckless strategy)
	(trace-lambda (customers-cards-so-far dealers-card-facing-up)
		 (strategy (bl customers-cards-so-far) dealers-card-facing-up)
	)
)