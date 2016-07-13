// swiftlint:disable type_name
import Prelude
import UIKit

public protocol UIScrollViewProtocol: UIViewProtocol {
  var scrollEnabled: Bool { get set }
}

extension UIScrollView: UIScrollViewProtocol {}

public extension LensHolder where Object: UIScrollViewProtocol {
  public var scrollEnabled: Lens<Object, Bool> {
    return Lens(
      view: { $0.scrollEnabled },
      set: { $1.scrollEnabled = $0; return $1 }
    )
  }
}
