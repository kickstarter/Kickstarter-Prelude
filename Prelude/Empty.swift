/// An un-inhabited type, i.e can never be instantiated.
public enum Empty {
}

extension Empty : Equatable {}
public func == (lhs: Empty, rhs: Empty) -> Bool {
  return true
}
