public struct NonEmpty<Collection: Swift.Collection> {
  public typealias Element = Collection.Iterator.Element
  public let head: Element
  public let tail: Collection
}

infix operator >|: AdditionPrecedence

public func >| <C: Collection>(head: C.Iterator.Element, tail: C) -> NonEmpty<C> {
  return NonEmpty<C>(head: head, tail: tail)
}

extension NonEmpty {
  public var count: Collection.IndexDistance {
    return tail.count.advanced(by: 1)
  }

  public var first: Element {
    return head
  }
}

extension NonEmpty where Collection: RandomAccessCollection {
  public var last: Element {
    return tail.last ?? head
  }
}

extension Array {
  public init<C: Collection>(_ nonEmpty: NonEmpty<C>) where C.Iterator.Element == Element {
    self = [nonEmpty.head] + Array(nonEmpty.tail)
  }
}

// MARK: Array

public typealias NonEmptyArray<Element> = NonEmpty<[Element]>

public func == <T>(lhs: NonEmptyArray<T>, rhs: NonEmptyArray<T>) -> Bool where T: Equatable {
  return lhs.head == rhs.head && lhs.tail == rhs.tail
}

public func != <T>(lhs: NonEmptyArray<T>, rhs: NonEmptyArray<T>) -> Bool where T: Equatable {
  return lhs.head != rhs.head && lhs.tail != rhs.tail
}

public protocol ArrayType {
  associatedtype Iterator: IteratorProtocol
  init(array: [Iterator.Element])
}

extension Array: ArrayType {
  public init(array: Array) {
    self = array
  }
}

extension NonEmpty where Collection: ArrayType {
  public init(_ head: Element, _ tail: Element...) {
    self.init(head: head, tail: Collection(array: tail))
  }
}

public func <> <T>(lhs: NonEmptyArray<T>, rhs: NonEmptyArray<T>) -> NonEmptyArray<T> {
  return lhs.head >| (lhs.tail <> [rhs.head] <> rhs.tail)
}

// MARK: Set

public typealias NonEmptySet<Element: Hashable> = NonEmpty<Set<Element>>

public func == <T>(lhs: NonEmptySet<T>, rhs: NonEmptySet<T>) -> Bool {
  return lhs.head == rhs.head && lhs.tail == rhs.tail
}

public func != <T>(lhs: NonEmptySet<T>, rhs: NonEmptySet<T>) -> Bool {
  return lhs.head != rhs.head || lhs.tail != rhs.tail
}

public protocol SetType {
  associatedtype Iterator: IteratorProtocol
  init(array: [Iterator.Element])
  func subtracting<S>(_ other: S) -> Self where S : Sequence, S.Iterator.Element == Iterator.Element
}

extension Set: SetType {
  public init(array: [Element]) {
    self = Set(array)
  }
}

public func >| <T>(head: T, tail: Set<T>) -> NonEmptySet<T> {
  return NonEmpty<Set<T>>(head: head, tail: tail.subtracting([head]))
}

extension NonEmpty where Collection: SetType, Collection.Iterator.Element: Hashable {
  public init(_ head: Element, _ tail: Element...) {
    self.init(head: head, tail: Collection(array: tail).subtracting([head]))
  }
}
