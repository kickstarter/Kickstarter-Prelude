import XCTest
@testable import Prelude

final class ComparatorTests: XCTestCase {
  func testIsOrdered() {
    XCTAssertEqual(.lt, Int.comparator.call(1, 2))
    XCTAssertEqual(.eq,Int.comparator.call(1, 1))
    XCTAssertEqual(.gt, Int.comparator.call(2, 1))
  }

  func testReversed() {
    XCTAssertEqual(.gt, Int.comparator.reversed().call(1, 2))
    XCTAssertEqual(.eq, Int.comparator.reversed().call(1, 1))
    XCTAssertEqual(.lt, Int.comparator.reversed().call(2, 1))
  }
}
