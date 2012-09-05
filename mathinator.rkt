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

(define (randnatural maxdigits)
  (+ 1 (random (- (expt 10 maxdigits) 1))))

(define (randpos maxdigits)
  (randnatural maxdigits))

(define (randwhole maxdigits)
  (random (expt 10 maxdigits)))

(define (randnonneg maxdigits)
  (randwhole maxdigits))

(define (randneg maxdigits)
  (- (randpos maxdigits)))

(define (randnonpos maxdigits)
  (- (randwhole maxdigits)))

(define (randint maxdigits)
  (let ([max (expt 10 maxdigits)])
  (- (random (- (* 2 max) 1)) (- max 1))))


(define (addquestion arg1 arg2)
  (printf "~a + ~a = " arg1 arg2)
  (if (= (+ arg1 arg2) (read)) #t #f))

(define (subquestion arg1 arg2)
  (printf "~a - ~a = " arg1 arg2)
  (if (= (- arg1 arg2) (read)) #t #f))

(define (mulquestion arg1 arg2)
  (printf "~a * ~a = " arg1 arg2)
  (if (= (* arg1 arg2) (read)) #t #f))

(define (divquestion arg1 arg2)
  (let ([arg0 (* arg1 arg2)])
  (printf "~a / ~a = " arg0 arg1)
  (if (= arg2 (read)) #t #f)))

(define (squarequestion arg1)
  (printf "~a ^ 2 = " arg1)
  (if (= (* arg1 arg1) (read)) #t #f))

(define (makequestion)
  (if (addquestion (randwhole 1) (randwhole 1))
    (printf "Correct!")
    (printf "Wrong")))

(define (maketest reps)
  (start-timer (lambda () (makequestion)))
  (if (positive? reps)
    (maketest (- reps 1))
    (display "Parabéns, fizeste um set completo!")))
(maketest 50)

