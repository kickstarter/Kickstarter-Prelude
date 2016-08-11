import XCTest
import Prelude_UIKit

private let sizeClasses: [UIUserInterfaceSizeClass] = [.Compact, .Regular]
private let sizeClassMatrix = sizeClasses
  .flatMap { horizontal in
    sizeClasses.map { vertical in
      UITraitCollection(traitsFromCollections: [
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
