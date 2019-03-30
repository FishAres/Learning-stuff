// "Map" operates on many different data types
val x = (0 to 4).toList
val x2 = x.map{x=> x*3}
val x3 = x.map{ _ * 0.3} // equivalent
// x3 shows it can change type
val xv = x.toVector
val xv2 = { // for-compreh.
  for (xi <- xv) yield (xi*0.2)
}
// Any parametrised type that has a map method
// is a "Functor"

// We can map functors that return
// values of the container type
// e.g. lists of lists
val x5 = {
  x map { x => List(x-0.1, x+0.1)}
}
// we can flatten this to a single list
val x6 = {
  x flatMap {x => List(x-0.1, x+0.1)}
}
val y = (0 to 12 by 2).toList
val xy = { // this is like a zip
  x flatMap {xi => y map
  {yi => xi * yi} }
}

val xy2 = for {
  // syntactic sugar for above
  // actually expands to flatMap
  xi <- x
  yi <- y
} yield (xi * yi)

// a monad is a functor that has
// a flatMap method
// Not all Monads are collections!

// Option monad
// returns result or None
val three = Option(3)
val twelve = three map (_ * 4)

val four = Option(4)
val twelveB = {
  three map (i => four map (i * _))
}
// this becomes cumbersome
// -> flatMap!
val twelveC = {
  three flatMap (i => four map (i * _))
}

val twelveD = for {
  i <- three
  j <- four
} yield (i * j)

val oops: Option[Int] = None
val oopsB = for {
  i <- three
  j <- oops
} yield (i * j)

val zero = Option(0)
val oopsC = for {
  i <- three
  j <- zero
} yield (i / j)

import breeze.linalg._
def safeChol(m: DenseMatrix[Double]): Option[DenseMatrix[Double]] = scala.util.Try(cholesky(m)).toOption
val m = DenseMatrix((2.0, 1.0), (1.0, 3.0))
val c = safeChol(m)

// Future monad - asynchronous computation
// sends slow computations to another thread
// will have a value sometime in the future
import scala.concurrent.duration._
import scala.concurrent.{Future,ExecutionContext,Await}
import ExecutionContext.Implicits.global

val f1 = Future {
  Thread.sleep(10000)
1 }
val f2 = Future {
  Thread.sleep(10000)
  2 }
val f3 = for {
  v1 <- f1
  v2 <- f2
} yield (v1 + v2)
println(Await.result(f3,30.second))