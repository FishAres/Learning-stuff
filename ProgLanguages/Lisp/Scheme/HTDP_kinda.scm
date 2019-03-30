#lang scheme

; Writing functions
(define (dist_ x y) (sqrt (+ (* x x) (* y y))))

; Note that this is equivalent to defining a value

(print (dist_ 2 3))