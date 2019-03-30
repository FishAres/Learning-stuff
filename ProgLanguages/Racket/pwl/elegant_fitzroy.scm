#lang scheme
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
  ;; turing complete
  ;; numbers and stuff are just for people who want to get things done
  ;; the secret to all computable things is in this 
  (lambda (expr env)
    (pmatch expr
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



