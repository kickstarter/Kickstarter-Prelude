public extension Dictionary where Value: Prelude.OptionalType {

  /// Removes `nil` values from dictionary and unwraps remaining optional values.
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
