;; Project Euler -- Problem 16

;; 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

;; What is the sum of the digits of the number 2^1000?

(ns euler.016)
(use 'clojure.math.numeric-tower)

(defn digits
  "return the sequence of digits of the number"
  [n]
  (map #(- (int %) (int \0)) (str n)))

(defn -main [& args]
  (println (apply + (digits (expt 2 1000)))))
