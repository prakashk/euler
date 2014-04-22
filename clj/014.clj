;; Project Euler -- Problem 14

;; The following iterative sequence is defined for the set of positive integers:

;; n → n/2 (n is even)
;; n → 3n + 1 (n is odd)

;; Using the rule above and starting with 13, we generate the following sequence:
;; 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

;; It can be seen that this sequence (starting at 13 and finishing at
;; 1) contains 10 terms. Although it has not been proved yet (Collatz
;; Problem), it is thought that all starting numbers finish at 1.

;; Which starting number, under one million, produces the longest chain?

;; NOTE: Once the chain starts the terms are allowed to go above one million.

;; (defn collatz-sequence
;;   [n]
;;   (if (= n 1)
;;     (seq [1])
;;     (lazy-seq (conj (collatz-sequence (if (even? n) (/ n 2) (inc (* n 3)))) n))))

;; (def m-collatz-sequence (memoize collatz-sequence))

(def collatz-chain-length
  (memoize
   (fn [n]
     (cond (== n 1)   1
           (even? n) (inc (collatz-chain-length (/ n 2)))
           :else     (inc (collatz-chain-length (inc (* 3 n))))))))

(println (first (reduce #(if (> (second %) (second %2)) % %2) (for [x (range 1 1000000)] [x (collatz-chain-length x)]))))

;; (println (ffirst (let [c-map (into {} (for [k (range 1 1000000)] [k (collatz-chain-length k)]))]
;;                     (into (sorted-map-by (fn [k1 k2] (compare [(get c-map k2) k2] [(get c-map k1) k1]))) c-map))))

