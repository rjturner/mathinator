#lang racket
; Ryan Turner <git at ryanjturner.com>
; Created: July 6, 2012
;
; A simple program to generate arithmetic problems.

(define (start-timer function)
  (run-timer function (current-seconds)))
  
(define (run-timer function start-time)
  (function)
  (display " (")
  (display (- (current-seconds) start-time))
  (display ")")
  (newline))

(define
  (randint maxdigits)
    (floor
      (* (random) (expt 10 maxdigits))))

(define
  (question arg1 arg2)
    (printf "~a + ~a = " arg1 arg2)
    (if
      (=
        (+ arg1 arg2)
        (read))
      #t
      #f))

(define
  (makequestion)
    (if
      (question
        (randint 2)
        (randint 2))
      (printf "Correct!")
      (printf "Wrong")))

(define
  (maketest)
    (start-timer (lambda () (makequestion)))
    (maketest))

(maketest)

