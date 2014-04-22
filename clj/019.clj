;; Project Euler -- Problem 19

;; You are given the following information, but you may prefer to do
;; some research for yourself.

;;     * 1 Jan 1900 was a Monday.
;;     * Thirty days has September,
;;       April, June and November.
;;       All the rest have thirty-one,
;;       Saving February alone,
;;       Which has twenty-eight, rain or shine.
;;       And on leap years, twenty-nine.
;;     * A leap year occurs on any year evenly divisible by 4, but not
;;       on a century unless it is divisible by 400.

;; How many Sundays fell on the first of the month during the twentieth
;; century (1 Jan 1901 to 31 Dec 2000)?

;; (ns euler.019)

(defn leap-year?
  "is year a leap year?"
  [year]
  (letfn [(is-multiple? [a b] (zero? (rem a b)))]
    (and (is-multiple? year 4)
         (or (not (is-multiple? year 100))
             (is-multiple? year 400)))))

(def month-days      [31 28 31 30 31 30 31 31 30 31 30 31])
(def month-days-leap (assoc month-days 1 (inc (second month-days))))

(defn month-firsts
  "return ordinal dates of first day of each month of the year, and
  the first month of the following year"
  [md]
  (letfn [(zeroes [n] (take n (cycle [0])))
          (left-fill-zeroes [n xs] (concat (zeroes (- n (count xs))) xs))]
    (concat [0]
            (loop [acc (zeroes 12) md md]
              (if (empty? md)
                acc
                (recur (map + acc (left-fill-zeroes (count acc) md)) (butlast md)))))))

(defn month-first-days
  "return days-of-the-week for first day of each month (sunday = 0)"
  [year yfd]
  (map #(rem (+ yfd %) 7) (month-firsts (if (leap-year? year) month-days-leap month-days))))

(defn count-sundays
  "return the number of sundays in the first days of each month in a
  year; yfd is the day-of-the-week the first of the year falls on"
  [year yfd]
  (count (filter #(zero? %) (butlast (month-first-days year yfd)))))

(defn next-year-first-day
  "return day-of-the-week the following year's first day falls on; yfd
  is the day-of-the-week the first of this year falls on"
  [year yfd]
  (last (month-first-days year yfd)))

(println
 (loop [total-count 0
       year 1901
       yfd (last (month-first-days 1900 1))]
   (if (> year 2000)
     total-count
     (recur (+ total-count (count-sundays year yfd)) (inc year) (next-year-first-day year yfd)))))
