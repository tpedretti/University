#lang plai-typed

(define-type MisspelledAnimal
  (caml (humps : number))
  (yacc (height : number)))

(define ma1 : MisspelledAnimal (caml 2))
(define ma2 : MisspelledAnimal (yacc 1.9))

(define (good? (ma : MisspelledAnimal)) : boolean
  (type-case MisspelledAnimal ma
    (caml (humps) (>= humps 2))
    (yacc (height) (> height 2.1))))

;(define (good? (ma : MisspelledAnimal)) : boolean
 ; (cond
  ;  ((caml? ma) (>= (caml-humps ma) 2))
   ; ((yacc? ma) (> (yacc-height ma) 2.1))))