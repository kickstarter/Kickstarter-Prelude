public struct Comparator<A> {
  internal let c: (A, A) -> Ordering
}

extension Comparator where A: Comparable {
  public init() {
    self.c = { $0 < $1 ? .lt : $0 == $1 ? .eq : .gt }
  }
}
