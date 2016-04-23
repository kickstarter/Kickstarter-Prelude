public func isTrue(b: BooleanType) -> Bool {
  return b.boolValue
}

public func isFalse(b: BooleanType) -> Bool {
  return !b.boolValue
}

public func negate(b: BooleanType) -> Bool {
  return !b.boolValue
}
