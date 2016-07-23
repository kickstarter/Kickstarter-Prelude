// swiftlint:disable type_name
import Prelude
import UIKit

extension CGPoint {
  public enum lens {
    public static let x = Lens<CGPoint, CGFloat>(
      view: { $0.x },
      set: { .init(x: $0, y: $1.y) }
    )

    public static let y = Lens<CGPoint, CGFloat>(
      view: { $0.y },
      set: { .init(x: $1.x, y: $0) }
    )
  }
}
