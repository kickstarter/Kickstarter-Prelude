import XCTest
@testable import Prelude

public final class StringTests: XCTestCase {

  func testSemigroupOperation() {
    XCTAssertEqual("helloworld", "hello".op("world"))
    XCTAssert("helloworld" == ("hello" <> "world"))
    XCTAssert("helloworld" == ("hello"<>)("world"))
    XCTAssert("helloworld" == (<>"world")("hello"))
    XCTAssertEqual(("hello".op("there")).op("world"), "hello".op("there".op("world")), "Associativity")
  }
}
