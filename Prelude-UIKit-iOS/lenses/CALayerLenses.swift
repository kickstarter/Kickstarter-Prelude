// swiftlint:disable type_name
import Prelude
import UIKit

extension CALayer {
  public enum lens {
    public static var borderColor = Lens<CALayer, CGColorRef?>(
      view: { $0.borderColor },
      set: { $1.borderColor = $0; return $1 }
    )

    public static var borderWidth = Lens<CALayer, CGFloat>(
      view: { $0.borderWidth },
      set: { $1.borderWidth = $0; return $1 }
    )

    public static let cornerRadius = Lens<CALayer, CGFloat>(
      view: { $0.cornerRadius },
      set: { $1.cornerRadius = $0; return $1 }
    )

    public static let masksToBounds = Lens<CALayer, Bool>(
      view: { $0.masksToBounds },
      set: { $1.masksToBounds = $0; return $1 }
    )
  }
}
