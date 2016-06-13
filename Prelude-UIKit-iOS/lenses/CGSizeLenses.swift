// swiftlint:disable type_name
import Prelude
import UIKit

extension CGSize {
  public enum lens {
    public static let width = Lens<CGSize, CGFloat>(
      view: { $0.width },
      set: { .init(width: $0, height: $1.height) }
    )

    public static let height = Lens<CGSize, CGFloat>(
      view: { $0.height },
      set: { .init(width: $1.width, height: $0) }
    )
  }
}
