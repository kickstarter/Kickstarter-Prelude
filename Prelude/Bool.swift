public func isTrue(_ b: Bool) -> Bool {
  return b
}

public func isFalse(_ b: Bool) -> Bool {
  return !b
}

public func negate(_ b: Bool) -> Bool {
  return !b
}

extension Bool: Semiring {
  public static func + (lhs: Bool, rhs: Bool) -> Bool {
    return lhs || rhs
  }

  public static func * (lhs: Bool, rhs: Bool) -> Bool {
    return lhs && rhs
  }

  public static var zero: Bool {
    return false
  }

  public static var one: Bool {
    return true
  }
}
