import XCTest
@testable import Prelude

class VectorTypeTest : XCTestCase {

  func testCGFloat() {
    let f1 = CGFloat(2.0)
    let f2 = CGFloat(3.0)

    XCTAssertEqual(5.0, f1 + f2)
    XCTAssertEqual(6.0, f1 * f2)
    XCTAssertEqual(-2.0, f1.negateVector())
  }

  func testCGPoint() {
    let p1 = CGPoint(x: 1.0, y: 2.0)
    let p2 = CGPoint(x: -2.0, y: 3.0)

    XCTAssertEqual(CGPoint(x: -1.0, y: 5.0), p1 + p2)
    XCTAssertEqual(CGPoint(x: 2.0, y: 4.0), p1 * 2.0)
    XCTAssertEqual(CGPoint(x: -1.0, y: -2.0), p1.negateVector())
  }

  func testCGRect() {
    let r1 = CGRect(x: 1.0, y: 1.0, width: 4.0, height: 3.0)
    let r2 = CGRect(x: -1.0, y: 2.0, width: 16.0, height: 9.0)

    XCTAssertEqual(CGRect(x: 0.0, y: 3.0, width: 20.0, height: 12.0), r1 + r2)
    XCTAssertEqual(CGRect(x: 2.0, y: 2.0, width: 8.0, height: 6.0), r1 * 2.0)
    XCTAssertEqual(CGRect(x: -1.0, y: -1.0, width: -4.0, height: -3.0), r1.negateVector())
  }
}
