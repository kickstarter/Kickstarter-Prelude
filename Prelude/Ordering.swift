/// A type that represents ordering (less than, equal, or greater than).
public enum Ordering {
  case lt
  case eq
  case gt

  public var reversed: Ordering {
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
  public static func identity () -> Ordering {
    return .eq
  }

  public func op(_ other: Ordering) -> Ordering {
    switch (self, other) {
    case (.lt, _):
      return .lt
    case (.eq, _):
      return other
    case (.gt, _):
      return .gt
    }
  }
}
