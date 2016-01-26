import XCTest
@testable import Prelude

final class TupleTests: XCTestCase {

  func testTupleEquality() {
    XCTAssert((1, 2) == (1, 2))
    XCTAssert((1, 2, 3) == (1, 2, 3))
    XCTAssert((1, 2, 3, 4) == (1, 2, 3, 4))
  }

  func testTupleInequality() {
    XCTAssert((1, 2) != (2, 1))
    XCTAssert((1, 2) != (1, 3))

    XCTAssert((1, 2, 3) != (2, 3, 1))
    XCTAssert((1, 2, 3) != (1, 3, 2))
    XCTAssert((1, 2, 3) != (1, 2, 0))

    XCTAssert((1, 2, 3, 4) != (0, 2, 3, 4))
    XCTAssert((1, 2, 3, 4) != (1, 0, 3, 4))
    XCTAssert((1, 2, 3, 4) != (1, 2, 0, 4))
    XCTAssert((1, 2, 3, 4) != (1, 2, 3, 0))
  }

  func testArrayOfTuplesEquality() {
    XCTAssert([(1, 2), (3, 4)] == [(1, 2), (3, 4)])

    XCTAssertFalse([(1, 2), (3, 4)] == [(1, 0), (3, 4)])
    XCTAssertFalse([(1, 2), (3, 4)] == [(1, 2), (0, 4)])
  }
}
