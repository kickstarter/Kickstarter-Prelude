extension Comparable {
  /**
   Clamps a value between `self` and `max`.

   - parameter max: The max value to clamp to.

   - returns: A function that takes a value and returns the value clamped to [self, max].
   */
  public func clamp(max: Self) -> (Self -> Self) {
    assert(self < max)
    return { value in value < self ? self : value > max ? max : value }
  }
}

/**
 Clamps a value between a min and max. This is a free-function version of `Comparable.clamp`.

 - parameter min: The minimum value to clamp to.
 - parameter max: The maximum value to clamp to.

 - returns: A function that takes a value and returns the value clamped to [min, max].
 */
public func clamp <T: Comparable> (min: T, _ max: T) -> (T -> T) {
  return { value in value |> min.clamp(max) }
}
