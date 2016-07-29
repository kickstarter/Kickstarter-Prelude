// swiftlint:disable type_name
import Prelude
import UIKit

public protocol UIScrollViewProtocol: UIViewProtocol {
  var scrollEnabled: Bool { get set }
  var scrollIndicatorInsets: UIEdgeInsets { get set }
  var showsHorizontalScrollIndicator: Bool { get set }
  var showsVerticalScrollIndicator: Bool { get set }
}

extension UIScrollView: UIScrollViewProtocol {}

public extension LensHolder where Object: UIScrollViewProtocol {
  public var scrollEnabled: Lens<Object, Bool> {
    return Lens(
      view: { $0.scrollEnabled },
      set: { $1.scrollEnabled = $0; return $1 }
    )
  }

  public var scrollIndicatorInsets: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.scrollIndicatorInsets },
      set: { $1.scrollIndicatorInsets = $0; return $1 }
    )
  }

  public var showsHorizontalScrollIndicator: Lens<Object, Bool> {
    return Lens(
      view: { $0.showsHorizontalScrollIndicator },
      set: { $1.showsHorizontalScrollIndicator = $0; return $1 }
    )
  }

  public var showsVerticalScrollIndicator: Lens<Object, Bool> {
    return Lens(
      view: { $0.showsVerticalScrollIndicator },
      set: { $1.showsVerticalScrollIndicator = $0; return $1 }
    )
  }
}
