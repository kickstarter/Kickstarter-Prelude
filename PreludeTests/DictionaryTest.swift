import XCTest
@testable import Prelude

class DictionaryTests: XCTestCase {

  func testCompact() {
    let values: [Int:String?] = [1: "1", 2: "2", 3: nil, 4: "4"]

    XCTAssertEqual([1: "1", 2: "2", 4: "4"], values.compact())
  }

  func testWithAllValuesFrom() {
    let xs = [1:1, 2:2, 3:3]
    let ys = [3:4, 4:5, 5:6]

    XCTAssertEqual([1:1, 2:2, 3:4, 4:5, 5:6], xs.withAllValuesFrom(ys))
  }
}
