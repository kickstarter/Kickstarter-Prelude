/// An optional protocol for use in type constraints.
public protocol OptionalType {
  /// The type contained in the otpional.
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

  /**
   - parameter predicate: A predicate that determines if the wrapped value should be kept or not.

   - returns: If optional is not `nil` and satisfies predicate, it is returned, otherwise `nil`
              is returned.
   */
  public func optionalFilter(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
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
