public protocol Monoid: Semigroup {
  static var identity: Self { get }
}
