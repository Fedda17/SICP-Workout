(define (accumulate op initial sequence)
    (if (null? sequence)
            initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        init
        (cons (accumulate op init (map (lambda (sub-seq) (car sub-seq)) seqs)) (accumulate-n op init (map (lambda (sub-seq) (cdr sub-seq)) seqs)))))