import XCTest
@testable import Prelude

class UnpackTests: XCTestCase {
  func testABUnpack() {
    let testTuple = unpack(("a", "b"), c: "c")

    XCTAssertEqual(testTuple.0, "a")
    XCTAssertEqual(testTuple.1, "b")
    XCTAssertEqual(testTuple.2, "c")
  }

  func testBCUnpack() {
    let testTuple = unpack("a", bc: ("b", "c"))

    XCTAssertEqual(testTuple.0, "a")
    XCTAssertEqual(testTuple.1, "b")
    XCTAssertEqual(testTuple.2, "c")
  }

  func testABCDUnpack() {
    let testTuple = unpack(("a", "b"), ("c", "d"))

    XCTAssertEqual(testTuple.0, "a")
    XCTAssertEqual(testTuple.1, "b")
    XCTAssertEqual(testTuple.2, "c")
    XCTAssertEqual(testTuple.3, "d")
  }
}
