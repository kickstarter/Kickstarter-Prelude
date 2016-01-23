import XCTest
@testable import Prelude

class VectorTypeTest : XCTestCase {

  func testCGFloat() {
    let f1 = CGFloat(2.0)
    let f2 = CGFloat(3.0)

    XCTAssertEqual(f1 + f2, 5.0)
    XCTAssertEqual(f1 * f2, 6.0)
    XCTAssertEqual(f1.negateVector(), -2.0)
  }

  func testCGPoint() {
    let p1 = CGPoint(x: 1.0, y: 2.0)
    let p2 = CGPoint(x: -2.0, y: 3.0)

    XCTAssertEqual(p1 + p2, CGPoint(x: -1.0, y: 5.0))
    XCTAssertEqual(p1 * 2.0, CGPoint(x: 2.0, y: 4.0))
    XCTAssertEqual(p1.negateVector(), CGPoint(x: -1.0, y: -2.0))
  }

  func testCGRect() {
    let r1 = CGRect(x: 1.0, y: 1.0, width: 4.0, height: 3.0)
    let r2 = CGRect(x: -1.0, y: 2.0, width: 16.0, height: 9.0)

    XCTAssertEqual(r1 + r2, CGRect(x: 0.0, y: 3.0, width: 20.0, height: 12.0))
    XCTAssertEqual(r1 * 2.0, CGRect(x: 2.0, y: 2.0, width: 8.0, height: 6.0))
    XCTAssertEqual(r1.negateVector(), CGRect(x: -1.0, y: -1.0, width: -4.0, height: -3.0))
  }
}
