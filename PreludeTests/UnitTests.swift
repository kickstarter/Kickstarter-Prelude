import XCTest
@testable import Prelude

final class UnitTests: XCTestCase {

  func testUnitEquality() {
    XCTAssertEqual(Prelude.Unit(), Prelude.Unit())
  }
}
