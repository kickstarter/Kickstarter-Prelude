
public typealias Comparator<A> = FunctionM<(A, A), Ordering>

// NB: We want to extend `Comparator` here, but it's not possible: [link]

extension FunctionM where M == Ordering {
  public func reversed() -> FunctionM {
    return FunctionM { self.call($0).reversed() }
  }
}
