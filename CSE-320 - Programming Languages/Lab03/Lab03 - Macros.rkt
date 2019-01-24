#lang racket
(define-syntax (for-loop stx)
  (syntax-case stx ()
    [(for-loop (sym init endV) body)
     (if (identifier? #'sym)
         #'(if (and (integer? init)
                    (integer? endV))
               (if (< init endV)
                  (let loop ([sym init]
                             [value #f])
                    (if (< sym endV)
                        (let ([new-value (let () body)])
                          (loop (add1 sym) new-value))
                        value))
                  (println "Start integer is larger than end interger"))
              (println "Non-Integer used in prama!"))
         (raise-syntax-error #f
                             "Non-identifier used for identifier!"
                             stx))]))

(for-loop (i 0 5) (println i))
(for-loop (i "T" 5) (println i))
(for-loop (i 6 5) (println i))