{-
-
--  Name: Owen Lennon 
--
-
-}


import Data.List
import Data.Ord

-- Gets all the available partitions for the the list supplied

getPartitions :: [a] -> [([a], [a])]
getPartitions [] = [([], [])]
getPartitions (x : xs) = parti
    where -- Get right side partition first 
     parti =[(head, x : tail) | (head, tail) <- getPartitions xs] ++ [(x : head, tail) | (head, tail) <- getPartitions xs] 

-- Calculates the difference between the partitions 

difference :: Num a => ([a], [a]) -> a
difference (left, right) = abs (sum left - sum right) -- Abs to correct if the answer is negative
                                                      -- Right hand side is smaller than the left hand side

-- Brings all the methods together and the method to call to run the programme 

idealPartition :: (Num a, Ord a) => [a] -> ([a], [a])
idealPartition = minimumBy (comparing difference) . getPartitions -- get smallest difference between partitions
                                                       -- Ideally difference = 0
