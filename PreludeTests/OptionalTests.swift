import XCTest
@testable import Prelude

final class OptionalTests: XCTestCase {

  func testIsNil() {
    let x: Int? = 1
    XCTAssertFalse(x.isNil)
    XCTAssertFalse(isNil(x))
    let y: Int? = nil
    XCTAssertTrue(y.isNil)
    XCTAssertTrue(isNil(y))
  }

  func testIsSome() {
    let x: Int? = 1
    XCTAssertTrue(x.isSome)
    XCTAssertTrue(isNotNil(x))
    let y: Int? = nil
    XCTAssertFalse(y.isSome)
    XCTAssertFalse(isNotNil(y))
  }

  func testOptionalFilter() {
    func isEven(x: Int) -> Bool { return x % 2 == 0 }

    let x: Int? = 1
    XCTAssertEqual(nil, x.optionalFilter(isEven))
    let y: Int? = 2
    XCTAssertEqual(2, y.optionalFilter(isEven))
  }

  func testCoalesceWith() {
    let x: Int? = 1
    XCTAssertEqual(1, x.coalesceWith(2))
    let y: Int? = nil
    XCTAssertEqual(2, y.coalesceWith(2))
  }

  func testForceUnwrap() {
    let x: Int? = 1
    XCTAssertEqual(1, x.forceUnwrap())
  }
}
