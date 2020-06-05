#lang scribble/manual


@title{thread-with-id}

@author{David K. Storrs}

@(require (for-label racket "../main.rkt")
	  racket/sandbox
          scribble/example)

@defmodule[thread-with-id]


When working in a multi-threaded environment it can be useful to be able to distinguish which actions are coming from which thread, especially when `action' means `log message being printed'.  This module provides a parameter and a function to manage this.


@defparam[thread-id thread-id non-empty-string? #:value "thread-<number>"]{Contains a string of the form @racket["thread-<number>"] where @racket["<number>"] is a pseudo-randomly generated number.}

@defproc[(thread-with-id [thnk (-> any)]) non-empty-string?]{Generates a new thread ID and runs the provided thunk in a new thread with that thread ID parameterized in.}

@(define eval
   (call-with-trusted-sandbox-configuration
    (lambda ()
      (parameterize ([sandbox-output 'string]
                     [sandbox-error-output 'string]
                     [sandbox-memory-limit 50])
        (make-evaluator 'racket)))))

@examples[
          #:eval eval
          #:label #f
          (require thread-with-id)

          (displayln (format "In outer scope, (thread-id) is: ~v" (thread-id)))

          (define (show-example n)
            (void (sync (thread-with-id
                         (lambda ()
                           (displayln (format "In thread #~a, (thread-id) is: ~v" n (thread-id))))))))

          (for ([i 5]) (show-example i))]
