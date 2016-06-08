import UIKit

extension UIButton {
  public func setBackgroundColor(backgroundColor: UIColor, forState state: UIControlState) {
    self.setBackgroundImage(UIImage.pixel(ofColor: backgroundColor),
                            forState: state)
  }
}
