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
    return { whole in
      let part = self.view(whole)
      return self.set(f(part), whole)
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
      set: { subPart, whole in
        let part = self.view(whole)
        let newPart = rhs.set(subPart, part)
        return self.set(newPart, whole)
      }
    )
  }
}

public extension LensType where Part : Comparable {
  public var comparator: Comparator<Whole> {
    return Comparator { lhs, rhs in
      self.view(lhs) < self.view(rhs) ? .lt
        : self.view(lhs) == self.view(rhs) ? .eq
        : .gt
    }
  }
}

/**
 Infix operator of the `set` function.

 - parameter lens: A lens.
 - parameter part: A part.

 - returns: A function that transforms a whole into a new whole with a part replaced.
 */
public func .~ <L: LensType> (lens: L, part: L.Part) -> (L.Whole -> L.Whole) {
  return { whole in lens.set(part, whole) }
}

/**
 Infix operator of the `view` function.

 - parameter whole: A whole.
 - parameter lens:  A lens.

 - returns: A part of a whole when viewed through the lens provided.
 */
public func ^* <L: LensType> (whole: L.Whole, lens: L) -> L.Part {
  return lens.view(whole)
}

/**
 Infix operator of `compose`, which composes two lenses.

 - parameter lhs: A lens.
 - parameter rhs: A lens.

 - returns: The composed lens.
 */
public func • <A, B, C> (lhs: Lens<A, B>, rhs: Lens<B, C>) -> Lens<A, C> {
  return lhs.compose(rhs)
}

/**
 Infix operator of Kleisli composition. This type of composition can help avoid need the full power of
 prisms and traversals when all you need to do is compose lenses through an optional value.

 - parameter lhs: A lens whose part is optional.
 - parameter rhs: A lens whose part is optional.

 - returns: The composed lens.
 */
public func >•> <A, B, C> (lhs: Lens<A, B?>, rhs: Lens<B, C?>) -> Lens<A, C?> {
  return Lens(
    view: { a in lhs.view(a).flatMap(rhs.view) },
    set: { (c, a) in lhs.set(lhs.view(a).map { rhs.set(c, $0) }, a) }
  )
}

/**
 Infix operator of the `over` function.

 - parameter lens: A lens.
 - parameter f:    A function for transforming a part of a whole.

 - returns: A function that transforms a whole into a new whole with its part transformed by `f`.
 */
public func %~ <L: LensType> (lens: L, f: L.Part -> L.Part) -> (L.Whole -> L.Whole) {
  return lens.over(f)
}

/**
 Variation of the infix operator %~.

 - parameter lens: A lens.
 - parameter f:    A function for transforming a part and whole into a new part.

 - returns: A function that transforms a whole into a new whole with its part transformed by `f`.
 */
public func %~~ <L: LensType> (lens: L, f: (L.Part, L.Whole) -> L.Part) -> (L.Whole -> L.Whole) {
  return { whole in
    let part = lens.view(whole)
    return lens.set(f(part, whole), whole)
  }
}

/**
 Infix operator to transform a part of a whole with a semigroup operation.

 - parameter lens: A lens whose part is a semigroup.
 - parameter a:    A part value that is concatenated to the part of a whole.

 - returns: A function that transform a whole into a new whole with its part concatenated to `a`.
 */
public func <>~ <L: LensType where L.Part: Semigroup> (lens: L, a: L.Part) -> (L.Whole -> L.Whole) {
  return lens.over(<>a)
}
