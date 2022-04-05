extension String: Semigroup {
  public func op(_ other: String) -> String {
    return self + other
  }
}
