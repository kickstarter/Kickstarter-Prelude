public struct FunctionR<A, R: Semiring> {
  public let call: (A) -> R

  public init(_ call: @escaping (A) -> R) {
    self.call = call
  }
}

extension FunctionR: Semiring {

  public static func + (lhs: FunctionR, rhs: FunctionR) -> FunctionR {
    return FunctionR { lhs.call($0) + rhs.call($0) }
  }

  public static func * (lhs: FunctionR, rhs: FunctionR) -> FunctionR {
    return FunctionR { lhs.call($0) * rhs.call($0) }
  }

  public static var zero: FunctionR {
    return FunctionR(const(R.zero))
  }

  public static var one: FunctionR {
    return FunctionR(const(R.one))
  }
}
