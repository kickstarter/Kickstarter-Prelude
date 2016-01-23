import XCTest
@testable import Prelude

class ComparableTests : XCTestCase {

  func testClamp() {
    XCTAssertEqualWithAccuracy(0.0, 0.0.clamp(1.0)(-1.0), accuracy: 0.0)
    XCTAssertEqualWithAccuracy(0.5, 0.0.clamp(1.0)(0.5), accuracy: 0.0)
    XCTAssertEqualWithAccuracy(1.0, 0.0.clamp(1.0)(2.0), accuracy: 0.0)
  }

  func testClampFreeFunction() {
    XCTAssertEqualWithAccuracy(0.0, clamp(0.0, 1.0)(-1.0), accuracy: 0.0)
    XCTAssertEqualWithAccuracy(0.5, clamp(0.0, 1.0)(0.5), accuracy: 0.0)
    XCTAssertEqualWithAccuracy(1.0, clamp(0.0, 1.0)(2.0), accuracy: 0.0)
  }
}
