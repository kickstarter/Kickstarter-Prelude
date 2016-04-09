import XCTest
@testable import Prelude

class ArrayTest: XCTestCase {

  func testCompact() {
    let xs: [Int?] = [nil, 1, 2, nil, 3, nil, 4, nil, nil]

    XCTAssertEqual([1, 2, 3, 4], xs.compact())
  }

  func testSemigroupConcat() {
    XCTAssert("hello world" == ["hello", " ", "world"].sconcat(""))
  }

  func testRandomElement() {
    let xs = [1, 2, 3, 4, 5]
    (0..<10).forEach { _ in
      XCTAssertNotNil(xs.randomElement)
    }

    let ys = [Int]()
    XCTAssertNil(ys.randomElement)
  }

  func testDistinct() {
    let xs = [1, 2, 3, 1, 2, 3]
    XCTAssertEqual([1, 2, 3], xs.distincts())
    XCTAssertEqual([1, 2, 3], xs.distincts(==))

    let ys: [Int] = []
    XCTAssertEqual([], ys.distincts())
    XCTAssertEqual([], ys.distincts(==))
  }

  func testSemigroupOperation() {
    XCTAssertEqual([1, 2, 3, 4], [1, 2].op([3, 4]))
    XCTAssert([1, 2, 3, 4] == ([1, 2] <> [3, 4]))
    XCTAssert([1, 2].op([3, 4].op([5, 6])) == [1, 2].op([3, 4]).op([5, 6]), "Associativity")
  }

  func testSafeSubscript() {
    let xs = [1, 2]
    XCTAssertEqual(1, xs[safe: 0])
    XCTAssertEqual(2, xs[safe: 1])
    XCTAssertNil(xs[safe: -1])
    XCTAssertNil(xs[safe: 2])
  }
}
