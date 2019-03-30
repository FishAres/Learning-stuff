// from Darren Wilkinson's blog

val x = (0 to 4).toList
val x2 = x map { x=> x * 3}

val x3 = x map { _ * 3} // same as x2
val x4 = x map { _ * 0.1} // (1/10 x)

val xv = x.toVector
val xv2 = xv map { _ * 0.2 }
val xv3 = for (xi <- xv) yield (xi * 0.2)

/* The comprehension in xv3 is identical to
the map statement for xv2 
Any parametrised type that has a map method
is a Functor 

Once we can map functions over elements of
containers, we can map functions that return
values of the container type, e.g.
returning a List over the elements of a List:
*/

val x5 = x map { x => List(x - 0.1, x + 0.1)}
// println(x5)

/* ok whatevs, but we typically want this flattened,
not in a list-of-lists. That's where flatMap
comes in */
val x6 = x flatMap { x => List(x-0.1, x+0.1)}
// println(x6)

val y = (0 to 12 by 2).toList
val xy = x flatMap {xi => y map {yi => xi * yi}}

// this xcould be re-written with a for comprehension
val xy2 = for {
    xi <- x
    yi <- y
} yield (xi * yi)

println(xy2)

// a monad is a functor that also has a flatmap method.

// Option monad:
val three = Option(3)