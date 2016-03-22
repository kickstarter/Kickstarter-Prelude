import XCTest
@testable import Prelude

final class TupleTests: XCTestCase {
  func testArrayOfTuplesEquality() {
    XCTAssert([(1, 2), (3, 4)] == [(1, 2), (3, 4)])

    XCTAssertFalse([(1, 2), (3, 4)] == [(1, 0), (3, 4)])
    XCTAssertFalse([(1, 2), (3, 4)] == [(1, 2), (0, 4)])
  }
}
