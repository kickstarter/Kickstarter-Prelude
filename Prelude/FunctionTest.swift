import XCTest
@testable import Prelude

class FunctionTest: XCTestCase {

  func testPipeForward() {
    func square(_ x: Int) -> Int { return x * x }

    XCTAssertEqual(4, 2 |> square)
  }

  func testArrayPipeForward() {
    func square(_ x: Int) -> Int { return x * x }

    XCTAssertEqual([4, 9, 16], [2, 3, 4] ||> square)
  }

  func testOptionalPipeForward() {
    func square(_ x: Int) -> Int { return x * x }

    XCTAssertEqual(4, 2 ?|> square)
    XCTAssertNil(nil ?|> square)
  }

  func testForwardCompose() {
    func square(_ x: Int) -> Int { return x * x }
    func incr(_ x: Int) -> Int { return x + 1 }

    XCTAssertEqual(16, (incr >>> square)(3))
    XCTAssertEqual(10, (square >>> incr)(3))
  }

  func testBackwardCompose() {
    func square(_ x: Int) -> Int { return x * x }
    func incr(_ x: Int) -> Int { return x + 1 }

    XCTAssertEqual(16, (square <<< incr)(3))
    XCTAssertEqual(10, (incr <<< square)(3))
  }

  func testSemigroupOperation() {
    func square(_ x: Int) -> Int { return x * x }
    func incr(_ x: Int) -> Int { return x + 1 }

    XCTAssertEqual(10, (square <> incr)(3))
    XCTAssertEqual(16, (incr <> square)(3))
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
