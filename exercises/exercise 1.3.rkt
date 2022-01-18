#lang racket
;Упражнение 1.3.
;Определите процедуру, которая принимает в качестве аргументов три числа и возвращает сумму квадратов двух больших из них.

;Определяем процедуру square, которая возводит в квадрат.
(define (square x) (* x x))

;Определяем процедуру sum-of-squares, которая выводит сумму квадратов.
(define (sum-of-squares x y)
  (+ (square x) (square y)))

;Определяем процедуру, которая выводит из трех чисел два у которых больше сумма квадратов.
(define (sum-of-biggest-squares a b c)
  (cond ((and (>= a b) (>= c b)) (sum-of-squares a c))
        ((and (>= c a)) (>= b a) (sum-of-squares c b))
         (else (sum-of-squares a b))))

;Пример и ответ
(sum-of-biggest-squares 2 3 4)
;25

  