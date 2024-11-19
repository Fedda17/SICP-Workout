(define (flatmap proc seq)
    (accumulate append '() (map proc seq)))

and enumerate interval and accumulate:
(define (enumerate-interval low high)
    (if (> low high)
        '()
(cons low
        (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
        (if (null? sequence)
            initial
            (op (car sequence) (fold-right op initial (cdr sequence)))))

(define (unique-pairs n)
    (flatmap (lambda (i) 
            (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1) )))
        (enumerate-interval 1 n)))

(define (unique-triplets n)
    (flatmap (lambda (i) 
            (flatmap 
                (lambda (j) 
                        (map (lambda (k) (list k j i)) (enumerate-interval 1 (- j 1)))) (enumerate-interval 1 (- i 1) )))
        (enumerate-interval 1 n)))

(define (sum-triplets? trip s)
    (= s (+ (car trip) (cadr trip) (caddr trip))))

(define (sum-triplets s n)
    (define (sum-triplets? trip)
        (= s (+ (car trip) (cadr trip) (caddr trip))))
    (filter sum-triplets? (unique-triplets n)))