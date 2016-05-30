// swiftlint:disable type_name
public enum Ordering {
  case lt
  case eq
  case gt
}
// swiftlint:enable type_name

extension Ordering: Monoid {
  public static let mempty = Ordering.eq

  public func op(other: Ordering) -> Ordering {
    switch (self, other) {
    case (.lt, _):          return .lt
    case let (.eq, other):  return other
    case (.gt, _):          return .gt
    }
  }
}
