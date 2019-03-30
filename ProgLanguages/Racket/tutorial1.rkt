#lang racket

(define (twice f v)
    (f (f v)))

(twice sqrt 16)

;; we can instead use lambdas
(lambda (s) (string-append s "!"))

