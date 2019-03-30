def factorial(n: Int): Int = 
if (n == 0) 1 else n * factorial(n-1)

println(factorial(5))

// This is not tail recursive: the function's 
// last evaluation isn't itself (or another function)
// Tail-recursive version:

def factorial_tail(n: Int): Int = {
    def loop(acc: Int, n: Int): Int = 
    if (n == 0) acc // storing variable
    else loop(acc*n, n-1)
loop(1, n)
}

println(factorial_tail(5))