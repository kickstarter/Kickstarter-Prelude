import Prelude

/*:
 # Function.swift

 ---

 ## Functional composition operators

 The operators `|>`, `>>>` and `<<<` can be used for function application and composition in a
 more expressive manner. Let’s define some simple, pure functions:
 */

func square (x: Int) -> Int {
  return x * x
}

func incr (x: Int) -> Int {
  return x + 1
}

func isPrime (p: Int) -> Bool {
  if p <= 1 { return false }
  if p <= 3 { return true }
  for i in 2...Int(sqrtf(Float(p))) {
    if p % i == 0 {
      return false
    }
  }
  return true
}

func isEven (n: Int) -> Bool {
  return n % 2 == 0
}

/*:
 The "pipe-forward" operator `|>` can be used to send a value through a pipeline of functions:
 */

5 |> square |> incr |> isPrime
6 |> square |> incr |> isPrime

/*:
 This is expressing that `5^2 + 1` is not prime, whereas `6^2 + 1` is prime.

 Note that `|>` is left-associative, so the above is equivalent to:
 */

((5 |> square) |> incr) |> isPrime
((6 |> square) |> incr) |> isPrime

/*:
 Alternatively we could have also composed the functions first and then piped a value through.
 Function composition is done via the `>>>` and `<<<` operators.
 */

5 |> (square >>> incr >>> isPrime)
6 |> (square >>> incr >>> isPrime)

5 |> (isPrime <<< incr <<< square)
6 |> (isPrime <<< incr <<< square)

/*:
 It can also be useful to pipe a whole collection of values into a pipeline, and get the
 resulting collection of transformed values back:
 */

[5, 6, 7, 8, 9, 10] ||> (square >>> incr >>> isPrime)

/*:
 Or an optional:
 */

let n: Int? = nil
let m: Int? = 5

n ?|> (square >>> incr >>> isPrime)
m ?|> (square >>> incr >>> isPrime)

/*:
 There are two global functions in Function.swift that at first might not seem very useful:
 `id` and `const`. Our goal is to to promote functions and composition above all else, and
 these functions help us do that.

 `id` is a function that simply returns whatever it is fed, i.e. the identity function. Consider
 the problem of filtering an array of booleans to get only the `true` values. One might do:
 */

let truths = [true, false, true, true, true, false, false]
truths.filter { x in x }
truths.filter { $0 }

/*:
 Neither of those closures are particularly enlightening and both are ad hoc. We could instead
 use the global `id` function to simply write:
 */

truths.filter(id)

/*:
 In fact, anytime you find yourself writing a closure of the form `{ x in x }` or `{ $0 }` you
 can simply use `id`.

 Many times in stream processing one wants to convert a stream of unimportant values into a stream
 of constant values, e.g. a stream of click events on a "Increment" button would be converted to
 a stream of `1`'s. This would typically look like:
 */

let clicks = [(), (), (), (), ()]
let increments = clicks.map { _ in 1}

/*:
 A better way is to use the `const` function, which is a curried function such that `const(x)` returns
 a new function for which no matter what you plug into it, it will simply return `x`. We can now do:
 */

let newIncrements = clicks.map(const(1))

/*:
 Anytime you find yourself writing a closure of the form `{ _ in value }` you could instead compose
 with `const(value)`.

 ## Point-free programming

 When one properly prompotes functional composition one can begin transforming streams of data without
 ever explicitly mentioning values in the stream. This is called
 [point-free programming](https://en.wikipedia.org/wiki/Tacit_programming). Consider the following:
 */

Array(1...100)
  .map(square >>> incr)
  .filter(isPrime)

/*:
 This finds all the prime numbers of the form `n^2 + 1` for `n = 1...100`. The entire stream processing
 pipeline is expressed without ever mentioning a single value that goes through the pipeline. This style
 of programming is very expressive and forces one to think in terms of small atomic units and pure
 functions, the benefits of which are immense.
 */
