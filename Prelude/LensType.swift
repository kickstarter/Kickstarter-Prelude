public protocol LensType {
  associatedtype Whole
  associatedtype Part

  init(view: Whole -> Part, set: (Part, Whole) -> Whole)

  var view: Whole -> Part { get }
  var set: (Part, Whole) -> Whole { get }
}

public extension LensType {
  /**
   Map a function over a part of a whole.

   - parameter f: A function.

   - returns: A function that takes wholes to wholes by applying the function to a subpart.
   */
  public func over(f: Part -> Part) -> (Whole -> Whole) {
    return { (a: Whole) -> Whole in
      let part = self.view(a)
      return self.set(f(part), a)
    }
  }

  /**
   Composes two lenses. Given lenses `Lens<A, B>` and `Lens<B, C>` it is possible to construct a lens
   `Lens<A, C>`.

   - parameter rhs: Another lens.

   - returns: A composed lens.
   */
  public func compose <RLens: LensType where RLens.Whole == Part>(rhs: RLens) -> Lens<Whole, RLens.Part> {
    return Lens(
      view: rhs.view • self.view,
      set: { (c: RLens.Part, a: Whole) -> Whole in
        let part = self.view(a)
        let newPart = rhs.set(c, part)
        return self.set(newPart, a)
      }
    )
  }
}

public func *~ <L: LensType> (lens: L, b: L.Part) -> L.Whole -> L.Whole {
  return { a in lens.set(b, a) }
}

public func ^* <L: LensType> (a: L.Whole, lens: L) -> L.Part {
  return lens.view(a)
}

public func • <A, B, C> (lhs: Lens<A, B>, rhs: Lens<B, C>) -> Lens<A, C> {
  return lhs.compose(rhs)
}

public func >•> <A, B, C> (lhs: Lens<A, B?>, rhs: Lens<B, C?>) -> Lens<A, C?> {
  return Lens(
    view: { a in lhs.view(a).flatMap(rhs.view) },
    set: { (c, a) in lhs.set(lhs.view(a).map { rhs.set(c, $0) }, a) }
  )
}

public func %~ <L: LensType> (lens: L, f: L.Part -> L.Part) -> L.Whole -> L.Whole {
  return lens.over(f)
}

public func <>~ <L: LensType where L.Part: Semigroup> (lens: L, a: L.Part) -> L.Whole -> L.Whole {
  return lens.over(<>a)
}
