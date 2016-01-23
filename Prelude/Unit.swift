/// The type with one single value.
public struct Unit {
  public init() {
  }
}

extension Unit : Equatable {}
public func == (lhs: Unit, rhs: Unit) -> Bool {
  return true
}
