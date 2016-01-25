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
}
