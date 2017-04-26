import XCTest
import Prelude

final class NonEmptyTests: XCTestCase {

  func testArrayConversion() {
    XCTAssert([1, 2, 3] == Array(NonEmptyArray(1, 2, 3)))
    XCTAssert([1, 2, 3] == Array(NonEmptySet(1, 1, 2, 3)).sorted())
  }

  func testCount() {
    XCTAssertEqual(3, NonEmptyArray(1, 2, 3).count)
    XCTAssertEqual(3, NonEmptySet(1, 1, 2, 3).count)
  }

  func testFirst() {
    XCTAssertEqual(1, NonEmptyArray(1, 2, 3).first)
    XCTAssertEqual(1, NonEmptySet(1, 1, 2, 3).first)
  }

  func testEquality() {
    XCTAssert(NonEmptyArray(1, 2, 3) == NonEmptyArray(1, 2, 3))
    XCTAssert(NonEmptyArray(1, 2, 3) != NonEmptyArray(2, 3, 4))
    XCTAssert(NonEmptySet(1, 1, 2, 3) == NonEmptySet(1, 2, 3))
    XCTAssert(NonEmptySet(1, 2, 3) != NonEmptySet(1, 2, 3, 4))

    XCTAssert(1 >| [2, 3] == NonEmptyArray(1, 2, 3))
    XCTAssert(1 >| [2, 3] != NonEmptyArray(2, 3, 4))
    XCTAssert(1 >| [1, 2, 3] == NonEmptySet(1, 2, 3))
    XCTAssert(1 >| [2, 3] != NonEmptySet(1, 2, 3, 4))
  }
}
