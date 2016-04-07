extension String: Semigroup {
  public func op(other: String) -> String {
    return self + other
  }
}
