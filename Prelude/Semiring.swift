public protocol Semiring {
  static func + (lhs: Self, rhs: Self) -> Self
  static func * (lhs: Self, rhs: Self) -> Self
  static var zero: Self { get }
  static var one: Self { get }
}
