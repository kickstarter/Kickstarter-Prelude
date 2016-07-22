public struct Comparator<A> {
  public let compare: (A, A) -> Ordering

  /// Compare if two elements of the same type are ordered.
  public var isOrdered: (A, A) -> Bool {
    return { lhs, rhs in self.compare(lhs, rhs) != .gt }
  }

  /// Reverses the order of a comporator.
  public var reversed: Comparator {
    return Comparator { lhs, rhs in self.compare(lhs, rhs).reversed }
  }
}

extension Comparator : Monoid {
  public static func identity () -> Comparator {
    return Comparator<A> { _, _ in .eq }
  }

  public func op(other: Comparator) -> Comparator {
    return Comparator { lhs, rhs in self.compare(lhs, rhs) <> other.compare(lhs, rhs) }
  }
}
