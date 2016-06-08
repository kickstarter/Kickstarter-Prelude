import UIKit

extension UIImage {
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
