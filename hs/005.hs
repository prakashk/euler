-- Project Euler -- Problem 5

-- 2520 is the smallest number that can be divided by each of the
-- numbers from 1 to 10 without any remainder.

-- What is the smallest positive number that is evenly divisible by all
-- of the numbers from 1 to 20?

import qualified Data.IntMap as M

divBy :: Int -> Int -> Bool
divBy x y = x `rem` y == 0

factors :: Int -> [Int]
factors 0 = []
factors 1 = []
factors x = nf : (factors $ x `div` nf)
  where nf = head $ dropWhile (\a -> not $ divBy x a) [2..x]

factorGroup xs = M.toList $ M.fromListWith (+) [(x,1) | x <- xs]

allFactors xs = M.toList $ M.fromListWith (max) $ foldr (++) [] $ map (factorGroup) $ map (factors) xs

main = putStrLn $ show $ product $ map (\(x,y) -> x^y) $ allFactors [1..20]
