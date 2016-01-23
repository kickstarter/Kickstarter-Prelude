import XCTest
@testable import Prelude

class DictionaryTests: XCTestCase {

  func testCompact() {
    let values: [Int:String?] = [1: "1", 2: "2", 3: nil, 4: "4"]

    XCTAssert(values.compact() == [1: "1", 2: "2", 4: "4"])
  }
}
