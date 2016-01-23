import XCTest
@testable import Prelude

class FunctionTest : XCTestCase {

  func testPipeForward() {
    func square(x: Int) -> Int { return x * x }

    XCTAssertEqual(4, 2 |> square)
  }

  func testCompose() {
    func square(x: Int) -> Int { return x * x }
    func incr(x: Int) -> Int { return x + 1 }

    XCTAssertEqual(16, (square • incr)(3))
    XCTAssertEqual(10, (incr • square)(3))
  }

  func testId() {
    XCTAssertEqual(2, id(2))
    XCTAssertEqual("doge", id("doge"))
  }

  func testConst() {
    XCTAssertEqual(2, const(2)(3))
    XCTAssertEqual(2, const(2)("doge"))
  }

  func testClamp() {
    XCTAssertEqualWithAccuracy(0.0, clamp(0.0, 1.0)(-1.0), accuracy: 0.0)
    XCTAssertEqualWithAccuracy(0.5, clamp(0.0, 1.0)(0.5), accuracy: 0.0)
    XCTAssertEqualWithAccuracy(1.0, clamp(0.0, 1.0)(2.0), accuracy: 0.0)
  }

  func testLerp() {
    XCTAssertEqualWithAccuracy(0.0, lerp(0.0, 4.0)(0.00), accuracy: 0.0)
    XCTAssertEqualWithAccuracy(1.0, lerp(0.0, 4.0)(0.25), accuracy: 0.0)
    XCTAssertEqualWithAccuracy(2.0, lerp(0.0, 4.0)(0.50), accuracy: 0.0)
    XCTAssertEqualWithAccuracy(3.0, lerp(0.0, 4.0)(0.75), accuracy: 0.0)
    XCTAssertEqualWithAccuracy(4.0, lerp(0.0, 4.0)(1.00), accuracy: 0.0)
  }
}
