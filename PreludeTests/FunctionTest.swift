import XCTest
@testable import Prelude

class FunctionTest: XCTestCase {

  func testPipeForward() {
    func square(x: Int) -> Int { return x * x }

    XCTAssert(2 |> square == 4)
  }

  func testCompose() {
    func square(x: Int) -> Int { return x * x }
    func incr(x: Int) -> Int { return x + 1 }

    XCTAssert((square • incr)(3) == 16)
    XCTAssert((incr • square)(3) == 10)
  }

  func testId() {
    XCTAssert(id(2) == 2)
    XCTAssert(id("doge") == "doge")
  }

  func testConst() {
    XCTAssert(const(2)(3) == 2)
    XCTAssert(const(2)("doge") == 2)
  }

  func testClamp() {
    XCTAssert(clamp(0.0, 1.0)(0.5) == 0.5)
    XCTAssert(clamp(0.0, 1.0)(2.0) == 1.0)
    XCTAssert(clamp(0.0, 1.0)(-1.0) == 0.0)
  }

  func testLerp() {
    XCTAssert(lerp(0.0, 4.0)(0.00) == 0.0)
    XCTAssert(lerp(0.0, 4.0)(0.25) == 1.0)
    XCTAssert(lerp(0.0, 4.0)(0.50) == 2.0)
    XCTAssert(lerp(0.0, 4.0)(0.75) == 3.0)
    XCTAssert(lerp(0.0, 4.0)(1.00) == 4.0)
  }
}
