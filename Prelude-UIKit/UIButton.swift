import UIKit

extension UIButton {
  /**
   Sets the background color of a button for a particular state.

   - parameter backgroundColor: The color to set.
   - parameter state:           The state for the color to take affect.
   */
  public func setBackgroundColor(_ backgroundColor: UIColor, for state: UIControl.State) {
    self.setBackgroundImage(.pixel(ofColor: backgroundColor), for: state)
  }
}
