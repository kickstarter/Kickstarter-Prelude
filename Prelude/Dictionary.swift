public extension Dictionary where Value: Prelude.OptionalType {

  /**
   - returns: A new dictionary with `nil` values removed.
   */
  public func compact() -> [Key:Value.Wrapped] {
    var ret: [Key:Value.Wrapped] = [:]
    for (key, value) in self {
      if let value = value.optional {
        ret[key] = value
      }
    }
    return ret
  }
}

public extension Dictionary {

  /**
   Merges `self` with `other`, but all values from `other` trump the values in `self`.

   - parameter other: Another dictionary.

   - returns: A merged dictionary.
   */
  public func withAllValuesFrom(other: Dictionary) -> Dictionary {

    var result = self

    for (key, value) in other {
      result[key] = value
    }

    return result
  }
}
