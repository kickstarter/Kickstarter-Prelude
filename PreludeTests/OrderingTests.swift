import XCTest
@testable import Prelude

final class OrderingTests: XCTestCase {
  func testOp() {
    XCTAssertEqual(Ordering.lt, Ordering.lt.op(Ordering.lt))
    XCTAssertEqual(Ordering.lt, Ordering.lt.op(Ordering.eq))
    XCTAssertEqual(Ordering.lt, Ordering.lt.op(Ordering.gt))
    XCTAssertEqual(Ordering.lt, Ordering.eq.op(Ordering.lt))
    XCTAssertEqual(Ordering.eq, Ordering.eq.op(Ordering.eq))
    XCTAssertEqual(Ordering.gt, Ordering.eq.op(Ordering.gt))
    XCTAssertEqual(Ordering.gt, Ordering.gt.op(Ordering.lt))
    XCTAssertEqual(Ordering.gt, Ordering.gt.op(Ordering.eq))
    XCTAssertEqual(Ordering.gt, Ordering.gt.op(Ordering.gt))
  }

  func testReversed() {
    XCTAssertEqual(Ordering.lt, Ordering.gt.reversed)
    XCTAssertEqual(Ordering.eq, Ordering.eq.reversed)
    XCTAssertEqual(Ordering.gt, Ordering.lt.reversed)
  }
}
