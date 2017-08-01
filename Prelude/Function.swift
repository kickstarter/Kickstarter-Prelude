/**
 Pipe a value into a function.

 - parameter x: A value.
 - parameter f: A function

 - returns: The value from apply `f` to `x`.
 */
public func |> <A, B> (x: A, f: (A) -> B) -> B {
  return f(x)
}

/**
 Pipe a collection of values into a function, i.e. a flipped-infix operator for `map`.

 - parameter xs: An array of values.
 - parameter f:  A transformation.

 - returns: An array of transformed values.
 */
public func ||> <A, B> (xs: [A], f: (A) -> B) -> [B] {
  return xs.map(f)
}

/**
 Pipe an optional value into a function, i.e. a flipped-infix operator for `map`.

 - parameter x: An optional value.
 - parameter f: A transformation.

 - returns: An optional transformed value.
 */
public func ?|> <A, B> (x: A?, f: (A) -> B) -> B? {
  return x.map(f)
}

/**
 Composes two functions in right-to-left order, i.e. (g • f)(x) = g(f(x)

 - parameter g: A function.
 - parameter f: A function.

 - returns: A function that is the composition of `f` and `g`.
 */
@available(*, deprecated)
public func • <A, B, C> (g: @escaping (B) -> C, f: @escaping (A) -> B) -> ((A) -> C) {
  return { x in g(f(x)) }
}

/**
 Composes two functions in left-to-right order, i.e. (f >>> g)(x) = g(f(x)
 - parameter g: A function.
 - parameter f: A function.
 - returns: A function that is the composition of `f` and `g`.
 */
public func >>> <A, B, C> (f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
  return { g(f($0)) }
}

/**
 Composes two functions in right-to-left order, i.e. (f <<< g)(x) = f(g(x)
 - parameter g: A function.
 - parameter f: A function.
 - returns: A function that is the composition of `f` and `g`.
 */
public func <<< <A, B, C> (g: @escaping (B) -> C, f: @escaping (A) -> B) -> (A) -> C {
  return { g(f($0)) }
}

/**
 Compose two endomorphisms in left-to-right order, i.e. (f <> g)(x) = g(f(x)) = x |> f |> g. Note that this
 operation is the monoid operation on the set of functions `A -> A`.

 - parameter f: A function.
 - parameter g: A function.

 - returns: A function that is the composition of `f` and `g`.
 */
public func <> <A> (f: @escaping (A) -> A, g: @escaping (A) -> A) -> ((A) -> A) {
  return { g(f($0)) }
}

/**
 The identity function on `A`.

 - parameter x: Any value.

 - returns: `x`
 */
public func id <A> (_ x: A) -> A {
  return x
}

/**
 A constant function.

 - parameter b: A value.

 - returns: A function that returns `b` no matter what it is fed.
 */
public func const <A, B> (_ b: B) -> ((A) -> B) {
  return { _ in b }
}
