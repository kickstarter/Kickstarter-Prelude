import XCTest
@testable import Prelude

final class UnitTests : XCTestCase {

  func testUnitEquality() {
    XCTAssertEqual(Unit(), Unit())
  }
}
