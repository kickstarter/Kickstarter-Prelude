// swiftlint:disable type_name
import UIKit

extension UIEdgeInsets {
  public enum lens {
    public static let left = Lens<UIEdgeInsets, CGFloat>(
      view: { $0.left },
      set: { UIEdgeInsets(top: $1.top, left: $0, bottom: $1.bottom, right: $1.right) }
    )

    public static let top = Lens<UIEdgeInsets, CGFloat>(
      view: { $0.left },
      set: { UIEdgeInsets(top: $0, left: $1.left, bottom: $1.bottom, right: $1.right) }
    )

    public static let right = Lens<UIEdgeInsets, CGFloat>(
      view: { $0.left },
      set: { UIEdgeInsets(top: $1.top, left: $1.left, bottom: $1.bottom, right: $0) }
    )

    public static let bottom = Lens<UIEdgeInsets, CGFloat>(
      view: { $0.left },
      set: { UIEdgeInsets(top: $1.top, left: $1.left, bottom: $0, right: $1.right) }
    )
  }
}
