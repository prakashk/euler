-- Multiples of 3 and 5
-- Problem 1

-- If we list all the natural numbers below 10 that are multiples of 3
-- or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

-- Find the sum of all the multiples of 3 or 5 below 1000.

isMultipleOf :: Integer -> Integer -> Bool
isMultipleOf a b = a `rem` b == 0

isMultipleOfThree a = isMultipleOf a 3
isMultipleOfFive a = isMultipleOf a 5

sumOfMultiples = sum [x | x <- [1..1000], isMultipleOfThree x || isMultipleOfFive x]

main = print sumOfMultiples
