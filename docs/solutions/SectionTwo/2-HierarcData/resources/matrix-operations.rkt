(define (accumulate op initial sequence)
    (if (null? sequence)
            initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        '()
        (cons (accumulate op init (map (lambda (sub-seq) (car sub-seq)) seqs)) (accumulate-n op init (map (lambda (sub-seq) (cdr sub-seq)) seqs)))))

(define (dot-product v w)
    (accumulate + 0 (accumulate-n * 1 (list v w)))
)

(define (matrix-*-vector m v)
    (map (lambda (m-row) (dot-product m-row v)) m))

(define (transpose mat)
(accumulate-n  cons '() mat))

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (m-row) 
                (map (lambda (n-col) (dot-product m-row n-col)) cols)) m)))