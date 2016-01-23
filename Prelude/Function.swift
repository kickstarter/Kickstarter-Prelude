import Foundation

/// Pipe an element into a function
infix operator |> {associativity left precedence 140}
public func |> <A, B> (x: A, f: A -> B) -> B {
  return f(x)
}

/// Compose two functions with an infix operator
infix operator • {associativity left precedence 150}
public func • <A, B, C> (g: B -> C, f: A -> B) -> A -> C {
  return { x in g(f(x)) }
}

/// The identity function on `A`
public func id <A> (x: A) -> A {
  return x
}

/// A constant function from `A` to `B`
public func const <A, B> (b: B) -> A -> B {
  return { _ in b }
}
