public struct Prism<Whole, Part>: PrismType {
  public let preview: Whole -> Part?
  public let review: Part -> Whole

  public init(preview: Whole -> Part?, review: Part -> Whole) {
    self.preview = preview
    self.review = review
  }
}
