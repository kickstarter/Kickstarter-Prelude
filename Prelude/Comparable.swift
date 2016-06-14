/**
 Clamps a value between a min and max.

 - parameter min: The minimum value to clamp to.
 - parameter max: The maximum value to clamp to.

 - returns: A function that takes a value and returns the value clamped to [min, max].
 */
public func clamp <T: Comparable> (_ min: T, _ max: T) -> ((T) -> T) {
  assert(min <= max)
  return { value in value < min ? min : value > max ? max : value }
}
