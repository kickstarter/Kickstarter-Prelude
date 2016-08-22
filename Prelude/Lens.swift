public struct Lens <Whole, Part> : LensType {
  public let view: (Whole) -> Part
  public let set: (Part, Whole) -> Whole

  public init(view: @escaping (Whole) -> Part, set: @escaping (Part, Whole) -> Whole) {
    self.view = view
    self.set = set
  }
}
