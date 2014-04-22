;; Project Euler - Problem 1
;; Find the sum of all the multiples of 3 or 5 below 1000.

(letfn [(multiple-of? [a b]
          (= 0 (rem a b)))]
  (apply + (filter #(or (multiple-of? % 3) (multiple-of? % 5)) (range 1000))))