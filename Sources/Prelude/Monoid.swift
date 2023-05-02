public protocol Monoid: Semigroup {
  static func identity () -> Self
}
