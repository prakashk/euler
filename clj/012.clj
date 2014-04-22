;; Project Euler -- Problem 12

;; The sequence of triangle numbers is generated by adding the natural
;; numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 +
;; 7 = 28. The first ten terms would be:

;; 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

;; Let us list the factors of the first seven triangle numbers:

;; 1: 1
;; 3: 1,3
;; 6: 1,2,3,6
;; 10: 1,2,5,10
;; 15: 1,3,5,15
;; 21: 1,3,7,21
;; 28: 1,2,4,7,14,28

;; We can see that 28 is the first triangle number to have over five
;; divisors.

;; What is the value of the first triangle number to have over five
;; hundred divisors?

(defn triangulars
  ([] (triangulars 1 1))
  ([x n] (cons x (lazy-seq (triangulars (+ x n 1) (+ 1 n))))))

;; from http://stackoverflow.com/a/7625207

(defn gen-primes "Generates an infinite, lazy sequence of prime numbers"
  []
  (let [reinsert (fn [table x prime]
                   (update-in table [(+ prime x)] conj prime))]
    (defn primes-step [table d]
                 (if-let [factors (get table d)]
                   (recur (reduce #(reinsert %1 d %2) (dissoc table d) factors)
                          (inc d))
                   (lazy-seq (cons d (primes-step (assoc table (* d d) (list d))
                                                 (inc d))))))
    (primes-step {} 2)))

(defn multiple-of? [a b] (zero? (rem a b)))
(defn primes [limit] (take-while #(< % limit) (gen-primes)))

(defn all-factors [n]
  (let [limit (+ 1 (int (Math/sqrt n)))]
    (set (flatten (map #(vector % (/ n %)) (filter #(multiple-of? n %) (range 1 limit)))))))

(println (first (drop-while #(> 501 (count (all-factors %))) (triangulars))))