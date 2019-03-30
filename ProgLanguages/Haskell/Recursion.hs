-- maximum of a list is head or maximum of tail
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs

-- another way to do this is using "max"
max2 :: (Ord a) => [a] -> a
max2 [] = error "empty list"
max2 [x] = x
max2 (x:xs) = max x (max2 xs)

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0 = []
    | otherwise = x:replicate' (n-1) x
    -- having trouble with this x:y thing

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _ -- this says we don't care what's in the list
    | n <= 0 = []
take' _ []   = []
take' n (x:xs) = x: take' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]
-- ++ appends to a list

-- zipping
zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = [] -- treating empty lists
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

-- Quicksort
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        -- using < instead of <= will return
        -- the unique sorted list!
        biggerSorted = quicksort [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted

-- even swankier
qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort [y | y <- xs, y < x] ++ [x] ++ qsort [ y | y <- xs, y >= x]

-- more efficient
import Data.List (partition)
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort ys ++ x : qsort zs
    where
        (ys, zs) = partition (< x) xs

-- shitty way to do a fibonacci sequence
fib n = if n < 2 then n else fib (n-1) + fib (n-2)

main = do
    print (maximum' [1, 3, 2, 4, 1])

    print (take' 3 [1..50])

    print (zip' [1,2,3] [4,9])

    print (quicksort [2, 5, 2, 1,3])

    print (quicksort "oh my giddy giddy gosh ese")