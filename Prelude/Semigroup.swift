/// A type is a Semigroup if it has an associative, binary operation.
public protocol Semigroup {
  /// An associative operation, i.e. a.op(b.op(c)) == (a.op(b)).op(c)
  func op(_ other: Self) -> Self
}

/**
 An infix version of the semigroup operator.

 - parameter lhs: A semigroup value.
 - parameter rhs: A semigroup value.

 - returns: A semigroup value.
 */
public func <> <S: Semigroup> (lhs: S, rhs: S) -> S {
  return lhs.op(rhs)
}

/**
 A prefix version of the <> operator. Given a semigroup value `b`, `<>b` will be a transformation that maps
 `a` to `a <> b`.

 - parameter b: A semigroup value.

 - returns: A semigroup transformation.
 */
public prefix func <> <S: Semigroup> (b: S) -> ((S) -> S) {
  return { $0 <> b }
}

/**
 A postfix version of the <> operator. Given a semigroup value `a`, `a<>` will be a transformation that maps
 `b` to `a <> b`.

 - parameter a: A semigroup value.

 - returns: A semigroup transformation.
 */
public postfix func <> <S: Semigroup> (a: S) -> ((S) -> S) {
  return { a <> $0 }
}
