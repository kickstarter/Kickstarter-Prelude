import XCTest
import Prelude

final class EitherTests: XCTestCase {

  func testInits() {

    XCTAssertTrue(Either<Int, String>.left(1) == Either<Int, String>(1))
    XCTAssertTrue(Either<Int, String>.right("hello") == Either<Int, String>("hello"))
  }

  func testLeftRightVars() {
    XCTAssertEqual(Either<Int, String>.left(1).left, 1)
    XCTAssertEqual(Either<Int, String>.left(1).right, nil)
    XCTAssertEqual(Either<Int, String>.right("hello").right, "hello")
    XCTAssertEqual(Either<Int, String>.right("hello").left, nil)
  }

  func testMap() {
    let double: (String) -> String = { $0 + $0 }

    XCTAssertTrue(Either<Int, String>.right("hello").map(double) == .right("hellohello"))
  }

  func testFlatMap() {
    let failOnGoodBye: (String) -> Either<Int, String> = { string in
      return string == "goodbye" ? .left(-1) : .right(string)
    }

    XCTAssertTrue(Either.right("hello").flatMap(failOnGoodBye) == Either.right("hello"))
    XCTAssertTrue(Either.right("goodbye").flatMap(failOnGoodBye) == Either.left(-1))
  }

  func testMapLeft() {
    let square: (Int) -> Int = { $0 * $0 }

    XCTAssertTrue(Either<Int, String>.left(2).mapLeft(square) == .left(4))
  }

  func testFlatMapLeft() {
    let failOnNegative: (Int) -> Either<Int, String> = { x in
      return x < 0 ? .right("failure") : .left(x * x)
    }

    XCTAssertTrue(Either.left(2).flatMapLeft(failOnNegative) == .left(4))
    XCTAssertTrue(Either.left(-1).flatMapLeft(failOnNegative) == .right("failure"))
  }

  func testFlatten() {
    XCTAssertTrue(Either.right(Either.right("hello")).flatten() == Either<Int, String>.right("hello"))
    XCTAssertTrue(Either<Int, Either<Int, String>>.left(1).flatten() == .left(1))
  }

  func testFlattenLeft() {
    XCTAssertTrue(Either<Either<Int, String>, String>.left(.left(1)).flattenLeft() == .left(1))
    XCTAssertTrue(Either<Either<Int, String>, String>.right("hello").flattenLeft() == .right("hello"))
  }

  func testIfLeftIfRight() {
    let square: (Int) -> Int = { $0 * $0 }
    let length: (String) -> Int = { $0.count }

    XCTAssertEqual(4, Either.left(2).ifLeft(square, ifRight: length))
    XCTAssertEqual(5, Either.right("hello").ifLeft(square, ifRight: length))
  }

  func testEitherCaseAnalysis() {
    let square: (Int) -> Int = { $0 * $0 }
    let length: (String) -> Int = { $0.count }

    XCTAssertEqual(4, .left(2) |> either(ifLeft: square, ifRight: length))
    XCTAssertEqual(5, .right("hello") |> either(ifLeft: square, ifRight: length))
  }

  func testIsLeft() {
    XCTAssertTrue(Either<Int, String>(1) |> isLeft)
    XCTAssertFalse(Either<Int, String>(1) |> isRight)
    XCTAssertFalse(Either<Int, String>("hello") |> isLeft)
    XCTAssertTrue(Either<Int, String>("hello") |> isRight)
  }

  func testLefts() {
    let xs: [Either<Int, String>] = [.left(1), .right("a"), .left(2), .right("b")]
    XCTAssertEqual([1, 2], lefts(xs))
  }

  func testRights() {
    let xs: [Either<Int, String>] = [.left(1), .right("a"), .left(2), .right("b")]
    XCTAssertEqual(["a", "b"], rights(xs))
  }
}
