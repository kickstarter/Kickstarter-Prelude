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

  func testFilter() {
    func isEven(_ x: Int) -> Bool { return x % 2 == 0 }

    let x: Int? = 1
    XCTAssertEqual(nil, x.filter(isEven))
    let y: Int? = 2
    XCTAssertEqual(2, y.filter(isEven))
  }

  func testDoIfSome() {
    var someBodyExecuted = 0
    let x: Int? = 1
    x.doIfSome { someBodyExecuted = $0 }
    XCTAssertEqual(x, someBodyExecuted)

    var noneBodyExecuted = false
    let y: Int? = nil
    y.doIfSome { _ in noneBodyExecuted = true }
    XCTAssertFalse(noneBodyExecuted)
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

  func testArrayEquality() {
    let xs: [Int?] = [1, nil, 2, nil, 3]
    let ys: [Int?] = [nil, nil, nil, nil, nil]
    let zs: [Int?] = [1, 2, 3]

    XCTAssertTrue(xs == xs)
    XCTAssertTrue(xs != ys)
    XCTAssertTrue(xs != zs)

    XCTAssertTrue(ys == ys)
    XCTAssertTrue(xs != zs)

    XCTAssertTrue(zs == zs)
  }

  func testFlattenOptional() {
    let x = Int??.some(1)
    let y = Int??.none

    XCTAssertEqual(flattenOptional(x), Int?.some(1))
    XCTAssertEqual(flattenOptional(y), Int?.none)
  }

  func testZip() {
    let pair = zip(.some(1), .some(2))
    XCTAssertEqual(1, pair?.0)
    XCTAssertEqual(2, pair?.1)
    let triple = zip(.some(1), .some(2), .some(3))
    XCTAssertEqual(1, triple?.0)
    XCTAssertEqual(2, triple?.1)
    XCTAssertEqual(3, triple?.2)

    let failFirst: (Int, Int)? = zip(.none, .some(1))
    XCTAssertNil(failFirst)
    let failLast: (Int, Int)? = zip(.some(1), .none)
    XCTAssertNil(failLast)
    let failTriple: (Int, Int, Int)? = zip(.some(1), .some(2), .none)
    XCTAssertNil(failTriple)
  }

  func testLift() {
    XCTAssertEqual(.some(3), lift(+, .some(1), .some(2)))
    XCTAssertNil(lift(+, .none, .some(2)))
  }
}
