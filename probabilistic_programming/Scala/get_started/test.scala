// Find sqrt using Newton's method
import math.abs

def sqrt(x: Double) = { // blockus
    def sqrtIter(guess: Double) : Double = 
        if (isGoodEnough(guess)) guess
        else sqrtIter(improve(guess))

    def isGoodEnough(guess: Double) = 
        abs(guess*guess - x) / x < 0.001

    def improve(guess: Double) = 
        (guess + x / guess) / 2

    sqrtIter(1.0)
}

println(sqrt(5))
