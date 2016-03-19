/**
 Pipe a value into a function.

 - parameter x: A value.
 - parameter f: A function

 - returns: The value from apply `f` to `x`.
 */
public func |> <A, B> (x: A, f: A -> B) -> B {
  return f(x)
}

/**
 Composes two functions in right-to-left order, i.e. (g • f)(x) = g(f(x)

 - parameter g: A function.
 - parameter f: A function.

 - returns: A function that is the composition of `f` and `g`.
 */
public func • <A, B, C> (g: B -> C, f: A -> B) -> (A -> C) {
  return { x in g(f(x)) }
}

/**
 Compose two endomorphisms in left-to-right order, i.e. (f <> g)(x) = g(f(x)) = x |> f |> g. Note that this
 operation is the monoid operation on the set of functions `A -> A`.

 - parameter f: A function.
 - parameter g: A function.

 - returns: A function that is the composition of `f` and `g`.
 */
public func <> <A> (f: A -> A, g: A -> A) -> (A -> A) {
  return { g(f($0)) }
}

/**
 The identity function on `A`.

 - parameter x: Any value.

 - returns: `x`
 */
public func id <A> (x: A) -> A {
  return x
}

/**
 A constant function.

 - parameter b: A value.

 - returns: A function that returns `b` no matter what it is fed.
 */
public func const <A, B> (b: B) -> (A -> B) {
  return { _ in b }
}
