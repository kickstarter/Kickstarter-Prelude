import Prelude
import UIKit

public protocol UIScrollViewProtocol: UIViewProtocol {
  var canCancelContentTouches: Bool { get set }
  var decelerationRate: UIScrollView.DecelerationRate { get set }
  var delaysContentTouches: Bool { get set }
  var keyboardDismissMode: UIScrollView.KeyboardDismissMode { get set }
  var isScrollEnabled: Bool { get set }
  var scrollIndicatorInsets: UIEdgeInsets { get set }
  #if os(iOS)
  var scrollsToTop: Bool { get set }
  #endif
  var showsHorizontalScrollIndicator: Bool { get set }
  var showsVerticalScrollIndicator: Bool { get set }
}

extension UIScrollView: UIScrollViewProtocol {}

public extension LensHolder where Object: UIScrollViewProtocol {

  public var canCancelContentTouches: Lens<Object, Bool> {
    return Lens(
      view: { $0.canCancelContentTouches },
      set: { $1.canCancelContentTouches = $0; return $1 }
    )
  }

  public var decelerationRate: Lens<Object, UIScrollView.DecelerationRate> {
    return Lens(
      view: { $0.decelerationRate },
      set: { $1.decelerationRate = $0; return $1 }
    )
  }

  public var delaysContentTouches: Lens<Object, Bool> {
    return Lens(
      view: { $0.delaysContentTouches },
      set: { $1.delaysContentTouches = $0; return $1 }
    )
  }

  public var isScrollEnabled: Lens<Object, Bool> {
    return Lens(
      view: { $0.isScrollEnabled },
      set: { $1.isScrollEnabled = $0; return $1 }
    )
  }

  public var keyboardDismissMode: Lens<Object, UIScrollView.KeyboardDismissMode> {
    return Lens(
      view: { $0.keyboardDismissMode },
      set: { $1.keyboardDismissMode = $0; return $1 }
    )
  }

  public var scrollIndicatorInsets: Lens<Object, UIEdgeInsets> {
    return Lens(
      view: { $0.scrollIndicatorInsets },
      set: { $1.scrollIndicatorInsets = $0; return $1 }
    )
  }

  #if os(iOS)
  public var scrollsToTop: Lens<Object, Bool> {
    return Lens(
      view: { $0.scrollsToTop },
      set: { $1.scrollsToTop = $0; return $1 }
    )
  }
  #endif

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
