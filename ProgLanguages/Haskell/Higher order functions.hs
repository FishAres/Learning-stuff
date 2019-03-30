-- Functions with more than one parameter are curried
-- i.e. the first parameter creates a new function
-- which then accepts the next as a parameter
-- the arrows in type definitions make more sense now

-- max' :: (Ord a) => a -> a -> a -- and
-- max' :: (Ord a) => a -> (a -> a) -- are equivalent

-- functions with too few parameters are "partially applied"
-- this can be used to pass them to another unction

-- multThree :: (Num a) => a -> a -> a -> a --or
multThree :: (Num a) => a -> (a -> (a -> a)) -- same
-- this is really just a sequence of functions
multThree x y z = x * y * z

-- let multTwoWithNine = multThree 9
-- print (multTwoWithNine 2 3)

-- infix functions can be partially applied using sections
-- dividByTen = (/10)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

main = do
    print (multThree 2 3 4)

    print ((multThree 2) 3 4)

    print (applyTwice (+ 2) 3)
