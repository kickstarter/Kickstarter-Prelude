// swiftlint:disable type_name
import UIKit

extension CGRect {
  public static let unit = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)

  public enum lens {
    public static let origin = Lens<CGRect, CGPoint>(
      view: { $0.origin },
      set: { CGRect(origin: $0, size: $1.size) }
    )

    public static let size = Lens<CGRect, CGSize>(
      view: { $0.size },
      set: { CGRect(origin: $1.origin, size: $0) }
    )
  }
}

private let _x = CGRect.lens.origin • CGPoint.lens.x
private let _y = CGRect.lens.origin • CGPoint.lens.y

extension LensType where Whole == CGRect, Part == CGPoint {

  public static var x: Lens<CGRect, CGFloat> {
    return _x
  }
  public static var y: Lens<CGRect, CGFloat> {
    return _y
  }
}

private let _width = CGRect.lens.size • CGSize.lens.width
private let _height = CGRect.lens.size • CGSize.lens.height

extension LensType where Whole == CGRect, Part == CGSize {
  public static var width: Lens<CGRect, CGFloat> {
    return _width
  }
  public static var height: Lens<CGRect, CGFloat> {
    return _height
  }
}
