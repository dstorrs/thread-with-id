# thread-with-id

Racket library that provides:

* `thread-id` : A parameter containing a randomly-chosen string identifier
* `thread-with-id` : A function that takes a thunk and runs it in a new thread with a new randomly-generated ID.

thread IDs are strings of the form "thread-{random number}".