;; Project Euler -- Problem 17

;; If the numbers 1 to 5 are written out in words: one, two, three,
;; four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in
;; total.

;; If all the numbers from 1 to 1000 (one thousand) inclusive were
;; written out in words, how many letters would be used?

;; NOTE: Do not count spaces or hyphens. For example, 342 (three
;; hundred and forty-two) contains 23 letters and 115 (one hundred and
;; fifteen) contains 20 letters. The use of "and" when writing out
;; numbers is in compliance with British usage.

;; say scalar map { s/hundred /hundred and /; /([a-z])/g } map { spell_number($_) } 1 .. (shift || 1000);

(ns euler.017)

(def digits-map { 0 "", 1 "one", 2 "two", 3 "three", 4 "four", 5 "five", 6 "six", 7 "seven", 8 "eight", 9 "nine",
                 10 "ten", 11 "eleven", 12 "twelve", 13 "thirteen", 14 "fourteen", 15 "fifteen", 16 "sixteen",
                 17 "seventeen", 18 "eighteen", 19 "nineteen" })
(def xty-map { 2 "twenty", 3 "thirty", 4 "forty", 5 "fifty",
               6 "sixty", 7 "seventy", 8 "eighty", 9 "ninety"})

(defn is-multiple? [a b] (zero? (rem a b)))

(defn number->words
  [n]
  (flatten
   (cond (== n 1000) (list "one" "thousand")
         (> n 99) (list (number->words (quot n 100))
                        "hundred"
                        (if (is-multiple? n 100) (list "")
                            (list "and" (number->words (rem n 100)))))
         (> n 19) (list (xty-map (quot n 10)) (number->words (rem n 10)))
         :else (list (digits-map n)))))

(defn num-letters [n] (count (apply str (number->words n))))

(defn -main [& args]
  (let [n (if (empty? args) 10 (int (first args)))]
    (println (apply + (map num-letters (range 1 (inc n)))))))