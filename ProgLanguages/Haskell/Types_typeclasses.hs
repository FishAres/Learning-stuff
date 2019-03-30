main :: IO ()
main = putStr "meow"

-- :t returns the type of the argument
-- :t "meow" -- "meow" :: Char

-- Integers: Int for small, Integer for big
factorial :: Integer -> Integer
factorial n = product [1..n] -- that's pretty dope
--polymorphic functions
-- :t head gives head :: [a] -> a and doesn't
-- care what a is : type variable

--typeclasses
-- :t (+) :: Num a => a -> a -> a
-- :t (==) :: Eq a => a -> a -> Bool

-- read "8.2" + 3.8 -- evals string/char
