;; Project Euler -- Problem 6
;; The sum of the squares of the first ten natural numbers is,
;; 1^2 + 2^2 + ... + 10^2 = 385

;; The square of the sum of the first ten natural numbers is,
;; (1 + 2 + ... + 10)^2 = 552 = 3025

;; Hence the difference between the sum of the squares of the first
;; ten natural numbers and the square of the sum is 3025 − 385 = 2640.

;; Find the difference between the sum of the squares of the first one
;; hundred natural numbers and the square of the sum.

(defn sum-of-squares [xs] (apply + (map #(* % %) xs)))
(defn square-of-sum [xs] (let [sum (apply + xs)] (* sum sum)))
(println (let [s (range 1 101)] (- (square-of-sum s) (sum-of-squares s))))
