def sum(f: Int => Int, a: Int, b: Int): Int = {
    if (a > b) 0
    else f(a) + sum(f, a+1, b)
}

def cube(ant): Int = {x * x * x}

def id(x: Int): Int = {x}
def sumCubes(a: Int, b: Int): Int = {sum(id, a, b)}

println(sumCubes(2, 3))