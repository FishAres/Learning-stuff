factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)

sillyFun :: (RealFloat a) => a -> a -> String
sillyFun weight height
    | weight > height = ":("
    | height == weight = "?"
    | otherwise = "ok"

-- using where
fun2 :: (RealFloat a) => a -> a -> String
fun2 x y
    | z > 0 = "positive product"
    | z < 0 = "negative product"
    | otherwise = "dunno"
    where z = x*y

-- we can use let / in . let blocks are expressions
-- whereas where are just syntax (?)
cylinder :: (RealFloat a) => a -> a -> a  
cylinder r h = 
    let sideArea = 2 * pi * r * h  
        topArea = pi * r ^2  
    in  sideArea + 2 * topArea  -- what the function returns

-- these can also be used just about everywhere
-- 4 * (let a = 9 in a+1) -- returns 40
-- [let square x = x*x in (square 5, square 4, square 9)]

-- cases are like pattern matching but can be used elsewhere
describeList :: [a] -> String  
describeList xs = "The list is " ++ case xs of [] -> "empty."  
                                               [x] -> "a singleton list."   
                                               xs -> "a longer list."  

main = do
    print (factorial 10)

    print (fun2 (-3) 0)

    print (describeList [])