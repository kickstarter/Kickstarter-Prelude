import UIKit

extension UIEdgeInsets {
  public init(all: CGFloat) {
    self.init(top: all, left: all, bottom: all, right: all)
  }

  public init(topBottom: CGFloat, leftRight: CGFloat) {
    self.init(top: topBottom, left: leftRight, bottom: topBottom, right: leftRight)
  }
}
