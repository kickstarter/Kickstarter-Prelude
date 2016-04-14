/**
 Clamps a value between a min and max.

 - parameter min: The minimum value to clamp to.
 - parameter max: The maximum value to clamp to.

 - returns: A function that takes a value and returns the value clamped to [min, max].
 */
public func clamp <T: Comparable> (min: T, _ max: T) -> (T -> T) {
  assert(min <= max)
  return { value in value < min ? min : value > max ? max : value }
}

public func clamp <T: Comparable> (min min: T) -> (T -> T) {
  return { value in value < min ? min : value }
}

public func clamp <T: Comparable> (max max: T) -> (T -> T) {
  return { value in value > max ? max : value }
}

/**
 Sample usage:

 ```
 max(0.0)(-1.0) == 0.0
 5.0 |> max(2.0) == 5.0
 ```

 - parameter a: The value to take the `max` with.

 - returns: A function that will take the `max` of `a` and its argument.
 */
public func max <T: Comparable> (a: T) -> (T -> T) {
  return { max(a, $0) }
}

/**
 Sample usage:

 ```
 min(0.0)(1.0) == 0.0
 2.0 |> min(5.0) == 2.0
 ```

 - parameter a: The value to take the `min` with.

 - returns: A function that will take the `min` of `a` and its argument.
 */
public func min <T: Comparable> (a: T) -> (T -> T) {
  return { max(a, $0) }
}
