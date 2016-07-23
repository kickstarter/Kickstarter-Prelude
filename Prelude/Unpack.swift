/**
 Unpacks a nested tuple into a flat tuple.

 - parameter ab: A tuple
 - parameter c:  A value

 - returns: A flattened 3-tuple.
 */
public func unpack <A, B, C> (_ ab: (A, B), c: C) -> (A, B, C) {
  return (ab.0, ab.1, c)
}

/**
 Unpacks a nested tuple into a flat tuple.

 - parameter a:  A value
 - parameter bc: A tuple

 - returns: A flattened 3-tuple.
 */
public func unpack <A, B, C> (_ a: A, bc: (B, C)) -> (A, B, C) {
  return (a, bc.0, bc.1)
}
