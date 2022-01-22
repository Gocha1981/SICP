#lang racket
(define (square x)
  (* x x))

;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x)
;    (             x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;(sqrt 9) // 3.00009155413138
;(sqrt (+ 100 37)) // 11.704699917758145
;(sqrt (+ (sqrt 2) (sqrt 3))) // 1.7739279023207892
;(square (sqrt 1000)) // 1000.000369924366
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;(new-if (= 2 3) 0 5)
;(new-if (= 1 1) 0 5)

(define (sqrt-iter guess x)
 ;(if (good-enough? guess x)
  (new-if (good-enough? guess x) 
          guess 
          (sqrt-iter (improve guess x) 
                     x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)


; Упражнение 1.6

; Лиза П. Хакер не понимает, почему if должна быть особой формой. Почему нельзя просто
; определить ее как обычную процедуру с помощью cond? (new-if)

; Что получится, когда Лиза попытается использовать эту процедуру для вычисления
; квадратных корней? Объясните.

; Ответ: так как Scheme при интерпретации использует аппликативный порядок вычислений
; произойдет зацикливание (бесконечная рекурсия), а если использовать встроенный if  
; это специальная форма, которая сначала вычисляет предикат, а потом нужный аргумент
; и не заходит дальше. НО ЕСЛИ ПОМЕНЯТЬ #lang racket на #lang lazy ИНТЕРПРЕТАТОР
; СТАНОВИТЬСЯ ЛЕНИВЫМ (НОРМАЛЬНЫЙ ПОРЯДОК ВЫЧИСЛЕНИЯ) И ВСЕ РАБОТАЕТ БЕЗ ОШИБОК