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

    #if swift(>=2.3)
      guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
    #else
      let context = UIGraphicsGetCurrentContext()
    #endif

    context.setFillColor(color.cgColor)
    context.fill(pixel)

    #if swift(>=2.3)
      return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    #else
      return UIGraphicsGetImageFromCurrentImageContext()
    #endif
  }
}
