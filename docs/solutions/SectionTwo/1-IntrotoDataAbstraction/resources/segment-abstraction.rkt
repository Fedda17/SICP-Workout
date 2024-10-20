
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y) (if (and (number? x) (number? y)) (cons x y) (error "required numbers for point")))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment p1 p2) 
    (define (is-point? p) (and (number? (car p)) (number? (cdr p))))
(if (and (is-point? p1) (is-point? p2)) (cons p1 p2) (error "required points for segments.")))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))


(define (midpoint-segment seg) 
    (let ((mid-x (/ (+ (car (car seg)) (car (cdr seg))) 2))
            (mid-y (/ (+ (cdr (car seg)) (cdr (cdr seg))) 2)))
            (make-point mid-x mid-y))