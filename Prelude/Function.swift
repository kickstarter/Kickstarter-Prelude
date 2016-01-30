import Foundation

infix operator |> {associativity left precedence 140}

/**
Pipe a value into a function.

- parameter x: A value.
- parameter f: A function

- returns: The value from apply `f` to `x`.
*/
public func |> <A, B> (x: A, f: A -> B) -> B {
  return f(x)
}

infix operator • {associativity left precedence 150}

/**
 Compose two functions

 - parameter g: A function.
 - parameter f: A function.

 - returns: The composition function of `f` and `g`.
*/
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
