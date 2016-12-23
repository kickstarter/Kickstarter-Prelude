/// A type representing a choice between two values: left and right.
public protocol EitherType {
  // swiftlint:disable type_name
  associatedtype A
  associatedtype B
  // swiftlint:enable type_name

  /**
   Create an `Either` value from a left value.

   - parameter left: A left value.

   - returns: An `Either` value.
   */
  init(left: A)

  /**
   Create an `Either` value from a right value.

   - parameter right: A right value.

   - returns: An `Either` value.
   */
  init(right: B)

  /**
   Create an `Either` value from a value. Only works when `A != B`.

   - parameter left: A value.

   - returns: An `Either` value.
   */
  init(_ left: A)

  /**
   Creates an `Either` value from a value. Only works when `A != B`.

   - parameter right: A value.

   - returns: An `Either` value
   */
  init(_ right: B)

  /// Get an optional left value out of an `Either` value.
  var left: A? { get }

  /// Get an optional right value out of an `Either` value.
  var right: B? { get }
}

extension EitherType {
  /**
   Extracts the `left` value from an either.

   - parameter e: An either type.

   - returns: A value of type `A` if `e` is a left either, `nil` otherwise.
   */
  public static func left(_ e: Self) -> A? {
    return e.left
  }

  /**
   Extracts the `right` value from an either.

   - parameter e: An either type.

   - returns: A value of type `B` if `e` is a right either, `nil` otherwise.
   */
  public static func right(_ e: Self) -> B? {
    return e.right
  }

  /// `true` if `self` is a left either, `false` otherwise.
  public var isLeft: Bool {
    return self.left != nil
  }

  /// `true` if `self` is a right either, `false` otherwise.
  public var isRight: Bool {
    return self.right != nil
  }
}

public func == <E: EitherType> (lhs: E, rhs: E) -> Bool where E.A: Equatable, E.B: Equatable {
  if let lhs = lhs.left, let rhs = rhs.left {
    return lhs == rhs
  } else if let lhs = lhs.right, let rhs = rhs.right {
    return lhs == rhs
  }
  return false
}

/**
 An implementation of `EitherType` that is functorial and monadic in the right-side type.
 */
public enum Either <A, B>: EitherType {
  case left(A)
  case right(B)

  public init(left: A) {
    self = .left(left)
  }

  public init(right: B) {
    self = .right(right)
  }

  public init(_ left: A) {
    self = .left(left)
  }

  public init(_ right: B) {
    self = .right(right)
  }

  public var left: A? {
    switch self {
    case let .left(left):
      return left
    case .right:
      return nil
    }
  }

  public var right: B? {
    switch self {
    case .left:
      return nil
    case let .right(right):
      return right
    }
  }

  /**
   Maps the right side of an either value.

   - parameter f: A transformation.

   - returns: A new either value.
   */
  public func map <C> (_ f: (B) -> C) -> Either<A, C> {
    switch self {
    case let .left(a):
      return .left(a)
    case let .right(b):
      return .right(f(b))
    }
  }

  /**
   Flatmaps the right side of an either value.

   - parameter f: A transformation.

   - returns: A new either value.
   */
  public func flatMap <C> (_ f: (B) -> Either<A, C>) -> Either<A, C> {
    return self.map(f).flatten()
  }

  /**
   Maps the left side of an either value.

   - parameter f: A transformation.

   - returns: A new either value.
   */
  public func mapLeft <C> (_ f: (A) -> C) -> Either<C, B> {
    switch self {
    case let .left(a):
      return .left(f(a))
    case let .right(b):
      return .right(b)
    }
  }

  /**
   Flatmaps the left side of an either value.

   - parameter f: A transformation.

   - returns: A new either value.
   */
  public func flatMapLeft <C> (_ f: (A) -> Either<C, B>) -> Either<C, B> {
    return self.mapLeft(f).flattenLeft()
  }

  /**
   Invokes the `ifLeft` function if the either value is left, and otherwise invokes `ifRight`.

   - parameter ifLeft:  A function taking a left value.
   - parameter ifRight: A function taking a right value.

   - returns: A value.
   */
  public func ifLeft <C> (_ ifLeft: (A) -> C, ifRight: (B) -> C) -> C {
    switch self {
    case let .left(left):
      return ifLeft(left)
    case let .right(right):
      return ifRight(right)
    }
  }
}

extension Either where B: EitherType, B.A == A {

  /**
   Flattens an `Either<A, Either<A, C>>` into an `Either<A, C>`.

   - returns: A flattened either value.
   */
  public func flatten() -> B {
    switch self {
    case let .left(left):
      return B(left: left)
    case let .right(right):
      return right
    }
  }
}

extension Either where A: EitherType, A.B == B {

  /**
   Flattens an `Either<Either<A, B>, B>` into an `Either<A, B>`.

   - returns: A flattened either value.
   */
  public func flattenLeft() -> A {
    switch self {
    case let .left(left):
      return left
    case let .right(right):
      return A(right: right)
    }
  }
}

/**
 Performs case analysis on `Either`, performing one of two functions depending on if the value is
 left or right.

 - parameter ifLeft:  A function that transforms left values.
 - parameter ifRight: A function that transforms right values.

 - returns: A function that performs case analysis on an `Either` value.
 */
public func either <A, B, C> (ifLeft: @escaping (A) -> C, ifRight: @escaping (B) -> C)
  -> ((Either<A, B>) -> C) {

    return { either in either.ifLeft(ifLeft, ifRight: ifRight) }
}

/**
 Returns true if the `Either` value is a left value.

 - parameter either: An `Either` value.

 - returns: A `Bool` value.
 */
public func isLeft <E: EitherType> (_ either: E) -> Bool {
  return either.isLeft
}

/**
 Returns true if the `Either` value is a right value.

 - parameter either: An `Either` value.

 - returns: A `Bool` value.
 */
public func isRight <E: EitherType> (_ either: E) -> Bool {
  return either.isRight
}

/**
 Returns all the left values from an array of `Either`s.

 - parameter eithers: An array of `Either`s.

 - returns: An array of left values.
 */
public func lefts <E: EitherType> (_ eithers: [E]) -> [E.A] {
  return eithers.map { $0.left }.compact()
}

/**
 Returns all the right values from an array of `Either`s.

 - parameter eithers: An array of `Either`s.

 - returns: An array of right values.
 */
public func rights <E: EitherType> (_ eithers: [E]) -> [E.B] {
  return eithers.map { $0.right }.compact()
}
