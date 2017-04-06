public protocol Monoid: Semigroup {
  static var identity: Self { get }
}

public func mconcat<M: Monoid>(_ xs: [M], _ initial: M) -> M {
  return sconcat(xs, M.identity)
}
