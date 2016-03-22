public func == <A: Equatable, B: Equatable> (lhs: [(A, B)], rhs: [(A, B)]) -> Bool {
  for (idx, _) in lhs.enumerate() {
    if lhs[idx] != rhs[idx] {
      return false
    }
  }
  return true
}
