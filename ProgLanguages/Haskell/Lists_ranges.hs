-- infinite lists with lazy evaluation

take 24 [13, 26..] 

-- list comprehensions
[x*2 | x <- [1..10], x*2 >= 12]

[x | x <- [50..100], mod x 7 == 3]
-- using predicates for lists is called filtering
[x | x <- [10..20], x/=13, x/=15, x/=19] -- divisible

let nouns = ["hobo", "frog", "pope"]
let adjectives = ["lazy", "grouchy", "scheming"]
[adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]

length' xs = sum [1 | _ <- xs]
-- replaces every element of a list with 1

removeNonUpper st = [ c | c <- st, c 'elem' ['A'..'Z']]

let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]  
[ [ x | x <- xs, even x] xs <- xxs]
[ [ x | x <- xs, even x ] | xs <- xxs] 

-- toight
let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24] 
-- gets all triangles in range then filters by requirement
-- lazy evaluation makes this interesting
