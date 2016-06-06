// swiftlint:disable type_name
import UIKit

extension CGSize {
  public enum lens {
    public static let width = Lens<CGSize, CGFloat>(
      view: { $0.width },
      set: { CGSize(width: $0, height: $1.height) }
    )

    public static let height = Lens<CGSize, CGFloat>(
      view: { $0.height },
      set: { CGSize(width: $1.width, height: $0) }
    )
  }
}
