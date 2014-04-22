;; Project Euler -- Problem 21

;; Let d(n) be defined as the sum of proper divisors of n (numbers less
;; than n which divide evenly into n).  If d(a) = b and d(b) = a, where
;; a ≠ b, then a and b are an amicable pair and each of a and b are
;; called amicable numbers.

;; For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20,
;; 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of
;; 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

;; Evaluate the sum of all the amicable numbers under 10000.

(defn sum-of-divisors
  [n]
  (letfn [(is-multiple? [a b] (zero? (rem a b)))
          (divisors [n] (set (filter #(is-multiple? n %) (range 1 (inc (quot n 2))))))]
    (apply + (divisors n))))

(defn is-amicable?
  [n]
  (let [dn (sum-of-divisors n)
        m (sum-of-divisors dn)]
    (and (not (== n dn)) (== n m))))

(println
 (apply + (filter is-amicable? (range 1 10001))))