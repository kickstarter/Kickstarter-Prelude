/// A `VectorType` instance is something that behaves like a linear vector does, i.e. it can be
/// scaled with numeric values and added to other vectors.
public protocol VectorType {
  typealias Scalar: NumericType
  
  func scale(c: Scalar) -> Self
  func add(v: Self) -> Self
  func subtract(v: Self) -> Self
  func negateVector() -> Self
  static func zero() -> Self
}

public extension VectorType {
  public func subtract(v: Self) -> Self {
    return self.add(v.negateVector())
  }
  public func negateVector() -> Self {
    return self.scale(Self.Scalar.one().negate())
  }
}

public func * <V: VectorType> (v: V, c: V.Scalar) -> V {
  return v.scale(c)
}

public func + <V: VectorType> (v: V, w: V) -> V {
  return v.add(w)
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
    return CGPointZero
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
    return CGRectZero
  }
}
