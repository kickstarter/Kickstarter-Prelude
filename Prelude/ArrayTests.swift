import XCTest
@testable import Prelude

class ArrayTests: XCTestCase {

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
    XCTAssertEqual([1, 2, 3, 4], [1, 2] <> [3, 4])

    let a = [1, 2]
    let b = [3, 4]
    let c = [5, 6]
    XCTAssertEqual(a <> (b <> c), (a <> b) <> c, "Associativity")
  }

  func testGroupBy() {
    let xs = Array(1...10)
    let grouped = xs.groupedBy { $0 % 2 == 0 }

    XCTAssertEqual([false, true], Array(grouped.keys))
    XCTAssertEqual([1, 3, 5, 7, 9], grouped[false]!)
    XCTAssertEqual([2, 4, 6, 8, 10], grouped[true]!)
  }

  func testSortedByComparator() {
    let xs = [3, 6, 1, 2]
    let sorted = xs.sorted(by: Comparator { $0 < $1 ? .lt : $0 == $1 ? .eq : .gt })
    XCTAssertEqual([1, 2, 3, 6], sorted)
  }
}
