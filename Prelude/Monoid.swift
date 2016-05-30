public protocol Monoid: Semigroup {
  static var mempty: Self { get }
}
