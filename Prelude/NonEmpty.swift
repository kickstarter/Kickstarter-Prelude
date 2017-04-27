public protocol NonEmpty {
  associatedtype Collection: Swift.Collection
  var head: Collection.Iterator.Element { get }
  var tail: Collection { get }
}

extension NonEmpty {
  public var count: Collection.IndexDistance {
    return tail.count.advanced(by: 1)
  }

  public var first: Collection.Iterator.Element {
    return head
  }
}

extension NonEmpty where Collection: RandomAccessCollection {
  public var last: Collection.Iterator.Element {
    return tail.last ?? head
  }
}

infix operator >|: AdditionPrecedence

// MARK: Array

public struct NonEmptyArray<Element>: NonEmpty {
  public let head: Element
  public let tail: [Element]
}

extension NonEmptyArray {
  public init(_ head: Element, _ tail: Element...) {
    self.init(head: head, tail: tail)
  }
}

extension NonEmptyArray: Semigroup {
  public func op(_ other: NonEmptyArray) -> NonEmptyArray {
    return NonEmptyArray(head: self.head, tail: self.tail <> [other.head] <> other.tail)
  }
}

public func == <T>(lhs: NonEmptyArray<T>, rhs: NonEmptyArray<T>) -> Bool where T: Equatable {
  return lhs.head == rhs.head && lhs.tail == rhs.tail
}

public func != <T>(lhs: NonEmptyArray<T>, rhs: NonEmptyArray<T>) -> Bool where T: Equatable {
  return lhs.head != rhs.head && lhs.tail != rhs.tail
}

public func >| <T>(head: T, tail: [T]) -> NonEmptyArray<T> {
  return NonEmptyArray<T>(head: head, tail: tail)
}

extension Array {
  public init(_ nonEmpty: NonEmptyArray<Element>) {
    self = [nonEmpty.head] + Array(nonEmpty.tail)
  }
}

// MARK: Set

public struct NonEmptySet<Element>: NonEmpty where Element: Hashable {
  public let head: Element
  public let tail: Set<Element>
}

extension NonEmptySet {
  public init(_ head: Element, _ tail: Element...) {
    self.init(head: head, tail: Set(tail).subtracting([head]))
  }
}

extension NonEmptySet: Semigroup {
  public func op(_ other: NonEmptySet) -> NonEmptySet {
    return NonEmptySet(
      head: self.head, tail: (self.tail <> [other.head] <> other.tail).subtracting([self.head])
    )
  }
}

public func == <T>(lhs: NonEmptySet<T>, rhs: NonEmptySet<T>) -> Bool {
  return lhs.head == rhs.head && lhs.tail == rhs.tail
}

public func != <T>(lhs: NonEmptySet<T>, rhs: NonEmptySet<T>) -> Bool {
  return lhs.head != rhs.head || lhs.tail != rhs.tail
}

public func >| <T>(head: T, tail: Set<T>) -> NonEmptySet<T> {
  return NonEmptySet<T>(head: head, tail: tail.subtracting([head]))
}

extension Array where Element: Hashable {
  public init(_ nonEmpty: NonEmptySet<Element>) {
    self = [nonEmpty.head] + Array(nonEmpty.tail)
  }
}
