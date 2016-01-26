/// An optional protocol for use in type constraints.
public protocol OptionalType {
  /// The type contained in the otpional.
  typealias Wrapped

  /// Extracts an optional from the receiver.
  var optional: Wrapped? { get }
}

extension Optional: OptionalType {
  public var optional: Wrapped? {
    return self
  }
}

extension Optional {
  public var isNil: Bool {
    return self == nil
  }

  public var isSome: Bool {
    return !isNil
  }

  public func forceUnwrap() -> Wrapped {
    return self!
  }

  /**
   - parameter predicate: A predicate that determines if the wrapped value should be kept or not.

   - returns: If optional is not `nil` and satisfies predicate, it is returned, otherwise `nil`
              is returned.
   */
  public func optionalFilter(predicate: Wrapped -> Bool) -> Optional {
    if let value = self where predicate(value) {
      return value
    }
    return nil
  }

  /**
    Coalesces `self` into an unwrapped value. This is a functional equivalent of the `??` operator.

   - parameter value:

   - returns:
   */
  public func coalesceWith(value: Wrapped) -> Wrapped {
    return self ?? value
  }
}

public func isNil <A> (x: A?) -> Bool {
  return x == nil
}

public func isNotNil <A> (x: A?) -> Bool {
  return x != nil
}
