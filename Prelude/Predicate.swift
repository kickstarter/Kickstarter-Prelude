public typealias Predicate<A> = FunctionR<A, Bool>

extension Sequence {
  public func filtered(by predicate: Predicate<Iterator.Element>) -> [Iterator.Element] {
    return self.filter(predicate.call)
  }
}

public func && <A> (lhs: Predicate<A>, rhs: Predicate<A>) -> Predicate<A> {
  return lhs * rhs
}

public func || <A> (lhs: Predicate<A>, rhs: Predicate<A>) -> Predicate<A> {
  return lhs + rhs
}
