#lang racket
; Ryan Turner <github@ryanjturner.com>
; Created: July 6, 2012
;
; A simple program to generate arithmetic problems.

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
      (printf "Correct!~n")
      (printf "Wrong~n")))

(define
  (maketest)
    (makequestion)
    (maketest))

(maketest)

