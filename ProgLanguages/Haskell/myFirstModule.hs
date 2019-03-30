module MyFirstModule where

    myExpression :: String
    myExpression = "Meow"

    myFunction :: String -> String
    myFunction input = "Try catch is of " ++ input

    myIfStatement :: Int -> Int
    -- if statements' branches need to result
    -- in the same type
    myIfStatement a = if a <= 2
        then a + 2
        else if a > 4
        -- "elif" statements are achieved using
        -- nested if-else statements
            then a
            else a - 2
    
    guardStatement :: Int -> Int
    -- equivalent to above
    guardStatement a
        | a <= 2 = a + 2
        | a <= 6 = a
        | otherwise = a -2

    main :: IO ()
    main = do
        putStrLn "Catch pig?"
        name <- getLine
        let message = myFunction name
        putStrLn message
        putStrLn "Oh no he too fast!"

    