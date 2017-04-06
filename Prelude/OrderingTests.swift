import XCTest
@testable import Prelude

final class OrderingTests: XCTestCase {
  func testOp() {
    XCTAssertEqual(Ordering.lt, .lt <> .lt)
    XCTAssertEqual(Ordering.lt, .lt <> .eq)
    XCTAssertEqual(Ordering.lt, .lt <> .gt)
    XCTAssertEqual(Ordering.lt, .eq <> .lt)
    XCTAssertEqual(Ordering.eq, .eq <> .eq)
    XCTAssertEqual(Ordering.gt, .eq <> .gt)
    XCTAssertEqual(Ordering.gt, .gt <> .lt)
    XCTAssertEqual(Ordering.gt, .gt <> .eq)
    XCTAssertEqual(Ordering.gt, .gt <> .gt)
  }

  func testReversed() {
    XCTAssertEqual(.lt, Ordering.gt.reversed())
    XCTAssertEqual(.eq, Ordering.eq.reversed())
    XCTAssertEqual(.gt, Ordering.lt.reversed())
  }
}
