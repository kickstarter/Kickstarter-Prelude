import XCTest
@testable import Kickstarter_Prelude

final class Kickstarter_PreludeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Kickstarter_Prelude().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
