public struct FunctionM<A, M: Monoid> {
  public let call: (A) -> M

  public init(_ call: @escaping (A) -> M) {
    self.call = call
  }
}

extension FunctionM: Monoid {
  public static func <>(lhs: FunctionM, rhs: FunctionM) -> FunctionM {
    return FunctionM { lhs.call($0) <> rhs.call($0) }
  }

  public static var identity: FunctionM {
    return FunctionM(const(M.identity))
  }
}
