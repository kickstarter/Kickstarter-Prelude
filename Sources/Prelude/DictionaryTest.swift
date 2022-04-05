import XCTest
@testable import Prelude

class DictionaryTests: XCTestCase {

  func testCompact() {
    let values: [Int: String?] = [1: "1", 2: "2", 3: nil, 4: "4"]

    XCTAssertEqual([1: "1", 2: "2", 4: "4"], values.compact())
  }

  func testWithAllValuesFrom() {
    let xs = [1: 1, 2: 2, 3: 3]
    let ys = [3: 4, 4: 5, 5: 6]

    XCTAssertEqual([1: 1, 2: 2, 3: 4, 4: 5, 5: 6], xs.withAllValuesFrom(ys))
  }

  func test_keyValuePairs() {
    let xs = Dictionary.keyValuePairs([(1, 2), (2, 3), (3, 4)])
    XCTAssertEqual([1: 2, 2: 3, 3: 4], xs)

    let ys = Dictionary.keyValuePairs([(1, 2), (2, 3), (3, 4), (1, 5)])
    XCTAssertEqual([1: 5, 2: 3, 3: 4], ys)
  }

  func test_TransformedKeys() {
    let xs = ["a": 1, "b": 2, "c": 3]
    XCTAssertEqual(["_a": 1, "_b": 2, "_c": 3], xs.transformedKeys("_"<>))
    XCTAssertEqual(["a_": 1, "b_": 2, "c_": 3], xs.transformedKeys(<>"_"))
  }

  func test_PrefixKeys() {
    let xs = ["a": 1, "b": 2, "c": 3]
    XCTAssertEqual(["_a": 1, "_b": 2, "_c": 3], xs.prefixedKeys("_"))
  }
}
