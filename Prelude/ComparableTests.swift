import XCTest
@testable import Prelude

class ComparableTests: XCTestCase {
  func testClampFreeFunction() {
    XCTAssertEqual(0.0, clamp(0.0, 1.0)(-1.0), accuracy: 0.0)
    XCTAssertEqual(0.5, clamp(0.0, 1.0)(0.5), accuracy: 0.0)
    XCTAssertEqual(1.0, clamp(0.0, 1.0)(2.0), accuracy: 0.0)
  }
}
