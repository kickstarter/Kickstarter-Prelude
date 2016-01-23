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
