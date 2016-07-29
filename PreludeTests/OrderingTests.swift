import XCTest
@testable import Prelude

final class OrderingTests: XCTestCase {
  func testOp() {
    XCTAssertEqual(Ordering.lt, Ordering.lt.op(.lt))
    XCTAssertEqual(Ordering.lt, Ordering.lt.op(.eq))
    XCTAssertEqual(Ordering.lt, Ordering.lt.op(.gt))
    XCTAssertEqual(Ordering.lt, Ordering.eq.op(.lt))
    XCTAssertEqual(Ordering.eq, Ordering.eq.op(.eq))
    XCTAssertEqual(Ordering.gt, Ordering.eq.op(.gt))
    XCTAssertEqual(Ordering.gt, Ordering.gt.op(.lt))
    XCTAssertEqual(Ordering.gt, Ordering.gt.op(.eq))
    XCTAssertEqual(Ordering.gt, Ordering.gt.op(.gt))
  }

  func testReversed() {
    XCTAssertEqual(Ordering.lt, Ordering.gt.reversed)
    XCTAssertEqual(Ordering.eq, Ordering.eq.reversed)
    XCTAssertEqual(Ordering.gt, Ordering.lt.reversed)
  }
}
