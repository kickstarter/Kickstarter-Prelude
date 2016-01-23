public func == <A : Equatable, B : Equatable> (lhs: (A, B), rhs: (A, B)) -> Bool {
  return (lhs.0 == rhs.0) && (lhs.1 == rhs.1)
}

public func != <A : Equatable, B : Equatable> (lhs: (A, B), rhs: (A, B)) -> Bool {
  return (lhs.0 != rhs.0) || (lhs.1 != rhs.1)
}

public func == <A : Equatable, B : Equatable, C : Equatable> (lhs: (A, B, C), rhs: (A, B, C)) -> Bool {
  return (lhs.0 == rhs.0) && (lhs.1 == rhs.1) && (lhs.2 == rhs.2)
}

public func != <A : Equatable, B : Equatable, C : Equatable> (lhs: (A, B, C), rhs: (A, B, C)) -> Bool {
  return (lhs.0 != rhs.0) || (lhs.1 != rhs.1) || (lhs.2 != rhs.2)
}

public func == <A : Equatable, B : Equatable, C : Equatable, D : Equatable> (lhs: (A, B, C, D), rhs: (A, B, C, D)) -> Bool {
  return (lhs.0 == rhs.0) && (lhs.1 == rhs.1) && (lhs.2 == rhs.2) && (lhs.3 == rhs.3)
}

public func != <A : Equatable, B : Equatable, C : Equatable, D : Equatable> (lhs: (A, B, C, D), rhs: (A, B, C, D)) -> Bool {
  return (lhs.0 != rhs.0) || (lhs.1 != rhs.1) || (lhs.2 != rhs.2) || (lhs.3 != rhs.3)
}

public func == <A: Equatable, B: Equatable> (lhs: [(A, B)], rhs: [(A, B)]) -> Bool {
  for (idx, _) in lhs.enumerate() {
    if lhs[idx] != rhs[idx] {
      return false
    }
  }
  return true
}
