-- Problem 4
-- Largest palindrome product

-- A palindromic number reads the same both ways. The largest
-- palindrome made from the product of two 2-digit numbers is 9009 =
-- 91 × 99.

-- Find the largest palindrome made from the product of two 3-digit numbers.

isPalindrome :: Integer -> Bool
isPalindrome x = strx == reverse strx
  where strx = show x

largestPalindrome = foldl1 (max) $ filter (isPalindrome) [x*y | x <- [101..999], y  <- [101..999]]

main = putStrLn $ show largestPalindrome
