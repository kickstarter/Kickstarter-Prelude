extension Set: Semigroup {
  public func op(_ other: Set) -> Set {
    return self.union(other)
  }
}
