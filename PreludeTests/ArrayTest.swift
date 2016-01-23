import XCTest
@testable import Prelude

class ArrayTest : XCTestCase {

  func testCompact() {
    let xs: [Int?] = [nil, 1, 2, nil, 3, nil, 4, nil, nil]

    XCTAssert(xs.compact() == [1, 2, 3, 4])
  }
}
