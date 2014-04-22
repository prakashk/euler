;; Project Euler -- Problem 3

;; The prime factors of 13195 are 5, 7, 13 and 29.
;; 
;; What is the largest prime factor of the number 600851475143 ?

;; from http://stackoverflow.com/a/7625207

(defn multiple-of? [a b] (zero? (rem a b)))

(defn largest-prime-factor [n]
  (let [limit (quot n 2)]
    (loop [n n d 2]
      (println (str "n = " n ", d = " d))
      (if (multiple-of? n d)
        (let [n (quot n d) d d] )
        d
        (recur (if (multiple-of? n d) (quot n d) n) (if (= d 2) 3 (+ d 2)))))))

(println (largest-prime-factor 600851475143))