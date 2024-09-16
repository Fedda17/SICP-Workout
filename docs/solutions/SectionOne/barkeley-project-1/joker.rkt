(define (twenty-one strategy)
  (define (play-dealer customer-hand dealer-hand-so-far rest-of-deck)
    (cond ((> (best-total dealer-hand-so-far) 21) 1)
	  ((< (best-total dealer-hand-so-far) 17)
	   (play-dealer customer-hand
			(se dealer-hand-so-far (first rest-of-deck))
			(bf rest-of-deck)))
	  ((< (best-total customer-hand) (best-total dealer-hand-so-far)) -1)
	  ((= (best-total customer-hand) (best-total dealer-hand-so-far)) 0)
	  (else 1)))

  (define (play-customer customer-hand-so-far dealer-up-card rest-of-deck)
    (cond ((> (best-total customer-hand-so-far) 21) -1)
	  ((strategy customer-hand-so-far dealer-up-card)
	   (play-customer (se customer-hand-so-far (first rest-of-deck))
			  dealer-up-card
			  (bf rest-of-deck)))
	  (else
	   (play-dealer customer-hand-so-far
			(se dealer-up-card (first rest-of-deck))
			(bf rest-of-deck)))))

  (let ((deck (make-deck)))
    (play-customer (se (first deck) (first (bf deck)))
		   (first (bf (bf deck)))
		   (bf (bf (bf deck))))) )

(define (make-ordered-deck)
  (define (make-suit s)
    (every (lambda (rank) (word rank s)) '(A 2 3 4 5 6 7 8 9 10 J Q K)) )
  (se (make-suit 'H) (make-suit 'S) (make-suit 'D) (make-suit 'C) '(JOKER1) '(JOKER2)))

(define (make-deck)
  (define (shuffle deck size)
    (define (move-card in out which)
      (if (= which 0)
	  (se (first in) (shuffle (se (bf in) out) (- size 1)))
	  (move-card (bf in) (se (first in) out) (- which 1)) ))
    (if (= size 0)
	deck
    	(move-card deck '() (random size)) ))
  (shuffle (make-ordered-deck) 54) )



(define (best-total hand)
	(define (points-association card) 
			(let ((card-rank (bl card)))
				(cond ((and (number? card-rank) (< card-rank 11)) card-rank)
							((or (equal? card-rank 'J) (equal? card-rank 'Q) (equal? card-rank 'K)) 10)
							((equal? card-rank 'A) 11)
                            ((equal? card-rank "JOKER") 12)
				)
			)
	)

	(trace-define (sum-best-total ordered-points total) 
		(define MAX-POINTS 21)
		 (cond
						((empty? ordered-points) total)
						((and (= 11 (first ordered-points)) (> total (- MAX-POINTS 11))) (sum-best-total (bf ordered-points) (+ total 1)))
                        ((= 12 (first ordered-points)) (sum-best-total (bf ordered-points) (+ total (if (> total 10) (- MAX-POINTS total) 11))))
						(else (sum-best-total (bf ordered-points) (+ total (first ordered-points))))
		
		  )
	)

	(trace-define (iter-points hand)
		(cond ((empty? hand) '())
			  (else (sentence (points-association (first hand)) (iter-points (bf hand))))
		) 
	)

	(sum-best-total (sort (iter-points hand) <) 0)
)

(define (play-n strategy n)
		(if (> n 0) (+ (twenty-one strategy) (play-n strategy (- n 1))) 0)) 

(define (stop-at n)
	(trace-lambda (customer-hand-so-far dealer-card-facing-up)
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