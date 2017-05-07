extension Set: Semigroup {
  public func op(_ other: Set) -> Set {
    return self.union(other)
  }
}

public func setLens<K: Hashable>(value: K) -> Lens<Set<K>, Bool> {
  return Lens(
    view: { whole in whole.contains(value) },
    set: { part, whole in
      return part ? whole.union([value]) : whole.subtracting([value])
    }
  )
}
