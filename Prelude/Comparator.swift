public struct Comparator<A> {
  public let compare: (A, A) -> Ordering

  public init(compare: @escaping (A, A) -> Ordering) {
    self.compare = compare
  }

  /**
   Compare if two elements of the same type are ordered.

   - returns: A bool value.
   */
  public var isOrdered: (A, A) -> Bool {
    return { lhs, rhs in self.compare(lhs, rhs) != .gt }
  }

  /**
   Reverses the order of a comparator.
   */
  public var reversed: Comparator {
    return Comparator { lhs, rhs in self.compare(lhs, rhs).reversed }
  }
}

extension Comparator : Monoid {
  public static func identity () -> Comparator {
    return Comparator<A> { _, _ in .eq }
  }

  public func op(_ other: Comparator) -> Comparator {
    return Comparator { lhs, rhs in self.compare(lhs, rhs) <> other.compare(lhs, rhs) }
  }
}

extension Bool {
  public static let trueLessThanComparator = Comparator<Bool>.init { lhs, rhs in
    switch (lhs, rhs) {
    case (true, false):                 return .lt
    case (false, true):                 return .gt
    case (true, true), (false, false):  return .eq
    }
  }
}
