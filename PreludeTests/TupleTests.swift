import XCTest
@testable import Prelude

final class TupleTests: XCTestCase {
  func testArrayOfTuplesEquality() {
    XCTAssert([(1, 2), (3, 4)] == [(1, 2), (3, 4)])

    XCTAssertFalse([(1, 2), (3, 4)] == [(1, 0), (3, 4)])
    XCTAssertFalse([(1, 2), (3, 4)] == [(1, 2), (0, 4)])
  }

  func testFirst() {
    XCTAssertEqual(1, first((1, 2)))
    XCTAssertEqual(2, first((2, 3)))
  }

  func testSecond() {
    XCTAssertEqual(2, second((1, 2)))
    XCTAssertEqual(3, second((2, 3)))
  }
}
