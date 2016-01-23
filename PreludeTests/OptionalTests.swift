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
    XCTAssertEqual(x.optionalFilter(isEven), nil)
    let y: Int? = 2
    XCTAssertEqual(y.optionalFilter(isEven), 2)
  }

  func testCoalesceWith() {
    let x: Int? = 1
    XCTAssertEqual(x.coalesceWith(2), 1)
    let y: Int? = nil
    XCTAssertEqual(y.coalesceWith(2), 2)
  }

  func testForceUnwrap() {
    let x: Int? = 1
    XCTAssertEqual(1, x.forceUnwrap())
  }
}
