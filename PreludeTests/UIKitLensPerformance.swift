import Prelude
import XCTest

class UIKitLensPerformance: XCTestCase {
  let count = 10_000

  func testPerformanceExample() {
    self.measureBlock {
      let transformation = UIView.lens.frame .~ CGRect(x: 100.0, y: 100.0, width: 200.0, height: 100.0)
        <> UIView.lens.backgroundColor .~ .redColor()

      (0...self.count).forEach { _ in
        UILabel() |> transformation
      }
    }
  }

  func testPerformanceWithoutLenses() {
    self.measureBlock {
      (0...self.count).forEach { _ in
        let label = UILabel()
        label.frame = CGRect(x: 100.0, y: 100.0, width: 200.0, height: 100.0)
        label.backgroundColor = .redColor()
      }
    }
  }
}
