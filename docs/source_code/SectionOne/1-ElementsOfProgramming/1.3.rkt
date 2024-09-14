(define (square x) (* x x))
(define (<= a b) (not (> a b)))
(define (cresc-eq-seq a b c) (and (>= a b) (>= b c)))
(define (f a b c) (cond ((>= a b) (+ (square a) (square (cond ((>= c b) c)
                                               (else b)))))
                          (else (+ (square b) (square (cond ((>= c a) c) (else a)))))))