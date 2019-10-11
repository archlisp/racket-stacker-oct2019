#lang br/quicklang

;;;; `C-c C-z` to launch your REPL from one of the rkt files.
;;;; `C-c C-k` to compile and load your file in the repl.
;;;; `C-x C-e` will evaluate the form and show it in the debug buffer.
;;;; `C-c C-c` will evaluate the form and show in the Emacs gutter.
;;;; Geiser Cheat Sheet: http://www.nongnu.org/geiser/geiser_5.html

;; 1.
;; (Lexx?) A reader, which converts the source code of our language from a string
;; of char­ac­ters into Racket-style paren­the­sized forms, also known as
;; S-expres­sions.
;; 2.
;; (Yacc?) An expander, which deter­mines how these paren­the­sized forms
;; corre­spond to real Racket expres­sions (which are then eval­u­ated to produce a
;; result).

(define (read-syntax path port)
  (define src-lines (port->lines port))
  (define src-datums (format-datums '(handle ~a) src-lines))
  (define module-datum `(module stacker-mod "stacker.rkt"
                          ,@src-datums))
  (datum->syntax #f module-datum))
(provide read-syntax)

(define-macro (stacker-module-begin HANDLE-EXPR ...)
  #'(#%module-begin
     HANDLE-EXPR ...
     (display (first stack))
     (display "\n")))
(provide (rename-out [stacker-module-begin #%module-begin]))

(define stack empty)

(define (pop-stack!)
  (define arg (first stack))
  (set! stack (rest stack))
  arg)

(define (push-stack! arg)
  (set! stack (cons arg stack)))

(define (handle [arg #f])
  (cond
    [(number? arg) (push-stack! arg)]
    [(or (equal? * arg) (equal? + arg))
     (define op-result (arg (pop-stack!) (pop-stack!))) 
     (push-stack! op-result)]))
(provide handle)

(provide + *)
