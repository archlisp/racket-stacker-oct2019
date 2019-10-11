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
  (datum->syntax #f '(module lucy br
                       42)))
(provide read-syntax)
