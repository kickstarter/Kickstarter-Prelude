public extension Dictionary where Value: Prelude.OptionalType {

  /**
   - returns: A new dictionary with `nil` values removed.
   */
  public func compact() -> [Key: Value.Wrapped] {
    var ret: [Key: Value.Wrapped] = [:]
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
  public func withAllValuesFrom(_ other: Dictionary) -> Dictionary {
    var result = self
    other.forEach { result[$0] = $1 }
    return result
  }

  /**
   Constructs a dictionary from an array of key-value pairs. If the array contains duplicate keys, the
   last instance of the key will trump all previous values.

   - parameter pairs: An array of key-value pairs.

   - returns: A dictionary.
   */
  public static func keyValuePairs(_ pairs: [(Key, Value)]) -> Dictionary {
    var result = Dictionary()
    pairs.forEach { result[$0] = $1 }
    return result
  }

  /**
   Constructs a new dictionary by transforming all keys by `f` and leaving values unchanged. If `f` is not
   one-to-one (i.e. there are two `a` and `b` for which `f(a) == f(b)`) then the resulting dictionary will
   contain fewer key-value pairs than the original.

   - parameter f: A key transformation.

   - returns: A new dictionary with keys transformed.
   */
  public func transformedKeys(_ f: (Key) -> Key) -> Dictionary {
    return Dictionary.keyValuePairs(self.map { (f($0), $1) })
  }
}

extension Dictionary where Key: Semigroup {

  /**
   Use the semigroup operation on Key to prefix keys with a value.

   - parameter prefix: A prefix value.

   - returns: A new dictionary.
   */
  public func prefixedKeys(_ prefix: Key) -> Dictionary {
    return transformedKeys(prefix<>)
  }
}
