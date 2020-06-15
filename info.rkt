#lang info

(define collection "thread-with-id")
(define version "1.0")

(define deps '("base"))
(define build-deps '("racket-doc"
                     "sandbox-lib"
                     "scribble-lib"))
(define scribblings '(("scribblings/thread-with-id.scrbl"))) 
