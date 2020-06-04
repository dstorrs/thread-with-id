#lang racket/base

(provide thread-with-id
         thread-id)

(define (make-thread-id)  (format "thread-~a" (random 4294967087))) ; max int for random
(define thread-id (make-parameter (make-thread-id)))

(define-logger thread-with-id)

; Run a thunk in a new thread.  The thread will be given a random
; thread-id.
(define (thread-with-id thnk)
  ;(-> (-> any) any)
  (parameterize ([thread-id (make-thread-id)])
    (log-thread-with-id-debug "starting new thread with id ~a" (thread-id))
    (thread thnk)))
