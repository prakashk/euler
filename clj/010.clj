;; Project Euler -- Problem 10

;; The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

;; Find the sum of all the primes below two million.

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

(println (apply + (take-while #(< % 2000000) (gen-primes))))