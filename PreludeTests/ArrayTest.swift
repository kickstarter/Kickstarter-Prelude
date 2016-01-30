import XCTest
@testable import Prelude

class ArrayTest: XCTestCase {

  func testCompact() {
    let xs: [Int?] = [nil, 1, 2, nil, 3, nil, 4, nil, nil]

    XCTAssertEqual([1, 2, 3, 4], xs.compact())
  }

  func testRandomElement() {
    let xs = [1, 2, 3, 4, 5]
    (0..<10).forEach { _ in
      XCTAssertNotNil(xs.randomElement)
    }

    let ys = [Int]()
    XCTAssertNil(ys.randomElement)
  }
}
