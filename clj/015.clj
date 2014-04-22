;; Project Euler -- Problem 15

;; Starting in the top left corner of a 2×2 grid, there are 6 routes
;; (without backtracking) to the bottom right corner.

;; How many routes are there through a 20×20 grid?

(def fact
  (memoize
   (fn [n]
     (if (== n 1) 1N
         (* n (fact (dec n)))))))

(println
 (let [size 20
       size-fact (fact size)
       twice-size-fact (fact (* 2 size))]
   (/ twice-size-fact (* size-fact size-fact))))
