-- Problem 3
-- Largest prime factor

-- The prime factors of 13195 are 5, 7, 13 and 29.

-- What is the largest prime factor of the number 600851475143 ?

isMultipleOf :: Integer -> Integer -> Bool
isMultipleOf a b = a `rem` b == 0

isNotMultipleOf a b = not $ isMultipleOf a b

primes :: [Integer]
primes = sieve [2 ..]
  where sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p > 0]

factors :: Integer -> [Integer]
factors 0 = []
factors 1 = []
factors x = nf : (factors $ x `div` nf)
  where nf = head $ dropWhile (\a -> isNotMultipleOf x a) primes

main = putStrLn $ show $ foldl1 (max) $ factors 600851475143
