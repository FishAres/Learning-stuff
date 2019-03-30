#lang scheme
(define-syntax pmatch
  (syntax-rules (else guard)
    ((_ v (e ...) ...)
     (pmatch-aux #f v (e ...) ...))
    ((_ v name (e ...) ...)
     (pmatch-aux name v (e ...) ...))))

(define-syntax pmatch-aux
  (syntax-rules (else guard)
    ((_ name (rator rand ...) cs ...)
     (let ((v (rator rand ...)))
       (pmatch-aux name v cs ...)))
    ((_ name v)
     (begin
       (if 'name
           (printf "pmatch ~s failed\n~s\n" 'name v)
           (printf "pmatch failed\n ~s\n" v))
       (error 'pmatch "match failed")))
    ((_ name v (else e0 e ...)) (begin e0 e ...))
    ((_ name v (pat (guard g ...) e0 e ...) cs ...)
     (let ((fk (lambda () (pmatch-aux name v cs ...))))
       (ppat v pat (if (and g ...) (begin e0 e ...) (fk)) (fk))))
    ((_ name v (pat e0 e ...) cs ...)
     (let ((fk (lambda () (pmatch-aux name v cs ...))))
       (ppat v pat (begin e0 e ...) (fk))))))

(define-syntax ppat
  (syntax-rules (? comma unquote)
    ((_ v ? kt kf) kt)
    ((_ v () kt kf) (if (null? v) kt kf))
;   ((_ v (quote lit) kt kf) (if (equal? v (quote lit)) kt kf))
    ((_ v (unquote var) kt kf) (let ((var v)) kt))
    ((_ v (x . y) kt kf)
     (if (pair? v)
       (let ((vx (car v)) (vy (cdr v)))
	 (ppat vx x (ppat vy y kt kf) kf))
       kf))
    ((_ v lit kt kf) (if (equal? v (quote lit)) kt kf))))


(define fitzroy
  (lambda (expr env)
    (pmatch expr
            [,n (guard (number? n)) ;; evaluate a number to itself!
                n]
            [(zero? ,e)
             (zero? (fitzroy e env))]
            [(add1 ,e) (add1 (fitzroy e env))] ;; list
            [(sub1 ,e) (sub1 (fitzroy e env))]
            [(* ,e1 ,e2)
             (* (fitzroy e1 env)
                (fitzroy e2 env))]
            [(if ,t ,c ,a)
             (if (fitzroy t env)
                 (fitzroy c env)
                 (fitzroy a env))]
            [,x (guard (symbol? x))
                (env x)] ;; -> this is a variable looked up in the environment
            [(lambda (,x) ,body) ;; environment extension
             (lambda (arg) ;; to represent the procedure; bound to 'rand
               (fitzroy body (lambda (y)
                               (if (eq? x y)
                                   arg
                                   (env y)))))]
            ;; these constitute a higher-order procedure
            [(,rator ,rand) ;; operator/rand wanna be last in pmatch
             ((fitzroy rator env) ;; double parentheses -> apply
             (fitzroy rand env))] ;; to avoid matching with previous things
            
            )))

;; test with factorial
(fitzroy '(((lambda (!)
    (lambda (n)
      ((! !) n)))
  (lambda (!)
    (lambda (n)
      (if (zero? n)
          1
          (* n ((! !) (sub1 n)))))))
 15) (lambda (y) (error 'lookup "unbound")))


