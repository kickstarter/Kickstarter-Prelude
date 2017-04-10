/// An optional protocol for use in type constraints.
public protocol OptionalType {
  /// The type contained in the optional.
  associatedtype Wrapped

  /// Extracts an optional from the receiver.
  var optional: Wrapped? { get }
}

extension Optional: OptionalType {
  public var optional: Wrapped? {
    return self
  }
}

extension OptionalType {
  public var isNil: Bool {
    return self.optional == nil
  }

  public var isSome: Bool {
    return !isNil
  }

  public func forceUnwrap() -> Wrapped {
    return self.optional!
  }

  // swiftlint:disable valid_docs
  /**
   Call `body` on wrapped value of `self` if present. An analog to `Sequence.forEach`.

   - parameter body: A procedure to call on the wrapped value of `self` if present.
   */
  public func doIfSome(_ body: (Wrapped) throws -> Void) rethrows {
    if let value = self.optional {
      try body(value)
    }
  }
  // swiftlint:enable valid_docs

  /**
   - parameter predicate: A predicate that determines if the wrapped value should be kept or not.

   - returns: If optional is not `nil` and satisfies predicate, it is returned, otherwise `nil`
              is returned.
   */
  public func filter(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
    if let value = self.optional, predicate(value) {
      return value
    }
    return nil
  }

  /**
    Coalesces `self` into an unwrapped value. This is a functional equivalent of the `??` operator.

   - parameter value:

   - returns:
   */
  public func coalesceWith(_ value: @autoclosure () -> Wrapped) -> Wrapped {
    return self.optional ?? value()
  }
}

/**
 Flattens a doubly nested optional.

 - parameter x: An optional.

 - returns: An optional.
 */
public func flattenOptional <A> (_ x: A??) -> A? {
  if let x = x { return x }
  return nil
}

public func isNil <A> (_ x: A?) -> Bool {
  return x == nil
}

public func isNotNil <A> (_ x: A?) -> Bool {
  return x != nil
}

/**
 An equality operator on arrays of equatable optionals.

 - parameter lhs: An array of equatable optionals.
 - parameter rhs: An array of equatable optionals.

 - returns: A boolean if the elements in both arrays are pairwise equal.
 */
public func == <A: Equatable> (lhs: [A?], rhs: [A?]) -> Bool {
  guard lhs.count == rhs.count else { return false }

  return zip(lhs, rhs).reduce(true) { (accum, lr) in
    return accum && lr.0 == lr.1
  }
}

/**
 An inequality operator on arrays of equatable optionals.

 - parameter lhs: An array of equatable optionals.
 - parameter rhs: An array of equatable optionals.

 - returns: A boolean if the elements in both arrays are not pairwise equal.
 */
public func != <A: Equatable> (lhs: [A?], rhs: [A?]) -> Bool {
  return !(lhs == rhs)
}

/**
 Wraps a non-optional value into an optional, and leaves an optional value unchanged.

 This can be useful for dealing with Swift API changes, in which methods formally returned non-optional
 values now return optional values.

 - parameter x: An optional value.

 - returns: A wrapped optional value.
 */
@available(*, deprecated, message: "Don’t use this. It was only necessary for Swift 2.3.")
public func optionalize<A>(x: A?) -> A? {
  return x
}

public func zip<A, B>(_ a: A?, _ b: B?) -> (A, B)? {
  return a.flatMap { a in b.map { b in (a, b) } }
}

public func zip<A, B, C>(_ a: A?, _ b: B?, _ c: C?) -> (A, B, C)? {
  return zip(a, b).flatMap { a, b in c.map { c in (a, b, c) } }
}

public func lift<A, B>(_ f: (A) -> B, _ x: A?) -> B? {
  return x.map(f)
}

public func lift<A, B, C>(_ f: (A, B) -> C, _ x: A?, _ y: B?) -> C? {
  return zip(x, y).map(f)
}

public func lift<A, B, C, D>(_ f: (A, B, C) -> D, _ x: A?, _ y: B?, _ z: C?) -> D? {
  return zip(x, y, z).map(f)
}
