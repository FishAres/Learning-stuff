-- https://guide.elm-lang.org/core_language.html

-- Function definitions
isNegative n = n < 0
isNegative -2

-- Anonymous functions
(\n -> n < 0) -2
{-The parentheses tell Elm to stop reading 
the function code at that point -}

-- if-expressions
if True then "pig" else "oh no!"

over9000 powerLevel = 
if powerLevel > 9000 then "It's over 9000!!"
else "meh"

-- Lists
numbers = [1, 4, 3, 2]
List.sort numbers
List.reverse numbers

double n = n * 2
List.map double numbers

-- Tuples
import String
goodName name = 
if String.length name <= 20 then
    (True, "very good!")
else
    (False, "He make bad!")

-- Records (like objects / dicts)
point = {x = 3, y = 4}
bill = {name = "Gates", age = 62}
bill.name

    -- you can also use the keys as functions:
.name bill
List.map .name [bill, bill, bill]

    -- pattern matching
under70 {age} = age < 70

under70 bill

under70 {species: "Megazord", age=987345}

