public typealias Comparator<A> = FunctionM<(A, A), Ordering>

// NB: We want to extend `Comparator` here, but it's not possible: [link]

extension FunctionM where M == Ordering {
  public func reversed() -> FunctionM {
    return FunctionM { self.call($0).reversed() }
  }
}

/**
 Sorts an array given a comparator.

 - parameter comparator: A comparator.

 - returns: A sorted array.
 */
extension Sequence {
  public func sorted(by comparator: Comparator<Iterator.Element>) -> [Iterator.Element] {
    return self.sorted { comparator.call($0, $1) == .lt }
  }
}
