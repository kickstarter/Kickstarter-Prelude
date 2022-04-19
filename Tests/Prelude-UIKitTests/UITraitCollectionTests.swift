import XCTest
import Prelude_UIKit

private let sizeClasses: [UIUserInterfaceSizeClass] = [.compact, .regular]
private let sizeClassMatrix = sizeClasses
  .flatMap { horizontal in
    sizeClasses.map { vertical in
      UITraitCollection(traitsFrom: [
        .init(horizontalSizeClass: horizontal),
        .init(verticalSizeClass: vertical)
        ]
      )
    }
}

class UITraitCollectionTests: XCTestCase {
  func testIsRegularRegular() {
    XCTAssertEqual([false, false, false, true], sizeClassMatrix.map { $0.isRegularRegular })
  }

  func testIsVerticallyCompact() {
    XCTAssertEqual([true, false, true, false], sizeClassMatrix.map { $0.isVerticallyCompact })
  }
}
