public protocol PrismType {
  associatedtype Whole
  associatedtype Part

  init(preview: Whole -> Part?, review: Part -> Whole)

  var preview: Whole -> Part? { get }
  var review: Part -> Whole { get }
}

extension PrismType {

  public func compose <RPrism: PrismType
    where RPrism.Whole == Part> (rhs: RPrism) -> Prism<Whole, RPrism.Part> {

    return Prism(
      preview: { a in self.preview(a).flatMap(rhs.preview) },
      review: self.review • rhs.review
    )
  }
}

//func * <A, B, C> (lhs: Prism<A, B>, rhs: Prism<B, C>) -> Prism<A, C> {
//  return Prism<A, C>(
//    preview: { a in
//      if let b = lhs.preview(a) {
//        return rhs.preview(b)
//      }
//      return nil
//    },
//    review: { c in
//      return lhs.review(rhs.review(c))
//    }
//  )
//}


public func ^? <P: PrismType> (lhs: P.Whole, rhs: P) -> P.Part? {
  return rhs.preview(lhs)
}
