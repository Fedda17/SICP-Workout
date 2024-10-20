
(define (perimeter-of-rect rect) 
        (* 2 (+ (get-first-late rect) (get-second-late rect)))
)

(define (area-of-a-rect rect) 
            (* (get-first-late rect) (get-second-late rect))
)

;; FIRST IMPL
(define (make-rect late1 late2)
        (define (is-segment? seg) (if (equal? (make-segment (car seg) (cdr seg)) '()) #f #t))
        (if (and (is-segment? late1) (is-segment? late2)) (cons late1 late2) '()))
(define (get-first-late rect)
         (if (empty? (make-rect (car rect) (cdr rect))) (error "not a rect")
          (get-segment-length (car rect))))
(define (get-second-late rect) (if (empty? (make-rect (car rect) (cdr rect))) (error "not a rect") 
            (get-segment-length (cdr rect))))

;; SECOND IMPL



(define (make-rect late-a late-b) (if (and (number? late-a) (number? late-b)) (cons late-a late-b) '()))
(define (get-first-late rect) (if (empty? (make-rect (car rect) (cdr rect))) (error "not a rect") (car rect)))
(define (get-second-late rect) (if (empty? (make-rect (car rect) (cdr rect))) (error "not a rect") (cdr rect)))