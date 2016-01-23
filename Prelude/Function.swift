import Foundation

infix operator |> {associativity left precedence 140}
public func |> <A, B> (x: A, f: A -> B) -> B {
  return f(x)
}

infix operator • {associativity left precedence 150}
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

/**
 Clamps a value to a max and min.

 - parameter min: A minimum value to clamp to.
 - parameter max: A maximum value to clamp to.

 - returns: A function that takes any value and clamps it between `min` and `max`.
 */
public func clamp <T: Comparable> (min: T, _ max: T)(_ value: T) -> T {
  return Swift.max(min, Swift.min(max, value))
}

/**
 Linearly interpolate between two vectors.

 - parameter a: A value to correspond to time `t = 0`.
 - parameter b: A value to correspond to time `t = 1`.

 - returns: A function that linearly interpolates between `a` and `b` as time `t` varies from `0` to `1`.
 */
public func lerp <V: VectorType> (a: V, _ b: V)(_ t: V.Scalar) -> V {
  return a * (V.Scalar.one() - t) + b * t
}
