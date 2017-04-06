/// A type that represents ordering (less than, equal, or greater than).
public enum Ordering {
  case lt
  case eq
  case gt

  public func reversed() -> Ordering {
    switch self {
    case .lt:
      return .gt
    case .eq:
      return .eq
    case .gt:
      return .lt
    }
  }
}

extension Ordering : Monoid {
  public static let identity = Ordering.eq

  public static func <>(lhs: Ordering, rhs: Ordering) -> Ordering {
    switch (lhs, rhs) {
    case (.lt, _):  return .lt
    case (.eq, _):  return rhs
    case (.gt, _):  return .gt
    }
  }
}
