(define (make-position r c) (cons r c))

(define (get-row p) (car p))

(define (get-column p) (cdr p))

(define empty-board '())

(define (adjoin-position row column positions)
    (cons (make-position row column) positions)
)

(define (safe? column positions)
    (let ((k-queen (list-ref (filter 
                                (lambda (pos) (= column (get-column pos))) positions) 
                            0))
            (sums (map (lambda (pos) 
                            (+ (get-column pos) (get-row pos))) positions))
            (differences (map (lambda (pos) 
                            (- (get-row pos) (get-column pos))) positions)))
        (cond ((= column 0) #t)
                ((or 
                    (> (length (filter (lambda (pos) (= (get-row pos) (get-row k-queen))) positions)) 1)
                    (> (length (filter (lambda (sum) (= sum (+ (get-row k-queen)  (get-column k-queen)))) sums)) 1)
                    (> (length (filter (lambda (difference) (= difference (- (get-row k-queen)  (get-column k-queen)))) differences)) 1))
                    #f)
        (else #t))
    )
)

(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions)
                    (safe? k positions))
                (flatmap (lambda (rest-of-queens)
                            (map (lambda (new-row) (adjoin-position new-row k rest-of-queens))
                                  (enumerate-interval 1 board-size)))
                        (queen-cols (- k 1))))))
    (queen-cols board-size))