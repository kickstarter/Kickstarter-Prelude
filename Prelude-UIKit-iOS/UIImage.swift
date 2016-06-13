import UIKit

extension UIImage {
  /**
   - parameter color: A color.

   - returns: A 1x1 UIImage of a solid color.
   */
  public static func pixel(ofColor color: UIColor) -> UIImage {
    let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)

    UIGraphicsBeginImageContext(pixel.size)
    defer { UIGraphicsEndImageContext() }

    let context = UIGraphicsGetCurrentContext()

    CGContextSetFillColorWithColor(context, color.CGColor)
    CGContextFillRect(context, pixel)

    return UIGraphicsGetImageFromCurrentImageContext()
  }
}
