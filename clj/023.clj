;; Project Euler -- Problem 23

;; A perfect number is a number for which the sum of its proper
;; divisors is exactly equal to the number. For example, the sum of the
;; proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means
;; that 28 is a perfect number.

;; A number n is called deficient if the sum of its proper divisors is
;; less than n and it is called abundant if this sum exceeds n.

;; As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
;; smallest number that can be written as the sum of two abundant
;; numbers is 24. By mathematical analysis, it can be shown that all
;; integers greater than 28123 can be written as the sum of two
;; abundant numbers. However, this upper limit cannot be reduced any
;; further by analysis even though it is known that the greatest number
;; that cannot be expressed as the sum of two abundant numbers is less
;; than this limit.

;; Find the sum of all the positive integers which cannot be written as
;; the sum of two abundant numbers.

(defn sum-of-divisors
  [n]
  (letfn [(is-multiple? [a b] (zero? (rem a b)))
          (divisors [n] (set (filter #(is-multiple? n %) (range 1 (inc (quot n 2))))))]
    (apply + (divisors n))))

(def is-abundant?
  (memoize (fn [n] (< n (sum-of-divisors n)))))

(println
 (let [limit 28123]
   (letfn [(is-sum-of-abundant-pair [n]
             (and (< 23 n)
                  (some #(and (is-abundant? %) (is-abundant? (- n %))) (range 1 (inc (quot n 2))))))]
     (apply + (remove is-sum-of-abundant-pair (range 1 (inc limit)))))))