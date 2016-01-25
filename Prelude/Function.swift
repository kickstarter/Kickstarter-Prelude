import Foundation

infix operator |> {associativity left precedence 140}

/// Pipe an element into a function
public func |> <A, B> (x: A, f: A -> B) -> B {
  return f(x)
}

infix operator • {associativity left precedence 150}

/// Compose two functions with an infix operator
public func • <A, B, C> (g: B -> C, f: A -> B) -> A -> C {
  return { x in g(f(x)) }
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

 - parameter b: Any value.

 - returns: A function that returns `b` for any value plugged in.
 */
public func const <A, B> (b: B) -> A -> B {
  return { _ in b }
}
