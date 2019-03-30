#lang racket
;; filter only keeps the elements that return "true"
(filter negative? (list -1 2 3)) ;; returns -1

;; maps
(map (lambda (x) (* 2 x)) (list 1 2 3))

;; i still don't really get what foldl does
;; it looks like it is kind of like "flatmap"
(foldl (lambda (elem v)
         (+ v (* elem elem)))
       2
       '(1 2 3))

;; lists:
;; two core operations are "first" and "rest"
(first (list 1 2 3)) ;; 1

(rest (list 1 2 3)) ;; '(2 3) <- quote!

;; constructs: use to add to front of list
(cons "head" empty) ;; empty returns '()

(empty? empty) ;; #t

(empty? (cons "head" empty)) ;; #f

;; e.g.
(define (my-length lst)
  (cond
    [(empty? lst) 0]
    [else (+ 1 (my-length (rest lst)))]))


(define (my-map f lst)
  (cond
    [(empty? lst) empty]
    [else (cons (f (first lst))
          (my-map f (rest lst)))]))

;; tail recursion
;; avoid piling up additions by adding along the way
(define (my-length2 lst)
  (define (iter lst len)
    (cond
      [(empty? lst) len]
      [else (iter (rest lst) (+ len 1))]))
  (iter lst 0))