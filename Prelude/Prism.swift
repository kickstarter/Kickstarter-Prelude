public struct Prism<A, B> {
  public let preview: (A) -> B?
  public let review: (B) -> A

  public init(preview: @escaping (A) -> B?, review: @escaping (B) -> A) {
    self.preview = preview
    self.review = review
  }
}

public func .. <A, B, C> (lhs: Prism<A, B>, rhs: Prism<B, C>) -> Prism<A, C> {
  return Prism<A, C>(
    preview: { a in lhs.preview(a).flatMap(rhs.preview) },
    review: rhs.review >>> lhs.review
  )
}

public func %~ <A, B> (prism: Prism<A, B>, f: @escaping (B) -> B) -> (A) -> A {
  return { a in
    prism.preview(a).map(f).map(prism.review) ?? a
  }
}

public func ^? <A, B> (a: A, prism: Prism<A, B>) -> B? {
  return prism.preview(a)
}

public func .. <A, B, C> (lens: Lens<A, B>, prism: Prism<B, C>) -> Lens<A, C?> {
  return Lens(
    view: { a in prism.preview(lens.view(a)) },
    set: { c, a in
      c.map { lens.set(prism.review($0), a) } ?? a
    }
  )
}

public func .. <A, B, C> (prism: Prism<A, B>, lens: Lens<B, C>) -> Lens<A, C?> {
  return Lens<A, C?>(
    view: { a in prism.preview(a).map(lens.view) },
    set: { c, a in
      zip(c, prism.preview(a))
        .map { c, b in lens.set(c, b) }
        .map(prism.review)
        ?? a
    }
  )
}
