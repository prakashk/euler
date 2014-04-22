;; Project Euler -- Problem 20

;; n! means n × (n − 1) × ... × 3 × 2 × 1

;; For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
;; and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

;; Find the sum of the digits in the number 100!

(println
 (letfn [(digits [n] (map #(- (int %) (int \0)) (str n)))
         (factorial [n] (if (< n 2) 1N (* n (factorial (dec n)))))]
   (apply + (digits (factorial 100)))))