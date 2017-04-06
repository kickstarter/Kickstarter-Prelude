extension String: Semigroup {
  public static func <>(lhs: String, rhs: String) -> String {
    return lhs + rhs
  }
}
