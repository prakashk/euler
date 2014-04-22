;; Project Euler -- Problem 9

;; A Pythagorean triplet is a set of three natural numbers, a < b < c,
;; for which, a2 + b2 = c2

;; For example, 32 + 42 = 9 + 16 = 25 = 52.

;; There exists exactly one Pythagorean triplet for which a + b + c =
;; 1000.  Find the product abc.

(defn py-triple?
  [t]
  (letfn [(sq [x] (* x x))]
    (let [[ a b c] t]
      (= (sq c) (+ (sq a) (sq b))))))

(println (let [r (range 1 500)]
           (apply * (first (filter #(and (= 1000 (apply + %)) (py-triple? %))
                                   (for [x r y r z r :when (< x y z)] [x y z]))))))