public extension Array where Element: OptionalType {

  /**
   - returns: A new array with `nil` values removed.
   */
  public func compact() -> [Element.Wrapped] {
    return self.filter { $0.optional != nil }.map { $0.optional! }
  }
}
