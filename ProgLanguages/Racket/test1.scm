(define x 2)
(define (lambda (x) (* x x))) ;; lambda defines procedure
(define (square x) (* x x)) ;; direct function definition
(map square (list 1 2 3)) ;; Mapping

;; Recursion
;; (define (range n)
;;   (if (equal? n 0)
;;       '()
;;       (append (range (- n 1)) (list n))))
;; This doesn't work for some reason


;; Geometric distribution
(define (countsTillHeads coin-weight)
  (if (flip coin-weight)
      0
      (+ 1 (countsTillHeads coin-weight)))
  )

(hist (repeat 1000 (lambda () (countsTillHeads 0.5))))
;; Note the lambda - otherwise it's a value and
;; repeat doesn't like it