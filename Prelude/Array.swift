public extension Array where Element: OptionalType {

  /// Removes `nil` values from an array of optionals, and unwraps remaining values.
  public func compact() -> [Element.Wrapped] {
    return self.filter { $0.optional != nil }.map { $0.optional! }
  }
}
