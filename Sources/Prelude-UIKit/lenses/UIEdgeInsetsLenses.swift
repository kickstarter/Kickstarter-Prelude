// swiftlint:disable type_name
import Prelude
import UIKit

extension UIEdgeInsets {
  public enum lens {
    public static let bottom = Lens<UIEdgeInsets, CGFloat>(
      view: { $0.bottom },
      set: { .init(top: $1.top, left: $1.left, bottom: $0, right: $1.right) }
    )

    public static let left = Lens<UIEdgeInsets, CGFloat>(
      view: { $0.left },
      set: { .init(top: $1.top, left: $0, bottom: $1.bottom, right: $1.right) }
    )

    public static let leftRight = Lens<UIEdgeInsets, (CGFloat, CGFloat)>(
      view: { ($0.left, $0.right) },
      set: { .init(top: $1.top, left: $0.0, bottom: $1.bottom, right: $0.1) }
    )

    public static let right = Lens<UIEdgeInsets, CGFloat>(
      view: { $0.right },
      set: { .init(top: $1.top, left: $1.left, bottom: $1.bottom, right: $0) }
    )

    public static let top = Lens<UIEdgeInsets, CGFloat>(
      view: { $0.top },
      set: { .init(top: $0, left: $1.left, bottom: $1.bottom, right: $1.right) }
    )

    public static let topBottom = Lens<UIEdgeInsets, (CGFloat, CGFloat)>(
      view: { ($0.top, $0.bottom) },
      set: { .init(top: $0.0, left: $1.left, bottom: $0.1, right: $1.right) }
    )
  }
}
