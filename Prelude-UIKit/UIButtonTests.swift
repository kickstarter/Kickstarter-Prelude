import XCTest
import Prelude_UIKit

class UIButtonTests: XCTestCase {
  func testSetBackgroundColor() {
    let button = UIButton()
    button.setBackgroundColor(.white, for: [])
    XCTAssertNotNil(button.backgroundImage(for: .normal))
  }
}
