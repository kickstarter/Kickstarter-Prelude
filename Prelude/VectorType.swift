/// A `VectorType` instance is something that behaves like a linear vector does, i.e. it can be
/// scaled with numeric values and added to other vectors.
public protocol VectorType: Equatable {
  associatedtype Scalar: NumericType

  func scale(c: Scalar) -> Self
  func add(v: Self) -> Self
  func subtract(v: Self) -> Self
  func negateVector() -> Self
  static func zero() -> Self
}

public extension VectorType {
  /**
   Linearly interpolate between two vectors.

   - parameter b: Another vector to interpolate to.

   - returns: A function that interpolates between `self` and `b` as `t` varies from `0` to `1`.
   */
  public func lerp(b: Self) -> (Self.Scalar -> Self) {
    return { t in self * (Self.Scalar.one() - t) + b * t }
  }

  public func subtract(v: Self) -> Self {
    return self.add(v.negateVector())
  }
  public func negateVector() -> Self {
    return self.scale(Self.Scalar.one().negate())
  }
}

/**
 Linearly interpolate between two vectors. This is a free-function version of `VectorType.lerp`.

 - parameter a: A vector to interpolate from.
 - parameter b: A vector to interpolate to.

 - returns: A function that interpolates between `a` and `b` as `t` varies from `0` to `1`.
 */
public func lerp <V: VectorType> (a: V, _ b: V) -> (V.Scalar -> V) {
  return { t in a * (V.Scalar.one() - t) + b * t }
}

public func * <V: VectorType> (v: V, c: V.Scalar) -> V {
  return v.scale(c)
}

public func + <V: VectorType> (v: V, w: V) -> V {
  return v.add(w)
}

extension Double : VectorType {
  public typealias Scalar = Double

  public func scale(c: Double) -> Double {
    return self * c
  }

  public func add(v: Double) -> Double {
    return self + v
  }

  public func zero() -> Double {
    return 0.0
  }
}

extension CGFloat : VectorType {
  public typealias Scalar = CGFloat

  public func scale(c: CGFloat) -> CGFloat {
    return self * c
  }

  public func add(v: CGFloat) -> CGFloat {
    return self + v
  }
}

extension CGPoint : VectorType {
  public typealias Scalar = CGFloat

  public func scale(c: CGFloat) -> CGPoint {
    return CGPoint(x: self.x * c, y: self.y * c)
  }

  public func add(v: CGPoint) -> CGPoint {
    return CGPoint(x: self.x + v.x, y: self.y + v.y)
  }

  public static func zero() -> CGPoint {
    return CGPoint.zero
  }
}

extension CGRect : VectorType {
  public typealias Scalar = CGFloat

  public func scale(c: Scalar) -> CGRect {
    return CGRect(
      x: self.origin.x * c,
      y: self.origin.y * c,
      width: self.size.width * c,
      height: self.size.height * c
    )
  }

  public func add(v: CGRect) -> CGRect {
    return CGRect(
      x: self.origin.x + v.origin.x,
      y: self.origin.y + v.origin.y,
      width: self.size.width + v.size.width,
      height: self.size.height + v.size.height
    )
  }

  public static func zero() -> CGRect {
    return CGRect.zero
  }
}
