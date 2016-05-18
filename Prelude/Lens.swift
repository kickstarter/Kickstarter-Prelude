public struct Lens <Whole, Part> : LensType {
  public let view: Whole -> Part
  public let set: (Part, Whole) -> Whole

  public init(view: Whole -> Part, set: (Part, Whole) -> Whole) {
    self.view = view
    self.set = set
  }
}
