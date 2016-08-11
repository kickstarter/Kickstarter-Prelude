import UIKit

extension UITraitCollection {
  public var isRegularRegular: Bool {
    return self.horizontalSizeClass == .Regular && self.verticalSizeClass == .Regular
  }

  public var isVerticallyCompact: Bool {
    return self.verticalSizeClass == .Compact
  }
}
