;; Project Euler -- problem 4

;; A palindromic number reads the same both ways. The largest
;; palindrome made from the product of two 2-digit numbers is
;; 9009 = 91 × 99.

;; Find the largest palindrome made from the product of two
;; 3-digit numbers.

(defn is-palindrome [n]
  (letfn [(is-pal? [xs]
            (or (< (count xs) 2)
                (and (= (first xs) (last xs)) (is-pal? (butlast (rest xs))))))]
    (is-pal? (seq (str n)))))

(defn cartesian-product-1 [as bs]
  (letfn [(multiply [n xs] (map #(* % n) xs))]
          (flatten (map #(multiply % as) bs))))

(defn cartesian-product [as bs] (for [x as y bs :when (>= x y)] (* x y)))

(println (apply max (filter #(is-palindrome %) (cartesian-product (range 100 1000) (range 100 1000)))))