import XCTest
@testable import Prelude

public final class StringTests: XCTestCase {

  func testSemigroupOperation() {
    XCTAssert("helloworld" == ("hello" <> "world"))
    XCTAssert("helloworld" == ("hello"<>)("world"))
    XCTAssert("helloworld" == (<>"world")("hello"))
    XCTAssertEqual("hello" <> ("there" <> "world"), ("hello" <> "there") <> "world", "Associativity")
  }
}
