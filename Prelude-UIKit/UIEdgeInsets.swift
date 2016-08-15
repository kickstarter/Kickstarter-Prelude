import UIKit

extension UIEdgeInsets {
  public init(all: CGFloat) {
    self.init(top: all, left: all, bottom: all, right: all)
  }

  public init(topBottom: CGFloat, leftRight: CGFloat) {
    self.init(top: topBottom, left: leftRight, bottom: topBottom, right: leftRight)
  }

  public init(topBottom: CGFloat) {
    self.init(top: topBottom, left: 0, bottom: topBottom, right: 0)
  }

  public init(leftRight: CGFloat) {
    self.init(top: 0, left: leftRight, bottom: 0, right: leftRight)
  }

  public init(left: CGFloat) {
    self.init(top: 0, left: left, bottom: 0, right: 0)
  }

  public init(bottom: CGFloat) {
    self.init(top: 0, left: 0, bottom: bottom, right: 0)
  }

  public init(right: CGFloat) {
    self.init(top: 0, left: 0, bottom: 0, right: right)
  }

  public init(top: CGFloat) {
    self.init(top: top, left: 0, bottom: 0, right: 0)
  }

  public var topBottom: (CGFloat, CGFloat) {
    return (self.top, self.bottom)
  }

  public var leftRight: (CGFloat, CGFloat) {
    return (self.left, self.right)
  }
}
