// swiftlint:disable type_name
import Prelude
import UIKit

extension CALayer {
  public enum lens {
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
