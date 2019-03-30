// Maps are higher order functions
val l1 = List(1,2,3)
val l2 = 4 :: l1 // appends to the front

val l3 = l2 map { x => x*x }

val l4 = l2.map(x => x*x)

import Currying._