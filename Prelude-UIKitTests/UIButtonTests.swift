import XCTest
import Prelude_UIKit

class UIButtonTests: XCTestCase {
  func testSetBackgroundColor() {
    let button = UIButton()
    button.setBackgroundColor(.white, forState: [])
    XCTAssertNotNil(button.backgroundImage(for: .normal))
  }
}
