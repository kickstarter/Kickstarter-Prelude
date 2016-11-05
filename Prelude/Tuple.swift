public func == <A: Equatable, B: Equatable> (lhs: [(A, B)], rhs: [(A, B)]) -> Bool {
  for (idx, _) in lhs.enumerate() {
    if lhs[idx] != rhs[idx] {
      return false
    }
  }
  return true
}

/**
 - parameter t: A 2-tuple.
 - returns: The first value of a 2-tuple.
 */
public func first<A, B>(t: (A, B)) -> A {
  return t.0
}

/**
 - parameter t: A 2-tuple.
 - returns: The second value of a 2-tuple.
 */
public func second<A, B>(t: (A, B)) -> B {
  return t.1
}

/**
 - parameter t: A 3-tuple.
 - returns: The first value of a 3-tuple.
 */
public func first<A, B, C>(t: (A, B, C)) -> A {
  return t.0
}

/**
 - parameter t: A 3-tuple.
 - returns: The second value of a 3-tuple.
 */
public func second<A, B, C>(t: (A, B, C)) -> B {
  return t.1
}

/**
 - parameter t: A 3-tuple.
 - returns: The third value of a 3-tuple.
 */
public func third<A, B, C>(t: (A, B, C)) -> C {
  return t.2
}
